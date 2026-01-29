




// // // // // import 'package:flutter/material.dart';
// // // // // import '/widgets/department_card.dart';
// // // // // import '/widgets/info_card.dart';
// // // // // import '/widgets/custom_action_button.dart';

// // // // // class AdminDashboardScreen extends StatefulWidget {
// // // // //   const AdminDashboardScreen({super.key});

// // // // //   @override
// // // // //   State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
// // // // // }

// // // // // class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
// // // // //   final List<Map<String, dynamic>> queueData = [
// // // // //     {
// // // // //       'department': 'Emergency',
// // // // //       'count': 24,
// // // // //       'avgWait': 15,
// // // // //       'icon': Icons.local_hospital,
// // // // //       'color': Colors.blue,
// // // // //     },
// // // // //     {
// // // // //       'department': 'Cardiology',
// // // // //       'count': 18,
// // // // //       'avgWait': 28,
// // // // //       'icon': Icons.favorite,
// // // // //       'color': Colors.pink,
// // // // //     },
// // // // //     {
// // // // //       'department': 'Neurology',
// // // // //       'count': 12,
// // // // //       'avgWait': 35,
// // // // //       'icon': Icons.psychology,
// // // // //       'color': Colors.green,
// // // // //     },
// // // // //     {
// // // // //       'department': 'Pediatrics',
// // // // //       'count': 16,
// // // // //       'avgWait': 22,
// // // // //       'icon': Icons.child_care,
// // // // //       'color': Colors.red,
// // // // //     },
// // // // //     {
// // // // //       'department': 'Ophthalmology',
// // // // //       'count': 9,
// // // // //       'avgWait': 18,
// // // // //       'icon': Icons.remove_red_eye,
// // // // //       'color': Colors.lightGreen,
// // // // //     },
// // // // //   ];

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final totalPatients =
// // // // //         queueData.fold<int>(0, (sum, item) => sum + item['count'] as int);

// // // // //     final avgWaitTime =
// // // // //         queueData.fold<int>(0, (sum, item) => sum + item['avgWait'] as int) ~/
// // // // //             queueData.length;

// // // // //     return Scaffold(
// // // // //       backgroundColor: const Color(0xFFF5F6FA),

// // // // //       // ✅ GRADIENT APP BAR
// // // // //       appBar: AppBar(
// // // // //         elevation: 0,
// // // // //         automaticallyImplyLeading: false,
// // // // //         toolbarHeight: 90,
// // // // //         flexibleSpace: Container(
// // // // //           decoration: const BoxDecoration(
// // // // //             gradient: LinearGradient(
// // // // //               colors: [
// // // // //                 Color.fromRGBO(13, 27, 140, 1),
// // // // //                 Color.fromRGBO(90, 140, 255, 1),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //         ),
// // // // //         title: Row(
// // // // //           children: [
// // // // //             const CircleAvatar(
// // // // //               radius: 22,
// // // // //               backgroundColor: Colors.white,
// // // // //               child: Text(
// // // // //                 'A',
// // // // //                 style: TextStyle(
// // // // //                   color: Color.fromRGBO(13, 27, 140, 1),
// // // // //                   fontWeight: FontWeight.bold,
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(width: 12),
// // // // //             const Column(
// // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // //               mainAxisSize: MainAxisSize.min,
// // // // //               children: [
// // // // //                 Text(
// // // // //                   'Dr. Sarah Johnson',
// // // // //                   style: TextStyle(
// // // // //                     fontSize: 16,
// // // // //                     fontWeight: FontWeight.w600,
// // // // //                     color: Colors.white,
// // // // //                   ),
// // // // //                 ),
// // // // //                 Text(
// // // // //                   'Hospital Administrator',
// // // // //                   style: TextStyle(
// // // // //                     fontSize: 13,
// // // // //                     color: Colors.white70,
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //             const Spacer(),
// // // // //             IconButton(
// // // // //               icon: const Icon(Icons.notifications_none, color: Colors.white),
// // // // //               onPressed: () {},
// // // // //             ),
// // // // //             IconButton(
// // // // //               icon: const Icon(Icons.settings_outlined, color: Colors.white),
// // // // //               onPressed: () {},
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),

// // // // //       // ✅ BODY CONTENT
// // // // //       body: SingleChildScrollView(
// // // // //         padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
// // // // //         child: Column(
// // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // //           children: [
// // // // //             // 🔹 Queue Overview
// // // // //             const Text(
// // // // //               'Queue Overview',
// // // // //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //             const SizedBox(height: 16),

// // // // //             Row(
// // // // //               children: [
// // // // //                 Expanded(
// // // // //                   child: InfoCard(
// // // // //                     title: 'Total Patients',
// // // // //                     value: totalPatients.toString(),
// // // // //                     icon: Icons.people,
// // // // //                     color: Colors.blue,
// // // // //                   ),
// // // // //                 ),
// // // // //                 const SizedBox(width: 12),
// // // // //                 Expanded(
// // // // //                   child: InfoCard(
// // // // //                     title: 'Avg Wait Time',
// // // // //                     value: '${avgWaitTime}m',
// // // // //                     icon: Icons.schedule,
// // // // //                     color: Colors.purple,
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),

// // // // //             const SizedBox(height: 12),

// // // // //             Row(
// // // // //               children: [
// // // // //                 Expanded(
// // // // //                   child: InfoCard(
// // // // //                     title: 'Departments',
// // // // //                     value: queueData.length.toString(),
// // // // //                     icon: Icons.domain,
// // // // //                     color: Colors.green,
// // // // //                   ),
// // // // //                 ),
// // // // //                 const SizedBox(width: 12),
// // // // //                 Expanded(
// // // // //                   child: InfoCard(
// // // // //                     title: 'Completed Today',
// // // // //                     value: '89',
// // // // //                     icon: Icons.check_circle,
// // // // //                     color: Colors.red,
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),

// // // // //             const SizedBox(height: 32),

// // // // //             // 🔹 Quick Actions
// // // // //             const Text(
// // // // //               'Quick Actions',
// // // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //             const SizedBox(height: 16),

// // // // //             Row(
// // // // //               children: [
// // // // //                 Expanded(
// // // // //                   child: CustomActionButton(
// // // // //                     label: 'Manage Queues',
// // // // //                     onPressed: () =>
// // // // //                         Navigator.pushNamed(context, '/manage-queue'),
// // // // //                     icon: Icons.edit,
// // // // //                     backgroundColor: Colors.blue,
// // // // //                     height: 52,
// // // // //                   ),
// // // // //                 ),
// // // // //                 const SizedBox(width: 10),
// // // // //                 Expanded(
// // // // //                   child: CustomActionButton(
// // // // //                     label: 'View Reports',
// // // // //                     onPressed: () => _showReportsDialog(context),
// // // // //                     icon: Icons.bar_chart,
// // // // //                     type: ButtonType.secondary,
// // // // //                     foregroundColor: Colors.black,
// // // // //                     height: 52,
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),

// // // // //             const SizedBox(height: 32),

// // // // //             // 🔹 Department Queues
// // // // //             Row(
// // // // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //               children: const [
// // // // //                 Text(
// // // // //                   'Department Queues',
// // // // //                   style:
// // // // //                       TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // //                 ),
// // // // //                 Text(
// // // // //                   'View All',
// // // // //                   style: TextStyle(
// // // // //                     fontSize: 14,
// // // // //                     color: Colors.blue,
// // // // //                     fontWeight: FontWeight.w500,
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),

// // // // //             const SizedBox(height: 16),

