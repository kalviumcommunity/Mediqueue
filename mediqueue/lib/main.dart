// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:mediqueue/screens/patient/hospital_details_screen.dart';
// import 'firebase_options.dart';
// import 'screens/welcome_screen.dart';
// import 'screens/home_screen.dart';
// import 'screens/patient/patient_home_screen.dart';
// import 'screens/patient/join_queue_screen.dart';
// import 'screens/admin/admin_dashboard_screen.dart';
// import 'screens/admin/manage_queue_screen.dart';
// import 'screens/patient/patient_profile_screen.dart';
// import 'screens/auth_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(const MediQueueApp());
// }

// class MediQueueApp extends StatelessWidget {
//   const MediQueueApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MediQueue - Smart Hospital Queue Management',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.blue,
//           brightness: Brightness.light,
//         ),
//         appBarTheme: const AppBarTheme(
//           centerTitle: true,
//           elevation: 0,
//         ),
//         fontFamily: 'Inter',
//       ),
//       home: const AppFlowManager(),
//     );
//   }
// }

// class AppFlowManager extends StatefulWidget {
//   const AppFlowManager({super.key});

//   @override
//   State<AppFlowManager> createState() => _AppFlowManagerState();
// }

 // class _AppFlowManagerState extends State<AppFlowManager> {
//   bool _isProcessingLogout = false;
//   DateTime? _lastLogoutTime;

//   Future<String> _getUserType(String userId) async {
//     try {
//       print("🔍 Checking user type for: $userId");

//       // First check 'users' collection
//       final userDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userId)
//           .get()
//           .timeout(const Duration(seconds: 5));

//       if (userDoc.exists) {
//         final userType = userDoc.data()?['userType'] ?? 'patient';
//         print("✅ Found user type in 'users' collection: $userType");
//         return userType;
//       }

//       print("ℹ️ User not found in 'users' collection, checking others...");

//       // Check patients collection
//       final patientDoc = await FirebaseFirestore.instance
//           .collection('patients')
//           .doc(userId)
//           .get();

//       if (patientDoc.exists) {
//         print("✅ User found in patients collection");
//         final userType = patientDoc.data()?['userType'] ?? 'patient';
//         print("📊 Patient user type: $userType");

//         // Also add to users collection for future lookups
//         await FirebaseFirestore.instance.collection('users').doc(userId).set({
//           'userId': userId,
//           'userType': userType,
//           'collection': 'patients',
//           'updatedAt': FieldValue.serverTimestamp(),
//         });
//         return userType;
//       }

//       // Check staff collection
//       final staffDoc = await FirebaseFirestore.instance
//           .collection('staff')
//           .doc(userId)
//           .get();

//       if (staffDoc.exists) {
//         print("✅ User found in staff collection");
//         final userType = staffDoc.data()?['userType'] ?? 'staff';
//         print("📊 Staff user type: $userType");

//         // Also add to users collection for future lookups
//         await FirebaseFirestore.instance.collection('users').doc(userId).set({
//           'userId': userId,
//           'userType': userType,
//           'collection': 'staff',
//           'updatedAt': FieldValue.serverTimestamp(),
//         });
//         return userType;
//       }

//       // Default to patient
//       print("⚠️ Creating default patient profile");
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         await FirebaseFirestore.instance
//             .collection('patients')
//             .doc(userId)
//             .set({
//           'userId': userId,
//           'email': user.email ?? '',
//           'userType': 'patient',
//           'name': user.displayName ?? user.email?.split('@').first ?? 'User',
//           'phone': '',
//           'createdAt': FieldValue.serverTimestamp(),
//           'updatedAt': FieldValue.serverTimestamp(),
//           'medicalHistory': [],
//           'currentQueue': null,
//           'notifications': [],
//           'preferences': {
//             'notificationEnabled': true,
//             'smsEnabled': true,
//           },
//         });

