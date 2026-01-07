// // // // import 'package:flutter/material.dart';
// // // // import 'screens/welcome_screen.dart';

// // // // void main() {
// // // //   runApp(const MediQueueApp());
// // // // }

// // // // class MediQueueApp extends StatelessWidget {
// // // //   const MediQueueApp({super.key});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       title: 'MediQueue',
// // // //       debugShowCheckedModeBanner: false,
// // // //       theme: ThemeData(
// // // //         primarySwatch: Colors.blue,
// // // //         useMaterial3: true,
// // // //       ),
// // // //       home: const WelcomeScreen(),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:provider/provider.dart';
// // // import 'screens/welcome_screen.dart';
// // // import 'screens/user_input_form.dart';
// // // import 'providers/patient_counter.dart';
// // // import 'providers/queue_provider.dart';

// // // void main() {
// // //   runApp(
// // //     MultiProvider(
// // //       providers: [
// // //         ChangeNotifierProvider(create: (_) => PatientCounter()),
// // //         ChangeNotifierProvider(create: (_) => QueueProvider()),
// // //       ],
// // //       child: const MediQueueApp(),
// // //     ),
// // //   );
// // // }

// // // class MediQueueApp extends StatelessWidget {
// // //   const MediQueueApp({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'MediQueue',
// // //       debugShowCheckedModeBanner: false,
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.blue,
// // //         useMaterial3: true,
// // //       ),
// // //       home: const WelcomeScreen(),
// // //     );
// // //   }
// // // }



// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'providers/queue_provider.dart';
// // import 'screens/welcome_screen.dart';

// // void main() {
// //   runApp(
// //     ChangeNotifierProvider(
// //       create: (_) => QueueProvider(),
// //       child: const MediQueueApp(),
// //     ),
// //   );
// // }

// // class MediQueueApp extends StatelessWidget {
// //   const MediQueueApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'MediQueue',
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
// //         useMaterial3: true,
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: const WelcomeScreen(),
// //     );
// //   }
// // }



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
import 'package:provider/provider.dart';
import 'providers/queue_provider.dart';
import 'providers/patient_counter.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QueueProvider()),
        ChangeNotifierProvider(create: (_) => PatientCounter()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MediQueue',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WelcomeScreen(),
    );
  }
}
