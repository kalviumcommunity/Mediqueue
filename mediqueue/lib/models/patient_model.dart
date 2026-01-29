import 'package:cloud_firestore/cloud_firestore.dart';

class PatientModel {
  final String id;
  final String userId; // Firebase Auth UID
  final String name;
  final String email;
  final String? phoneNumber;
  final DateTime? dateOfBirth;
  final String? bloodGroup;
  final String? address;
  final List<String> medicalHistory;
  final DateTime createdAt;
  final DateTime updatedAt;

  PatientModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.bloodGroup,
    this.address,
    this.medicalHistory = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor to create a PatientModel from Firestore document
  factory PatientModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return PatientModel(
      id: doc.id,
      userId: data['userId'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'],
      dateOfBirth: data['dateOfBirth'] != null
          ? (data['dateOfBirth'] as Timestamp).toDate()
          : null,
      bloodGroup: data['bloodGroup'],
      address: data['address'],
      medicalHistory: List<String>.from(data['medicalHistory'] ?? []),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  // Convert PatientModel to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'dateOfBirth':
          dateOfBirth != null ? Timestamp.fromDate(dateOfBirth!) : null,
      'bloodGroup': bloodGroup,
      'address': address,
      'medicalHistory': medicalHistory,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  // Copy with method for updating patient information
  PatientModel copyWith({
    String? id,
    String? userId,
    String? name,
    String? email,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? bloodGroup,
    String? address,
    List<String>? medicalHistory,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PatientModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      address: address ?? this.address,
      medicalHistory: medicalHistory ?? this.medicalHistory,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
