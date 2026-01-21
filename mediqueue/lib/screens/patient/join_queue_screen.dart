// // // import 'package:flutter/material.dart';

// // // class JoinQueueScreen extends StatefulWidget {
// // //   const JoinQueueScreen({super.key});

// // //   @override
// // //   State<JoinQueueScreen> createState() => _JoinQueueScreenState();
// // // }

// // // class _JoinQueueScreenState extends State<JoinQueueScreen> {
// // //   String? selectedHospital;
// // //   String? selectedDepartment;
// // //   bool isInQueue = false;
// // //   int queuePosition = 0;
// // //   int estimatedWaitTime = 0;

// // //   final List<String> hospitals = [
// // //     'City General Hospital',
// // //     'Central Medical Center',
// // //     'St. Mary\'s Hospital',
// // //     'Metro Health Clinic',
// // //   ];

// // //   final List<Map<String, dynamic>> departments = [
// // //     {'name': 'General Medicine', 'icon': Icons.medical_services, 'wait': 25},
// // //     {'name': 'Cardiology', 'icon': Icons.favorite, 'wait': 45},
// // //     {'name': 'Orthopedics', 'icon': Icons.accessibility_new, 'wait': 35},
// // //     {'name': 'Pediatrics', 'icon': Icons.child_care, 'wait': 20},
// // //     {'name': 'Dermatology', 'icon': Icons.face, 'wait': 30},
// // //     {'name': 'ENT', 'icon': Icons.hearing, 'wait': 25},
// // //   ];

// // //   void _joinQueue() {
// // //     if (selectedHospital == null || selectedDepartment == null) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(
// // //           content: Text('Please select hospital and department'),
// // //           backgroundColor: Colors.orange,
// // //         ),
// // //       );
// // //       return;
// // //     }

// // //     setState(() {
// // //       isInQueue = true;
// // //       queuePosition = 8;
// // //       final dept =
// // //           departments.firstWhere((d) => d['name'] == selectedDepartment);
// // //       estimatedWaitTime = dept['wait'] as int;
// // //     });

// // //     ScaffoldMessenger.of(context).showSnackBar(
// // //       const SnackBar(
// // //         content: Text('Successfully joined the queue!'),
// // //         backgroundColor: Colors.green,
// // //       ),
// // //     );
// // //   }

// // //   void _leaveQueue() {
// // //     showDialog(
// // //       context: context,
// // //       builder: (context) => AlertDialog(
// // //         title: const Text('Leave Queue?'),
// // //         content: const Text('Are you sure you want to leave the queue?'),
// // //         actions: [
// // //           TextButton(
// // //             onPressed: () => Navigator.pop(context),
// // //             child: const Text('Cancel'),
// // //           ),
// // //           TextButton(
// // //             onPressed: () {
// // //               setState(() {
// // //                 isInQueue = false;
// // //                 queuePosition = 0;
// // //                 estimatedWaitTime = 0;
// // //               });
// // //               Navigator.pop(context);
// // //               ScaffoldMessenger.of(context).showSnackBar(
// // //                 const SnackBar(content: Text('Left the queue')),
// // //               );
// // //             },
// // //             child: const Text('Leave', style: TextStyle(color: Colors.red)),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Join Queue'),
// // //         actions: [
// // //           if (isInQueue)
// // //             IconButton(
// // //               icon: const Icon(Icons.exit_to_app),
// // //               onPressed: _leaveQueue,
// // //               tooltip: 'Leave Queue',
// // //             ),
// // //         ],
// // //       ),
// // //       body: SingleChildScrollView(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: isInQueue ? _buildQueueStatusView() : _buildJoinQueueForm(),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildJoinQueueForm() {
// // //     return Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         // Header
// // //         Card(
// // //           color: Colors.blue.shade50,
// // //           elevation: 0,
// // //           child: Padding(
// // //             padding: const EdgeInsets.all(16.0),
// // //             child: Row(
// // //               children: [
// // //                 Icon(Icons.info_outline, color: Colors.blue.shade700),
// // //                 const SizedBox(width: 12),
// // //                 const Expanded(
// // //                   child: Text(
// // //                     'Select a hospital and department to join the queue',
// // //                     style: TextStyle(fontSize: 14),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //         const SizedBox(height: 24),

