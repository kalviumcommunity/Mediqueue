import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String email;
  final String userType; // 'patient' or 'admin'
  final String? fullName;
  final String? phoneNumber;
  final DateTime createdAt;
  final DateTime? updatedAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.userType,
    this.fullName,
    this.phoneNumber,
    required this.createdAt,
    this.updatedAt,
  });

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'userType': userType,
      'fullName': fullName ?? '',
      'phoneNumber': phoneNumber ?? '',
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  // Create from Firestore document
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      userType: map['userType'] ?? 'patient',
      fullName: map['fullName'],
      phoneNumber: map['phoneNumber'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt:
          map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
    );
  }

  // Create from Firebase User
  factory UserModel.fromFirebaseUser(User user, String userType) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      userType: userType,
      createdAt: DateTime.now(),
    );
  }

  // Check if user is admin
  bool get isAdmin => userType == 'admin';

  // Get display name
  String get displayName {
    if (fullName != null && fullName!.isNotEmpty) {
      return fullName!;
    }
    // Extract name from email (john@gmail.com → John)
    final namePart = email.split('@').first;
    return namePart[0].toUpperCase() + namePart.substring(1);
  }
}
