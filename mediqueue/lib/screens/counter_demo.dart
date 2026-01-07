// import 'package:flutter/material.dart';

// class CounterDemo extends StatefulWidget {
//   const CounterDemo({super.key});

//   @override
//   State<CounterDemo> createState() => _CounterDemoState();
// }

// class _CounterDemoState extends State<CounterDemo> {
//   int count = 0;

//   void increment() {
//     setState(() {
//       count++; // reactive update
//     });
//   }

//   void reset() {
//     setState(() {
//       count = 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Counter Demo (Reactive UI)'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Current Count: $count',
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: increment,
//                   child: const Text('Increment'),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton(
//                   onPressed: reset,
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                   child: const Text('Reset'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