// // //         // Hospital Selection
// // //         const Text(
// // //           'Select Hospital',
// // //           style: TextStyle(
// // //             fontSize: 18,
// // //             fontWeight: FontWeight.bold,
// // //             color: Color(0xFF424242),
// // //           ),
// // //         ),
// // //         const SizedBox(height: 12),
// // //         Container(
// // //           padding: const EdgeInsets.symmetric(horizontal: 16),
// // //           decoration: BoxDecoration(
// // //             color: Colors.white,
// // //             borderRadius: BorderRadius.circular(12),
// // //             border: Border.all(color: Colors.grey.shade300),
// // //           ),
// // //           child: DropdownButtonHideUnderline(
// // //             child: DropdownButton<String>(
// // //               isExpanded: true,
// // //               value: selectedHospital,
// // //               hint: const Text('Choose a hospital'),
// // //               icon: const Icon(Icons.arrow_drop_down),
// // //               items: hospitals.map((String hospital) {
// // //                 return DropdownMenuItem<String>(
// // //                   value: hospital,
// // //                   child: Row(
// // //                     children: [
// // //                       const Icon(Icons.local_hospital, size: 20),
// // //                       const SizedBox(width: 12),
// // //                       Text(hospital),
// // //                     ],
// // //                   ),
// // //                 );
// // //               }).toList(),
// // //               onChanged: (String? value) {
// // //                 setState(() {
// // //                   selectedHospital = value;
// // //                   selectedDepartment = null;
// // //                 });
// // //               },
// // //             ),
// // //           ),
// // //         ),
// // //         const SizedBox(height: 24),

// // //         // Department Selection
// // //         const Text(
// // //           'Select Department',
// // //           style: TextStyle(
// // //             fontSize: 18,
// // //             fontWeight: FontWeight.bold,
// // //             color: Color(0xFF424242),
// // //           ),
// // //         ),
// // //         const SizedBox(height: 12),

// // //         if (selectedHospital == null)
// // //           Card(
// // //             color: Colors.grey.shade100,
// // //             child: const Padding(
// // //               padding: EdgeInsets.all(16.0),
// // //               child: Center(
// // //                 child: Text(
// // //                   'Please select a hospital first',
// // //                   style: TextStyle(color: Colors.grey),
// // //                 ),
// // //               ),
// // //             ),
// // //           )
// // //         else
// // //           GridView.builder(
// // //             shrinkWrap: true,
// // //             physics: const NeverScrollableScrollPhysics(),
// // //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // //               crossAxisCount: 2,
// // //               childAspectRatio: 1.3,
// // //               crossAxisSpacing: 12,
// // //               mainAxisSpacing: 12,
// // //             ),
// // //             itemCount: departments.length,
// // //             itemBuilder: (context, index) {
// // //               final dept = departments[index];
// // //               final isSelected = selectedDepartment == dept['name'];

// // //               return Card(
// // //                 elevation: isSelected ? 8 : 2,
// // //                 shape: RoundedRectangleBorder(
// // //                   borderRadius: BorderRadius.circular(12),
// // //                   side: BorderSide(
// // //                     color: isSelected ? Colors.blue : Colors.transparent,
// // //                     width: 2,
// // //                   ),
// // //                 ),
// // //                 child: InkWell(
// // //                   onTap: () {
// // //                     setState(() {
// // //                       selectedDepartment = dept['name'];
// // //                     });
// // //                   },
// // //                   borderRadius: BorderRadius.circular(12),
// // //                   child: Padding(
// // //                     padding: const EdgeInsets.all(12.0),
// // //                     child: Column(
// // //                       mainAxisAlignment: MainAxisAlignment.center,
// // //                       children: [
// // //                         Icon(
// // //                           dept['icon'],
// // //                           size: 36,
// // //                           color:
// // //                               isSelected ? Colors.blue : Colors.grey.shade600,
// // //                         ),
// // //                         const SizedBox(height: 8),
// // //                         Text(
// // //                           dept['name'],
// // //                           textAlign: TextAlign.center,
// // //                           style: TextStyle(
// // //                             fontSize: 13,
// // //                             fontWeight: isSelected
// // //                                 ? FontWeight.bold
// // //                                 : FontWeight.normal,
// // //                             color: isSelected ? Colors.blue : Colors.black87,
// // //                           ),
// // //                         ),
// // //                         const SizedBox(height: 4),
// // //                         Text(
// // //                           '~${dept['wait']} min',
// // //                           style: TextStyle(
// // //                             fontSize: 11,
// // //                             color: Colors.grey.shade600,
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ),
// // //               );
// // //             },
// // //           ),
// // //         const SizedBox(height: 32),

