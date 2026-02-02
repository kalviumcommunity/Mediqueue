// class NotificationService {
//   // Send notification when patient joins the queue
//   Future<void> sendQueueJoinedNotification({
//     required String patientEmail,
//     required String hospitalName,
//     required String departmentName,
//     required int queueNumber,
//     required int estimatedWaitTime,
//   }) async {
//     print(
//         'Queue Joined Notification sent to $patientEmail for $hospitalName/$departmentName. Queue #: $queueNumber, Estimated wait: $estimatedWaitTime mins.');
//   }

//   // Send notification when patient cancels/leaves the queue
//   Future<void> sendQueueCancelledNotification({
//     required String patientEmail,
//     required String hospitalName,
//     required String departmentName,
//     required int queueNumber,
//   }) async {
//     print(
//         'Queue Cancelled Notification sent to $patientEmail for $hospitalName/$departmentName. Queue #: $queueNumber');
//   }

//   // Send notification when patient is called (admin action)
//   Future<void> sendPatientCalledNotification({
//     required String patientEmail,
//     required String hospitalName,
//     required String departmentName,
//     required int queueNumber,
//   }) async {
//     print(
//         'Patient Called Notification sent to $patientEmail for $hospitalName/$departmentName. Queue #: $queueNumber');
//   }