//         await FirebaseFirestore.instance.collection('users').doc(userId).set({
//           'userId': userId,
//           'email': user.email ?? '',
//           'userType': 'patient',
//           'name': user.displayName ?? user.email?.split('@').first ?? 'User',
//           'phone': '',
//           'collection': 'patients',
//           'createdAt': FieldValue.serverTimestamp(),
//           'updatedAt': FieldValue.serverTimestamp(),
//         });
//       }

//       return 'patient';
//     } on TimeoutException {
//       print("⏰ Firestore timeout, defaulting to patient");
//       return 'patient';
//     } catch (e) {
//       print('⚠️ Error getting user type: $e');
//       return 'patient';
//     }
//   }

//   Widget _buildLoadingScreen({String message = 'Loading MediQueue...'}) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(
//                 _isProcessingLogout ? Colors.orange : Colors.blue,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               message,
//               style: const TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             if (_isProcessingLogout) ...[
//               const SizedBox(height: 8),
//               Text(
//                 'Please wait...',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey[600],
//                   fontStyle: FontStyle.italic,
//                 ),
//               ),
//             ]
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         print("🎯 Auth Stream State: ${snapshot.connectionState}");

//         // Show loading while checking auth state
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           print("⏳ Waiting for auth state...");
//           return _buildLoadingScreen();
//         }

//         // Handle errors
//         if (snapshot.hasError) {
//           print("❌ Auth stream error: ${snapshot.error}");
//           return _buildLoadingScreen(message: 'Authentication error');
//         }

//         final user = snapshot.data;

//         if (user != null) {
//           print("✅ User is logged in: ${user.email}");
//           print("🆔 User ID: ${user.uid}");

//           // User is logged in → Check user type and navigate accordingly
//           return FutureBuilder<String>(
//             future: _getUserType(user.uid),
//             builder: (context, typeSnapshot) {
//               print("🎯 Type Future State: ${typeSnapshot.connectionState}");

//               if (typeSnapshot.connectionState == ConnectionState.waiting) {
//                 return _buildLoadingScreen(message: 'Checking user profile...');
//               }

//               if (typeSnapshot.hasError) {
//                 print("❌ Error getting user type: ${typeSnapshot.error}");
//                 // Navigate directly on error
//                 WidgetsBinding.instance.addPostFrameCallback((_) {
//                   Navigator.of(context).pushAndRemoveUntil(
//                     MaterialPageRoute(
//                       builder: (context) => const PatientHomeScreen(),
//                     ),
//                     (route) => false,
//                   );
//                 });
//                 return _buildLoadingScreen(
//                     message: 'Setting up your profile...');
//               }

//               final userType = typeSnapshot.data ?? 'patient';
//               print("🎯 Final User Type: $userType");

//               // Navigate based on user type
//               WidgetsBinding.instance.addPostFrameCallback((_) {
//                 if (userType == 'admin' || userType == 'staff') {
//                   print(
//                       "👑 Admin/Staff user detected, navigating to AdminDashboardScreen");
//                   Navigator.of(context).pushAndRemoveUntil(
//                     MaterialPageRoute(
//                       builder: (context) => const AdminDashboardScreen(),
//                     ),
//                     (route) => false,
//                   );
//                 } else {
//                   print(
//                       "👤 Patient user detected, navigating to PatientHomeScreen");
//                   Navigator.of(context).pushAndRemoveUntil(
//                     MaterialPageRoute(
//                       builder: (context) => const PatientHomeScreen(),
//                     ),
//                     (route) => false,
//                   );
//                 }
//               });

//               // Show loading while navigating
//               return _buildLoadingScreen(
//                   message: 'Welcome back! Redirecting...');
//             },
//           );
//         }

//         print("🚫 No user logged in → Showing WelcomeScreen");
//         // No user logged in → Show WelcomeScreen first
//         return const WelcomeScreen();
//       },
//     );
//   }