// // // // //             ListView.builder(
// // // // //               shrinkWrap: true,
// // // // //               physics: const NeverScrollableScrollPhysics(),
// // // // //               itemCount: queueData.length,
// // // // //               itemBuilder: (context, index) {
// // // // //                 final dept = queueData[index];
// // // // //                 return DepartmentCard(
// // // // //                   dept: dept,
// // // // //                   onTap: () {
// // // // //                     Navigator.pushNamed(
// // // // //                       context,
// // // // //                       '/manage-queue',
// // // // //                       arguments: dept['department'],
// // // // //                     );
// // // // //                   },
// // // // //                   title: '',
// // // // //                   subtitle: '',
// // // // //                   iconColor: dept['color'],
// // // // //                   icon: dept['icon'],
// // // // //                   color: dept['color'],
// // // // //                 );
// // // // //               },
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   void _showReportsDialog(BuildContext context) {
// // // // //     showDialog(
// // // // //       context: context,
// // // // //       builder: (_) => AlertDialog(
// // // // //         title: const Text('Daily Report'),
// // // // //         content: const Column(
// // // // //           mainAxisSize: MainAxisSize.min,
// // // // //           children: [
// // // // //             _ReportRow('Total Patients Today', '127'),
// // // // //             _ReportRow('Average Wait Time', '28 minutes'),
// // // // //             _ReportRow('Completed Appointments', '98'),
// // // // //             _ReportRow('No Shows', '5'),
// // // // //             _ReportRow('Cancelled', '12'),
// // // // //           ],
// // // // //         ),
// // // // //         actions: [
// // // // //           TextButton(
// // // // //             onPressed: () => Navigator.pop(context),
// // // // //             child: const Text('Close'),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class _ReportRow extends StatelessWidget {
// // // // //   final String label;
// // // // //   final String value;

// // // // //   const _ReportRow(this.label, this.value);

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Padding(
// // // // //       padding: const EdgeInsets.symmetric(vertical: 6),
// // // // //       child: Row(
// // // // //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //         children: [
// // // // //           Text(label),
// // // // //           Text(
// // // // //             value,
// // // // //             style: const TextStyle(fontWeight: FontWeight.bold),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }




// // // // // import 'package:flutter/material.dart';
// // // // // import '/widgets/department_card.dart';
// // // // // import '/widgets/info_card.dart';
// // // // // import '/widgets/custom_action_button.dart';

// // // // // class AdminDashboardScreen extends StatefulWidget {
// // // // //   const AdminDashboardScreen({super.key});

// // // // //   @override
// // // // //   State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
// // // // // }

// // // // // class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
// // // // //   final List<Map<String, dynamic>> queueData = [
// // // // //     {
// // // // //       'department': 'Emergency',
// // // // //       'count': 24,
// // // // //       'avgWait': 15,
// // // // //       'icon': Icons.local_hospital,
// // // // //       'color': Colors.blue,
// // // // //     },
// // // // //     {
// // // // //       'department': 'Cardiology',
// // // // //       'count': 18,
// // // // //       'avgWait': 28,
// // // // //       'icon': Icons.favorite,
// // // // //       'color': Colors.pink,
// // // // //     },
// // // // //     {
// // // // //       'department': 'Neurology',
// // // // //       'count': 12,
// // // // //       'avgWait': 35,
// // // // //       'icon': Icons.psychology,
// // // // //       'color': Colors.green,
// // // // //     },
// // // // //     {
// // // // //       'department': 'Pediatrics',
// // // // //       'count': 16,
// // // // //       'avgWait': 22,
// // // // //       'icon': Icons.child_care,
// // // // //       'color': Colors.red,
// // // // //     },
// // // // //     {
// // // // //       'department': 'Ophthalmology',
// // // // //       'count': 9,
// // // // //       'avgWait': 18,
// // // // //       'icon': Icons.remove_red_eye,
// // // // //       'color': Colors.lightGreen,
// // // // //     },
// // // // //   ];

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final totalPatients =
// // // // //         queueData.fold<int>(0, (sum, item) => sum + item['count'] as int);

// // // // //     final avgWaitTime =
// // // // //         queueData.fold<int>(0, (sum, item) => sum + item['avgWait'] as int) ~/
// // // // //             queueData.length;

// // // // //     return Scaffold(
// // // // //       backgroundColor: const Color(0xFFF5F6FA),

// // // // //       // 🔷 GRADIENT APP BAR
// // // // //       appBar: AppBar(
// // // // //         elevation: 0,
// // // // //         automaticallyImplyLeading: false,
// // // // //         toolbarHeight: 90,
// // // // //         flexibleSpace: Container(
// // // // //           decoration: const BoxDecoration(
// // // // //             gradient: LinearGradient(
// // // // //               colors: [
// // // // //                 Color.fromRGBO(13, 27, 140, 1),
// // // // //                 Color.fromRGBO(90, 140, 255, 1),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //         ),
// // // // //         title: Row(
// // // // //           children: [
// // // // //             const CircleAvatar(
// // // // //               radius: 22,
// // // // //               backgroundColor: Colors.white,
// // // // //               child: Text(
// // // // //                 'A',
// // // // //                 style: TextStyle(
// // // // //                   color: Color.fromRGBO(13, 27, 140, 1),
// // // // //                   fontWeight: FontWeight.bold,
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(width: 12),
// // // // //             const Column(
// // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // //               mainAxisSize: MainAxisSize.min,
// // // // //               children: [
// // // // //                 Text(
// // // // //                   'Dr. Sarah Johnson',
// // // // //                   style: TextStyle(
// // // // //                     fontSize: 16,
// // // // //                     fontWeight: FontWeight.w600,
// // // // //                     color: Colors.white,
// // // // //                   ),
// // // // //                 ),
// // // // //                 Text(
// // // // //                   'Hospital Administrator',
// // // // //                   style: TextStyle(
// // // // //                     fontSize: 13,
// // // // //                     color: Colors.white70,
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),

// // // // //       // 🔷 BODY
// // // // //       body: SingleChildScrollView(
// // // // //         padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
// // // // //         child: Column(
// // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // //           children: [
// // // // //             const Text(
// // // // //               'Queue Overview',
// // // // //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //             const SizedBox(height: 16),

// // // // //             Row(
// // // // //               children: [
// // // // //                 Expanded(
// // // // //                   child: InfoCard(
// // // // //                     title: 'Total Patients',
// // // // //                     value: totalPatients.toString(),
// // // // //                     icon: Icons.people,
// // // // //                     color: Colors.blue,
// // // // //                   ),
// // // // //                 ),
// // // // //                 const SizedBox(width: 12),
// // // // //                 Expanded(
// // // // //                   child: InfoCard(
// // // // //                     title: 'Avg Wait Time',
// // // // //                     value: '${avgWaitTime}m',
// // // // //                     icon: Icons.schedule,
// // // // //                     color: Colors.purple,
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),

// // // // //             const SizedBox(height: 12),

// // // // //             Row(
// // // // //               children: [
// // // // //                 Expanded(
// // // // //                   child: InfoCard(
// // // // //                     title: 'Departments',
// // // // //                     value: queueData.length.toString(),
// // // // //                     icon: Icons.domain,
// // // // //                     color: Colors.green,
// // // // //                   ),
// // // // //                 ),
// // // // //                 const SizedBox(width: 12),
// // // // //                 Expanded(
// // // // //                   child: InfoCard(
// // // // //                     title: 'Completed Today',
// // // // //                     value: '89',
// // // // //                     icon: Icons.check_circle,
// // // // //                     color: Colors.red,
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),

// // // // //             const SizedBox(height: 32),

// // // // //             const Text(
// // // // //               'Quick Actions',
// // // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //             const SizedBox(height: 16),

// // // // //             Row(
// // // // //               children: [
// // // // //                 Expanded(
// // // // //                   child: CustomActionButton(
// // // // //                     label: 'Manage Queues',
// // // // //                     onPressed: () =>
// // // // //                         Navigator.pushNamed(context, '/manage-queue'),
// // // // //                     icon: Icons.edit,
// // // // //                     backgroundColor: Colors.blue,
// // // // //                     height: 52,
// // // // //                   ),
// // // // //                 ),
// // // // //                 const SizedBox(width: 10),
// // // // //                 Expanded(
// // // // //                   child: CustomActionButton(
// // // // //                     label: 'View Reports',
// // // // //                     onPressed: () => _showReportsDialog(context),
// // // // //                     icon: Icons.bar_chart,
// // // // //                     type: ButtonType.secondary,
// // // // //                     foregroundColor: Colors.black,
// // // // //                     height: 52,
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),

// // // // //             const SizedBox(height: 32),

// // // // //             Row(
// // // // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //               children: const [
// // // // //                 Text(
// // // // //                   'Department Queues',
// // // // //                   style: TextStyle(
// // // // //                       fontSize: 18, fontWeight: FontWeight.bold),
// // // // //                 ),
// // // // //                 Text(
// // // // //                   'View All',
// // // // //                   style: TextStyle(
// // // // //                     fontSize: 14,
// // // // //                     color: Colors.blue,
// // // // //                     fontWeight: FontWeight.w500,
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),

// // // // //             const SizedBox(height: 16),

// // // // //             ListView.builder(
// // // // //               shrinkWrap: true,
// // // // //               physics: const NeverScrollableScrollPhysics(),
// // // // //               itemCount: queueData.length,
// // // // //               itemBuilder: (context, index) {
// // // // //                 final dept = queueData[index];
// // // // //                 return DepartmentCard(
// // // // //                   dept: dept,
// // // // //                   onTap: () {
// // // // //                     Navigator.pushNamed(
// // // // //                       context,
// // // // //                       '/manage-queue',
// // // // //                       arguments: dept['department'],
// // // // //                     );
// // // // //                   },
// // // // //                   title: '',
// // // // //                   subtitle: '',
// // // // //                   iconColor: dept['color'],
// // // // //                   icon: dept['icon'],
// // // // //                   color: dept['color'],
// // // // //                 );
// // // // //               },
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   // ✅ FIXED DAILY REPORT DIALOG
// // // // //   void _showReportsDialog(BuildContext context) {
// // // // //     showDialog(
// // // // //       context: context,
// // // // //       barrierColor: Colors.black54,
// // // // //       builder: (_) => Center(
// // // // //         child: Material(
// // // // //           color: Colors.transparent,
// // // // //           child: Container(
// // // // //             width: MediaQuery.of(context).size.width * 0.85,
// // // // //             padding: const EdgeInsets.all(20),
// // // // //             decoration: BoxDecoration(
// // // // //               color: Colors.white,
// // // // //               borderRadius: BorderRadius.circular(18),
// // // // //             ),
// // // // //             child: Column(
// // // // //               mainAxisSize: MainAxisSize.min,
// // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // //               children: [
// // // // //                 const Text(
// // // // //                   'Daily Report',
// // // // //                   style:
// // // // //                       TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // // // //                 ),
// // // // //                 const SizedBox(height: 6),
// // // // //                 const Text(
// // // // //                   "Today's Overview - March 15, 2024",
// // // // //                   style: TextStyle(color: Colors.grey),
// // // // //                 ),
// // // // //                 const SizedBox(height: 16),
// // // // //                 const Divider(),

