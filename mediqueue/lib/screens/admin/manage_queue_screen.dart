import 'package:flutter/material.dart';
import '../../widgets/status_badge.dart';
import '../../widgets/custom_action_button.dart';

class ManageQueueScreen extends StatefulWidget {
  const ManageQueueScreen({super.key});

  @override
  State<ManageQueueScreen> createState() => _ManageQueueScreenState();
}

class _ManageQueueScreenState extends State<ManageQueueScreen> {
  List<Map<String, dynamic>> patients = [
    {
      'id': '001',
      'name': 'John Doe',
      'position': 1,
      'status': 'Waiting',
      'time': '09:15 AM',
      'phone': '+1 234 567 8900'
    },
    {
      'id': '002',
      'name': 'Jane Smith',
      'position': 2,
      'status': 'Waiting',
      'time': '09:20 AM',
      'phone': '+1 234 567 8901'
    },
    {
      'id': '003',
      'name': 'Mike Johnson',
      'position': 3,
      'status': 'Waiting',
      'time': '09:25 AM',
      'phone': '+1 234 567 8902'
    },
    {
      'id': '004',
      'name': 'Sarah Williams',
      'position': 4,
      'status': 'Waiting',
      'time': '09:30 AM',
      'phone': '+1 234 567 8903'
    },
    {
      'id': '005',
      'name': 'David Brown',
      'position': 5,
      'status': 'Waiting',
      'time': '09:35 AM',
      'phone': '+1 234 567 8904'
    },
  ];

  void _callNextPatient() {
    if (patients.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No patients in queue')),
      );
      return;
    }

    final patient = patients.first;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Call Patient'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Calling: ${patient['name']}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('ID: ${patient['id']}'),
            Text('Time Joined: ${patient['time']}'),
            Text('Phone: ${patient['phone']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                patients.removeAt(0);
                // Update positions
                for (int i = 0; i < patients.length; i++) {
                  patients[i]['position'] = i + 1;
                }
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${patient['name']} has been called')),
              );
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  void _markAsCompleted(int index) {
    final patient = patients[index];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Mark as Completed'),
        content: Text('Mark ${patient['name']}\'s appointment as completed?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              setState(() {
                patients.removeAt(index);
                // Update positions
                for (int i = 0; i < patients.length; i++) {
                  patients[i]['position'] = i + 1;
                }
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Patient marked as completed'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Complete'),
          ),
        ],
      ),
    );
  }

  void _markAsNoShow(int index) {
    final patient = patients[index];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Mark as No-Show'),
        content: Text('Mark ${patient['name']} as no-show?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              setState(() {
                patients.removeAt(index);
                // Update positions
                for (int i = 0; i < patients.length; i++) {
                  patients[i]['position'] = i + 1;
                }
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Patient marked as no-show'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            child: const Text('No-Show'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Queue'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {});
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Queue refreshed')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Queue Summary Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade600, Colors.blue.shade400],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildHeaderStat(
                    'In Queue', patients.length.toString(), Icons.people),
                Container(width: 1, height: 40, color: Colors.white30),
                _buildHeaderStat(
                    'Next', patients.isEmpty ? '-' : '#1', Icons.person),
                Container(width: 1, height: 40, color: Colors.white30),
                _buildHeaderStat('Avg Wait', '25 min', Icons.schedule),
              ],
            ),
          ),

          // Call Next Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomActionButton(
              label: 'Call Next Patient',
              onPressed: patients.isEmpty ? null : _callNextPatient,
              icon: Icons.notifications_active,
              type: ButtonType.primary,
              backgroundColor: Colors.green,
              height: 60,
            ),
          ),

          // Patient List
          Expanded(
            child: patients.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: patients.length,
                    itemBuilder: (context, index) {
                      return _buildPatientCard(index);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildPatientCard(int index) {
    final patient = patients[index];
    final isFirst = index == 0;

    return Card(
      elevation: isFirst ? 6 : 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isFirst ? Colors.blue : Colors.transparent,
          width: isFirst ? 2 : 0,
        ),
      ),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: isFirst ? Colors.blue : Colors.grey.shade300,
          foregroundColor: isFirst ? Colors.white : Colors.black87,
          child: Text(
            '#${patient['position']}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Row(
          children: [
            Text(
              patient['name'],
              style: TextStyle(
                fontWeight: isFirst ? FontWeight.bold : FontWeight.w600,
                fontSize: 16,
              ),
            ),
            if (isFirst) ...[
              const SizedBox(width: 8),
              const StatusBadge(
                status: QueueStatus.active,
                label: 'NEXT',
                compact: true,
              ),
            ],
          ],
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Text(
                'ID: ${patient['id']} • Joined: ${patient['time']}',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                ),
              ),
            ),
            StatusBadge(
              status: QueueStatus.waiting,
              compact: true,
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact: ${patient['phone']}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _markAsCompleted(index),
                        icon: const Icon(Icons.check_circle, size: 18),
                        label: const Text('Complete'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.green,
                          side: const BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _markAsNoShow(index),
                        icon: const Icon(Icons.person_off, size: 18),
                        label: const Text('No-Show'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event_available,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            'No Patients in Queue',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'All patients have been served',
            style: TextStyle(
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
