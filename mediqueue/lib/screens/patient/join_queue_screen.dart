import 'package:flutter/material.dart';

class JoinQueueScreen extends StatefulWidget {
  const JoinQueueScreen({super.key});

  @override
  State<JoinQueueScreen> createState() => _JoinQueueScreenState();
}

class _JoinQueueScreenState extends State<JoinQueueScreen> {
  String? selectedHospital;
  String? selectedDepartment;
  bool isInQueue = false;
  int queuePosition = 0;
  int estimatedWaitTime = 0;

  final List<String> hospitals = [
    'City General Hospital',
    'Central Medical Center',
    'St. Mary\'s Hospital',
    'Metro Health Clinic',
  ];

  final List<Map<String, dynamic>> departments = [
    {'name': 'General Medicine', 'icon': Icons.medical_services, 'wait': 25},
    {'name': 'Cardiology', 'icon': Icons.favorite, 'wait': 45},
    {'name': 'Orthopedics', 'icon': Icons.accessibility_new, 'wait': 35},
    {'name': 'Pediatrics', 'icon': Icons.child_care, 'wait': 20},
    {'name': 'Dermatology', 'icon': Icons.face, 'wait': 30},
    {'name': 'ENT', 'icon': Icons.hearing, 'wait': 25},
  ];

  void _joinQueue() {
    if (selectedHospital == null || selectedDepartment == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select hospital and department'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() {
      isInQueue = true;
      queuePosition = 8;
      final dept =
          departments.firstWhere((d) => d['name'] == selectedDepartment);
      estimatedWaitTime = dept['wait'] as int;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Successfully joined the queue!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _leaveQueue() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Leave Queue?'),
        content: const Text('Are you sure you want to leave the queue?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                isInQueue = false;
                queuePosition = 0;
                estimatedWaitTime = 0;
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Left the queue')),
              );
            },
            child: const Text('Leave', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Queue'),
        actions: [
          if (isInQueue)
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: _leaveQueue,
              tooltip: 'Leave Queue',
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: isInQueue ? _buildQueueStatusView() : _buildJoinQueueForm(),
      ),
    );
  }

  Widget _buildJoinQueueForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Card(
          color: Colors.blue.shade50,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue.shade700),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Select a hospital and department to join the queue',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Hospital Selection
        const Text(
          'Select Hospital',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF424242),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: selectedHospital,
              hint: const Text('Choose a hospital'),
              icon: const Icon(Icons.arrow_drop_down),
              items: hospitals.map((String hospital) {
                return DropdownMenuItem<String>(
                  value: hospital,
                  child: Row(
                    children: [
                      const Icon(Icons.local_hospital, size: 20),
                      const SizedBox(width: 12),
                      Text(hospital),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedHospital = value;
                  selectedDepartment = null;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Department Selection
        const Text(
          'Select Department',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF424242),
          ),
        ),
        const SizedBox(height: 12),

        if (selectedHospital == null)
          Card(
            color: Colors.grey.shade100,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Please select a hospital first',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: departments.length,
            itemBuilder: (context, index) {
              final dept = departments[index];
              final isSelected = selectedDepartment == dept['name'];

              return Card(
                elevation: isSelected ? 8 : 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: isSelected ? Colors.blue : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedDepartment = dept['name'];
                    });
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          dept['icon'],
                          size: 36,
                          color:
                              isSelected ? Colors.blue : Colors.grey.shade600,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          dept['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected ? Colors.blue : Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '~${dept['wait']} min',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        const SizedBox(height: 32),

        // Join Button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            onPressed: _joinQueue,
            icon: const Icon(Icons.add_circle_outline, size: 28),
            label: const Text(
              'Join Queue',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQueueStatusView() {
    return Column(
      children: [
        // Success Message
        Card(
          color: Colors.green.shade50,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.check_circle,
                    color: Colors.green.shade700, size: 32),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'You\'re in the queue!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Queue Position Card
        Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade600, Colors.blue.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Text(
                  'Your Position',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '#$queuePosition',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'in queue',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Details Cards
        Row(
          children: [
            Expanded(
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Icon(Icons.schedule,
                          color: Colors.orange.shade600, size: 32),
                      const SizedBox(height: 12),
                      const Text(
                        'Est. Wait',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$estimatedWaitTime min',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Icon(Icons.people,
                          color: Colors.purple.shade600, size: 32),
                      const SizedBox(height: 12),
                      const Text(
                        'Ahead',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${queuePosition - 1}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Queue Details
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Queue Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(height: 24),
                _buildDetailRow(
                    Icons.local_hospital, 'Hospital', selectedHospital!),
                const SizedBox(height: 12),
                _buildDetailRow(
                    Icons.medical_services, 'Department', selectedDepartment!),
                const SizedBox(height: 12),
                _buildDetailRow(Icons.access_time, 'Joined',
                    'Today, ${TimeOfDay.now().format(context)}'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Leave Queue Button
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton.icon(
            onPressed: _leaveQueue,
            icon: const Icon(Icons.exit_to_app),
            label: const Text(
              'Leave Queue',
              style: TextStyle(fontSize: 16),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade600),
        const SizedBox(width: 12),
        Text(
          '$label: ',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