//   // Call this method when user initiates logout
//   void initiateLogout() {
//     print("🚪 Initiating logout process...");
//     if (mounted) {
//       setState(() {
//         _isProcessingLogout = true;
//         _lastLogoutTime = DateTime.now();
//       });
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'screens/welcome_screen.dart';
import 'screens/patient/patient_home_screen.dart';
import 'screens/admin/admin_dashboard_screen.dart';
import 'screens/admin/select_hospital_screen.dart';
import 'screens/admin/manage_hospital_screen.dart';
import 'screens/admin/manage_doctors_screen.dart';
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
      title: 'MediQueue',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const AuthWrapper(),
      routes: {
        '/select-hospital': (context) => const SelectHospitalScreen(),
        '/manage-hospital': (context) => const ManageHospitalScreen(),
        '/manage-doctors': (context) => const ManageDoctorsScreen(),
        '/admin-dashboard': (context) => const AdminDashboardScreen(),
      },
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool _isCheckingAuth = true;

  @override
  void initState() {
    super.initState();
    print("🚀 AuthWrapper INITIALIZED");

    // Check initial auth state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkInitialAuth();
    });
  }

  void _checkInitialAuth() async {
    final user = FirebaseAuth.instance.currentUser;
    print("🔍 Initial auth check - User: ${user?.email}");

    if (mounted) {
      setState(() {
        _isCheckingAuth = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isCheckingAuth) {
      return _buildLoadingScreen(message: 'Checking authentication...');
    }

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        print(
            "🔄 AuthWrapper REBUILDING - Connection: ${snapshot.connectionState}");
        print("👤 Has Data: ${snapshot.hasData}");
        print("📊 Data: ${snapshot.data?.email}");

        // Show loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          print("⏳ Waiting for auth state...");
          return _buildLoadingScreen();
        }

        final user = snapshot.data;

        if (user != null) {
          print("✅✅✅ USER IS LOGGED IN: ${user.email}");
          print("🆔 User ID: ${user.uid}");

          // User is logged in - determine user type
          return FutureBuilder<String>(
            future: _getUserType(user.uid),
            builder: (context, typeSnapshot) {
              print(
                  "🎯 User type future state: ${typeSnapshot.connectionState}");

              if (typeSnapshot.connectionState == ConnectionState.waiting) {
                return _buildLoadingScreen(message: 'Checking user profile...');
              }

              if (typeSnapshot.hasError) {
                print("❌ Error getting user type: ${typeSnapshot.error}");
                return const PatientHomeScreen();
              }

              final userType = typeSnapshot.data ?? 'patient';
              print("🎯 FINAL USER TYPE: $userType");

              if (userType == 'admin' || userType == 'staff') {
                print("👑 RETURNING AdminDashboardScreen");
                return const AdminDashboardScreen();
              } else {
                print("👤 RETURNING PatientHomeScreen");
                return const PatientHomeScreen();
              }
            },
          );
        }

        // No user logged in - show WelcomeScreen
        print("🚫🚫🚫 NO USER LOGGED IN - Showing WelcomeScreen");
        return const WelcomeScreen();
      },
    );
  }

  Future<String> _getUserType(String userId) async {
    try {
      print("🔍 Getting user type for: $userId");

      // Check users collection
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get()
          .timeout(const Duration(seconds: 3));

      if (userDoc.exists) {
        final userType = userDoc.data()?['userType'] ?? 'patient';
        print("✅ Found user type: $userType");
        return userType;
      }

      // Check patients collection
      final patientDoc = await FirebaseFirestore.instance
          .collection('patients')
          .doc(userId)
          .get();

      if (patientDoc.exists) {
        print("✅ Found in patients collection");
        return 'patient';
      }

      // Check staff collection
      final staffDoc = await FirebaseFirestore.instance
          .collection('staff')
          .doc(userId)
          .get();

      if (staffDoc.exists) {
        final userType = staffDoc.data()?['userType'] ?? 'staff';
        print("✅ Found in staff collection: $userType");
        return userType;
      }

      print("⚠️ User not found, defaulting to patient");
      return 'patient';
    } catch (e) {
      print("❌ Error: $e");
      return 'patient';
    }
  }

  Widget _buildLoadingScreen({String message = 'Loading...'}) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(message),
          ],
        ),
      ),
    );
  }
}
