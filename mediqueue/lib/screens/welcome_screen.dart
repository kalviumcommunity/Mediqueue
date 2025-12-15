import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool joinedQueue = false;

  void _toggleQueueStatus() {
    setState(() {
      joinedQueue = !joinedQueue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MediQueue'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.local_hospital, size: 90, color: Colors.blue),
            const SizedBox(height: 20),
            Text(
              joinedQueue
                  ? 'You have joined the queue!'
                  : 'Welcome to MediQueue',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _toggleQueueStatus,
              child: Text(joinedQueue ? 'Cancel Queue' : 'Join Queue'),
            ),
          ],
        ),
      ),
    );
  }
}
