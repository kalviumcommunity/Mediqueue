import 'package:cloud_firestore/cloud_firestore.dart';

enum QueueStatus {
  waiting,
  called,
  inProgress,
  completed,
  cancelled,
  noShow,
}

class QueueModel {
  final String id;
  final String hospitalId;
  final String hospitalName;
  final String departmentName;
  final String patientId;
  final String patientName;
  final String patientEmail;
  final String? patientPhone;
  final int queueNumber;
  final int estimatedWaitTime; // in minutes
  final QueueStatus status;
  final DateTime joinedAt;
  final DateTime? calledAt;
  final DateTime? completedAt;
  final String? notes;
  final String? priority; // normal, urgent, emergency
  final DateTime updatedAt;

  QueueModel({
    required this.id,
    required this.hospitalId,
    required this.hospitalName,
    required this.departmentName,
    required this.patientId,
    required this.patientName,
    required this.patientEmail,
    this.patientPhone,
    required this.queueNumber,
    required this.estimatedWaitTime,
    required this.status,
    required this.joinedAt,
    this.calledAt,
    this.completedAt,
    this.notes,
    this.priority = 'normal',
    required this.updatedAt,
  });

  // Factory constructor from Firestore document
  factory QueueModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return QueueModel(
      id: doc.id,
      hospitalId: data['hospitalId'] ?? '',
      hospitalName: data['hospitalName'] ?? '',
      departmentName: data['departmentName'] ?? '',
      patientId: data['patientId'] ?? '',
      patientName: data['patientName'] ?? '',
      patientEmail: data['patientEmail'] ?? '',
      patientPhone: data['patientPhone'],
      queueNumber: data['queueNumber'] ?? 0,
      estimatedWaitTime: data['estimatedWaitTime'] ?? 0,
      status: _statusFromString(data['status'] ?? 'waiting'),
      joinedAt: (data['joinedAt'] as Timestamp).toDate(),
      calledAt: data['calledAt'] != null
          ? (data['calledAt'] as Timestamp).toDate()
          : null,
      completedAt: data['completedAt'] != null
          ? (data['completedAt'] as Timestamp).toDate()
          : null,
      notes: data['notes'],
      priority: data['priority'] ?? 'normal',
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'hospitalId': hospitalId,
      'hospitalName': hospitalName,
      'departmentName': departmentName,
      'patientId': patientId,
      'patientName': patientName,
      'patientEmail': patientEmail,
      'patientPhone': patientPhone,
      'queueNumber': queueNumber,
      'estimatedWaitTime': estimatedWaitTime,
      'status': _statusToString(status),
      'joinedAt': Timestamp.fromDate(joinedAt),
      'calledAt': calledAt != null ? Timestamp.fromDate(calledAt!) : null,
      'completedAt':
          completedAt != null ? Timestamp.fromDate(completedAt!) : null,
      'notes': notes,
      'priority': priority,
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  // Helper methods to convert status enum
  static QueueStatus _statusFromString(String status) {
    switch (status.toLowerCase()) {
      case 'waiting':
        return QueueStatus.waiting;
      case 'called':
        return QueueStatus.called;
      case 'inprogress':
        return QueueStatus.inProgress;
      case 'completed':
        return QueueStatus.completed;
      case 'cancelled':
        return QueueStatus.cancelled;
      case 'noshow':
        return QueueStatus.noShow;
      default:
        return QueueStatus.waiting;
    }
  }

  static String _statusToString(QueueStatus status) {
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

  // Copy with method
  QueueModel copyWith({
    String? id,
    String? hospitalId,
    String? hospitalName,
    String? departmentName,
    String? patientId,
    String? patientName,
    String? patientEmail,
    String? patientPhone,
    int? queueNumber,
    int? estimatedWaitTime,
    QueueStatus? status,
    DateTime? joinedAt,
    DateTime? calledAt,
    DateTime? completedAt,
    String? notes,
    String? priority,
    DateTime? updatedAt,
  }) {
    return QueueModel(
      id: id ?? this.id,
      hospitalId: hospitalId ?? this.hospitalId,
      hospitalName: hospitalName ?? this.hospitalName,
      departmentName: departmentName ?? this.departmentName,
      patientId: patientId ?? this.patientId,
      patientName: patientName ?? this.patientName,
      patientEmail: patientEmail ?? this.patientEmail,
      patientPhone: patientPhone ?? this.patientPhone,
      queueNumber: queueNumber ?? this.queueNumber,
      estimatedWaitTime: estimatedWaitTime ?? this.estimatedWaitTime,
      status: status ?? this.status,
      joinedAt: joinedAt ?? this.joinedAt,
      calledAt: calledAt ?? this.calledAt,
      completedAt: completedAt ?? this.completedAt,
      notes: notes ?? this.notes,
      priority: priority ?? this.priority,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // Get user-friendly status text
  String get statusText {
    switch (status) {
      case QueueStatus.waiting:
        return 'Waiting';
      case QueueStatus.called:
        return 'Called';
      case QueueStatus.inProgress:
        return 'In Progress';
      case QueueStatus.completed:
        return 'Completed';
      case QueueStatus.cancelled:
        return 'Cancelled';
      case QueueStatus.noShow:
        return 'No Show';
    }
  }
}
