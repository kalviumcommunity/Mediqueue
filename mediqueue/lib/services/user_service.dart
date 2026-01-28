import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Save new user when they sign up WITH ALL DETAILS
  Future<void> createUserProfile({
    required String email,
    required String userType,
    required String phoneNumber,
    required String name,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw Exception("User not authenticated");
      }

      final userData = {
        'userId': user.uid,
        'email': email,
        'userType': userType, // 'patient' or 'staff'
        'phone': phoneNumber,
        'name': name,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      };

      // Save to appropriate collection based on user type
      if (userType == 'patient') {
        // Save to patients collection
        await _firestore.collection('patients').doc(user.uid).set({
          ...userData,
          'medicalHistory': [],
          'currentQueue': null,
          'notifications': [],
          'preferences': {
            'notificationEnabled': true,
            'smsEnabled': true,
          },
        });

        // Also save to users collection for quick lookup
        await _firestore.collection('users').doc(user.uid).set({
          ...userData,
          'collection': 'patients', // Reference to main collection
        });

        print('✅ Patient profile created for: $email');
      } else if (userType == 'staff') {
        // Save to staff collection
        await _firestore.collection('staff').doc(user.uid).set({
          ...userData,
          'role': 'staff', // Can be 'doctor', 'nurse', 'admin', 'receptionist'
          'hospitalId': '', // To be assigned by admin
          'departmentId': '', // To be assigned by admin
          'status': 'active',
          'permissions': {
            'canManageQueue': false,
            'canViewPatients': true,
            'canUpdateStatus': false,
          },
        });

        // Also save to users collection for quick lookup
        await _firestore.collection('users').doc(user.uid).set({
          ...userData,
          'collection': 'staff', // Reference to main collection
        });

        print('✅ Staff profile created for: $email');
      }

      print('📱 Phone saved: $phoneNumber');
      print('👤 Name saved: $name');
      print('🎯 User type: $userType');
    } catch (e) {
      print('❌ Error creating user profile: $e');
      rethrow;
    }
  }

  // Get current user's data from appropriate collection
  Future<Map<String, dynamic>?> getCurrentUserData() async {
    try {
      final user = _auth.currentUser;
      if (user == null) return null;

      // First check users collection for quick lookup
      final userDoc = await _firestore.collection('users').doc(user.uid).get();

      if (userDoc.exists && userDoc.data() != null) {
        final userData = userDoc.data()!;
        final collection = userData['collection'] ?? 'patients';

        // Get full data from the appropriate collection
        final mainDoc =
            await _firestore.collection(collection).doc(user.uid).get();

        if (mainDoc.exists && mainDoc.data() != null) {
          return mainDoc.data();
        }
      }
      return null;
    } catch (e) {
      print('❌ Error getting user data: $e');
      return null;
    }
  }

  // Update user profile (name, phone, etc.)
  Future<void> updateUserProfile({
    String? fullName,
    String? phoneNumber,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;

      // Get user's collection type
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      final collection = userDoc.data()?['collection'] ?? 'patients';

      final updateData = <String, dynamic>{
        'updatedAt': FieldValue.serverTimestamp(),
      };

      if (fullName != null && fullName.isNotEmpty) {
        updateData['name'] = fullName;
      }

      if (phoneNumber != null && phoneNumber.isNotEmpty) {
        updateData['phone'] = phoneNumber;
      }

      if (additionalData != null) {
        updateData.addAll(additionalData);
      }

      // Update main collection
      await _firestore.collection(collection).doc(user.uid).update(updateData);

      // Also update users collection for consistency
      await _firestore.collection('users').doc(user.uid).update({
        if (fullName != null) 'name': fullName,
        if (phoneNumber != null) 'phone': phoneNumber,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      print('✅ User profile updated for: ${user.uid}');
      if (phoneNumber != null) print('📱 Phone updated to: $phoneNumber');
      if (fullName != null) print('👤 Name updated to: $fullName');
    } catch (e) {
      print('❌ Error updating user profile: $e');
      rethrow;
    }
  }

  // Get phone number
  Future<String?> getPhoneNumber() async {
    final userData = await getCurrentUserData();
    return userData?['phone'];
  }

  // Get display name
  Future<String> getDisplayName() async {
    final userData = await getCurrentUserData();

    if (userData != null &&
        userData['name'] != null &&
        userData['name'].toString().isNotEmpty) {
      return userData['name'];
    }

    // Fallback: extract name from email
    final email = userData?['email'] ?? '';
    if (email.isNotEmpty) {
      final namePart = email.split('@').first;
      return namePart[0].toUpperCase() + namePart.substring(1);
    }

    return 'User';
  }

  // Get user role/type
  Future<String> getUserType() async {
    final userData = await getCurrentUserData();
    return userData?['userType'] ?? 'patient';
  }

  // Check if current user exists in database
  Future<bool> userProfileExists() async {
    final user = _auth.currentUser;
    if (user == null) return false;

    // Check users collection first
    final userDoc = await _firestore.collection('users').doc(user.uid).get();
    return userDoc.exists;
  }

  // Get user's Firestore collection path
  Future<String> getUserCollectionPath() async {
    final user = _auth.currentUser;
    if (user == null) return 'patients';

    final userDoc = await _firestore.collection('users').doc(user.uid).get();
    return userDoc.data()?['collection'] ?? 'patients';
  }

  // Get complete user profile with type-specific data
  Future<Map<String, dynamic>?> getCompleteUserProfile() async {
    try {
      final user = _auth.currentUser;
      if (user == null) return null;

      final collection = await getUserCollectionPath();
      final doc = await _firestore.collection(collection).doc(user.uid).get();

      if (doc.exists) {
        final data = doc.data() ?? {};
        data['collection'] = collection; // Add collection info
        return data;
      }
      return null;
    } catch (e) {
      print('❌ Error getting complete profile: $e');
      return null;
    }
  }

  // Check if user is staff/admin
  Future<bool> isStaff() async {
    final userType = await getUserType();
    return userType == 'staff';
  }

  // Check if user is patient
  Future<bool> isPatient() async {
    final userType = await getUserType();
    return userType == 'patient';
  }

  // Get staff-specific data (if user is staff)
  Future<Map<String, dynamic>?> getStaffData() async {
    if (await isStaff()) {
      final user = _auth.currentUser;
      if (user == null) return null;

      final doc = await _firestore.collection('staff').doc(user.uid).get();
      return doc.data();
    }
    return null;
  }

  // Get patient-specific data (if user is patient)
  Future<Map<String, dynamic>?> getPatientData() async {
    if (await isPatient()) {
      final user = _auth.currentUser;
      if (user == null) return null;

      final doc = await _firestore.collection('patients').doc(user.uid).get();
      return doc.data();
    }
    return null;
  }

  // Get user's current queue status (for patients)
  Future<Map<String, dynamic>?> getCurrentQueueStatus() async {
    if (await isPatient()) {
      final data = await getPatientData();
      return data?['currentQueue'];
    }
    return null;
  }

  // Update last login timestamp
  Future<void> updateLastLogin() async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;

      final collection = await getUserCollectionPath();
      await _firestore.collection(collection).doc(user.uid).update({
        'lastLogin': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('❌ Error updating last login: $e');
    }
  }

  // Delete user profile (for account deletion)
  Future<void> deleteUserProfile() async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;

      final collection = await getUserCollectionPath();

      // Delete from both collections
      await _firestore.collection(collection).doc(user.uid).delete();
      await _firestore.collection('users').doc(user.uid).delete();

      print('✅ User profile deleted: ${user.uid}');
    } catch (e) {
      print('❌ Error deleting user profile: $e');
      rethrow;
    }
  }
}
