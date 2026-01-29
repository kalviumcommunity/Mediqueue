import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/hospital_model.dart';

/// Sample data initialization for MediQueue
/// Run this once to populate your Firestore database with sample hospitals
class SampleDataInitializer {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Initialize sample hospital data
  Future<void> initializeSampleData() async {
    try {
      print('Starting sample data initialization...');

      // Check if data already exists
      final existingHospitals =
          await _db.collection('hospitals').limit(1).get();
      if (existingHospitals.docs.isNotEmpty) {
        print('Sample data already exists. Skipping initialization.');
        return;
      }

      await _addSampleHospitals();

      print('✅ Sample data initialization completed successfully!');
    } catch (e) {
      print('❌ Error initializing sample data: $e');
      rethrow;
    }
  }

  /// Add sample hospitals
  Future<void> _addSampleHospitals() async {
    final hospitals = [
      HospitalModel(
        id: '',
        name: 'City General Hospital',
        location: '123 Main Street, Downtown',
        latitude: 28.6139,
        longitude: 77.2090,
        phoneNumber: '+91-11-12345678',
        email: 'info@citygeneralhospital.com',
        website: 'https://citygeneralhospital.com',
        rating: 4.5,
        description:
            'Leading healthcare provider offering comprehensive medical services with state-of-the-art facilities.',
        facilities: [
          'Emergency 24/7',
          'ICU',
          'Pharmacy',
          'Laboratory',
          'X-Ray',
          'CT Scan',
          'Ambulance',
          'Blood Bank'
        ],
        isActive: true,
        departments: [
          DepartmentModel(
            name: 'General Medicine',
            queueCount: 12,
            averageWaitTime: 20,
            isOpen: true,
            openingHours: '8:00 AM - 8:00 PM',
          ),
          DepartmentModel(
            name: 'Cardiology',
            queueCount: 5,
            averageWaitTime: 30,
            isOpen: true,
            openingHours: '9:00 AM - 6:00 PM',
          ),
          DepartmentModel(
            name: 'Orthopedics',
            queueCount: 8,
            averageWaitTime: 25,
            isOpen: true,
            openingHours: '8:00 AM - 5:00 PM',
          ),
          DepartmentModel(
            name: 'Pediatrics',
            queueCount: 15,
            averageWaitTime: 15,
            isOpen: true,
            openingHours: '24/7',
          ),
          DepartmentModel(
            name: 'Emergency',
            queueCount: 3,
            averageWaitTime: 5,
            isOpen: true,
            openingHours: '24/7',
          ),
        ],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      HospitalModel(
        id: '',
        name: 'Apollo Medical Center',
        location: '456 Healthcare Avenue, Medical District',
        latitude: 28.5355,
        longitude: 77.3910,
        phoneNumber: '+91-11-23456789',
        email: 'contact@apollomedical.com',
        website: 'https://apollomedical.com',
        rating: 4.7,
        description:
            'Premier multi-specialty hospital with advanced medical technology and expert healthcare professionals.',
        facilities: [
          'Emergency 24/7',
          'ICU',
          'NICU',
          'Pharmacy',
          'Laboratory',
          'MRI',
          'CT Scan',
          'Dialysis',
          'Ambulance'
        ],
        isActive: true,
        departments: [
          DepartmentModel(
            name: 'General Medicine',
            queueCount: 10,
            averageWaitTime: 18,
            isOpen: true,
            openingHours: '7:00 AM - 9:00 PM',
          ),
          DepartmentModel(
            name: 'Cardiology',
            queueCount: 7,
            averageWaitTime: 35,
            isOpen: true,
            openingHours: '8:00 AM - 7:00 PM',
          ),
          DepartmentModel(
            name: 'Neurology',
            queueCount: 4,
            averageWaitTime: 40,
            isOpen: true,
            openingHours: '9:00 AM - 5:00 PM',
          ),
          DepartmentModel(
            name: 'Oncology',
            queueCount: 6,
            averageWaitTime: 45,
            isOpen: true,
            openingHours: '8:00 AM - 6:00 PM',
          ),
          DepartmentModel(
            name: 'Emergency',
            queueCount: 2,
            averageWaitTime: 5,
            isOpen: true,
            openingHours: '24/7',
          ),
        ],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      HospitalModel(
        id: '',
        name: 'Max Healthcare Hospital',
        location: '789 Wellness Road, North District',
        latitude: 28.7041,
        longitude: 77.1025,
        phoneNumber: '+91-11-34567890',
        email: 'info@maxhealthcare.com',
        website: 'https://maxhealthcare.com',
        rating: 4.6,
        description:
            'Trusted healthcare institution providing quality medical care with compassion and innovation.',
        facilities: [
          'Emergency 24/7',
          'ICU',
          'PICU',
          'Pharmacy',
          'Laboratory',
          'Radiology',
          'Physiotherapy',
          'Ambulance',
          'Blood Bank'
        ],
        isActive: true,
        departments: [
          DepartmentModel(
            name: 'General Medicine',
            queueCount: 14,
            averageWaitTime: 22,
            isOpen: true,
            openingHours: '6:00 AM - 10:00 PM',
          ),
          DepartmentModel(
            name: 'Orthopedics',
            queueCount: 9,
            averageWaitTime: 28,
            isOpen: true,
            openingHours: '8:00 AM - 6:00 PM',
          ),
          DepartmentModel(
            name: 'ENT',
            queueCount: 6,
            averageWaitTime: 20,
            isOpen: true,
            openingHours: '9:00 AM - 5:00 PM',
          ),
          DepartmentModel(
            name: 'Dermatology',
            queueCount: 8,
            averageWaitTime: 25,
            isOpen: true,
            openingHours: '9:00 AM - 6:00 PM',
          ),
          DepartmentModel(
            name: 'Emergency',
            queueCount: 4,
            averageWaitTime: 8,
            isOpen: true,
            openingHours: '24/7',
          ),
        ],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      HospitalModel(
        id: '',
        name: 'Fortis Memorial Hospital',
        location: '321 Medical Plaza, South District',
        latitude: 28.4595,
        longitude: 77.0266,
        phoneNumber: '+91-11-45678901',
        email: 'contact@fortismemorial.com',
        website: 'https://fortismemorial.com',
        rating: 4.4,
        description:
            'Comprehensive healthcare facility with specialized departments and modern medical equipment.',
        facilities: [
          'Emergency 24/7',
          'ICU',
          'CCU',
          'Pharmacy',
          'Laboratory',
          'Ultrasound',
          'ECG',
          'Ambulance'
        ],
        isActive: true,
        departments: [
          DepartmentModel(
            name: 'General Medicine',
            queueCount: 11,
            averageWaitTime: 20,
            isOpen: true,
            openingHours: '8:00 AM - 8:00 PM',
          ),
          DepartmentModel(
            name: 'Gynecology',
            queueCount: 7,
            averageWaitTime: 30,
            isOpen: true,
            openingHours: '9:00 AM - 6:00 PM',
          ),
          DepartmentModel(
            name: 'Pediatrics',
            queueCount: 13,
            averageWaitTime: 18,
            isOpen: true,
            openingHours: '24/7',
          ),
          DepartmentModel(
            name: 'Ophthalmology',
            queueCount: 5,
            averageWaitTime: 22,
            isOpen: true,
            openingHours: '9:00 AM - 5:00 PM',
          ),
          DepartmentModel(
            name: 'Emergency',
            queueCount: 3,
            averageWaitTime: 6,
            isOpen: true,
            openingHours: '24/7',
          ),
        ],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      HospitalModel(
        id: '',
        name: 'BLK Super Speciality Hospital',
        location: '567 Healthcare Boulevard, Central District',
        latitude: 28.6517,
        longitude: 77.1741,
        phoneNumber: '+91-11-56789012',
        email: 'info@blkhospital.com',
        website: 'https://blkhospital.com',
        rating: 4.8,
        description:
            'Super speciality hospital with world-class infrastructure and internationally trained specialists.',
        facilities: [
          'Emergency 24/7',
          'ICU',
          'NICU',
          'PICU',
          'Pharmacy',
          'Laboratory',
          'MRI',
          'CT Scan',
          'PET Scan',
          'Cath Lab',
          'Ambulance',
          'Blood Bank'
        ],
        isActive: true,
        departments: [
          DepartmentModel(
            name: 'General Medicine',
            queueCount: 8,
            averageWaitTime: 18,
            isOpen: true,
            openingHours: '7:00 AM - 9:00 PM',
          ),
          DepartmentModel(
            name: 'Cardiology',
            queueCount: 9,
            averageWaitTime: 38,
            isOpen: true,
            openingHours: '8:00 AM - 7:00 PM',
          ),
          DepartmentModel(
            name: 'Neurosurgery',
            queueCount: 3,
            averageWaitTime: 50,
            isOpen: true,
            openingHours: '9:00 AM - 5:00 PM',
          ),
          DepartmentModel(
            name: 'Gastroenterology',
            queueCount: 6,
            averageWaitTime: 32,
            isOpen: true,
            openingHours: '9:00 AM - 6:00 PM',
          ),
          DepartmentModel(
            name: 'Emergency',
            queueCount: 2,
            averageWaitTime: 4,
            isOpen: true,
            openingHours: '24/7',
          ),
        ],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];

    // Add hospitals to Firestore
    for (final hospital in hospitals) {
      await _db.collection('hospitals').add(hospital.toMap());
      print('✅ Added: ${hospital.name}');
    }
  }

  /// Create admin user (call after creating a user via Firebase Auth)
  Future<void> createAdminUser(String userId, String email,
      {String? hospitalId}) async {
    try {
      await _db.collection('admins').doc(userId).set({
        'email': email,
        'hospitalId': hospitalId,
        'role': 'admin',
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Also add to user_roles collection
      await _db.collection('user_roles').doc(userId).set({
        'role': 'admin',
        'hospitalId': hospitalId,
        'permissions': ['read', 'write', 'delete'],
        'createdAt': FieldValue.serverTimestamp(),
      });

      print('✅ Admin user created: $email');
    } catch (e) {
      print('❌ Error creating admin user: $e');
      rethrow;
    }
  }

  /// Clear all sample data (use with caution!)
  Future<void> clearAllData() async {
    try {
      print('⚠️ Clearing all data...');

      // Delete all hospitals
      final hospitals = await _db.collection('hospitals').get();
      for (final doc in hospitals.docs) {
        await doc.reference.delete();
      }

      // Delete all queues
      final queues = await _db.collection('queues').get();
      for (final doc in queues.docs) {
        await doc.reference.delete();
      }

      // Delete all patients
      final patients = await _db.collection('patients').get();
      for (final doc in patients.docs) {
        await doc.reference.delete();
      }

      print('✅ All data cleared!');
    } catch (e) {
      print('❌ Error clearing data: $e');
      rethrow;
    }
  }
}