// // //         // Join Button
// // //         SizedBox(
// // //           width: double.infinity,
// // //           height: 56,
// // //           child: ElevatedButton.icon(
// // //             onPressed: _joinQueue,
// // //             icon: const Icon(Icons.add_circle_outline, size: 28),
// // //             label: const Text(
// // //               'Join Queue',
// // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //             ),
// // //             style: ElevatedButton.styleFrom(
// // //               backgroundColor: Colors.blue,
// // //               foregroundColor: Colors.white,
// // //               shape: RoundedRectangleBorder(
// // //                 borderRadius: BorderRadius.circular(12),
// // //               ),
// // //               elevation: 3,
// // //             ),
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildQueueStatusView() {
// // //     return Column(
// // //       children: [
// // //         // Success Message
// // //         Card(
// // //           color: Colors.green.shade50,
// // //           elevation: 0,
// // //           child: Padding(
// // //             padding: const EdgeInsets.all(16.0),
// // //             child: Row(
// // //               children: [
// // //                 Icon(Icons.check_circle,
// // //                     color: Colors.green.shade700, size: 32),
// // //                 const SizedBox(width: 12),
// // //                 const Expanded(
// // //                   child: Text(
// // //                     'You\'re in the queue!',
// // //                     style: TextStyle(
// // //                       fontSize: 18,
// // //                       fontWeight: FontWeight.bold,
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //         const SizedBox(height: 24),

// // //         // Queue Position Card
// // //         Card(
// // //           elevation: 6,
// // //           shape: RoundedRectangleBorder(
// // //             borderRadius: BorderRadius.circular(20),
// // //           ),
// // //           child: Container(
// // //             padding: const EdgeInsets.all(32),
// // //             decoration: BoxDecoration(
// // //               gradient: LinearGradient(
// // //                 colors: [Colors.blue.shade600, Colors.blue.shade400],
// // //                 begin: Alignment.topLeft,
// // //                 end: Alignment.bottomRight,
// // //               ),
// // //               borderRadius: BorderRadius.circular(20),
// // //             ),
// // //             child: Column(
// // //               children: [
// // //                 const Text(
// // //                   'Your Position',
// // //                   style: TextStyle(
// // //                     color: Colors.white70,
// // //                     fontSize: 16,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 12),
// // //                 Text(
// // //                   '#$queuePosition',
// // //                   style: const TextStyle(
// // //                     color: Colors.white,
// // //                     fontSize: 72,
// // //                     fontWeight: FontWeight.bold,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 8),
// // //                 Text(
// // //                   'in queue',
// // //                   style: TextStyle(
// // //                     color: Colors.white70,
// // //                     fontSize: 16,
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //         const SizedBox(height: 24),

// // //         // Details Cards
// // //         Row(
// // //           children: [
// // //             Expanded(
// // //               child: Card(
// // //                 elevation: 3,
// // //                 child: Padding(
// // //                   padding: const EdgeInsets.all(20.0),
// // //                   child: Column(
// // //                     children: [
// // //                       Icon(Icons.schedule,
// // //                           color: Colors.orange.shade600, size: 32),
// // //                       const SizedBox(height: 12),
// // //                       const Text(
// // //                         'Est. Wait',
// // //                         style: TextStyle(
// // //                           color: Colors.grey,
// // //                           fontSize: 12,
// // //                         ),
// // //                       ),
// // //                       const SizedBox(height: 4),
// // //                       Text(
// // //                         '$estimatedWaitTime min',
// // //                         style: const TextStyle(
// // //                           fontSize: 18,
// // //                           fontWeight: FontWeight.bold,
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //             const SizedBox(width: 12),
// // //             Expanded(
// // //               child: Card(
// // //                 elevation: 3,
// // //                 child: Padding(
// // //                   padding: const EdgeInsets.all(20.0),
// // //                   child: Column(
// // //                     children: [
// // //                       Icon(Icons.people,
// // //                           color: Colors.purple.shade600, size: 32),
// // //                       const SizedBox(height: 12),
// // //                       const Text(
// // //                         'Ahead',
// // //                         style: TextStyle(
// // //                           color: Colors.grey,
// // //                           fontSize: 12,
// // //                         ),
// // //                       ),
// // //                       const SizedBox(height: 4),
// // //                       Text(
// // //                         '${queuePosition - 1}',
// // //                         style: const TextStyle(
// // //                           fontSize: 18,
// // //                           fontWeight: FontWeight.bold,
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //         const SizedBox(height: 24),

// // //         // Queue Details
// // //         Card(
// // //           elevation: 2,
// // //           child: Padding(
// // //             padding: const EdgeInsets.all(20.0),
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 const Text(
// // //                   'Queue Details',
// // //                   style: TextStyle(
// // //                     fontSize: 18,
// // //                     fontWeight: FontWeight.bold,
// // //                   ),
// // //                 ),
// // //                 const Divider(height: 24),
// // //                 _buildDetailRow(
// // //                     Icons.local_hospital, 'Hospital', selectedHospital!),
// // //                 const SizedBox(height: 12),
// // //                 _buildDetailRow(
// // //                     Icons.medical_services, 'Department', selectedDepartment!),
// // //                 const SizedBox(height: 12),
// // //                 _buildDetailRow(Icons.access_time, 'Joined',
// // //                     'Today, ${TimeOfDay.now().format(context)}'),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //         const SizedBox(height: 24),

// // //         // Leave Queue Button
// // //         SizedBox(
// // //           width: double.infinity,
// // //           height: 50,
// // //           child: OutlinedButton.icon(
// // //             onPressed: _leaveQueue,
// // //             icon: const Icon(Icons.exit_to_app),
// // //             label: const Text(
// // //               'Leave Queue',
// // //               style: TextStyle(fontSize: 16),
// // //             ),
// // //             style: OutlinedButton.styleFrom(
// // //               foregroundColor: Colors.red,
// // //               side: const BorderSide(color: Colors.red),
// // //               shape: RoundedRectangleBorder(
// // //                 borderRadius: BorderRadius.circular(12),
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildDetailRow(IconData icon, String label, String value) {
// // //     return Row(
// // //       children: [
// // //         Icon(icon, size: 20, color: Colors.grey.shade600),
// // //         const SizedBox(width: 12),
// // //         Text(
// // //           '$label: ',
// // //           style: TextStyle(
// // //             color: Colors.grey.shade600,
// // //             fontSize: 14,
// // //           ),
// // //         ),
// // //         Expanded(
// // //           child: Text(
// // //             value,
// // //             style: const TextStyle(
// // //               fontSize: 14,
// // //               fontWeight: FontWeight.w600,
// // //             ),
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }



// // import 'package:flutter/material.dart';

// // class JoinQueueScreen extends StatefulWidget {
// //   const JoinQueueScreen({super.key});

// //   @override
// //   State<JoinQueueScreen> createState() => _JoinQueueScreenState();
// // }

// // class _JoinQueueScreenState extends State<JoinQueueScreen> {
// //   bool isInQueue = false;
// //   int queuePosition = 0;
// //   int estimatedWaitTime = 0;

// //   String? hospitalName;
// //   String? departmentName;

// //   final Map<String, int> departmentWaitTimes = {
// //     'General Medicine': 25,
// //     'Cardiology': 45,
// //     'Orthopedics': 35,
// //     'Pediatrics': 20,
// //     'Dermatology': 30,
// //     'ENT': 25,
// //   };

// //   @override
// //   void didChangeDependencies() {
// //     super.didChangeDependencies();

// //     final args =
// //         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

// //     hospitalName = args?['hospitalName'];
// //     departmentName = args?['department'];
// //   }

// //   void _joinQueue() {
// //     setState(() {
// //       isInQueue = true;
// //       queuePosition = 8; // dummy value
// //       estimatedWaitTime =
// //           departmentWaitTimes[departmentName] ?? 20;
// //     });

// //     ScaffoldMessenger.of(context).showSnackBar(
// //       const SnackBar(
// //         content: Text('Successfully joined the queue'),
// //         backgroundColor: Colors.green,
// //       ),
// //     );
// //   }

// //   void _leaveQueue() {
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: const Text('Leave Queue?'),
// //         content: const Text('Are you sure you want to leave the queue?'),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.pop(context),
// //             child: const Text('Cancel'),
// //           ),
// //           TextButton(
// //             onPressed: () {
// //               setState(() {
// //                 isInQueue = false;
// //                 queuePosition = 0;
// //                 estimatedWaitTime = 0;
// //               });
// //               Navigator.pop(context);
// //             },
// //             child: const Text(
// //               'Leave',
// //               style: TextStyle(color: Colors.red),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Join Queue'),
// //         actions: [
// //           if (isInQueue)
// //             IconButton(
// //               icon: const Icon(Icons.exit_to_app),
// //               onPressed: _leaveQueue,
// //             ),
// //         ],
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16),
// //         child: isInQueue ? _buildQueueStatusView() : _buildConfirmView(),
// //       ),
// //     );
// //   }

// //   // ---------- CONFIRM VIEW ----------
// //   Widget _buildConfirmView() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Card(
// //           color: Colors.blue.shade50,
// //           elevation: 0,
// //           child: const Padding(
// //             padding: EdgeInsets.all(16),
// //             child: Row(
// //               children: [
// //                 Icon(Icons.info_outline, color: Colors.blue),
// //                 SizedBox(width: 12),
// //                 Expanded(
// //                   child: Text(
// //                     'Details further needed to join the queue',
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //         const SizedBox(height: 24),

// //         Card(
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(16),
// //           ),
// //           child: Padding(
// //             padding: const EdgeInsets.all(20),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 const Text(
// //                   'Selected Details',
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 const Divider(height: 24),
// //                 _buildDetailRow(
// //                     Icons.local_hospital, 'Hospital', hospitalName ?? 'N/A'),
// //                 const SizedBox(height: 12),
// //                 _buildDetailRow(Icons.medical_services,
// //                     'Department', departmentName ?? 'N/A'),
// //                 const SizedBox(height: 12),
// //                 _buildDetailRow(Icons.schedule, 'Estimated Wait',
// //                     '~${departmentWaitTimes[departmentName] ?? '-'} min'),
// //               ],
// //             ),
// //           ),
// //         ),
// //         const SizedBox(height: 32),

// //         SizedBox(
// //           width: double.infinity,
// //           height: 56,
// //           child: ElevatedButton.icon(
// //             onPressed: _joinQueue,
// //             icon: const Icon(Icons.add_circle_outline),
// //             label: const Text(
// //               'Confirm & Join Queue',
// //               style: TextStyle(fontSize: 18),
// //             ),
// //             style: ElevatedButton.styleFrom(
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(12),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   // ---------- QUEUE STATUS VIEW ----------
// //   Widget _buildQueueStatusView() {
// //     return Column(
// //       children: [
// //         Card(
// //           color: Colors.green.shade50,
// //           elevation: 0,
// //           child: const Padding(
// //             padding: EdgeInsets.all(16),
// //             child: Row(
// //               children: [
// //                 Icon(Icons.check_circle, color: Colors.green, size: 32),
// //                 SizedBox(width: 12),
// //                 Text(
// //                   'You are in the queue!',
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //         const SizedBox(height: 24),

// //         Card(
// //           elevation: 6,
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(20),
// //           ),
// //           child: Container(
// //             padding: const EdgeInsets.all(32),
// //             decoration: BoxDecoration(
// //               gradient: LinearGradient(
// //                 colors: [Colors.blue.shade600, Colors.blue.shade400],
// //               ),
// //               borderRadius: BorderRadius.circular(20),
// //             ),
// //             child: Column(
// //               children: [
// //                 const Text(
// //                   'Your Position',
// //                   style: TextStyle(color: Colors.white70),
// //                 ),
// //                 const SizedBox(height: 12),
// //                 Text(
// //                   '#$queuePosition',
// //                   style: const TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 64,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //         const SizedBox(height: 24),

// //         _buildDetailRow(
// //             Icons.schedule, 'Estimated Wait', '$estimatedWaitTime min'),
// //         const SizedBox(height: 12),
// //         _buildDetailRow(
// //             Icons.local_hospital, 'Hospital', hospitalName ?? 'N/A'),
// //         const SizedBox(height: 12),
// //         _buildDetailRow(
// //             Icons.medical_services, 'Department', departmentName ?? 'N/A'),
// //       ],
// //     );
// //   }

// //   Widget _buildDetailRow(
// //       IconData icon, String label, String value) {
// //     return Row(
// //       children: [
// //         Icon(icon, size: 20, color: Colors.grey),
// //         const SizedBox(width: 12),
// //         Text(
// //           '$label: ',
// //           style: const TextStyle(fontWeight: FontWeight.w600),
// //         ),
// //         Expanded(child: Text(value)),
// //       ],
// //     );
// //   }
// // }


//  import 'package:flutter/material.dart';

// class JoinQueueScreen extends StatefulWidget {
//   const JoinQueueScreen({super.key});

//   @override
//   State<JoinQueueScreen> createState() => _JoinQueueScreenState();
// }

// class _JoinQueueScreenState extends State<JoinQueueScreen> {
//   bool isInQueue = true; // join queue screen directly

//   int queuePosition = 8;
//   int estimatedWaitTime = 45;

//   String hospitalName = "City General Hospital";
//   String? departmentName = "Cardiology";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,

//       // ✅ APP BAR (matches image)
//       appBar: AppBar(
//         title: const Text(
//           "Join Queue",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
//         ),
//         leading: const BackButton(color: Colors.black),
//         elevation: 0,
//         backgroundColor: Colors.white,
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 16),
//             child: Icon(Icons.location_on_outlined, color: Colors.deepPurple),
//           )
//         ],
//       ),