// // // // //                 _reportItem(
// // // // //                   'Total Patients Today',
// // // // //                   'Active and completed visits',
// // // // //                   '127',
// // // // //                   Colors.blue,
// // // // //                 ),
// // // // //                 _reportItem(
// // // // //                   'Average Wait Time',
// // // // //                   'From check-in to appointment',
// // // // //                   '18 min',
// // // // //                   Colors.blueAccent,
// // // // //                 ),
// // // // //                 _reportItem(
// // // // //                   'Completed Appointments',
// // // // //                   'Successfully finished today',
// // // // //                   '94',
// // // // //                   Colors.green,
// // // // //                 ),
// // // // //                 _reportItem(
// // // // //                   'No-Shows',
// // // // //                   "Patients who didn't arrive",
// // // // //                   '8',
// // // // //                   Colors.orange,
// // // // //                 ),
// // // // //                 _reportItem(
// // // // //                   'Cancelled Appointments',
// // // // //                   'Cancelled by patients or staff',
// // // // //                   '12',
// // // // //                   Colors.red,
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _reportItem(
// // // // //     String title,
// // // // //     String subtitle,
// // // // //     String value,
// // // // //     Color color,
// // // // //   ) {
// // // // //     return Column(
// // // // //       children: [
// // // // //         Padding(
// // // // //           padding: const EdgeInsets.symmetric(vertical: 12),
// // // // //           child: Row(
// // // // //             children: [
// // // // //               Expanded(
// // // // //                 child: Column(
// // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                   children: [
// // // // //                     Text(title,
// // // // //                         style: const TextStyle(
// // // // //                             fontWeight: FontWeight.w600)),
// // // // //                     const SizedBox(height: 4),
// // // // //                     Text(
// // // // //                       subtitle,
// // // // //                       style: const TextStyle(
// // // // //                           fontSize: 12, color: Colors.grey),
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //               Text(
// // // // //                 value,
// // // // //                 style: TextStyle(
// // // // //                   fontSize: 16,
// // // // //                   fontWeight: FontWeight.bold,
// // // // //                   color: color,
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //         const Divider(height: 1),
// // // // //       ],
// // // // //     );
// // // // //   }
// // // // // }



// // // // import 'package:flutter/material.dart';
// // // // import '/widgets/department_card.dart';
// // // // import '/widgets/info_card.dart';
// // // // import '/widgets/custom_action_button.dart';

// // // // class AdminDashboardScreen extends StatefulWidget {
// // // //   const AdminDashboardScreen({super.key});

// // // //   @override
// // // //   State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
// // // // }

// // // // class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
// // // //   final List<Map<String, dynamic>> queueData = [
// // // //     {
// // // //       'department': 'Emergency',
// // // //       'count': 24,
// // // //       'avgWait': 15,
// // // //       'icon': Icons.local_hospital,
// // // //       'color': Colors.blue,
// // // //     },
// // // //     {
// // // //       'department': 'Cardiology',
// // // //       'count': 18,
// // // //       'avgWait': 28,
// // // //       'icon': Icons.favorite,
// // // //       'color': Colors.pink,
// // // //     },
// // // //     {
// // // //       'department': 'Neurology',
// // // //       'count': 12,
// // // //       'avgWait': 35,
// // // //       'icon': Icons.psychology,
// // // //       'color': Colors.green,
// // // //     },
// // // //     {
// // // //       'department': 'Pediatrics',
// // // //       'count': 16,
// // // //       'avgWait': 22,
// // // //       'icon': Icons.child_care,
// // // //       'color': Colors.red,
// // // //     },
// // // //     {
// // // //       'department': 'Ophthalmology',
// // // //       'count': 9,
// // // //       'avgWait': 18,
// // // //       'icon': Icons.remove_red_eye,
// // // //       'color': Colors.lightGreen,
// // // //     },
// // // //   ];

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final totalPatients =
// // // //         queueData.fold<int>(0, (sum, item) => sum + item['count'] as int);

// // // //     final avgWaitTime =
// // // //         queueData.fold<int>(0, (sum, item) => sum + item['avgWait'] as int) ~/
// // // //             queueData.length;

// // // //     return Scaffold(
// // // //       backgroundColor: const Color(0xFFF5F6FA),

// // // //       // ✅ DRAWER (LEFT MENU)
// // // //       drawer: Drawer(
// // // //         child: SafeArea(
// // // //           child: Column(
// // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // //             children: [
// // // //               const Padding(
// // // //                 padding: EdgeInsets.all(20),
// // // //                 child: Text(
// // // //                   'MediQueue',
// // // //                   style: TextStyle(
// // // //                     fontSize: 20,
// // // //                     fontWeight: FontWeight.bold,
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //               const Divider(),

// // // //               _drawerItem(Icons.person_outline, 'My Account'),
// // // //               _drawerItem(Icons.notifications_none, 'Notification'),
// // // //               _drawerItem(Icons.history, 'History'),

// // // //               const Spacer(),

// // // //               Padding(
// // // //                 padding: const EdgeInsets.all(20),
// // // //                 child: SizedBox(
// // // //                   width: double.infinity,
// // // //                   height: 45,
// // // //                   child: OutlinedButton(
// // // //                     onPressed: () {},
// // // //                     style: OutlinedButton.styleFrom(
// // // //                       shape: RoundedRectangleBorder(
// // // //                         borderRadius: BorderRadius.circular(30),
// // // //                       ),
// // // //                     ),
// // // //                     child: const Text('Logout'),
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),

// // // //       // 🔷 APP BAR (MENU ICON ADDED, ICONS REMOVED)
// // // //       appBar: AppBar(
// // // //         elevation: 0,
// // // //         toolbarHeight: 90,
// // // //         automaticallyImplyLeading: false,
// // // //         flexibleSpace: Container(
// // // //           decoration: const BoxDecoration(
// // // //             gradient: LinearGradient(
// // // //               colors: [
// // // //                 Color.fromRGBO(13, 27, 140, 1),
// // // //                 Color.fromRGBO(90, 140, 255, 1),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ),
// // // //         title: Row(
// // // //           children: [
// // // //             Builder(
// // // //               builder: (context) => IconButton(
// // // //                 icon: const Icon(Icons.menu, color: Colors.white),
// // // //                 onPressed: () => Scaffold.of(context).openDrawer(),
// // // //               ),
// // // //             ),
// // // //             const SizedBox(width: 8),
// // // //             const CircleAvatar(
// // // //               radius: 22,
// // // //               backgroundColor: Colors.white,
// // // //               child: Text(
// // // //                 'A',
// // // //                 style: TextStyle(
// // // //                   color: Color.fromRGBO(13, 27, 140, 1),
// // // //                   fontWeight: FontWeight.bold,
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             const SizedBox(width: 12),
// // // //             const Column(
// // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // //               mainAxisSize: MainAxisSize.min,
// // // //               children: [
// // // //                 Text(
// // // //                   'Dr. Sarah Johnson',
// // // //                   style: TextStyle(
// // // //                     fontSize: 16,
// // // //                     fontWeight: FontWeight.w600,
// // // //                     color: Colors.white,
// // // //                   ),
// // // //                 ),
// // // //                 Text(
// // // //                   'Hospital Administrator',
// // // //                   style: TextStyle(
// // // //                     fontSize: 13,
// // // //                     color: Colors.white70,
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),

// // // //       // 🔷 BODY (UNCHANGED)
// // // //       body: SingleChildScrollView(
// // // //         padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             const Text(
// // // //               'Queue Overview',
// // // //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // // //             ),
// // // //             const SizedBox(height: 16),

// // // //             Row(
// // // //               children: [
// // // //                 Expanded(
// // // //                   child: InfoCard(
// // // //                     title: 'Total Patients',
// // // //                     value: totalPatients.toString(),
// // // //                     icon: Icons.people,
// // // //                     color: Colors.blue,
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(width: 12),
// // // //                 Expanded(
// // // //                   child: InfoCard(
// // // //                     title: 'Avg Wait Time',
// // // //                     value: '${avgWaitTime}m',
// // // //                     icon: Icons.schedule,
// // // //                     color: Colors.purple,
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),

// // // //             const SizedBox(height: 12),

// // // //             Row(
// // // //               children: [
// // // //                 Expanded(
// // // //                   child: InfoCard(
// // // //                     title: 'Departments',
// // // //                     value: queueData.length.toString(),
// // // //                     icon: Icons.domain,
// // // //                     color: Colors.green,
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(width: 12),
// // // //                 Expanded(
// // // //                   child: InfoCard(
// // // //                     title: 'Completed Today',
// // // //                     value: '89',
// // // //                     icon: Icons.check_circle,
// // // //                     color: Colors.red,
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),

// // // //             const SizedBox(height: 32),

// // // //             const Text(
// // // //               'Quick Actions',
// // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //             ),
// // // //             const SizedBox(height: 16),

