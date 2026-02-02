import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel {
  final String id;
  final String name;
  final String specialization;
  final String? qualification;
  final int? experience; // years
  final bool isAvailable;

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialization,
    this.qualification,
    this.experience,
    this.isAvailable = true,
  });

  factory DoctorModel.fromMap(Map<String, dynamic> data) {
    return DoctorModel(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      specialization: data['specialization'] ?? '',
      qualification: data['qualification'],
      experience: data['experience'],
      isAvailable: data['isAvailable'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'specialization': specialization,
      'qualification': qualification,
      'experience': experience,
      'isAvailable': isAvailable,
    };
  }
}

class DepartmentModel {
  final String id; // Add unique ID for department
  final String name;
  final String description; // Add description field
  final String openingTime; // Add opening time field
  final String closingTime; // Add closing time field
  final int queueCount;
  final int averageWaitTime; // in minutes
  final bool isOpen;
  final String? openingHours;
  final List<DoctorModel> doctors;

  DepartmentModel({
    required this.id,
    required this.name,
    this.description = '',
    this.openingTime = '',
    this.closingTime = '',
    required this.queueCount,
    this.averageWaitTime = 15,
    this.isOpen = true,
    this.openingHours,
    this.doctors = const [],
  });

  factory DepartmentModel.fromMap(Map<String, dynamic> data) {
    // Derive a stable id: prefer provided id, otherwise slugify the name so the
    // dropdowns don't regenerate a new id every rebuild.
    final String derivedId;
    final String rawId = (data['id'] ?? '') as String;
    if (rawId.isNotEmpty) {
      derivedId = rawId;
    } else {
      final name = (data['name'] ?? '').toString();
      derivedId = name.isNotEmpty
          ? name.toLowerCase().replaceAll(RegExp(r'\s+'), '_')
          : DateTime.now().millisecondsSinceEpoch.toString();
    }

    return DepartmentModel(
      id: derivedId,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      openingTime: data['openingTime'] ?? '',
      closingTime: data['closingTime'] ?? '',
      queueCount: data['queueCount'] ?? 0,
      averageWaitTime: data['averageWaitTime'] ?? 15,
      isOpen: data['isOpen'] ?? true,
      openingHours: data['openingHours'],
      doctors: (data['doctors'] as List<dynamic>? ?? [])
          .map((doc) => DoctorModel.fromMap(doc as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'openingTime': openingTime,
      'closingTime': closingTime,
      'queueCount': queueCount,
      'averageWaitTime': averageWaitTime,
      'isOpen': isOpen,
      'openingHours': openingHours,
      'doctors': doctors.map((doc) => doc.toMap()).toList(),
    };
  }
}

class HospitalModel {
  final String id;
  final String name;
  final String location;
  final double latitude;
  final double longitude;
  final List<DepartmentModel> departments;
  final String? phoneNumber;
  final String? email;
  final String? website;
  final double? rating;
  final String? description;
  final List<String> facilities;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? emergencyContact;

  HospitalModel({
    required this.id,
    required this.name,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.departments,
    this.phoneNumber,
    this.email,
    this.website,
    this.rating,
    this.description,
    this.facilities = const [],
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
    this.emergencyContact,
  });

  // Convenience getters for compatibility
  String get address => location;
  String get phone => phoneNumber ?? '';

  // Factory constructor from Firestore document
  factory HospitalModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return HospitalModel(
      id: doc.id,
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      latitude: (data['latitude'] ?? 0.0).toDouble(),
      longitude: (data['longitude'] ?? 0.0).toDouble(),
      departments: (data['departments'] as List<dynamic>? ?? [])
          .map((dept) => DepartmentModel.fromMap(dept as Map<String, dynamic>))
          .toList(),
      phoneNumber: data['phoneNumber'] ?? data['phone'],
      email: data['email'],
      website: data['website'],
      rating: data['rating']?.toDouble(),
      description: data['description'],
      facilities: List<String>.from(data['facilities'] ?? []),
      isActive: data['isActive'] ?? true,
      createdAt: data['createdAt'] != null
          ? (data['createdAt'] as Timestamp).toDate()
          : null,
      updatedAt: data['updatedAt'] != null
          ? (data['updatedAt'] as Timestamp).toDate()
          : null,
      emergencyContact: data['emergencyContact'],
    );
  }

  // Legacy support - keep fromMap for backward compatibility
  factory HospitalModel.fromMap(String id, Map<String, dynamic> data) {
    return HospitalModel(
      id: id,
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      latitude: (data['latitude'] ?? 0.0).toDouble(),
      longitude: (data['longitude'] ?? 0.0).toDouble(),
      departments: (data['departments'] as List<dynamic>? ?? [])
          .map((dept) => DepartmentModel.fromMap(dept as Map<String, dynamic>))
          .toList(),
      phoneNumber: data['phoneNumber'],
      email: data['email'],
      website: data['website'],
      rating: data['rating']?.toDouble(),
      description: data['description'],
      facilities: List<String>.from(data['facilities'] ?? []),
      isActive: data['isActive'] ?? true,
    );
  }

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'departments': departments.map((dept) => dept.toMap()).toList(),
      'phoneNumber': phoneNumber,
      'email': email,
      'website': website,
      'rating': rating,
      'description': description,
      'facilities': facilities,
      'isActive': isActive,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
      'updatedAt': updatedAt != null
          ? Timestamp.fromDate(updatedAt!)
          : FieldValue.serverTimestamp(),
    };
  }

  // Get total queue count across all departments
  int get totalQueueCount {
    return departments.fold(0, (sum, dept) => sum + dept.queueCount);
  }

  // Get list of open departments
  List<DepartmentModel> get openDepartments {
    return departments.where((dept) => dept.isOpen).toList();
  }

  // Copy with method
  HospitalModel copyWith({
    String? id,
    String? name,
    String? location,
    double? latitude,
    double? longitude,
    List<DepartmentModel>? departments,
    String? phoneNumber,
    String? email,
    String? website,
    double? rating,
    String? description,
    List<String>? facilities,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return HospitalModel(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      departments: departments ?? this.departments,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      website: website ?? this.website,
      rating: rating ?? this.rating,
      description: description ?? this.description,
      facilities: facilities ?? this.facilities,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
