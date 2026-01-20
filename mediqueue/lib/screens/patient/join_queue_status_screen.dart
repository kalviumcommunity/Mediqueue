import 'package:flutter/material.dart';

class JoinQueueStatusScreen extends StatelessWidget {
  final String departmentName;

  const JoinQueueStatusScreen({
    super.key,
    required this.departmentName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // ✅ GRADIENT APP BAR
      appBar: AppBar(
        title: const Text(
          "Queue Status",
          style: TextStyle(color: Colors.white),
        ),
        leading: const BackButton(color: Colors.white),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(13, 27, 140, 1),
                Color.fromRGBO(90, 140, 255, 1),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _queueCard(),
            const SizedBox(height: 24),
            _infoTile(Icons.access_time, "Estimated Wait", "20 minutes"),
            _infoTile(Icons.people, "Your Position", "#8"),
            _infoTile(Icons.local_hospital, "Department", departmentName),
            const SizedBox(height: 20),
            const LinearProgressIndicator(value: 0.5),
          ],
        ),
      ),
    );
  }

  Widget _queueCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8),
        ],
      ),
      child: Row(
        children: const [
          Icon(Icons.check_circle, color: Colors.green, size: 32),
          SizedBox(width: 12),
          Text(
            "You are in the queue!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