// // // //             Row(
// // // //               children: [
// // // //                 Expanded(
// // // //                   child: CustomActionButton(
// // // //                     label: 'Manage Queues',
// // // //                     onPressed: () =>
// // // //                         Navigator.pushNamed(context, '/manage-queue'),
// // // //                     icon: Icons.edit,
// // // //                     backgroundColor: Colors.blue,
// // // //                     height: 52,
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(width: 10),
// // // //                 Expanded(
// // // //                   child: CustomActionButton(
// // // //                     label: 'View Reports',
// // // //                     onPressed: () => _showReportsDialog(context),
// // // //                     icon: Icons.bar_chart,
// // // //                     type: ButtonType.secondary,
// // // //                     foregroundColor: Colors.black,
// // // //                     height: 52,
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),

// // // //             const SizedBox(height: 32),

// // // //             Row(
// // // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //               children: const [
// // // //                 Text(
// // // //                   'Department Queues',
// // // //                   style: TextStyle(
// // // //                       fontSize: 18, fontWeight: FontWeight.bold),
// // // //                 ),
// // // //                 Text(
// // // //                   'View All',
// // // //                   style: TextStyle(
// // // //                     fontSize: 14,
// // // //                     color: Colors.blue,
// // // //                     fontWeight: FontWeight.w500,
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),

// // // //             const SizedBox(height: 16),

// // // //             ListView.builder(
// // // //               shrinkWrap: true,
// // // //               physics: const NeverScrollableScrollPhysics(),
// // // //               itemCount: queueData.length,
// // // //               itemBuilder: (context, index) {
// // // //                 final dept = queueData[index];
// // // //                 return DepartmentCard(
// // // //                   dept: dept,
// // // //                   onTap: () {
// // // //                     Navigator.pushNamed(
// // // //                       context,
// // // //                       '/manage-queue',
// // // //                       arguments: dept['department'],
// // // //                     );
// // // //                   },
// // // //                   title: '',
// // // //                   subtitle: '',
// // // //                   iconColor: dept['color'],
// // // //                   icon: dept['icon'],
// // // //                   color: dept['color'],
// // // //                 );
// // // //               },
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _drawerItem(IconData icon, String title) {
// // // //     return ListTile(
// // // //       leading: Icon(icon),
// // // //       title: Text(title),
// // // //       onTap: () {},
// // // //     );
// // // //   }

// // // //   // REPORT DIALOG (UNCHANGED)
// // // //   void _showReportsDialog(BuildContext context) {
// // // //     showDialog(
// // // //       context: context,
// // // //       barrierColor: Colors.black54,
// // // //       builder: (_) => Center(
// // // //         child: Material(
// // // //           color: Colors.transparent,
// // // //           child: Container(
// // // //             width: MediaQuery.of(context).size.width * 0.85,
// // // //             padding: const EdgeInsets.all(20),
// // // //             decoration: BoxDecoration(
// // // //               color: Colors.white,
// // // //               borderRadius: BorderRadius.circular(18),
// // // //             ),
// // // //             child: Column(
// // // //               mainAxisSize: MainAxisSize.min,
// // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // //               children: const [
// // // //                 Text(
// // // //                   'Daily Report',
// // // //                   style: TextStyle(
// // // //                     fontSize: 20,
// // // //                     fontWeight: FontWeight.bold,
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }



// // // // import 'package:flutter/material.dart';
// // // // import '/widgets/department_card.dart';
// // // // import '/widgets/info_card.dart';
// // // // import '/widgets/custom_action_button.dart';

// // // // class AdminDashboardScreen extends StatefulWidget {
// // // //   const AdminDashboardScreen({super.key});

// // // //   @override
// // // //   State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
// // // // }

// // // // class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
// // // //   final List<Map<String, dynamic>> queueData = [
// // // //     {
// // // //       'department': 'Emergency',
// // // //       'count': 24,
// // // //       'avgWait': 15,
// // // //       'icon': Icons.local_hospital,
// // // //       'color': Colors.blue,
// // // //     },
// // // //     {
// // // //       'department': 'Cardiology',
// // // //       'count': 18,
// // // //       'avgWait': 28,
// // // //       'icon': Icons.favorite,
// // // //       'color': Colors.pink,
// // // //     },
// // // //     {
// // // //       'department': 'Neurology',
// // // //       'count': 12,
// // // //       'avgWait': 35,
// // // //       'icon': Icons.psychology,
// // // //       'color': Colors.green,
// // // //     },
// // // //     {
// // // //       'department': 'Pediatrics',
// // // //       'count': 16,
// // // //       'avgWait': 22,
// // // //       'icon': Icons.child_care,
// // // //       'color': Colors.red,
// // // //     },
// // // //     {
// // // //       'department': 'Ophthalmology',
// // // //       'count': 9,
// // // //       'avgWait': 18,
// // // //       'icon': Icons.remove_red_eye,
// // // //       'color': Colors.lightGreen,
// // // //     },
// // // //   ];

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final totalPatients =
// // // //         queueData.fold<int>(0, (sum, item) => sum + item['count'] as int);

// // // //     final avgWaitTime =
// // // //         queueData.fold<int>(0, (sum, item) => sum + item['avgWait'] as int) ~/
// // // //             queueData.length;

// // // //     return Scaffold(
// // // //       backgroundColor: const Color(0xFFF5F6FA),

// // // //       // ✅ DRAWER (LOGOUT BELOW HISTORY)
// // // //       drawer: Drawer(
// // // //         child: SafeArea(
// // // //           child: Column(
// // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // //             children: [
// // // //               const Padding(
// // // //                 padding: EdgeInsets.all(20),
// // // //                 child: Text(
// // // //                   'MediQueue',
// // // //                   style: TextStyle(
// // // //                     fontSize: 20,
// // // //                     fontWeight: FontWeight.bold,
// // // //                   ),
// // // //                 ),
// // // //               ),

// // // //               _drawerItem(Icons.person_outline, 'My Account'),
// // // //               _drawerItem(Icons.notifications_none, 'Notification'),
// // // //               _drawerItem(Icons.history, 'History'),

// // // //               const SizedBox(height: 12),

// // // //               // ✅ LOGOUT BELOW HISTORY
// // // //               Padding(
// // // //                 padding: const EdgeInsets.symmetric(horizontal: 20),
// // // //                 child: SizedBox(
// // // //                   width: double.infinity,
// // // //                   height: 45,
// // // //                   child: OutlinedButton(
// // // //                     onPressed: () {},
// // // //                     style: OutlinedButton.styleFrom(
// // // //                       shape: RoundedRectangleBorder(
// // // //                         borderRadius: BorderRadius.circular(30),
// // // //                       ),
// // // //                     ),
// // // //                     child: const Text('Logout'),
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),

// // // //       // 🔷 APP BAR
// // // //       appBar: AppBar(
// // // //         elevation: 0,
// // // //         toolbarHeight: 90,
// // // //         automaticallyImplyLeading: false,
// // // //         flexibleSpace: Container(
// // // //           decoration: const BoxDecoration(
// // // //             gradient: LinearGradient(
// // // //               colors: [
// // // //                 Color.fromRGBO(13, 27, 140, 1),
// // // //                 Color.fromRGBO(90, 140, 255, 1),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ),
// // // //         title: Row(
// // // //           children: [
// // // //             Builder(
// // // //               builder: (context) => IconButton(
// // // //                 icon: const Icon(Icons.menu, color: Colors.white),
// // // //                 onPressed: () => Scaffold.of(context).openDrawer(),
// // // //               ),
// // // //             ),
// // // //             const SizedBox(width: 8),
// // // //             const CircleAvatar(
// // // //               radius: 22,
// // // //               backgroundColor: Colors.white,
// // // //               child: Text(
// // // //                 'A',
// // // //                 style: TextStyle(
// // // //                   color: Color.fromRGBO(13, 27, 140, 1),
// // // //                   fontWeight: FontWeight.bold,
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             const SizedBox(width: 12),
// // // //             const Column(
// // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // //               mainAxisSize: MainAxisSize.min,
// // // //               children: [
// // // //                 Text(
// // // //                   'Dr. Sarah Johnson',
// // // //                   style: TextStyle(
// // // //                     fontSize: 16,
// // // //                     fontWeight: FontWeight.w600,
// // // //                     color: Colors.white,
// // // //                   ),
// // // //                 ),
// // // //                 Text(
// // // //                   'Hospital Administrator',
// // // //                   style: TextStyle(
// // // //                     fontSize: 13,
// // // //                     color: Colors.white70,
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),

// // // //       // 🔷 BODY
// // // //       body: SingleChildScrollView(
// // // //         padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             const Text(
// // // //               'Queue Overview',
// // // //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // // //             ),
// // // //             const SizedBox(height: 16),

// // // //             Row(
// // // //               children: [
// // // //                 Expanded(
// // // //                   child: InfoCard(
// // // //                     title: 'Total Patients',
// // // //                     value: totalPatients.toString(),
// // // //                     icon: Icons.people,
// // // //                     color: Colors.blue,
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(width: 12),
// // // //                 Expanded(
// // // //                   child: InfoCard(
// // // //                     title: 'Avg Wait Time',
// // // //                     value: '${avgWaitTime}m',
// // // //                     icon: Icons.schedule,
// // // //                     color: Colors.purple,
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),

// // // //             const SizedBox(height: 12),

