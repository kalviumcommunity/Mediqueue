import 'dart:math' show cos, sin, sqrt, atan2, pi;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/hospital_model.dart';
import '../models/patient_model.dart';
import '../models/queue_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Collection references
  CollectionReference get _hospitalsCollection => _db.collection('hospitals');
  CollectionReference get _patientsCollection => _db.collection('patients');
  CollectionReference get _queuesCollection => _db.collection('queues');
  CollectionReference get _departmentsCollection =>
      _db.collection('departments');

  // ============================================================================
  // HOSPITAL CRUD OPERATIONS
  // ============================================================================

  /// Get all hospitals
  Stream<List<HospitalModel>> getHospitals() {
    return _hospitalsCollection
        .where('isActive', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => HospitalModel.fromFirestore(doc))
            .toList());
  }

  /// Get hospital by ID
  Future<HospitalModel?> getHospitalById(String hospitalId) async {
    try {
      final doc = await _hospitalsCollection.doc(hospitalId).get();
      if (doc.exists) {
        return HospitalModel.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error getting hospital: $e');
      return null;
    }
  }

  /// Add a new hospital
  Future<String?> addHospital(HospitalModel hospital) async {
    try {
      final docRef = await _hospitalsCollection.add(hospital.toMap());
      return docRef.id;
    } catch (e) {
      print('Error adding hospital: $e');
      return null;
    }
  }

  /// Update hospital information
  Future<bool> updateHospital(
      String hospitalId, Map<String, dynamic> data) async {
    try {
      data['updatedAt'] = FieldValue.serverTimestamp();
      await _hospitalsCollection.doc(hospitalId).update(data);
      return true;
    } catch (e) {
      print('Error updating hospital: $e');
      return false;
    }
  }

  /// Delete hospital (soft delete by setting isActive to false)
  Future<bool> deleteHospital(String hospitalId) async {
    try {
      await _hospitalsCollection.doc(hospitalId).update({
        'isActive': false,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      return true;
    } catch (e) {
      print('Error deleting hospital: $e');
      return false;
    }
  }

  /// Update department queue count
  Future<bool> updateDepartmentQueueCount(
      String hospitalId, String departmentName, int newCount) async {
    try {
      final hospital = await getHospitalById(hospitalId);
      if (hospital == null) return false;

      final updatedDepartments = hospital.departments.map((dept) {
        if (dept.name == departmentName) {
          return DepartmentModel(
            name: dept.name,
            queueCount: newCount,
            averageWaitTime: dept.averageWaitTime,
            isOpen: dept.isOpen,
            openingHours: dept.openingHours,
          );
        }
        return dept;
      }).toList();

      await _hospitalsCollection.doc(hospitalId).update({
        'departments': updatedDepartments.map((d) => d.toMap()).toList(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      return true;
    } catch (e) {
      print('Error updating department queue count: $e');
      return false;
    }
  }

  // ============================================================================
  // PATIENT CRUD OPERATIONS
  // ============================================================================

  /// Get patient by user ID (Firebase Auth UID)
  Future<PatientModel?> getPatientByUserId(String userId) async {
    try {
      final snapshot = await _patientsCollection
          .where('userId', isEqualTo: userId)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        return PatientModel.fromFirestore(snapshot.docs.first);
      }
      return null;
    } catch (e) {
      print('Error getting patient: $e');
      return null;
    }
  }

  /// Get patient by document ID
  Future<PatientModel?> getPatientById(String patientId) async {
    try {
      final doc = await _patientsCollection.doc(patientId).get();
      if (doc.exists) {
        return PatientModel.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error getting patient by ID: $e');
      return null;
    }
  }

  /// Create a new patient profile
  Future<String?> createPatient(PatientModel patient) async {
    try {
      final docRef = await _patientsCollection.add(patient.toMap());
      return docRef.id;
    } catch (e) {
      print('Error creating patient: $e');
      return null;
    }
  }

  /// Update patient information
  Future<bool> updatePatient(
      String patientId, Map<String, dynamic> data) async {
    try {
      data['updatedAt'] = FieldValue.serverTimestamp();
      await _patientsCollection.doc(patientId).update(data);
      return true;
    } catch (e) {
      print('Error updating patient: $e');
      return false;
    }
  }

  /// Delete patient
  Future<bool> deletePatient(String patientId) async {
    try {
      await _patientsCollection.doc(patientId).delete();
      return true;
    } catch (e) {
      print('Error deleting patient: $e');
      return false;
    }
  }

  // ============================================================================
  // QUEUE CRUD OPERATIONS
  // ============================================================================

  /// Get all queues for a specific hospital and department
  Stream<List<QueueModel>> getQueuesByHospitalAndDepartment(
      String hospitalId, String departmentName) {
    return _queuesCollection
        .where('hospitalId', isEqualTo: hospitalId)
        .where('departmentName', isEqualTo: departmentName)
        .where('status', whereIn: ['waiting', 'called', 'inProgress'])
        .orderBy('queueNumber')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => QueueModel.fromFirestore(doc)).toList());
  }

  /// Get active queue for a patient
  Stream<List<QueueModel>> getActiveQueuesForPatient(String patientId) {
    return _queuesCollection
        .where('patientId', isEqualTo: patientId)
        .where('status', whereIn: ['waiting', 'called', 'inProgress'])
        .orderBy('joinedAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => QueueModel.fromFirestore(doc)).toList());
  }

  /// Get queue history for a patient
  Future<List<QueueModel>> getQueueHistoryForPatient(String patientId,
      {int limit = 10}) async {
    try {
      final snapshot = await _queuesCollection
          .where('patientId', isEqualTo: patientId)
          .orderBy('joinedAt', descending: true)
          .limit(limit)
          .get();

      return snapshot.docs.map((doc) => QueueModel.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error getting queue history: $e');
      return [];
    }
  }

  /// Get queue by ID
  Future<QueueModel?> getQueueById(String queueId) async {
    try {
      final doc = await _queuesCollection.doc(queueId).get();
      if (doc.exists) {
        return QueueModel.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error getting queue: $e');
      return null;
    }
  }

  /// Add patient to queue
  Future<String?> addToQueue(QueueModel queue) async {
    try {
      final docRef = await _queuesCollection.add(queue.toMap());
      return docRef.id;
    } catch (e) {
      print('Error adding to queue: $e');
      return null;
    }
  }

  /// Update queue status
  Future<bool> updateQueueStatus(String queueId, QueueStatus status) async {
    try {
      Map<String, dynamic> updateData = {
        'status': _statusToString(status),
        'updatedAt': FieldValue.serverTimestamp(),
      };

      if (status == QueueStatus.called) {
        updateData['calledAt'] = FieldValue.serverTimestamp();
      } else if (status == QueueStatus.completed) {
        updateData['completedAt'] = FieldValue.serverTimestamp();
      }

      await _queuesCollection.doc(queueId).update(updateData);
      return true;
    } catch (e) {
      print('Error updating queue status: $e');
      return false;
    }
  }

  /// Update queue information
  Future<bool> updateQueue(String queueId, Map<String, dynamic> data) async {
    try {
      data['updatedAt'] = FieldValue.serverTimestamp();
      await _queuesCollection.doc(queueId).update(data);
      return true;
    } catch (e) {
      print('Error updating queue: $e');
      return false;
    }
  }

  /// Cancel queue entry
  Future<bool> cancelQueue(String queueId) async {
    return await updateQueueStatus(queueId, QueueStatus.cancelled);
  }

  /// Delete queue entry
  Future<bool> deleteQueue(String queueId) async {
    try {
      await _queuesCollection.doc(queueId).delete();
      return true;
    } catch (e) {
      print('Error deleting queue: $e');
      return false;
    }
  }

  /// Get next queue number for a department
  Future<int> getNextQueueNumber(
      String hospitalId, String departmentName) async {
    try {
      final snapshot = await _queuesCollection
          .where('hospitalId', isEqualTo: hospitalId)
          .where('departmentName', isEqualTo: departmentName)
          .orderBy('queueNumber', descending: true)
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        return 1;
      }

      final lastQueue = QueueModel.fromFirestore(snapshot.docs.first);
      return lastQueue.queueNumber + 1;
    } catch (e) {
      print('Error getting next queue number: $e');
      // Fallback to counting current queues
      final count = await _queuesCollection
          .where('hospitalId', isEqualTo: hospitalId)
          .where('departmentName', isEqualTo: departmentName)
          .where('status', whereIn: ['waiting', 'called', 'inProgress']).get();
      return count.docs.length + 1;
    }
  }

  /// Get current position in queue
  Future<int> getQueuePosition(String queueId) async {
    try {
      final currentQueue = await getQueueById(queueId);
      if (currentQueue == null) return -1;

      final snapshot = await _queuesCollection
          .where('hospitalId', isEqualTo: currentQueue.hospitalId)
          .where('departmentName', isEqualTo: currentQueue.departmentName)
          .where('status', isEqualTo: 'waiting')
          .where('queueNumber', isLessThan: currentQueue.queueNumber)
          .get();

      return snapshot.docs.length + 1;
    } catch (e) {
      print('Error getting queue position: $e');
      return -1;
    }
  }

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  String _statusToString(QueueStatus status) {
    switch (status) {
      case QueueStatus.waiting:
        return 'waiting';
      case QueueStatus.called:
        return 'called';
      case QueueStatus.inProgress:
        return 'inProgress';
      case QueueStatus.completed:
        return 'completed';
      case QueueStatus.cancelled:
        return 'cancelled';
      case QueueStatus.noShow:
        return 'noShow';
      
    }
  }

  // ============================================================================
  // SEARCH & FILTER OPERATIONS
  // ============================================================================

  /// Search hospitals by name or location
  Future<List<HospitalModel>> searchHospitals(String query) async {
    try {
      final snapshot =
          await _hospitalsCollection.where('isActive', isEqualTo: true).get();

      final allHospitals =
          snapshot.docs.map((doc) => HospitalModel.fromFirestore(doc)).toList();

      // Filter in memory (Firestore doesn't support full-text search natively)
      return allHospitals.where((hospital) {
        final searchQuery = query.toLowerCase();
        return hospital.name.toLowerCase().contains(searchQuery) ||
            hospital.location.toLowerCase().contains(searchQuery);
      }).toList();
    } catch (e) {
      print('Error searching hospitals: $e');
      return [];
    }
  }

  /// Get hospitals within a radius (requires geohashing or GeoFlutterFire)
  /// This is a simple implementation using bounding box
  Future<List<HospitalModel>> getNearbyHospitals(
      double latitude, double longitude, double radiusInKm) async {
    try {
      // Calculate approximate bounding box
      final latDelta = radiusInKm / 111.0; // 1 degree latitude ≈ 111 km
      final lonDelta = radiusInKm / (111.0 * cos(latitude * pi / 180));

      final snapshot = await _hospitalsCollection
          .where('isActive', isEqualTo: true)
          .where('latitude', isGreaterThan: latitude - latDelta)
          .where('latitude', isLessThan: latitude + latDelta)
          .get();

      final hospitals = snapshot.docs
          .map((doc) => HospitalModel.fromFirestore(doc))
          .where((hospital) {
        // Calculate actual distance
        final distance = _calculateDistance(
            latitude, longitude, hospital.latitude, hospital.longitude);
        return distance <= radiusInKm;
      }).toList();

      // Sort by distance
      hospitals.sort((a, b) {
        final distA =
            _calculateDistance(latitude, longitude, a.latitude, a.longitude);
        final distB =
            _calculateDistance(latitude, longitude, b.latitude, b.longitude);
        return distA.compareTo(distB);
      });

      return hospitals;
    } catch (e) {
      print('Error getting nearby hospitals: $e');
      return [];
    }
  }

  /// Calculate distance between two coordinates (Haversine formula)
  double _calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const R = 6371; // Earth's radius in km
    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c;
  }

  double _toRadians(double degree) {
    return degree * pi / 180;
  }
}