//       body: _queueStatusView(),
//     );
//   }

//   // ================= QUEUE STATUS UI =================
//   Widget _queueStatusView() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           // -------- Queue Details Card --------
//           Card(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//             elevation: 1,
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         "Queue Details - $departmentName",
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 16),
//                       ),
//                       const Spacer(),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12, vertical: 6),
//                         decoration: BoxDecoration(
//                           color: Colors.green.shade100,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: const Text(
//                           "ACTIVE",
//                           style: TextStyle(
//                               color: Colors.green,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text("Current Position"),
//                           const SizedBox(height: 4),
//                           Text(
//                             "#$queuePosition",
//                             style: const TextStyle(
//                               fontSize: 28,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text("Estimated Wait"),
//                           const SizedBox(height: 4),
//                           Text(
//                             "$estimatedWaitTime min",
//                             style: const TextStyle(
//                               fontSize: 28,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.red,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: const [
//                           Text("Doctor Available"),
//                           SizedBox(height: 4),
//                           Text(
//                             "Dr. Sarah\nWilson",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           const SizedBox(height: 16),

//           // -------- Queue Progress --------
//           Card(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//             color: const Color(0xFFE6E3FF),
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: const [
//                       Text("Queue Progress",
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                       Spacer(),
//                       Text("12/25 patients",
//                           style: TextStyle(color: Colors.deepPurple)),
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: const LinearProgressIndicator(
//                       value: 0.48,
//                       minHeight: 8,
//                       backgroundColor: Colors.white,
//                       color: Colors.deepPurple,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("Currently serving: #8",
//                           style: TextStyle(fontSize: 12)),
//                       Text("Avg. time: 12 min",
//                           style: TextStyle(fontSize: 12)),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),

//           const SizedBox(height: 16),

//           // -------- Recent Queue Activity --------
//           Card(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text("Recent Queue Activity",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                   SizedBox(height: 12),
//                   _ActivityDot(
//                     color: Colors.green,
//                     text: "Patient #7 completed consultation",
//                     time: "2 minutes ago",
//                   ),
//                   _ActivityDot(
//                     color: Colors.blue,
//                     text: "Patient #8 called for consultation",
//                     time: "5 minutes ago",
//                   ),
//                   _ActivityDot(
//                     color: Colors.teal,
//                     text: "New patient joined queue (#25)",
//                     time: "8 minutes ago",
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           const SizedBox(height: 16),

//           // -------- Important Information --------
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: const Color(0xFFE6E3FF),
//               borderRadius: BorderRadius.circular(16),
//               border: Border.all(color: Colors.deepPurple),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Row(
//                   children: [
//                     Icon(Icons.info, color: Colors.deepPurple),
//                     SizedBox(width: 8),
//                     Text(
//                       "Important Information",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 8),
//                 Text("• Please arrive 10 minutes before your estimated time"),
//                 Text("• Bring your ID and insurance card"),
//                 Text(
//                     "• Queue position may change based on emergency cases"),
//                 Text("• You'll receive SMS notifications for updates"),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ================= ACTIVITY DOT =================
// class _ActivityDot extends StatelessWidget {
//   final Color color;
//   final String text;
//   final String time;

//   const _ActivityDot({
//     required this.color,
//     required this.text,
//     required this.time,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 8,
//             height: 8,
//             margin: const EdgeInsets.only(top: 6),
//             decoration:
//                 BoxDecoration(color: color, shape: BoxShape.circle),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(text),
//                 const SizedBox(height: 2),
//                 Text(time,
//                     style:
//                         const TextStyle(fontSize: 12, color: Colors.grey)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

  import 'package:flutter/material.dart';
import 'join_queue_status_screen.dart';

class JoinQueueScreen extends StatefulWidget {
  const JoinQueueScreen({super.key, required String departmentName});

  @override
  State<JoinQueueScreen> createState() => _JoinQueueScreenState();
}

class _JoinQueueScreenState extends State<JoinQueueScreen> {
  String? departmentName;

  final List<Map<String, dynamic>> departments = [
    {
      "name": "Cardiology",
      "subtitle": "Heart & Vascular",
      "icon": Icons.favorite,
      "color": Colors.lightBlue,
      "doctors": 3,
      "status": "available",
    },
    {
      "name": "Neurology",
      "subtitle": "Brain & Nervous System",
      "icon": Icons.psychology,
      "color": Colors.teal,
      "doctors": 2,
      "status": "available",
    },
    {
      "name": "Orthopedics",
      "subtitle": "Bones & Joints",
      "icon": Icons.accessibility,
      "color": Colors.indigo,
      "doctors": 4,
      "status": "available",
    },
    {
      "name": "Pediatrics",
      "subtitle": "Children's Health",
      "icon": Icons.child_care,
      "color": Colors.orange,
      "doctors": 5,
      "status": "available",
    },
    {
      "name": "Ophthalmology",
      "subtitle": "Eye Care",
      "icon": Icons.remove_red_eye,
      "color": Colors.deepOrange,
      "doctors": 1,
      "status": "available",
    },
    {
      "name": "Emergency",
      "subtitle": "Urgent Care",
      "icon": Icons.local_hospital,
      "color": Colors.red,
      "doctors": 0,
      "status": "walkin",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // ✅ GRADIENT APP BAR
      appBar: AppBar(
        title: const Text(
          "Department",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _hospitalCard(),
            const SizedBox(height: 24),
            const Text(
              "Select Department",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: GridView.builder(
                itemCount: departments.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final dept = departments[index];
                  final selected = departmentName == dept["name"];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        departmentName = dept["name"];
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: selected ? Colors.blue : Colors.transparent,
                          width: 2,
                        ),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 8),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor:
                                dept["color"].withOpacity(0.15),
                            child: Icon(
                              dept["icon"],
                              color: dept["color"],
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            dept["name"],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            dept["subtitle"],
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ✅ JOIN QUEUE BUTTON
      bottomNavigationBar: departmentName == null
          ? null
          : Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => JoinQueueStatusScreen(
                          departmentName: departmentName!,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    "Join Queue - $departmentName",
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _hospitalCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(180, 220, 255, 1),
            Color.fromRGBO(120, 180, 255, 1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: const [
          Expanded(
            child: Text(
              "City General Hospital\nDowntown Medical District",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Icon(Icons.local_hospital, size: 48),
        ],
      ),
    );
  }
}