// // // //             Row(
// // // //               children: [
// // // //                 Expanded(
// // // //                   child: InfoCard(
// // // //                     title: 'Departments',
// // // //                     value: queueData.length.toString(),
// // // //                     icon: Icons.domain,
// // // //                     color: Colors.green,
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(width: 12),
// // // //                 Expanded(
// // // //                   child: InfoCard(
// // // //                     title: 'Completed Today',
// // // //                     value: '89',
// // // //                     icon: Icons.check_circle,
// // // //                     color: Colors.red,
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),

// // // //             const SizedBox(height: 32),

// // // //             const Text(
// // // //               'Quick Actions',
// // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //             ),
// // // //             const SizedBox(height: 16),

// // // //             Row(
// // // //               children: [
// // // //                 Expanded(
// // // //                   child: CustomActionButton(
// // // //                     label: 'Manage Queues',
// // // //                     onPressed: () =>
// // // //                         Navigator.pushNamed(context, '/manage-queue'),
// // // //                     icon: Icons.edit,
// // // //                     backgroundColor: Colors.blue,
// // // //                     height: 52,
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(width: 10),
// // // //                 Expanded(
// // // //                   child: CustomActionButton(
// // // //                     label: 'View Reports',
// // // //                     onPressed: () => _showReportsDialog(context),
// // // //                     icon: Icons.bar_chart,
// // // //                     type: ButtonType.secondary,
// // // //                     foregroundColor: Colors.black,
// // // //                     height: 52,
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),

// // // //             const SizedBox(height: 32),

// // // //             // ✅ VIEW ALL REMOVED
// // // //             const Text(
// // // //               'Department Queues',
// // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //             ),

// // // //             const SizedBox(height: 16),

// // // //             ListView.builder(
// // // //               shrinkWrap: true,
// // // //               physics: const NeverScrollableScrollPhysics(),
// // // //               itemCount: queueData.length,
// // // //               itemBuilder: (context, index) {
// // // //                 final dept = queueData[index];
// // // //                 return DepartmentCard(
// // // //                   dept: dept,
// // // //                   onTap: () {
// // // //                     Navigator.pushNamed(
// // // //                       context,
// // // //                       '/manage-queue',
// // // //                       arguments: dept['department'],
// // // //                     );
// // // //                   },
// // // //                   title: '',
// // // //                   subtitle: '',
// // // //                   iconColor: dept['color'],
// // // //                   icon: dept['icon'],
// // // //                   color: dept['color'],
// // // //                 );
// // // //               },
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _drawerItem(IconData icon, String title) {
// // // //     return ListTile(
// // // //       leading: Icon(icon),
// // // //       title: Text(title),
// // // //       onTap: () {},
// // // //     );
// // // //   }

// // // //   void _showReportsDialog(BuildContext context) {
// // // //     showDialog(
// // // //       context: context,
// // // //       barrierColor: Colors.black54,
// // // //       builder: (_) => Center(
// // // //         child: Material(
// // // //           color: Colors.transparent,
// // // //           child: Container(
// // // //             width: MediaQuery.of(context).size.width * 0.85,
// // // //             padding: const EdgeInsets.all(20),
// // // //             decoration: BoxDecoration(
// // // //               color: Colors.white,
// // // //               borderRadius: BorderRadius.circular(18),
// // // //             ),
// // // //             child: const Text(
// // // //               'Daily Report',
// // // //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }



// // // import 'package:flutter/material.dart';
// // // import '/widgets/department_card.dart';
// // // import '/widgets/info_card.dart';
// // // import '/widgets/custom_action_button.dart';

// // // class AdminDashboardScreen extends StatefulWidget {
// // //   const AdminDashboardScreen({super.key});

// // //   @override
// // //   State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
// // // }

// // // class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
// // //   final List<Map<String, dynamic>> queueData = [
// // //     {
// // //       'department': 'Emergency',
// // //       'count': 24,
// // //       'avgWait': 15,
// // //       'icon': Icons.local_hospital,
// // //       'color': Colors.blue,
// // //     },
// // //     {
// // //       'department': 'Cardiology',
// // //       'count': 18,
// // //       'avgWait': 28,
// // //       'icon': Icons.favorite,
// // //       'color': Colors.pink,
// // //     },
// // //     {
// // //       'department': 'Neurology',
// // //       'count': 12,
// // //       'avgWait': 35,
// // //       'icon': Icons.psychology,
// // //       'color': Colors.green,
// // //     },
// // //     {
// // //       'department': 'Pediatrics',
// // //       'count': 16,
// // //       'avgWait': 22,
// // //       'icon': Icons.child_care,
// // //       'color': Colors.red,
// // //     },
// // //     {
// // //       'department': 'Ophthalmology',
// // //       'count': 9,
// // //       'avgWait': 18,
// // //       'icon': Icons.remove_red_eye,
// // //       'color': Colors.lightGreen,
// // //     },
// // //   ];

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final totalPatients =
// // //     queueData.fold<int>(0, (sum, item) => sum + (item['count'] as int));


// // //     final avgWaitTime =
// // //     queueData.fold<int>(0, (sum, item) => sum + (item['avgWait'] as int)) ~/
// // //         queueData.length;


// // //     return Scaffold(
// // //       backgroundColor: const Color(0xFFF5F6FA),

// // //       // ================= DRAWER =================
// // //       drawer: Drawer(
// // //         child: SafeArea(
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               const Padding(
// // //                 padding: EdgeInsets.all(20),
// // //                 child: Text(
// // //                   'MediQueue',
// // //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // //                 ),
// // //               ),

// // //               _drawerItem(Icons.person_outline, 'My Account'),
// // //               _drawerItem(Icons.notifications_none, 'Notification'),
// // //               _drawerItem(Icons.history, 'History'),

// // //               const Spacer(),

// // //               Padding(
// // //                 padding: const EdgeInsets.all(20),
// // //                 child: SizedBox(
// // //                   width: double.infinity,
// // //                   height: 45,
// // //                   child: OutlinedButton(
// // //                     onPressed: () {},
// // //                     style: OutlinedButton.styleFrom(
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(30),
// // //                       ),
// // //                     ),
// // //                     child: const Text('Logout'),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),

// // //       // ================= APP BAR =================
// // //       appBar: AppBar(
// // //         elevation: 0,
// // //         toolbarHeight: 90,
// // //         automaticallyImplyLeading: false,
// // //         flexibleSpace: Container(
// // //           decoration: const BoxDecoration(
// // //             gradient: LinearGradient(
// // //               colors: [
// // //                 Color.fromRGBO(13, 27, 140, 1),
// // //                 Color.fromRGBO(90, 140, 255, 1),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //         title: Row(
// // //           children: [
// // //             Builder(
// // //               builder: (context) => IconButton(
// // //                 icon: const Icon(Icons.menu, color: Colors.white),
// // //                 onPressed: () => Scaffold.of(context).openDrawer(),
// // //               ),
// // //             ),
// // //             const SizedBox(width: 8),
// // //             const CircleAvatar(
// // //               radius: 22,
// // //               backgroundColor: Colors.white,
// // //               child: Text(
// // //                 'A',
// // //                 style: TextStyle(
// // //                   color: Color.fromRGBO(13, 27, 140, 1),
// // //                   fontWeight: FontWeight.bold,
// // //                 ),
// // //               ),
// // //             ),
// // //             const SizedBox(width: 12),
// // //             const Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               mainAxisSize: MainAxisSize.min,
// // //               children: [
// // //                 Text(
// // //                   'Dr. Sarah Johnson',
// // //                   style: TextStyle(
// // //                     fontSize: 16,
// // //                     fontWeight: FontWeight.w600,
// // //                     color: Colors.white,
// // //                   ),
// // //                 ),
// // //                 Text(
// // //                   'Hospital Administrator',
// // //                   style: TextStyle(
// // //                     fontSize: 13,
// // //                     color: Colors.white70,
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ],
// // //         ),
// // //       ),

// // //       // ================= BODY =================
// // //       body: SingleChildScrollView(
// // //         padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             const Text(
// // //               'Queue Overview',
// // //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // //             ),
// // //             const SizedBox(height: 16),

// // //             Row(
// // //               children: [
// // //                 Expanded(
// // //                   child: InfoCard(
// // //                     title: 'Total Patients',
// // //                     value: totalPatients.toString(),
// // //                     icon: Icons.people,
// // //                     color: Colors.blue,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(width: 12),
// // //                 Expanded(
// // //                   child: InfoCard(
// // //                     title: 'Avg Wait Time',
// // //                     value: '${avgWaitTime}m',
// // //                     icon: Icons.schedule,
// // //                     color: Colors.purple,
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),

// // //             const SizedBox(height: 12),

// // //             Row(
// // //               children: [
// // //                 Expanded(
// // //                   child: InfoCard(
// // //                     title: 'Departments',
// // //                     value: queueData.length.toString(),
// // //                     icon: Icons.domain,
// // //                     color: Colors.green,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(width: 12),
// // //                 Expanded(
// // //                   child: InfoCard(
// // //                     title: 'Completed Today',
// // //                     value: '89',
// // //                     icon: Icons.check_circle,
// // //                     color: Colors.red,
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),

// // //             const SizedBox(height: 32),

