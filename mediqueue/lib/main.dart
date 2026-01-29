import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediqueue/screens/patient/hospital_details_screen.dart';
import 'firebase_options.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/patient/patient_home_screen.dart';
import 'screens/patient/join_queue_screen.dart';
import 'screens/admin/admin_dashboard_screen.dart';
import 'screens/admin/manage_queue_screen.dart';
import 'screens/patient/patient_profile_screen.dart';
import 'screens/auth_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MediQueueApp());
}

class MediQueueApp extends StatelessWidget {
  const MediQueueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediQueue - Smart Hospital Queue Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
        fontFamily: 'Inter',
      ),
      home: const AppFlowManager(),
    );
  }
}

class AppFlowManager extends StatefulWidget {
  const AppFlowManager({super.key});

  @override
  State<AppFlowManager> createState() => _AppFlowManagerState();
}

class _AppFlowManagerState extends State<AppFlowManager> {
  Future<String> _getUserType(String userId) async {
    try {
      print("🔍 Checking user type for: $userId");

      // ⚠️ TEMPORARY FIX: Bypass Firestore check for now
      // Uncomment this to always treat users as patients until Firestore is fixed
      // print("⚠️ Firestore unavailable, defaulting to patient");
      // return 'patient';

      // Try to get user type from Firestore
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get()
          .timeout(const Duration(seconds: 5)); // Add timeout

      if (userDoc.exists) {
        final userType = userDoc.data()?['userType'] ?? 'patient';
        print("✅ Found user type in Firestore: $userType");
        return userType;
      }

      print("ℹ️ User not found in 'users' collection, checking others...");

      // Fallback: check patients collection
      final patientDoc = await FirebaseFirestore.instance
          .collection('patients')
          .doc(userId)
          .get();

      if (patientDoc.exists) {
        print("✅ User found in patients collection");
        return 'patient';
      }

      // Fallback: check staff collection
      final staffDoc = await FirebaseFirestore.instance
          .collection('staff')
          .doc(userId)
          .get();

      if (staffDoc.exists) {
        print("✅ User found in staff collection");
        return 'staff';
      }

      print("⚠️ User not found in any collection, defaulting to patient");
      return 'patient'; // Default
    } on TimeoutException {
      print("⏰ Firestore timeout, defaulting to patient");
      return 'patient';
    } catch (e) {
      print('⚠️ Error getting user type: $e');

      // ⚠️ TEMPORARY: Check if it's a Firestore unavailable error
      if (e.toString().contains('unavailable') ||
          e.toString().contains('PERMISSION_DENIED')) {
        print("🔧 Firestore service unavailable, using temporary logic");

        // Temporary logic: Check if email contains "admin" to guess user type
        final user = FirebaseAuth.instance.currentUser;
        if (user?.email?.toLowerCase().contains('admin') == true ||
            user?.email?.toLowerCase().contains('hospital') == true) {
          print("🎯 Guessing admin based on email");
          return 'admin';
        }
      }

      return 'patient'; // Default to patient on error
    }
  }

  Widget _buildLoadingScreen() {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              'Loading MediQueue...',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Show loading while checking auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingScreen();
        }

        final user = snapshot.data;

        if (user != null) {
          // User is logged in → Check user type and navigate accordingly
          return FutureBuilder<String>(
            future: _getUserType(user.uid),
            builder: (context, typeSnapshot) {
              if (typeSnapshot.connectionState == ConnectionState.waiting) {
                return _buildLoadingScreen();
              }

              final userType = typeSnapshot.data ?? 'patient';

              if (userType == 'admin' || userType == 'staff') {
                print("👨‍⚕️ Admin user detected, going to AdminHomeScreen");
                return const AdminDashboardScreen();
              } else {
                print("👤 Patient user detected, going to PatientHomeScreen");
                return const PatientHomeScreen();
              }
            },
          );
        }

        // No user logged in → Show WelcomeScreen first
        return const WelcomeScreen();
      },
    );
  }
}
