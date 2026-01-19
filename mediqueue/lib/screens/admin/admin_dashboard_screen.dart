// import 'package:flutter/material.dart';
// import '../widgets/department_card.dart';

// class AdminDashboardScreen extends StatefulWidget {
//   const AdminDashboardScreen({super.key});

//   @override
//   State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
// }

// class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
//   final List<Map<String, dynamic>> queueData = [
//     {
//       'department': 'General Medicine',
//       'count': 12,
//       'avgWait': 25,
//       'icon': Icons.medical_services,
//       'color': Colors.blue
//     },
//     {
//       'department': 'Cardiology',
//       'count': 8,
//       'avgWait': 45,
//       'icon': Icons.favorite,
//       'color': Colors.red
//     },
//     {
//       'department': 'Orthopedics',
//       'count': 5,
//       'avgWait': 35,
//       'icon': Icons.accessibility_new,
//       'color': Colors.orange
//     },
//     {
//       'department': 'Pediatrics',
//       'count': 15,
//       'avgWait': 20,
//       'icon': Icons.child_care,
//       'color': Colors.pink
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final totalPatients =
//         queueData.fold<int>(0, (sum, item) => sum + (item['count'] as int));
//     final avgWaitTime =
//         queueData.fold<int>(0, (sum, item) => sum + (item['avgWait'] as int)) ~/
//             queueData.length;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Admin Dashboard'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: () {
//               setState(() {});
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Dashboard refreshed')),
//               );
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.settings),
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Settings opening...')),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.green.shade50,
//               Colors.white,
//             ],
//           ),
//         ),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Welcome Card
//               Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Colors.green.shade600, Colors.green.shade400],
//                     ),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: const Row(
//                     children: [
//                       Icon(
//                         Icons.admin_panel_settings,
//                         color: Colors.white,
//                         size: 40,
//                       ),
//                       SizedBox(width: 16),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Hospital Admin',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               'City General Hospital',
//                               style: TextStyle(
//                                 color: Colors.white70,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),

//               // Statistics Cards
//               const Text(
//                 'Overview',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF424242),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildStatCard(
//                       'Total Patients',
//                       totalPatients.toString(),
//                       Icons.people,
//                       Colors.blue,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: _buildStatCard(
//                       'Avg. Wait',
//                       '$avgWaitTime min',
//                       Icons.schedule,
//                       Colors.orange,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),

//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildStatCard(
//                       'Departments',
//                       queueData.length.toString(),
//                       Icons.domain,
//                       Colors.purple,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: _buildStatCard(
//                       'Completed',
//                       '47',
//                       Icons.check_circle,
//                       Colors.green,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),

//               // Quick Actions
//               const Text(
//                 'Quick Actions',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF424242),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildActionButton(
//                       context,
//                       'Manage Queue',
//                       Icons.queue,
//                       Colors.blue,
//                       () {
//                         Navigator.pushNamed(context, '/manage-queue');
//                       },
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: _buildActionButton(
//                       context,
//                       'Reports',
//                       Icons.assessment,
//                       Colors.green,
//                       () {
//                         _showReportsDialog(context);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),

//               // Department Queue Status
//               const Text(
//                 'Department Queues',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF424242),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: queueData.length,
//                 itemBuilder: (context, index) {
//                   final dept = queueData[index];
//                   return DepartmentCard(
//                     dept: dept,
//                     onTap: () {
//                       Navigator.pushNamed(
//                         context,
//                         '/manage-queue',
//                         arguments: dept['department'],
//                       );
//                     },
//                   );
//                 },
//               ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildStatCard(
//       String label, String value, IconData icon, Color color) {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Icon(icon, color: color, size: 32),
//             const SizedBox(height: 8),
//             Text(
//               value,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey.shade600,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildActionButton(
//     BuildContext context,
//     String label,
//     IconData icon,
//     Color color,
//     VoidCallback onPressed,
//   ) {
//     return ElevatedButton.icon(
//       onPressed: onPressed,
//       icon: Icon(icon),
//       label: Text(label),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: color,
//         foregroundColor: Colors.white,
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     );
//   }