// // //             const Text(
// // //               'Quick Actions',
// // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //             ),
// // //             const SizedBox(height: 16),

// // //             Row(
// // //               children: [
// // //                 Expanded(
// // //                   child: CustomActionButton(
// // //                     label: 'Manage Queues',
// // //                     onPressed: () =>
// // //                         Navigator.pushNamed(context, '/manage-queue'),
// // //                     icon: Icons.edit,
// // //                     backgroundColor: Colors.blue,
// // //                     height: 52,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(width: 10),
// // //                 Expanded(
// // //                   child: CustomActionButton(
// // //                     label: 'View Reports',
// // //                     onPressed: () => _showReportsDialog(context),
// // //                     icon: Icons.bar_chart,
// // //                     type: ButtonType.secondary,
// // //                     foregroundColor: Colors.black,
// // //                     height: 52,
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),

// // //             const SizedBox(height: 32),

// // //             const Text(
// // //               'Department Queues',
// // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //             ),
// // //             const SizedBox(height: 16),

// // //             ListView.builder(
// // //               shrinkWrap: true,
// // //               physics: const NeverScrollableScrollPhysics(),
// // //               itemCount: queueData.length,
// // //               itemBuilder: (context, index) {
// // //                 final dept = queueData[index];
// // //                 return DepartmentCard(
// // //                   dept: dept,
// // //                   icon: dept['icon'],
// // //                   iconColor: dept['color'],
// // //                   color: dept['color'],
// // //                   title: '',
// // //                   subtitle: '',
// // //                   onTap: () {
// // //                     Navigator.pushNamed(
// // //                       context,
// // //                       '/manage-queue',
// // //                       arguments: dept['department'],
// // //                     );
// // //                   },
// // //                 );
// // //               },
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _drawerItem(IconData icon, String title) {
// // //     return ListTile(
// // //       leading: Icon(icon),
// // //       title: Text(title),
// // //       onTap: () {},
// // //     );
// // //   }

// // //   void _showReportsDialog(BuildContext context) {
// // //     showDialog(
// // //       context: context,
// // //       barrierColor: Colors.black54,
// // //       builder: (_) => Center(
// // //         child: Material(
// // //           color: Colors.transparent,
// // //           child: Container(
// // //             width: MediaQuery.of(context).size.width * 0.85,
// // //             padding: const EdgeInsets.all(20),
// // //             decoration: BoxDecoration(
// // //               color: Colors.white,
// // //               borderRadius: BorderRadius.circular(18),
// // //             ),
// // //             child: Column(
// // //               mainAxisSize: MainAxisSize.min,
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: const [
// // //                 Text(
// // //                   'Daily Report',
// // //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }



// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart'; // ADD THIS IMPORT
// // import '/widgets/department_card.dart';
// // import '/widgets/info_card.dart';
// // import '/widgets/custom_action_button.dart';
// // import '../auth_screen.dart'; // IMPORT AUTH SCREEN

// // class AdminDashboardScreen extends StatefulWidget {
// //   const AdminDashboardScreen({super.key});

// //   @override
// //   State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
// // }

// // class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
// //   final List<Map<String, dynamic>> queueData = [
// //     {
// //       'department': 'Emergency',
// //       'count': 24,
// //       'avgWait': 15,
// //       'icon': Icons.local_hospital,
// //       'color': Colors.blue,
// //     },
// //     {
// //       'department': 'Cardiology',
// //       'count': 18,
// //       'avgWait': 28,
// //       'icon': Icons.favorite,
// //       'color': Colors.pink,
// //     },
// //     {
// //       'department': 'Neurology',
// //       'count': 12,
// //       'avgWait': 35,
// //       'icon': Icons.psychology,
// //       'color': Colors.green,
// //     },
// //     {
// //       'department': 'Pediatrics',
// //       'count': 16,
// //       'avgWait': 22,
// //       'icon': Icons.child_care,
// //       'color': Colors.red,
// //     },
// //     {
// //       'department': 'Ophthalmology',
// //       'count': 9,
// //       'avgWait': 18,
// //       'icon': Icons.remove_red_eye,
// //       'color': Colors.lightGreen,
// //     },
// //   ];

// //   bool _isLoggingOut = false; // ADD THIS

// //   @override
// //   Widget build(BuildContext context) {
// //     // ✅ Fix: cast to int
// //     final totalPatients =
// //         queueData.fold<int>(0, (sum, item) => sum + (item['count'] as int));

// //     final avgWaitTime =
// //         queueData.fold<int>(0, (sum, item) => sum + (item['avgWait'] as int)) ~/
// //             queueData.length;

// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF5F6FA),

// //       // ✅ DRAWER with Logout below History
// //       drawer: Drawer(
// //         child: SafeArea(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               const Padding(
// //                 padding: EdgeInsets.all(20),
// //                 child: Text(
// //                   'MediQueue',
// //                   style: TextStyle(
// //                     fontSize: 20,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ),

// //               _drawerItem(Icons.person_outline, 'My Account'),
// //               _drawerItem(Icons.notifications_none, 'Notification'),
// //               _drawerItem(Icons.history, 'History'),

// //               const SizedBox(height: 12),

// //               // ✅ Logout below History - UPDATED
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 20),
// //                 child: SizedBox(
// //                   width: double.infinity,
// //                   height: 45,
// //                   child: OutlinedButton(
// //                     onPressed: () async {
// //                       // Close drawer
// //                       Navigator.pop(context);

// //                       // Show confirmation dialog
// //                       final shouldLogout = await showDialog<bool>(
// //                         context: context,
// //                         builder: (context) => AlertDialog(
// //                           title: const Text('Logout'),
// //                           content:
// //                               const Text('Are you sure you want to logout?'),
// //                           actions: [
// //                             TextButton(
// //                               onPressed: () => Navigator.pop(context, false),
// //                               child: const Text('Cancel'),
// //                             ),
// //                             ElevatedButton(
// //                               onPressed: () => Navigator.pop(context, true),
// //                               style: ElevatedButton.styleFrom(
// //                                 backgroundColor: Colors.red,
// //                               ),
// //                               child: const Text('Logout'),
// //                             ),
// //                           ],
// //                         ),
// //                       );

// //                       if (shouldLogout != true) {
// //                         return; // User cancelled
// //                       }

// //                       // Show loading
// //                       setState(() {
// //                         _isLoggingOut = true;
// //                       });

// //                       try {
// //                         // Add a small delay for smooth UI
// //                         await Future.delayed(const Duration(milliseconds: 300));

// //                         // Perform Firebase logout
// //                         await FirebaseAuth.instance.signOut();

// //                         // Navigate to auth screen
// //                         Navigator.of(context).pushAndRemoveUntil(
// //                           MaterialPageRoute(
// //                             builder: (context) =>
// //                                 const AuthScreen(), // You need to import AuthScreen
// //                           ),
// //                           (route) => false,
// //                         );
// //                       } catch (e) {
// //                         // Hide loading on error
// //                         if (mounted) {
// //                           setState(() {
// //                             _isLoggingOut = false;
// //                           });
// //                         }

// //                         // Show error message
// //                         ScaffoldMessenger.of(context).showSnackBar(
// //                           SnackBar(
// //                             content: Text('Logout failed: ${e.toString()}'),
// //                             backgroundColor: Colors.red,
// //                           ),
// //                         );
// //                       }
// //                     },
// //                     style: OutlinedButton.styleFrom(
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(30),
// //                       ),
// //                     ),
// //                     child: const Text('Logout'),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),

// //       // 🔷 APP BAR
// //       appBar: AppBar(
// //         elevation: 0,
// //         toolbarHeight: 90,
// //         automaticallyImplyLeading: false,
// //         flexibleSpace: Container(
// //           decoration: const BoxDecoration(
// //             gradient: LinearGradient(
// //               colors: [
// //                 Color.fromRGBO(13, 27, 140, 1),
// //                 Color.fromRGBO(90, 140, 255, 1),
// //               ],
// //             ),
// //           ),
// //         ),
// //         title: Row(
// //           children: [
// //             Builder(
// //               builder: (context) => IconButton(
// //                 icon: const Icon(Icons.menu, color: Colors.white),
// //                 onPressed: () => Scaffold.of(context).openDrawer(),
// //               ),
// //             ),
// //             const SizedBox(width: 8),
// //             const CircleAvatar(
// //               radius: 22,
// //               backgroundColor: Colors.white,
// //               child: Text(
// //                 'A',
// //                 style: TextStyle(
// //                   color: Color.fromRGBO(13, 27, 140, 1),
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(width: 12),
// //             const Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Text(
// //                   'Dr. Sarah Johnson',
// //                   style: TextStyle(
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.w600,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //                 Text(
// //                   'Hospital Administrator',
// //                   style: TextStyle(
// //                     fontSize: 13,
// //                     color: Colors.white70,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),

// //       // 🔷 BODY
// //       body: Stack(
// //         children: [
// //           SingleChildScrollView(
// //             padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 const Text(
// //                   'Queue Overview',
// //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //                 ),
// //                 const SizedBox(height: 16),
// //                 Row(
// //                   children: [
// //                     Expanded(
// //                       child: InfoCard(
// //                         title: 'Total Patients',
// //                         value: totalPatients.toString(),
// //                         icon: Icons.people,
// //                         color: Colors.blue,
// //                       ),
// //                     ),
// //                     const SizedBox(width: 12),
// //                     Expanded(
// //                       child: InfoCard(
// //                         title: 'Avg Wait Time',
// //                         value: '${avgWaitTime}m',
// //                         icon: Icons.schedule,
// //                         color: Colors.purple,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 12),
// //                 Row(
// //                   children: [
// //                     Expanded(
// //                       child: InfoCard(
// //                         title: 'Departments',
// //                         value: queueData.length.toString(),
// //                         icon: Icons.domain,
// //                         color: Colors.green,
// //                       ),
// //                     ),
// //                     const SizedBox(width: 12),
// //                     Expanded(
// //                       child: InfoCard(
// //                         title: 'Completed Today',
// //                         value: '89',
// //                         icon: Icons.check_circle,
// //                         color: Colors.red,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 32),
// //                 const Text(
// //                   'Quick Actions',
// //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                 ),
// //                 const SizedBox(height: 16),
// //                 Row(
// //                   children: [
// //                     Expanded(
// //                       child: CustomActionButton(
// //                         label: 'Manage Queues',
// //                         onPressed: () =>
// //                             Navigator.pushNamed(context, '/manage-queue'),
// //                         icon: Icons.edit,
// //                         backgroundColor: Colors.blue,
// //                         height: 52,
// //                       ),
// //                     ),
// //                     const SizedBox(width: 10),
// //                     Expanded(
// //                       child: CustomActionButton(
// //                         label: 'View Reports',
// //                         onPressed: () => _showReportsDialog(context),
// //                         icon: Icons.bar_chart,
// //                         type: ButtonType.secondary,
// //                         foregroundColor: Colors.black,
// //                         height: 52,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 32),
// //                 const Text(
// //                   'Department Queues',
// //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                 ),
// //                 const SizedBox(height: 16),
// //                 ListView.builder(
// //                   shrinkWrap: true,
// //                   physics: const NeverScrollableScrollPhysics(),
// //                   itemCount: queueData.length,
// //                   itemBuilder: (context, index) {
// //                     final dept = queueData[index];
// //                     return DepartmentCard(
// //                       dept: dept,
// //                       onTap: () {
// //                         Navigator.pushNamed(
// //                           context,
// //                           '/manage-queue',
// //                           arguments: dept['department'],
// //                         );
// //                       },
// //                       title: '',
// //                       subtitle: '',
// //                       iconColor: dept['color'],
// //                       icon: dept['icon'],
// //                       color: dept['color'],
// //                     );
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),

