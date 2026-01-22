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


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(MediQueueApp());
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
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           // Show loading while checking auth state
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Scaffold(
//               backgroundColor: Colors.white,
//               body: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }

//           // If user is logged in, show appropriate home screen
//           if (snapshot.hasData && snapshot.data != null) {
//             final User user = snapshot.data!;

//             // For now, we'll navigate based on the last selected user type
//             // In a real app, you'd check user type from Firestore

//             // You can add logic here to check user type from local storage
//             // or navigate to a role selection screen

//             // Default to patient home for now
//             return const PatientHomeScreen();

//             // Or show a role selection screen:
//             // return const RoleSelectionScreen();
//           }

//           // If user is not logged in, show auth screen
//           return const AuthScreen();
//         },
//       ),  
//       initialRoute: "/",
//       routes: {
//         "/": (context) => const WelcomeScreen(),
//         "/auth": (context) => const AuthScreen(),
//         "/home": (context) => HomeScreen(),
//         "/patient-home": (context) => PatientHomeScreen(), // ❌ no const
//         "/join-queue": (context) => const JoinQueueScreen(departmentName: '',),
//         "/admin-dashboard": (context) => const AdminDashboardScreen(),
//         "/manage-queue": (context) => const ManageQueueScreen(),
//         "/patient-profile": (context) => const PatientProfileScreen(),
//         "/hospital-details": (context) => const HospitalDetailsScreen(),
//       },
//       onUnknownRoute: (settings) => MaterialPageRoute(
//         builder: (context) => const WelcomeScreen(),
//       ),
//     );
//   }
// }



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
//       // REMOVE initialRoute and routes - Use only StreamBuilder with home
//       home: AuthWrapper(),
//     );
//   }
// }

// class AuthWrapper extends StatefulWidget {
//   const AuthWrapper({super.key});

//   @override
//   State<AuthWrapper> createState() => _AuthWrapperState();
// }

// class _AuthWrapperState extends State<AuthWrapper> {
//   // Use a StreamSubscription to listen to auth changes
//   StreamSubscription<User?>? _authSubscription;
//   User? _currentUser;
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();

//     // Listen to auth state changes
//     _authSubscription = FirebaseAuth.instance.authStateChanges().listen(
//       (User? user) {
//         print('AuthWrapper - Auth state changed');
//         print('New user: ${user?.email}');

//         if (mounted) {
//           setState(() {
//             _currentUser = user;
//             _isLoading = false;
//           });
//         }
//       },
//       onError: (error) {
//         print('AuthWrapper - Error: $error');
//         if (mounted) {
//           setState(() {
//             _isLoading = false;
//           });
//         }
//       },
//     );

//     // Also get initial user immediately
//     _currentUser = FirebaseAuth.instance.currentUser;
//     if (_currentUser != null) {
//       _isLoading = false;
//     }
//   }

//   @override
//   void dispose() {
//     _authSubscription?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('AuthWrapper - Building with user: ${_currentUser?.email}');
//     print('AuthWrapper - isLoading: $_isLoading');

//     if (_isLoading) {
//       return const Scaffold(
//         backgroundColor: Colors.white,
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }

//     return _currentUser != null
//         ?  PatientHomeScreen()
//         : const AuthScreen();
//   }
// }


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
      home: const AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  StreamSubscription<User?>? _authSubscription;
  User? _currentUser;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    // Listen to auth state changes
    _authSubscription = FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        print('AuthWrapper - Auth state changed');
        print('New user: ${user?.email}');

        if (mounted) {
          setState(() {
            _currentUser = user;
            _isLoading = false;
          });
        }
      },
      onError: (error) {
        print('AuthWrapper - Error: $error');
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      },
    );

    // Also get initial user immediately
    _currentUser = FirebaseAuth.instance.currentUser;
    if (_currentUser != null) {
      _isLoading = false;
    }
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('AuthWrapper - Building with user: ${_currentUser?.email}');
    print('AuthWrapper - isLoading: $_isLoading');

    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return _currentUser != null
        ? const PatientHomeScreen()
        : const AuthScreen();
  }
}
