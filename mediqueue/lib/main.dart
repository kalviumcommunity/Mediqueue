
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
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
      // Initial route - Welcome screen
      initialRoute: "/",
      // Named routes for navigation
      routes: {
        "/": (context) => const WelcomeScreen(),
        "/auth": (context) => const AuthScreen(),
        "/home": (context) => HomeScreen(),
        "/patient-home": (context) => const PatientHomeScreen(),
        "/join-queue": (context) => const JoinQueueScreen(),
        "/admin-dashboard": (context) => const AdminDashboardScreen(),
        "/manage-queue": (context) => const ManageQueueScreen(),
        "/patient-profile": (context) => const PatientProfileScreen(),
        "/hospital-details": (context) => const HospitalDetailsScreen(),
      },
      // Handle unknown routes
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      },
    );
  }
}