// //           // Logout Overlay
// //           if (_isLoggingOut)
// //             Container(
// //               color: Colors.black.withOpacity(0.5),
// //               child: Center(
// //                 child: Container(
// //                   padding: const EdgeInsets.all(24),
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: BorderRadius.circular(16),
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Colors.black.withOpacity(0.1),
// //                         blurRadius: 20,
// //                         spreadRadius: 2,
// //                       ),
// //                     ],
// //                   ),
// //                   child: Column(
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //                       SizedBox(
// //                         width: 40,
// //                         height: 40,
// //                         child: CircularProgressIndicator(
// //                           valueColor: AlwaysStoppedAnimation<Color>(
// //                               Colors.blue), // Use your primary color
// //                           strokeWidth: 3,
// //                         ),
// //                       ),
// //                       const SizedBox(height: 16),
// //                       const Text(
// //                         'Signing out...',
// //                         style: TextStyle(
// //                           fontSize: 16,
// //                           fontWeight: FontWeight.w500,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _drawerItem(IconData icon, String title) {
// //     return ListTile(
// //       leading: Icon(icon),
// //       title: Text(title),
// //       onTap: () {},
// //     );
// //   }

// //   // ✅ Daily Report Dialog with details
// //   void _showReportsDialog(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       barrierColor: Colors.black54,
// //       builder: (_) => Center(
// //         child: Material(
// //           color: Colors.transparent,
// //           child: Container(
// //             width: MediaQuery.of(context).size.width * 0.85,
// //             padding: const EdgeInsets.all(20),
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.circular(18),
// //             ),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 const Text(
// //                   'Daily Report',
// //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //                 ),
// //                 const SizedBox(height: 6),
// //                 const Text(
// //                   "Today's Overview - March 15, 2024",
// //                   style: TextStyle(color: Colors.grey),
// //                 ),
// //                 const SizedBox(height: 16),
// //                 const Divider(),
// //                 _reportItem(
// //                   'Total Patients Today',
// //                   'Active and completed visits',
// //                   '127',
// //                   Colors.blue,
// //                 ),
// //                 _reportItem(
// //                   'Average Wait Time',
// //                   'From check-in to appointment',
// //                   '18 min',
// //                   Colors.blueAccent,
// //                 ),
// //                 _reportItem(
// //                   'Completed Appointments',
// //                   'Successfully finished today',
// //                   '94',
// //                   Colors.green,
// //                 ),
// //                 _reportItem(
// //                   'No-Shows',
// //                   "Patients who didn't arrive",
// //                   '8',
// //                   Colors.orange,
// //                 ),
// //                 _reportItem(
// //                   'Cancelled Appointments',
// //                   'Cancelled by patients or staff',
// //                   '12',
// //                   Colors.red,
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _reportItem(
// //     String title,
// //     String subtitle,
// //     String value,
// //     Color color,
// //   ) {
// //     return Column(
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.symmetric(vertical: 12),
// //           child: Row(
// //             children: [
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(title,
// //                         style: const TextStyle(fontWeight: FontWeight.w600)),
// //                     const SizedBox(height: 4),
// //                     Text(
// //                       subtitle,
// //                       style: const TextStyle(fontSize: 12, color: Colors.grey),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               Text(
// //                 value,
// //                 style: TextStyle(
// //                   fontSize: 16,
// //                   fontWeight: FontWeight.bold,
// //                   color: color,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         const Divider(height: 1),
// //       ],
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '/widgets/department_card.dart';
// import '/widgets/info_card.dart';
// import '/widgets/custom_action_button.dart';
// import '../auth_screen.dart';
// import 'manage_queue_screen.dart'; // Import ManageQueueScreen

// class AdminDashboardScreen extends StatefulWidget {
//   const AdminDashboardScreen({super.key});

//   @override
//   State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
// }

// class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
//   final List<Map<String, dynamic>> queueData = [
//     {'department': 'Emergency', 'count': 24, 'avgWait': 15, 'icon': Icons.local_hospital, 'color': Colors.blue},
//     {'department': 'Cardiology', 'count': 18, 'avgWait': 28, 'icon': Icons.favorite, 'color': Colors.pink},
//     {'department': 'Neurology', 'count': 12, 'avgWait': 35, 'icon': Icons.psychology, 'color': Colors.green},
//     {'department': 'Pediatrics', 'count': 16, 'avgWait': 22, 'icon': Icons.child_care, 'color': Colors.red},
//     {'department': 'Ophthalmology', 'count': 9, 'avgWait': 18, 'icon': Icons.remove_red_eye, 'color': Colors.lightGreen},
//   ];

//   bool _isLoggingOut = false;

//   @override
//   Widget build(BuildContext context) {
//     final totalPatients = queueData.fold<int>(0, (sum, item) => sum + (item['count'] as int));
//     final avgWaitTime = queueData.fold<int>(0, (sum, item) => sum + (item['avgWait'] as int)) ~/ queueData.length;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F6FA),
//       drawer: Drawer(
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Text('MediQueue', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               ),
//               _drawerItem(Icons.person_outline, 'My Account'),
//               _drawerItem(Icons.notifications_none, 'Notification'),
//               _drawerItem(Icons.history, 'History'),
//               const SizedBox(height: 12),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: 45,
//                   child: OutlinedButton(
//                     onPressed: () async {
//                       Navigator.pop(context);
//                       final shouldLogout = await showDialog<bool>(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: const Text('Logout'),
//                           content: const Text('Are you sure you want to logout?'),
//                           actions: [
//                             TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
//                             ElevatedButton(
//                               onPressed: () => Navigator.pop(context, true),
//                               style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                               child: const Text('Logout'),
//                             ),
//                           ],
//                         ),
//                       );

//                       if (shouldLogout != true) return;

//                       setState(() => _isLoggingOut = true);
//                       try {
//                         await Future.delayed(const Duration(milliseconds: 300));
//                         await FirebaseAuth.instance.signOut();
//                         Navigator.of(context).pushAndRemoveUntil(
//                           MaterialPageRoute(builder: (_) => const AuthScreen()),
//                           (route) => false,
//                         );
//                       } catch (e) {
//                         if (mounted) setState(() => _isLoggingOut = false);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Logout failed: ${e.toString()}'), backgroundColor: Colors.red),
//                         );
//                       }
//                     },
//                     style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
//                     child: const Text('Logout'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       appBar: AppBar(
//         elevation: 0,
//         toolbarHeight: 90,
//         automaticallyImplyLeading: false,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(colors: [Color.fromRGBO(13, 27, 140, 1), Color.fromRGBO(90, 140, 255, 1)]),
//           ),
//         ),
//         title: Row(
//           children: [
//             Builder(
//               builder: (context) => IconButton(icon: const Icon(Icons.menu, color: Colors.white), onPressed: () => Scaffold.of(context).openDrawer()),
//             ),
//             const SizedBox(width: 8),
//             const CircleAvatar(radius: 22, backgroundColor: Colors.white, child: Text('A', style: TextStyle(color: Color.fromRGBO(13, 27, 140, 1), fontWeight: FontWeight.bold))),
//             const SizedBox(width: 12),
//             const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text('Dr. Sarah Johnson', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
//                 Text('Hospital Administrator', style: TextStyle(fontSize: 13, color: Colors.white70)),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text('Queue Overview', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Expanded(child: InfoCard(title: 'Total Patients', value: totalPatients.toString(), icon: Icons.people, color: Colors.blue)),
//                     const SizedBox(width: 12),
//                     Expanded(child: InfoCard(title: 'Avg Wait Time', value: '${avgWaitTime}m', icon: Icons.schedule, color: Colors.purple)),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     Expanded(child: InfoCard(title: 'Departments', value: queueData.length.toString(), icon: Icons.domain, color: Colors.green)),
//                     const SizedBox(width: 12),
//                     Expanded(child: InfoCard(title: 'Completed Today', value: '89', icon: Icons.check_circle, color: Colors.red)),
//                   ],
//                 ),
//                 const SizedBox(height: 32),
//                 const Text('Quick Actions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: CustomActionButton(
//                         label: 'Manage Queues',
//                         onPressed: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (_) => const ManageQueueScreen(department: null,)));
//                         },
//                         icon: Icons.edit,
//                         backgroundColor: Colors.blue,
//                         height: 52,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: CustomActionButton(
//                         label: 'View Reports',
//                         onPressed: () => _showReportsDialog(context),
//                         icon: Icons.bar_chart,
//                         type: ButtonType.secondary,
//                         foregroundColor: Colors.black,
//                         height: 52,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 32),
//                 const Text('Department Queues', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 16),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: queueData.length,
//                   itemBuilder: (context, index) {
//                     final dept = queueData[index];
//                     return DepartmentCard(
//                       dept: dept,
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (_) => ManageQueueScreen(department: dept['department'])),
//                         );
//                       },
//                       title: '',
//                       subtitle: '',
//                       iconColor: dept['color'],
//                       icon: dept['icon'],
//                       color: dept['color'],
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//           if (_isLoggingOut)
//             Container(
//               color: Colors.black.withOpacity(0.5),
//               child: Center(
//                 child: Container(
//                   padding: const EdgeInsets.all(24),
//                   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, spreadRadius: 2)]),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: const [
//                       SizedBox(width: 40, height: 40, child: CircularProgressIndicator(strokeWidth: 3, color: Colors.blue)),
//                       SizedBox(height: 16),
//                       Text('Signing out...', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _drawerItem(IconData icon, String title) {
//     return ListTile(leading: Icon(icon), title: Text(title), onTap: () {});
//   }

//   void _showReportsDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierColor: Colors.black54,
//       builder: (_) => Center(
//         child: Material(
//           color: Colors.transparent,
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.85,
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text('Daily Report', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 6),
//                 const Text("Today's Overview - March 15, 2024", style: TextStyle(color: Colors.grey)),
//                 const SizedBox(height: 16),
//                 const Divider(),
//                 _reportItem('Total Patients Today', 'Active and completed visits', '127', Colors.blue),
//                 _reportItem('Average Wait Time', 'From check-in to appointment', '18 min', Colors.blueAccent),
//                 _reportItem('Completed Appointments', 'Successfully finished today', '94', Colors.green),
//                 _reportItem('No-Shows', "Patients who didn't arrive", '8', Colors.orange),
//                 _reportItem('Cancelled Appointments', 'Cancelled by patients or staff', '12', Colors.red),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _reportItem(String title, String subtitle, String value, Color color) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 12),
//           child: Row(
//             children: [
//               Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w600)), const SizedBox(height: 4), Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey))])),
//               Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
//             ],
//           ),
//         ),
//         const Divider(height: 1),
//       ],
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/widgets/department_card.dart';
import '/widgets/info_card.dart';
import '/widgets/custom_action_button.dart';
import '../auth_screen.dart';
import 'manage_queue_screen.dart';
import 'admin_profile_screen.dart'; // ✅ ADDED

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final List<Map<String, dynamic>> queueData = [
    {'department': 'Emergency', 'count': 24, 'avgWait': 15, 'icon': Icons.local_hospital, 'color': Colors.blue},
    {'department': 'Cardiology', 'count': 18, 'avgWait': 28, 'icon': Icons.favorite, 'color': Colors.pink},
    {'department': 'Neurology', 'count': 12, 'avgWait': 35, 'icon': Icons.psychology, 'color': Colors.green},
    {'department': 'Pediatrics', 'count': 16, 'avgWait': 22, 'icon': Icons.child_care, 'color': Colors.red},
    {'department': 'Ophthalmology', 'count': 9, 'avgWait': 18, 'icon': Icons.remove_red_eye, 'color': Colors.lightGreen},
  ];

  bool _isLoggingOut = false;

  @override
  Widget build(BuildContext context) {
    final totalPatients = queueData.fold<int>(0, (sum, item) => sum + (item['count'] as int));
    final avgWaitTime = queueData.fold<int>(0, (sum, item) => sum + (item['avgWait'] as int)) ~/ queueData.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text('MediQueue', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              _drawerItem(Icons.person_outline, 'My Account'),
              _drawerItem(Icons.notifications_none, 'Notification'),
              _drawerItem(Icons.history, 'History'),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: OutlinedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      final shouldLogout = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Logout'),
                          content: const Text('Are you sure you want to logout?'),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context, true),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                              child: const Text('Logout'),
                            ),
                          ],
                        ),
                      );

                      if (shouldLogout != true) return;

                      setState(() => _isLoggingOut = true);
                      try {
                        await Future.delayed(const Duration(milliseconds: 300));
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => const AuthScreen()),
                          (route) => false,
                        );
                      } catch (e) {
                        if (mounted) setState(() => _isLoggingOut = false);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Logout failed: ${e.toString()}'), backgroundColor: Colors.red),
                        );
                      }
                    },
                    style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                    child: const Text('Logout'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromRGBO(13, 27, 140, 1), Color.fromRGBO(90, 140, 255, 1)]),
          ),
        ),
        title: Row(
          children: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            const SizedBox(width: 8),
            const CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: Text('A', style: TextStyle(color: Color.fromRGBO(13, 27, 140, 1), fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Dr. Sarah Johnson', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                Text('Hospital Administrator', style: TextStyle(fontSize: 13, color: Colors.white70)),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Queue Overview', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: InfoCard(title: 'Total Patients', value: totalPatients.toString(), icon: Icons.people, color: Colors.blue)),
                    const SizedBox(width: 12),
                    Expanded(child: InfoCard(title: 'Avg Wait Time', value: '${avgWaitTime}m', icon: Icons.schedule, color: Colors.purple)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: InfoCard(title: 'Departments', value: queueData.length.toString(), icon: Icons.domain, color: Colors.green)),
                    const SizedBox(width: 12),
                    Expanded(child: InfoCard(title: 'Completed Today', value: '89', icon: Icons.check_circle, color: Colors.red)),
                  ],
                ),
                const SizedBox(height: 32),
                const Text('Quick Actions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CustomActionButton(
                        label: 'Manage Queues',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const ManageQueueScreen(department: null)));
                        },
                        icon: Icons.edit,
                        backgroundColor: Colors.blue,
                        height: 52,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomActionButton(
                        label: 'View Reports',
                        onPressed: () => _showReportsDialog(context),
                        icon: Icons.bar_chart,
                        type: ButtonType.secondary,
                        foregroundColor: Colors.black,
                        height: 52,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Text('Department Queues', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: queueData.length,
                  itemBuilder: (context, index) {
                    final dept = queueData[index];
                    return DepartmentCard(
                      dept: dept,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => ManageQueueScreen(department: dept['department'])),
                        );
                      },
                      title: '',
                      subtitle: '',
                      iconColor: dept['color'],
                      icon: dept['icon'],
                      color: dept['color'],
                    );
                  },
                ),
              ],
            ),
          ),
          if (_isLoggingOut)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, spreadRadius: 2)],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(width: 40, height: 40, child: CircularProgressIndicator(strokeWidth: 3, color: Colors.blue)),
                      SizedBox(height: 16),
                      Text('Signing out...', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ✅ UPDATED FUNCTION
  Widget _drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        if (title == 'My Account') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AdminProfileScreen()),
          );
        }
      },
    );
  }

  void _showReportsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (_) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Daily Report', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                const Text("Today's Overview - March 15, 2024", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 16),
                const Divider(),
                _reportItem('Total Patients Today', 'Active and completed visits', '127', Colors.blue),
                _reportItem('Average Wait Time', 'From check-in to appointment', '18 min', Colors.blueAccent),
                _reportItem('Completed Appointments', 'Successfully finished today', '94', Colors.green),
                _reportItem('No-Shows', "Patients who didn't arrive", '8', Colors.orange),
                _reportItem('Cancelled Appointments', 'Cancelled by patients or staff', '12', Colors.red),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _reportItem(String title, String subtitle, String value, Color color) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ]),
              ),
              Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
