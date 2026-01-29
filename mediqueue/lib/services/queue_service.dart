import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/queue_model.dart';
import '../models/patient_model.dart';
import '../models/hospital_model.dart';
import 'firestore_service.dart';
import 'notification_service.dart';

class QueueService {
  final FirestoreService _firestoreService = FirestoreService();
  final NotificationService _notificationService = NotificationService();

  // ============================================================================
  // QUEUE MANAGEMENT
  // ============================================================================

  /// Join a queue at a hospital department
  Future<Map<String, dynamic>> joinQueue({
    required String hospitalId,
    required String hospitalName,
    required String departmentName,
    required PatientModel patient,
    String? notes,
    String priority = 'normal',
  }) async {
    try {
      // Check if patient already has an active queue
      final activeQueues =
          await _firestoreService.getActiveQueuesForPatient(patient.id).first;

      if (activeQueues.isNotEmpty) {
        // Check if already in queue for this hospital/department
        final existingQueue = activeQueues.firstWhere(
          (q) =>
              q.hospitalId == hospitalId && q.departmentName == departmentName,
          orElse: () => activeQueues.first,
        );

        if (existingQueue.hospitalId == hospitalId &&
            existingQueue.departmentName == departmentName) {
          return {
            'success': false,
            'message': 'You are already in the queue for this department',
            'queueId': existingQueue.id,
          };
        }
      }

      // Get next queue number
      final queueNumber = await _firestoreService.getNextQueueNumber(
          hospitalId, departmentName);

      // Calculate estimated wait time
      final estimatedWaitTime = await _calculateEstimatedWaitTime(
          hospitalId, departmentName, queueNumber);

      // Create queue entry
      final queue = QueueModel(
        id: '',
        hospitalId: hospitalId,
        hospitalName: hospitalName,
        departmentName: departmentName,
        patientId: patient.id,
        patientName: patient.name,
        patientEmail: patient.email,
        patientPhone: patient.phoneNumber,
        queueNumber: queueNumber,
        estimatedWaitTime: estimatedWaitTime,
        status: QueueStatus.waiting,
        joinedAt: DateTime.now(),
        notes: notes,
        priority: priority,
        updatedAt: DateTime.now(),
      );

      // Add to Firestore
      final queueId = await _firestoreService.addToQueue(queue);

      if (queueId != null) {
        // Update department queue count
        await _updateDepartmentQueueCount(hospitalId, departmentName, 1);

        // Send confirmation notification
        await _notificationService.sendQueueJoinedNotification(
          patientEmail: patient.email,
          hospitalName: hospitalName,
          departmentName: departmentName,
          queueNumber: queueNumber,
          estimatedWaitTime: estimatedWaitTime,
        );

        return {
          'success': true,
          'message': 'Successfully joined the queue',
          'queueId': queueId,
          'queueNumber': queueNumber,
          'estimatedWaitTime': estimatedWaitTime,
        };
      }

      return {
        'success': false,
        'message': 'Failed to join queue. Please try again.',
      };
    } catch (e) {
      print('Error joining queue: $e');
      return {
        'success': false,
        'message': 'An error occurred: ${e.toString()}',
      };
    }
  }

  /// Leave/Cancel a queue
  Future<Map<String, dynamic>> leaveQueue(String queueId) async {
    try {
      final queue = await _firestoreService.getQueueById(queueId);
      if (queue == null) {
        return {
          'success': false,
          'message': 'Queue entry not found',
        };
      }

      // Update queue status to cancelled
      final success = await _firestoreService.updateQueueStatus(
          queueId, QueueStatus.cancelled);

      if (success) {
        // Update department queue count
        await _updateDepartmentQueueCount(
            queue.hospitalId, queue.departmentName, -1);

        // Send cancellation notification
        await _notificationService.sendQueueCancelledNotification(
          patientEmail: queue.patientEmail,
          hospitalName: queue.hospitalName,
          departmentName: queue.departmentName,
          queueNumber: queue.queueNumber,
        );

        return {
          'success': true,
          'message': 'Successfully left the queue',
        };
      }

      return {
        'success': false,
        'message': 'Failed to leave queue. Please try again.',
      };
    } catch (e) {
      print('Error leaving queue: $e');
      return {
        'success': false,
        'message': 'An error occurred: ${e.toString()}',
      };
    }
  }

