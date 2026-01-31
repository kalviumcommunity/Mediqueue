// // import 'package:flutter/material.dart';
// // import '../../widgets/status_badge.dart';
// // import '../../widgets/custom_action_button.dart';

// // class ManageQueueScreen extends StatefulWidget {
// //   const ManageQueueScreen({super.key});

// //   @override
// //   State<ManageQueueScreen> createState() => _ManageQueueScreenState();
// // }

// // class _ManageQueueScreenState extends State<ManageQueueScreen> {
// //   List<Map<String, dynamic>> patients = [
// //     {
// //       'id': '001',
// //       'name': 'John Doe',
// //       'position': 1,
// //       'status': 'Waiting',
// //       'time': '09:15 AM',
// //       'phone': '+1 234 567 8900'
// //     },
// //     {
// //       'id': '002',
// //       'name': 'Jane Smith',
// //       'position': 2,
// //       'status': 'Waiting',
// //       'time': '09:20 AM',
// //       'phone': '+1 234 567 8901'
// //     },
// //     {
// //       'id': '003',
// //       'name': 'Mike Johnson',
// //       'position': 3,
// //       'status': 'Waiting',
// //       'time': '09:25 AM',
// //       'phone': '+1 234 567 8902'
// //     },
// //     {
// //       'id': '004',
// //       'name': 'Sarah Williams',
// //       'position': 4,
// //       'status': 'Waiting',
// //       'time': '09:30 AM',
// //       'phone': '+1 234 567 8903'
// //     },
// //     {
// //       'id': '005',
// //       'name': 'David Brown',
// //       'position': 5,
// //       'status': 'Waiting',
// //       'time': '09:35 AM',
// //       'phone': '+1 234 567 8904'
// //     },
// //   ];

// //   void _callNextPatient() {
// //     if (patients.isEmpty) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('No patients in queue')),
// //       );
// //       return;
// //     }