//   // Widget _buildDepartmentCard(BuildContext context, Map<String, dynamic> dept) {
//   //   return Card(
//   //     elevation: 2,
//   //     margin: const EdgeInsets.only(bottom: 12),
//   //     shape: RoundedRectangleBorder(
//   //       borderRadius: BorderRadius.circular(12),
//   //     ),
//   //     child: ListTile(
//   //       contentPadding: const EdgeInsets.all(16),
//   //       leading: Container(
//   //         padding: const EdgeInsets.all(12),
//   //         decoration: BoxDecoration(
//   //           color: (dept['color'] as Color).withOpacity(0.1),
//   //           borderRadius: BorderRadius.circular(12),
//   //         ),
//   //         child: Icon(
//   //           dept['icon'],
//   //           color: dept['color'],
//   //           size: 28,
//   //         ),
//   //       ),
//   //       title: Text(
//   //         dept['department'],
//   //         style: const TextStyle(
//   //           fontWeight: FontWeight.bold,
//   //           fontSize: 16,
//   //         ),
//   //       ),
//   //       subtitle: Text(
//   //         '${dept['count']} patients • Avg ${dept['avgWait']} min wait',
//   //         style: TextStyle(
//   //           color: Colors.grey.shade600,
//   //           fontSize: 13,
//   //         ),
//   //       ),
//   //       trailing: IconButton(
//   //         icon: const Icon(Icons.arrow_forward_ios, size: 18),
//   //         onPressed: () {
//   //           Navigator.pushNamed(
//   //             context,
//   //             '/manage-queue',
//   //             arguments: dept['department'],
//   //           );
//   //         },
//   //       ),
//   //     ),
//   //   );
//   // }

//   void _showReportsDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Daily Report'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildReportRow('Total Patients Today', '127'),
//             _buildReportRow('Average Wait Time', '28 minutes'),
//             _buildReportRow('Completed Appointments', '98'),
//             _buildReportRow('No Shows', '5'),
//             _buildReportRow('Cancelled', '12'),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Close'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildReportRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: const TextStyle(fontSize: 14)),
//           Text(
//             value,
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '/widgets/department_card.dart';
import '/widgets/info_card.dart';
import '/widgets/custom_action_button.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final List<Map<String, dynamic>> queueData = [
    {
      'department': 'General Medicine',
      'count': 12,
      'avgWait': 25,
      'icon': Icons.medical_services,
      'color': Colors.blue
    },
    {
      'department': 'Cardiology',
      'count': 8,
      'avgWait': 45,
      'icon': Icons.favorite,
      'color': Colors.red
    },
    {
      'department': 'Orthopedics',
      'count': 5,
      'avgWait': 35,
      'icon': Icons.accessibility_new,
      'color': Colors.orange
    },
    {
      'department': 'Pediatrics',
      'count': 15,
      'avgWait': 20,
      'icon': Icons.child_care,
      'color': Colors.pink
    },
  ];

  @override
  Widget build(BuildContext context) {
    final totalPatients =
        queueData.fold<int>(0, (sum, item) => sum + item['count'] as int);

    final avgWaitTime =
        queueData.fold<int>(0, (sum, item) => sum + item['avgWait'] as int) ~/
            queueData.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {});
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Dashboard refreshed')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings opening...')),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade50, Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWelcomeCard(),
              const SizedBox(height: 24),
              const Text(
                'Overview',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: InfoCard(
                      title: 'Total Patients',
                      value: totalPatients.toString(),
                      icon: Icons.people,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: InfoCard(
                      title: 'Avg. Wait',
                      value: '$avgWaitTime min',
                      icon: Icons.schedule,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: InfoCard(
                      title: 'Departments',
                      value: queueData.length.toString(),
                      icon: Icons.domain,
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: InfoCard(
                      title: 'Completed',
                      value: '47',
                      icon: Icons.check_circle,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Quick Actions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomActionButton(
                      label: 'Manage Queue',
                      onPressed: () =>
                          Navigator.pushNamed(context, '/manage-queue'),
                      icon: Icons.queue,
                      type: ButtonType.primary,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomActionButton(
                      label: 'Reports',
                      onPressed: () => _showReportsDialog(context),
                      icon: Icons.assessment,
                      type: ButtonType.primary,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Department Queues',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
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
                      Navigator.pushNamed(
                        context,
                        '/manage-queue',
                        arguments: dept['department'],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade600, Colors.green.shade400],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Row(
          children: [
            Icon(Icons.admin_panel_settings, color: Colors.white, size: 40),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hospital Admin',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'City General Hospital',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showReportsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Daily Report'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ReportRow('Total Patients Today', '127'),
            _ReportRow('Average Wait Time', '28 minutes'),
            _ReportRow('Completed Appointments', '98'),
            _ReportRow('No Shows', '5'),
            _ReportRow('Cancelled', '12'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

class _ReportRow extends StatelessWidget {
  final String label;
  final String value;

  const _ReportRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