  /// Get patient's current position in queue
  Future<Map<String, dynamic>> getQueuePosition(String queueId) async {
    try {
      final queue = await _firestoreService.getQueueById(queueId);
      if (queue == null) {
        return {
          'success': false,
          'message': 'Queue entry not found',
        };
      }

      final position = await _firestoreService.getQueuePosition(queueId);

      // Recalculate estimated wait time based on current position
      final estimatedWaitTime = position * 15; // Assume 15 minutes per patient

      return {
        'success': true,
        'position': position,
        'queueNumber': queue.queueNumber,
        'estimatedWaitTime': estimatedWaitTime,
        'status': queue.status,
      };
    } catch (e) {
      print('Error getting queue position: $e');
      return {
        'success': false,
        'message': 'An error occurred: ${e.toString()}',
      };
    }
  }

  /// Stream of queue updates for a patient
  Stream<List<QueueModel>> watchPatientQueues(String patientId) {
    return _firestoreService.getActiveQueuesForPatient(patientId);
  }

  /// Stream of queue for a specific hospital department (for admin)
  Stream<List<QueueModel>> watchDepartmentQueue(
      String hospitalId, String departmentName) {
    return _firestoreService.getQueuesByHospitalAndDepartment(
        hospitalId, departmentName);
  }

  // ============================================================================
  // ADMIN QUEUE OPERATIONS
  // ============================================================================

  /// Call next patient in queue (Admin function)
  Future<Map<String, dynamic>> callNextPatient(
      String hospitalId, String departmentName) async {
    try {
      // Get all waiting patients
      final queues = await _firestoreService
          .getQueuesByHospitalAndDepartment(hospitalId, departmentName)
          .first;

      final waitingQueues = queues
          .where((q) => q.status == QueueStatus.waiting)
          .toList()
        ..sort((a, b) => a.queueNumber.compareTo(b.queueNumber));

      if (waitingQueues.isEmpty) {
        return {
          'success': false,
          'message': 'No patients in queue',
        };
      }

      final nextPatient = waitingQueues.first;

      // Update status to called
      final success = await _firestoreService.updateQueueStatus(
          nextPatient.id, QueueStatus.called);

      if (success) {
        // Send notification to patient
        await _notificationService.sendPatientCalledNotification(
          patientEmail: nextPatient.patientEmail,
          hospitalName: nextPatient.hospitalName,
          departmentName: nextPatient.departmentName,
          queueNumber: nextPatient.queueNumber,
        );

        return {
          'success': true,
          'message': 'Patient called successfully',
          'queue': nextPatient,
        };
      }

      return {
        'success': false,
        'message': 'Failed to call patient',
      };
    } catch (e) {
      print('Error calling next patient: $e');
      return {
        'success': false,
        'message': 'An error occurred: ${e.toString()}',
      };
    }
  }

  /// Mark patient as in progress (Admin function)
  Future<bool> markPatientInProgress(String queueId) async {
    return await _firestoreService.updateQueueStatus(
        queueId, QueueStatus.inProgress);
  }

  /// Mark patient as completed (Admin function)
  Future<Map<String, dynamic>> markPatientCompleted(String queueId) async {
    try {
      final queue = await _firestoreService.getQueueById(queueId);
      if (queue == null) {
        return {
          'success': false,
          'message': 'Queue entry not found',
        };
      }

      final success = await _firestoreService.updateQueueStatus(
          queueId, QueueStatus.completed);

      if (success) {
        // Update department queue count
        await _updateDepartmentQueueCount(
            queue.hospitalId, queue.departmentName, -1);

        // Send completion notification
        await _notificationService.sendQueueCompletedNotification(
          patientEmail: queue.patientEmail,
          hospitalName: queue.hospitalName,
          departmentName: queue.departmentName,
        );

        return {
          'success': true,
          'message': 'Patient marked as completed',
        };
      }

      return {
        'success': false,
        'message': 'Failed to mark patient as completed',
      };
    } catch (e) {
      print('Error marking patient as completed: $e');
      return {
        'success': false,
        'message': 'An error occurred: ${e.toString()}',
      };
    }
  }