// //     final patient = patients.first;
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: const Text('Call Patient'),
// //         content: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               'Calling: ${patient['name']}',
// //               style: const TextStyle(
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             Text('ID: ${patient['id']}'),
// //             Text('Time Joined: ${patient['time']}'),
// //             Text('Phone: ${patient['phone']}'),
// //           ],
// //         ),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.pop(context),
// //             child: const Text('Cancel'),
// //           ),
// //           ElevatedButton(
// //             onPressed: () {
// //               setState(() {
// //                 patients.removeAt(0);
// //                 // Update positions
// //                 for (int i = 0; i < patients.length; i++) {
// //                   patients[i]['position'] = i + 1;
// //                 }
// //               });
// //               Navigator.pop(context);
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 SnackBar(content: Text('${patient['name']} has been called')),
// //               );
// //             },
// //             child: const Text('Confirm'),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void _markAsCompleted(int index) {
// //     final patient = patients[index];
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: const Text('Mark as Completed'),
// //         content: Text('Mark ${patient['name']}\'s appointment as completed?'),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.pop(context),
// //             child: const Text('Cancel'),
// //           ),
// //           ElevatedButton(
// //             style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
// //             onPressed: () {
// //               setState(() {
// //                 patients.removeAt(index);
// //                 // Update positions
// //                 for (int i = 0; i < patients.length; i++) {
// //                   patients[i]['position'] = i + 1;
// //                 }
// //               });
// //               Navigator.pop(context);
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 const SnackBar(
// //                   content: Text('Patient marked as completed'),
// //                   backgroundColor: Colors.green,
// //                 ),
// //               );
// //             },
// //             child: const Text('Complete'),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void _markAsNoShow(int index) {
// //     final patient = patients[index];
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: const Text('Mark as No-Show'),
// //         content: Text('Mark ${patient['name']} as no-show?'),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.pop(context),
// //             child: const Text('Cancel'),
// //           ),
// //           ElevatedButton(
// //             style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
// //             onPressed: () {
// //               setState(() {
// //                 patients.removeAt(index);
// //                 // Update positions
// //                 for (int i = 0; i < patients.length; i++) {
// //                   patients[i]['position'] = i + 1;
// //                 }
// //               });
// //               Navigator.pop(context);
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 const SnackBar(
// //                   content: Text('Patient marked as no-show'),
// //                   backgroundColor: Colors.red,
// //                 ),
// //               );
// //             },
// //             child: const Text('No-Show'),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Manage Queue'),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.refresh),
// //             onPressed: () {
// //               setState(() {});
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 const SnackBar(content: Text('Queue refreshed')),
// //               );
// //             },
// //           ),
// //         ],
// //       ),
// //       body: Column(
// //         children: [
// //           // Queue Summary Header
// //           Container(
// //             padding: const EdgeInsets.all(20),
// //             decoration: BoxDecoration(
// //               gradient: LinearGradient(
// //                 colors: [Colors.blue.shade600, Colors.blue.shade400],
// //               ),
// //             ),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// //               children: [
// //                 _buildHeaderStat(
// //                     'In Queue', patients.length.toString(), Icons.people),
// //                 Container(width: 1, height: 40, color: Colors.white30),
// //                 _buildHeaderStat(
// //                     'Next', patients.isEmpty ? '-' : '#1', Icons.person),
// //                 Container(width: 1, height: 40, color: Colors.white30),
// //                 _buildHeaderStat('Avg Wait', '25 min', Icons.schedule),
// //               ],
// //             ),
// //           ),

// //           // Call Next Button
// //           Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: CustomActionButton(
// //               label: 'Call Next Patient',
// //               onPressed: patients.isEmpty ? null : _callNextPatient,
// //               icon: Icons.notifications_active,
// //               type: ButtonType.primary,
// //               backgroundColor: Colors.green,
// //               height: 60,
// //             ),
// //           ),

// //           // Patient List
// //           Expanded(
// //             child: patients.isEmpty
// //                 ? _buildEmptyState()
// //                 : ListView.builder(
// //                     padding: const EdgeInsets.symmetric(horizontal: 16),
// //                     itemCount: patients.length,
// //                     itemBuilder: (context, index) {
// //                       return _buildPatientCard(index);
// //                     },
// //                   ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildHeaderStat(String label, String value, IconData icon) {
// //     return Column(
// //       children: [
// //         Icon(icon, color: Colors.white, size: 28),
// //         const SizedBox(height: 8),
// //         Text(
// //           value,
// //           style: const TextStyle(
// //             color: Colors.white,
// //             fontSize: 24,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         Text(
// //           label,
// //           style: const TextStyle(
// //             color: Colors.white70,
// //             fontSize: 12,
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildPatientCard(int index) {
// //     final patient = patients[index];
// //     final isFirst = index == 0;

// //     return Card(
// //       elevation: isFirst ? 6 : 2,
// //       margin: const EdgeInsets.only(bottom: 12),
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(12),
// //         side: BorderSide(
// //           color: isFirst ? Colors.blue : Colors.transparent,
// //           width: isFirst ? 2 : 0,
// //         ),
// //       ),
// //       child: ExpansionTile(
// //         leading: CircleAvatar(
// //           backgroundColor: isFirst ? Colors.blue : Colors.grey.shade300,
// //           foregroundColor: isFirst ? Colors.white : Colors.black87,
// //           child: Text(
// //             '#${patient['position']}',
// //             style: const TextStyle(fontWeight: FontWeight.bold),
// //           ),
// //         ),
// //         title: Row(
// //           children: [
// //             Text(
// //               patient['name'],
// //               style: TextStyle(
// //                 fontWeight: isFirst ? FontWeight.bold : FontWeight.w600,
// //                 fontSize: 16,
// //               ),
// //             ),
// //             if (isFirst) ...[
// //               const SizedBox(width: 8),
// //               const StatusBadge(
// //                 status: QueueStatus.active,
// //                 label: 'NEXT',
// //                 compact: true,
// //               ),
// //             ],
// //           ],
// //         ),
// //         subtitle: Row(
// //           children: [
// //             Expanded(
// //               child: Text(
// //                 'ID: ${patient['id']} • Joined: ${patient['time']}',
// //                 style: TextStyle(
// //                   color: Colors.grey.shade600,
// //                   fontSize: 13,
// //                 ),
// //               ),
// //             ),
// //             StatusBadge(
// //               status: QueueStatus.waiting,
// //               compact: true,
// //             ),
// //           ],
// //         ),
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   'Contact: ${patient['phone']}',
// //                   style: const TextStyle(fontSize: 14),
// //                 ),
// //                 const SizedBox(height: 16),
// //                 Row(
// //                   children: [
// //                     Expanded(
// //                       child: OutlinedButton.icon(
// //                         onPressed: () => _markAsCompleted(index),
// //                         icon: const Icon(Icons.check_circle, size: 18),
// //                         label: const Text('Complete'),
// //                         style: OutlinedButton.styleFrom(
// //                           foregroundColor: Colors.green,
// //                           side: const BorderSide(color: Colors.green),
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(width: 8),
// //                     Expanded(
// //                       child: OutlinedButton.icon(
// //                         onPressed: () => _markAsNoShow(index),
// //                         icon: const Icon(Icons.person_off, size: 18),
// //                         label: const Text('No-Show'),
// //                         style: OutlinedButton.styleFrom(
// //                           foregroundColor: Colors.red,
// //                           side: const BorderSide(color: Colors.red),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildEmptyState() {
// //     return Center(
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Icon(
// //             Icons.event_available,
// //             size: 80,
// //             color: Colors.grey.shade300,
// //           ),
// //           const SizedBox(height: 16),
// //           Text(
// //             'No Patients in Queue',
// //             style: TextStyle(
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //               color: Colors.grey.shade600,
// //             ),
// //           ),
// //           const SizedBox(height: 8),
// //           Text(
// //             'All patients have been served',
// //             style: TextStyle(
// //               color: Colors.grey.shade500,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';
// import '../../widgets/status_badge.dart';

// class ManageQueueScreen extends StatefulWidget {
//   const ManageQueueScreen({super.key, required department});

//   @override
//   State<ManageQueueScreen> createState() => _ManageQueueScreenState();
// }

// class _ManageQueueScreenState extends State<ManageQueueScreen> {
//   List<Map<String, String>> queue = [
//     {
//       'token': 'A-15',
//       'name': 'Sarah Johnson',
//       'id': 'MRN-2024-001',
//       'time': '09:15 AM',
//       'wait': '8 min',
//     },
//     {
//       'token': 'A-16',
//       'name': 'Michael Chen',
//       'id': 'MRN-2024-002',
//       'time': '09:22 AM',
//       'wait': '6 min',
//     },
//     {
//       'token': 'A-17',
//       'name': 'Emily Rodriguez',
//       'id': 'MRN-2024-003',
//       'time': '09:28 AM',
//       'wait': '5 min',
//     },
//     {
//       'token': 'A-18',
//       'name': 'David Thompson',
//       'id': 'MRN-2024-004',
//       'time': '09:32 AM',
//       'wait': '7 min',
//     },
//   ];

//   // ---------------- CALL NEXT PATIENT ----------------
//   void _callNextPatient() {
//     if (queue.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('No patients in queue')),
//       );
//       return;
//     }

//     final nextPatient = queue.first;

//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text('Call Next Patient'),
//         content: Text(
//           'Calling ${nextPatient['name']} (${nextPatient['token']})',
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 queue.removeAt(0);
//               });
//               Navigator.pop(context);

//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text('${nextPatient['name']} has been called'),
//                 ),
//               );
//             },
//             child: const Text('Confirm'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF6FAFD),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         toolbarHeight: 90,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromRGBO(13, 27, 140, 1),
//                 Color.fromRGBO(90, 140, 255, 1),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           padding: const EdgeInsets.only(left: 16, bottom: 12, top: 36),
//           child: Row(
//             children: [
//               GestureDetector(
//                 onTap: () => Navigator.pop(context),
//                 child: const Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                   size: 28,
//                 ),
//               ),
//               const SizedBox(width: 12),
//               const Text(
//                 'Queue Management',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           _summaryCard(),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             child: SizedBox(
//               width: double.infinity,
//               height: 56,
//               child: ElevatedButton.icon(
//                 onPressed: queue.isEmpty ? null : _callNextPatient,
//                 icon: const Icon(Icons.volume_up),
//                 label: const Text(
//                   'Notify Next Patient',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 254, 254, 254),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           const Padding(
//             padding: EdgeInsets.fromLTRB(16, 8, 16, 12),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Current Queue',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),

//           Expanded(
//             child: queue.isEmpty
//                 ? const Center(child: Text('Queue is empty'))
//                 : ListView.builder(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     itemCount: queue.length,
//                     itemBuilder: (context, index) {
//                       return _queueTile(index, queue[index]);
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ---------------- SUMMARY CARD ----------------
//   Widget _summaryCard() {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       padding: const EdgeInsets.symmetric(vertical: 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _summaryItem(queue.length.toString(), 'In Queue', Colors.blue),
//           _summaryItem(
//             queue.isNotEmpty ? queue.first['token']! : '-',
//             'Next Token',
//             Colors.green,
//           ),
//           _summaryItem('12m', 'Avg Wait', Colors.red),
//         ],
//       ),
//     );
//   }

//   Widget _summaryItem(String value, String label, Color color) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: color,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           label,
//           style: const TextStyle(color: Colors.grey),
//         ),
//       ],
//     );
//   }

//   // ---------------- QUEUE TILE ----------------
//   Widget _queueTile(int index, Map<String, String> p) {
//     final bool isNext = index == 0;

//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 62,
//             height: 62,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: isNext ? Colors.blue.shade50 : Colors.orange.shade50,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Text(
//               p['token']!,
//               style: TextStyle(
//                 fontSize: 17,
//                 fontWeight: FontWeight.bold,
//                 color: isNext ? Colors.blue : Colors.orange,
//               ),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   p['name']!,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   'ID: ${p['id']}',
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 13,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Row(
//                   children: [
//                     const Icon(Icons.access_time,
//                         size: 14, color: Colors.grey),
//                     const SizedBox(width: 4),
//                     Expanded(
//                       child: Text(
//                         'Joined: ${p['time']}',
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               StatusBadge(
//                 status: isNext ? QueueStatus.active : QueueStatus.waiting,
//                 label: isNext ? 'NEXT' : 'WAIT',
//                 compact: false,
//               ),
//               const SizedBox(height: 6),
//               Text(
//                 'Wait: ${p['wait']}',
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: isNext ? Colors.red : Colors.green,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'dart:async';
import 'package:flutter/material.dart';
import '../../widgets/status_badge.dart'
    hide QueueStatus; // Hide QueueStatus from this import
import '../../services/queue_service.dart';
import '../../models/queue_model.dart';

class ManageQueueScreen extends StatefulWidget {
  final String? department;
  const ManageQueueScreen({super.key, this.department});

  @override
  State<ManageQueueScreen> createState() => _ManageQueueScreenState();
}

class _ManageQueueScreenState extends State<ManageQueueScreen> {
  List<QueueModel> _realQueue = [];
  bool _isLoading = true;
  String? _nextPatientToken;
  int _queueLength = 0;
  int _averageWaitTime = 0;

  late QueueService _queueService;
  StreamSubscription? _queueSubscription;

  @override
  void initState() {
    super.initState();
    _queueService = QueueService();
    _loadQueueData();
  }

  @override
  void dispose() {
    _queueSubscription?.cancel();
    super.dispose();
  }

  Future<void> _loadQueueData() async {
    try {
      // TODO: Replace with actual hospital ID from admin context
      const hospitalId = 'default_hospital_id';
      final departmentName = widget.department ?? 'General';

      final stream = _queueService.watchDepartmentQueue(
        hospitalId,
        departmentName,
      );

      _queueSubscription = stream.listen((queues) {
        final waitingQueues = queues
            .where((q) => q.status == QueueStatus.waiting)
            .toList()
          ..sort((a, b) => a.queueNumber.compareTo(b.queueNumber));

        // Calculate average wait time
        final avgWait = waitingQueues.isNotEmpty
            ? waitingQueues
                    .map((q) => q.estimatedWaitTime)
                    .reduce((a, b) => a + b) ~/
                waitingQueues.length
            : 0;

        setState(() {
          _realQueue = waitingQueues;
          _queueLength = waitingQueues.length;
          _nextPatientToken = waitingQueues.isNotEmpty
              ? '${waitingQueues.first.queueNumber}'
              : '-';
          _averageWaitTime = avgWait;
          _isLoading = false;
        });
      }, onError: (e) {
        print('Error loading queue data: $e');
        setState(() => _isLoading = false);
      });
    } catch (e) {
      print('Error setting up queue stream: $e');
      setState(() => _isLoading = false);
    }
  }

  void _callNextPatient() async {
    if (_realQueue.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No patients in queue')),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Notifying patient...'),
          ],
        ),
      ),
    );

    try {
      const hospitalId = 'default_hospital_id';

      final result = await _queueService.callNextPatientWithNotification(
        hospitalId: hospitalId,
        departmentName: widget.department ?? 'General',
      );

      Navigator.pop(context);

      if (result['success'] == true) {
        final notificationResult =
            result['notificationResult'] as Map<String, dynamic>? ?? {};
        final smsSent = notificationResult['smsSent'] ?? false;
        final smsEnabled = notificationResult['smsEnabled'] ?? false;

        String message = 'Patient has been notified';
        if (smsEnabled && smsSent) {
          message += ' (SMS sent successfully)';
        } else if (smsEnabled) {
          message += ' (SMS not sent - check phone number)';
        } else {
          message += ' (In-app notification only - SMS disabled)';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result['message'] ?? 'Failed to notify patient'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: const Color(0xFFF6FAFD),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFD),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 130,
        flexibleSpace: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(13, 27, 140, 1),
                  Color.fromRGBO(90, 140, 255, 1)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back,
                      color: Colors.white, size: 30),
                ),
                const SizedBox(width: 12),
                Text(
                  widget.department != null
                      ? '${widget.department} Queue'
                      : 'Queue Management',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          _summaryCard(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: _realQueue.isEmpty ? null : _callNextPatient,
                icon: const Icon(Icons.volume_up),
                label: const Text(
                  'Notify Next Patient',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 254, 254, 254),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Current Queue',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: _realQueue.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.group_off, size: 60, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          'No patients in queue',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    itemCount: _realQueue.length,
                    itemBuilder: (context, index) {
                      return _queueTile(index, _realQueue[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _summaryCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _summaryItem(_queueLength.toString(), 'In Queue', Colors.blue),
          _summaryItem(_nextPatientToken ?? '-', 'Next Token', Colors.green),
          _summaryItem('${_averageWaitTime}m', 'Avg Wait', Colors.red),
        ],
      ),
    );
  }

  Widget _summaryItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _queueTile(int index, QueueModel patient) {
    final bool isNext = index == 0;
    final timeJoined = patient.joinedAt;
    final formattedTime =
        '${timeJoined.hour.toString().padLeft(2, '0')}:${timeJoined.minute.toString().padLeft(2, '0')}';
    final patientIdShort = patient.patientId.length > 8
        ? '${patient.patientId.substring(0, 8)}...'
        : patient.patientId;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isNext ? Colors.blue.shade50 : Colors.orange.shade50,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              '${patient.queueNumber}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isNext ? Colors.blue : Colors.orange,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  patient.patientName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: $patientIdShort',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 12, color: Colors.grey),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        'Joined: $formattedTime',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                if (patient.priority != 'normal' && patient.priority != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: patient.priority == 'urgent'
                            ? Colors.orange[100]
                            : Colors.red[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        patient.priority!.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          color: patient.priority == 'urgent'
                              ? Colors.orange[800]
                              : Colors.red[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              StatusBadge(
                // Pass status as string
                status: isNext ? 'called' : 'waiting',
                label: isNext ? 'NEXT' : 'WAIT',
                compact: true,
              ),
              const SizedBox(height: 4),
              Text(
                'Wait: ${patient.estimatedWaitTime}m',
                style: TextStyle(
                  fontSize: 11,
                  color: isNext ? Colors.red : Colors.green,
                ),
              ),
              if (patient.notes != null && patient.notes!.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.note, size: 12, color: Colors.grey),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
