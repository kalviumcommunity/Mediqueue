import 'package:cloud_firestore/cloud_firestore.dart';

/// Run this function once to add sample hospitals with coordinates to Firebase
/// You can call this from your app's initial screen or a debug button
Future<void> addSampleHospitals() async {
  final firestore = FirebaseFirestore.instance;

  final sampleHospitals = [
    {
      'name': 'City General Hospital',
      'location': '123 Main Street, Downtown, New Delhi',
      'latitude': 28.6139,
      'longitude': 77.2090,
      'departments': [
        {'name': 'General Medicine', 'queueCount': 15},
        {'name': 'Cardiology', 'queueCount': 8},
        {'name': 'Orthopedics', 'queueCount': 12},
        {'name': 'Emergency', 'queueCount': 25},
      ],
    },
    {
      'name': 'MediCare Clinic',
      'location': '456 Medical District, New Delhi',
      'latitude': 28.5355,
      'longitude': 77.2883,
      'departments': [
        {'name': 'Multi-Speciality', 'queueCount': 10},
        {'name': 'Pediatrics', 'queueCount': 6},
        {'name': 'Dermatology', 'queueCount': 5},
      ],
    },
    {
      'name': "St. Mary's Medical Center",
      'location': '789 Central Avenue, New Delhi',
      'latitude': 28.7041,
      'longitude': 77.1025,
      'departments': [
        {'name': 'Cardiology', 'queueCount': 18},
        {'name': 'Neurology', 'queueCount': 7},
        {'name': 'General Medicine', 'queueCount': 14},
      ],
    },
    {
      'name': 'LifeCare Hospital',
      'location': '321 East End Road, New Delhi',
      'latitude': 28.5672,
      'longitude': 77.2100,
      'departments': [
        {'name': 'Orthopedics', 'queueCount': 14},
        {'name': 'General Surgery', 'queueCount': 9},
        {'name': 'ENT', 'queueCount': 6},
      ],
    },
    {
      'name': 'HeartPlus Clinic',
      'location': '555 Riverside Avenue, New Delhi',
      'latitude': 28.6517,
      'longitude': 77.2219,
      'departments': [
        {'name': 'Cardiology', 'queueCount': 11},
        {'name': 'Cardiac Surgery', 'queueCount': 5},
        {'name': 'Emergency', 'queueCount': 20},
      ],
    },
    {
      'name': 'GreenCross Hospital',
      'location': '888 Park Area, New Delhi',
      'latitude': 28.5244,
      'longitude': 77.2066,
      'departments': [
        {'name': 'General Surgery', 'queueCount': 9},
        {'name': 'Gynecology', 'queueCount': 8},
        {'name': 'General Medicine', 'queueCount': 16},
      ],
    },
    {
      'name': 'LittleCare Children Hospital',
      'location': '999 West Avenue, New Delhi',
      'latitude': 28.5167,
      'longitude': 77.1583,
      'departments': [
        {'name': 'Pediatrics', 'queueCount': 12},
        {'name': 'Neonatology', 'queueCount': 4},
        {'name': 'Pediatric Surgery', 'queueCount': 3},
      ],
    },
    {
      'name': 'Apollo Hospital',
      'location': 'Sarita Vihar, New Delhi',
      'latitude': 28.5244,
      'longitude': 77.2883,
      'departments': [
        {'name': 'Multi-Speciality', 'queueCount': 20},
        {'name': 'Oncology', 'queueCount': 8},
        {'name': 'Neurology', 'queueCount': 10},
        {'name': 'Cardiology', 'queueCount': 15},
      ],
    },
  ];

  try {
    // Check if hospitals already exist
    final existingHospitals = await firestore.collection('hospitals').get();

    if (existingHospitals.docs.isNotEmpty) {
      print(
          '⚠️ Hospitals collection already has ${existingHospitals.docs.length} documents.');
      print(
          'Skipping to avoid duplicates. Delete existing hospitals first if you want to re-add.');
      return;
    }

    // Add each hospital
    for (var hospital in sampleHospitals) {
      await firestore.collection('hospitals').add(hospital);
      print('✅ Added: ${hospital['name']}');
    }

    print(
        '\n🎉 Successfully added ${sampleHospitals.length} sample hospitals!');
    print('You can now view them on the Hospital Map screen.');
  } catch (e) {
    print('❌ Error adding hospitals: $e');
  }
}

/// Alternative: Clear existing hospitals and add fresh data
Future<void> resetAndAddSampleHospitals() async {
  final firestore = FirebaseFirestore.instance;

  try {
    // Delete all existing hospitals
    final existingHospitals = await firestore.collection('hospitals').get();
    for (var doc in existingHospitals.docs) {
      await doc.reference.delete();
    }
    print('🗑️ Cleared ${existingHospitals.docs.length} existing hospitals');

    // Add new sample data
    await addSampleHospitals();
  } catch (e) {
    print('❌ Error resetting hospitals: $e');
  }
}