  /// Mark patient as no-show (Admin function)
  Future<Map<String, dynamic>> markPatientNoShow(String queueId) async {
    try {
      final queue = await _firestoreService.getQueueById(queueId);
      if (queue == null) {
        return {
          'success': false,
          'message': 'Queue entry not found',
        };
      }

      final success = await _firestoreService.updateQueueStatus(
          queueId, QueueStatus.noShow);

      if (success) {
        // Update department queue count
        await _updateDepartmentQueueCount(
            queue.hospitalId, queue.departmentName, -1);

        return {
          'success': true,
          'message': 'Patient marked as no-show',
        };
      }

      return {
        'success': false,
        'message': 'Failed to mark patient as no-show',
      };
    } catch (e) {
      print('Error marking patient as no-show: $e');
      return {
        'success': false,
        'message': 'An error occurred: ${e.toString()}',
      };
    }
  }

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  /// Calculate estimated wait time based on queue position
  Future<int> _calculateEstimatedWaitTime(
      String hospitalId, String departmentName, int queueNumber) async {
    try {
      // Get hospital to check average wait time for department
      final hospital = await _firestoreService.getHospitalById(hospitalId);
      if (hospital != null) {
        final department = hospital.departments.firstWhere(
          (d) => d.name == departmentName,
          orElse: () => DepartmentModel(
            name: departmentName,
            queueCount: 0,
            averageWaitTime: 15,
          ),
        );

        // Calculate wait time: (people ahead) * (average time per patient)
        final peopleAhead = queueNumber - 1;
        return peopleAhead * department.averageWaitTime;
      }

      // Default calculation: 15 minutes per person
      return (queueNumber - 1) * 15;
    } catch (e) {
      print('Error calculating wait time: $e');
      return (queueNumber - 1) * 15; // Fallback
    }
  }

  /// Update department queue count
  Future<void> _updateDepartmentQueueCount(
      String hospitalId, String departmentName, int increment) async {
    try {
      final hospital = await _firestoreService.getHospitalById(hospitalId);
      if (hospital != null) {
        final department = hospital.departments.firstWhere(
          (d) => d.name == departmentName,
          orElse: () => DepartmentModel(
            name: departmentName,
            queueCount: 0,
          ),
        );

        final newCount = (department.queueCount + increment).clamp(0, 999);
        await _firestoreService.updateDepartmentQueueCount(
            hospitalId, departmentName, newCount);
      }
    } catch (e) {
      print('Error updating department queue count: $e');
    }
  }

  /// Get queue statistics for a department
  Future<Map<String, dynamic>> getQueueStatistics(
      String hospitalId, String departmentName) async {
    try {
      final queues = await _firestoreService
          .getQueuesByHospitalAndDepartment(hospitalId, departmentName)
          .first;

      final waitingCount =
          queues.where((q) => q.status == QueueStatus.waiting).length;
      final inProgressCount =
          queues.where((q) => q.status == QueueStatus.inProgress).length;
      final averageWaitTime = waitingCount > 0
          ? queues
                  .where((q) => q.status == QueueStatus.waiting)
                  .map((q) => q.estimatedWaitTime)
                  .reduce((a, b) => a + b) ~/
              waitingCount
          : 0;

      return {
        'totalInQueue': waitingCount + inProgressCount,
        'waiting': waitingCount,
        'inProgress': inProgressCount,
        'averageWaitTime': averageWaitTime,
      };
    } catch (e) {
      print('Error getting queue statistics: $e');
      return {
        'totalInQueue': 0,
        'waiting': 0,
        'inProgress': 0,
        'averageWaitTime': 0,
      };
    }
  }
}
