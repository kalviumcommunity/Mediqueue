


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'screens/welcome_screen.dart';
// import 'screens/user_input_form.dart';
// import 'providers/patient_counter.dart';
// import 'providers/queue_provider.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => PatientCounter()),
//         ChangeNotifierProvider(create: (_) => QueueProvider()),
//       ],
//       child: const MediQueueApp(),
//     ),
//   );
// }

// class MediQueueApp extends StatelessWidget {
//   const MediQueueApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MediQueue',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         useMaterial3: true,
//       ),
//       home: const WelcomeScreen(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/welcome_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => SignupScreen(),
        "/login": (context) => LoginScreen(),
        "/home": (context) => HomeScreen(),
        "/welcome": (context) => WelcomeScreen(),
      },
    );
  }
}