//   // Send notification when patient queue is completed
//   Future<void> sendQueueCompletedNotification({
//     required String patientEmail,
//     required String hospitalName,
//     required String departmentName,
//   }) async {
//     print(
//         'Queue Completed Notification sent to $patientEmail for $hospitalName/$departmentName.');
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ================= SMS SENDING CAPABILITY =================

  /// Send SMS via third-party API (Mock implementation - replace with real API)
  Future<bool> sendSmsNotification({
    required String phoneNumber,
    required String message,
  }) async {
    try {
      // TODO: Replace with real SMS API (Twilio, AWS SNS, etc.)
      // For now, we'll mock it and log to console

      // Validate phone number
      if (phoneNumber.isEmpty || !phoneNumber.contains(RegExp(r'[0-9]'))) {
        print('❌ Invalid phone number: $phoneNumber');
        return false;
      }

      // Mock SMS sending - replace this with actual API call
      print('📱 [SMS SENT] To: $phoneNumber');
      print('   Message: $message');

      // Simulate API delay
      await Future.delayed(const Duration(milliseconds: 500));

      // In real implementation:
      // final response = await http.post(
      //   Uri.parse('https://api.twilio.com/2010-04-01/Accounts/{AccountSid}/Messages.json'),
      //   headers: {
      //     'Authorization': 'Basic ' + base64Encode(utf8.encode('$accountSid:$authToken')),
      //     'Content-Type': 'application/x-www-form-urlencoded',
      //   },
      //   body: {
      //     'To': phoneNumber,
      //     'From': '+1234567890', // Your Twilio number
      //     'Body': message,
      //   },
      // );
      //
      // return response.statusCode == 201;

      return true; // Mock success
    } catch (e) {
      print('❌ SMS sending failed: $e');
      return false;
    }
  }

  // ================= PATIENT PREFERENCE CHECK =================

  /// Get patient's SMS preference from Firestore
  Future<bool> getPatientSmsPreference(String patientId) async {
    try {
      final doc = await _firestore.collection('patients').doc(patientId).get();

      if (doc.exists) {
        final data = doc.data();
        final preferences = data?['preferences'] as Map<String, dynamic>? ?? {};
        return preferences['smsEnabled'] ?? true; // Default to true if not set
      }

      return true; // Default to true if patient not found
    } catch (e) {
      print('❌ Error getting SMS preference: $e');
      return true; // Default to true on error
    }
  }

  // ================= ENHANCED NOTIFICATION METHODS =================

  /// Send notification when patient is called (with SMS option)
  /// Send notification when patient is called (with SMS option)
  Future<Map<String, dynamic>> sendPatientCalledNotificationWithSms({
    required String patientId,
    required String patientEmail,
    required String? patientPhone,
    required String hospitalName,
    required String departmentName,
    required int queueNumber,
  }) async {
    try {
      // Get patient's SMS preference
      final smsEnabled = await getPatientSmsPreference(patientId);

      // Create notification message
      final message =
          'Your queue number $queueNumber for $departmentName at $hospitalName is next. Please proceed to the counter.';

      // Results tracking - FIXED: Explicitly cast to bool
      final results = {
        'inAppSent': false,
        'smsSent': false,
        'smsEnabled': smsEnabled,
        'hasPhone': (patientPhone?.isNotEmpty ??
            false), // ✅ FIXED: Convert bool? to bool
      };

      // 1. Always send in-app/email notification (existing method)
      await sendPatientCalledNotification(
        patientEmail: patientEmail,
        hospitalName: hospitalName,
        departmentName: departmentName,
        queueNumber: queueNumber,
      );
      results['inAppSent'] = true;

      // 2. Send SMS only if enabled AND phone exists
      if (smsEnabled && patientPhone != null && patientPhone.isNotEmpty) {
        final smsResult = await sendSmsNotification(
          phoneNumber: patientPhone,
          message: message,
        );
        results['smsSent'] = smsResult;

        if (smsResult) {
          print('✅ SMS notification sent successfully');
        } else {
          print('⚠️ SMS notification failed (fallback to in-app only)');
        }
      } else {
        print(
            'ℹ️ SMS not sent. Enabled: $smsEnabled, Has Phone: ${patientPhone?.isNotEmpty == true}');
      }

      // Log notification sent
      await _logNotification(
        patientId: patientId,
        type: 'patient_called',
        message: message,
        smsSent: results['smsSent'] ?? false,
        smsEnabled: smsEnabled,
      );

      return results;
    } catch (e) {
      print('❌ Error in sendPatientCalledNotificationWithSms: $e');
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  // ================= EXISTING METHODS (UPDATED WITH SMS OPTION) =================

  // Send notification when patient joins the queue
  Future<void> sendQueueJoinedNotification({
    required String patientEmail,
    required String hospitalName,
    required String departmentName,
    required int queueNumber,
    required int estimatedWaitTime,
  }) async {
    print(
        'Queue Joined Notification sent to $patientEmail for $hospitalName/$departmentName. Queue #: $queueNumber, Estimated wait: $estimatedWaitTime mins.');

    // TODO: Add SMS option here if needed
  }

  // Send notification when patient cancels/leaves the queue
  Future<void> sendQueueCancelledNotification({
    required String patientEmail,
    required String hospitalName,
    required String departmentName,
    required int queueNumber,
  }) async {
    print(
        'Queue Cancelled Notification sent to $patientEmail for $hospitalName/$departmentName. Queue #: $queueNumber');

    // TODO: Add SMS option here if needed
  }

  // Send notification when patient is called (admin action) - ORIGINAL
  Future<void> sendPatientCalledNotification({
    required String patientEmail,
    required String hospitalName,
    required String departmentName,
    required int queueNumber,
  }) async {
    print(
        'Patient Called Notification sent to $patientEmail for $hospitalName/$departmentName. Queue #: $queueNumber');
  }

  // Send notification when patient queue is completed
  Future<void> sendQueueCompletedNotification({
    required String patientEmail,
    required String hospitalName,
    required String departmentName,
  }) async {
    print(
        'Queue Completed Notification sent to $patientEmail for $hospitalName/$departmentName.');
  }

  // ================= HELPER METHODS =================

  /// Log notification to Firestore for tracking
  Future<void> _logNotification({
    required String patientId,
    required String type,
    required String message,
    bool smsSent = false,
    bool smsEnabled = false,
  }) async {
    try {
      await _firestore.collection('notifications').add({
        'patientId': patientId,
        'type': type, // 'patient_called', 'queue_joined', etc.
        'message': message,
        'smsSent': smsSent,
        'smsEnabled': smsEnabled,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('❌ Error logging notification: $e');
    }
  }

  /// Get patient's notification history
  Future<List<Map<String, dynamic>>> getPatientNotifications(
      String patientId) async {
    try {
      final query = await _firestore
          .collection('notifications')
          .where('patientId', isEqualTo: patientId)
          .orderBy('timestamp', descending: true)
          .limit(50)
          .get();

      return query.docs.map((doc) {
        final data = doc.data();
        return {
          'id': doc.id,
          ...data,
          'timestamp': (data['timestamp'] as Timestamp?)?.toDate(),
        };
      }).toList();
    } catch (e) {
      print('❌ Error getting notifications: $e');
      return [];
    }
  }
}
