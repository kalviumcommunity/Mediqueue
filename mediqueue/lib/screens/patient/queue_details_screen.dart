import 'package:flutter/material.dart';

class QueueDetailsScreen extends StatelessWidget {
  final Map<String, String> queue;

  const QueueDetailsScreen({super.key, required this.queue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Queue Details'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hospital: ${queue['hospitalName']}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Queue Number: ${queue['queueNumber']}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "Date: ${queue['date']}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "Status: ${queue['status']}",
              style: TextStyle(
                fontSize: 16,
                color: queue['status'] == "Completed" ? Colors.green : Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
