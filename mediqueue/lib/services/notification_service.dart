class NotificationService {
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
  }

  // Send notification when patient is called (admin action)
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
}
