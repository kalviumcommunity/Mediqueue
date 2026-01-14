// // import 'package:flutter/material.dart';

// // class PatientProfileScreen extends StatelessWidget {
// //   const PatientProfileScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF6FAFF),
// //       appBar: AppBar(
// //         title: const Text('Patient Profile'),
// //         centerTitle: true,
// //         backgroundColor: Colors.transparent,
// //         elevation: 0,
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             _buildHeader(),
// //             const SizedBox(height: 20),
// //             _buildInfoCard(),
// //             const SizedBox(height: 20),
// //             _buildActionCard(),
// //             const SizedBox(height: 40),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // ================= HEADER =================
// //   Widget _buildHeader() {
// //     return Container(
// //       width: double.infinity,
// //       padding: const EdgeInsets.symmetric(vertical: 32),
// //       decoration: const BoxDecoration(
// //         gradient: LinearGradient(
// //           begin: Alignment.topCenter,
// //           end: Alignment.bottomCenter,
// //           colors: [
// //             Color(0xFFEAF4FF),
// //             Color(0xFFF6FAFF),
// //           ],
// //         ),
// //       ),
// //       child: Column(
// //         children: [
// //           Container(
// //             padding: const EdgeInsets.all(18),
// //             decoration: BoxDecoration(
// //               shape: BoxShape.circle,
// //               color: Colors.blue.shade100,
// //             ),
// //             child: const Icon(
// //               Icons.person,
// //               size: 64,
// //               color: Colors.blue,
// //             ),
// //           ),
// //           const SizedBox(height: 12),
// //           const Text(
// //             'Claudia Jerome',
// //             style: TextStyle(
// //               fontSize: 22,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           const SizedBox(height: 4),
// //           Text(
// //             'Patient',
// //             style: TextStyle(
// //               fontSize: 14,
// //               color: Colors.grey.shade600,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   // ================= INFO CARD =================
// //   Widget _buildInfoCard() {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 20),
// //       child: Card(
// //         elevation: 4,
// //         shadowColor: Colors.blue.withOpacity(0.1),
// //         shape: RoundedRectangleBorder(
// //           borderRadius: BorderRadius.circular(18),
// //         ),
// //         child: Padding(
// //           padding: const EdgeInsets.all(20),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: const [
// //               Text(
// //                 'Patient Information',
// //                 style: TextStyle(
// //                   fontSize: 18,
// //                   fontWeight: FontWeight.w600,
// //                 ),
// //               ),
// //               SizedBox(height: 20),
// //               _InfoRow(
// //                 icon: Icons.email_outlined,
// //                 text: 'claudia@email.com',
// //               ),
// //               _InfoRow(
// //                 icon: Icons.phone_outlined,
// //                 text: '+91 98765 43210',
// //               ),
// //               _InfoRow(
// //                 icon: Icons.history,
// //                 text: 'Queues Joined: 5',
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // ================= ACTION CARD =================
// //   Widget _buildActionCard() {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 20),
// //       child: Card(
// //         elevation: 4,
// //         shadowColor: Colors.blue.withOpacity(0.1),
// //         shape: RoundedRectangleBorder(
// //           borderRadius: BorderRadius.circular(18),
// //         ),
// //         child: Padding(
// //           padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
// //           child: Column(
// //             children: [
// //               _actionButton(
// //                 icon: Icons.edit,
// //                 label: 'Edit Profile',
// //                 color: Colors.blue,
// //                 onTap: () {},
// //               ),
// //               const SizedBox(height: 14),
// //               _actionButton(
// //                 icon: Icons.logout,
// //                 label: 'Logout',
// //                 color: Colors.red,
// //                 onTap: () {},
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _actionButton({
// //     required IconData icon,
// //     required String label,
// //     required Color color,
// //     required VoidCallback onTap,
// //   }) {
// //     return SizedBox(
// //       width: double.infinity,
// //       height: 48,
// //       child: ElevatedButton.icon(
// //         onPressed: onTap,
// //         icon: Icon(icon, size: 20),
// //         label: Text(
// //           label,
// //           style: const TextStyle(fontSize: 16),
// //         ),
// //         style: ElevatedButton.styleFrom(
// //           backgroundColor: color.withOpacity(0.1),
// //           foregroundColor: color,
// //           elevation: 0,
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(30),
// //             side: BorderSide(color: color),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // ================= INFO ROW =================
// // class _InfoRow extends StatelessWidget {
// //   final IconData icon;
// //   final String text;

// //   const _InfoRow({required this.icon, required this.text});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 14),
// //       child: Row(
// //         children: [
// //           Icon(icon, size: 22, color: Colors.blue),
// //           const SizedBox(width: 14),
// //           Expanded(
// //             child: Text(
// //               text,
// //               style: const TextStyle(fontSize: 15),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'queue_details_screen.dart';

// class PatientProfileScreen extends StatefulWidget {
//   const PatientProfileScreen({super.key});

//   @override
//   State<PatientProfileScreen> createState() => _PatientProfileScreenState();
// }

// class _PatientProfileScreenState extends State<PatientProfileScreen> {
//   bool showHistory = false;

//   // Hardcoded queue history
//   final List<Map<String, String>> queueHistory = [
//     {
//       "hospitalName": "City Hospital",
//       "queueNumber": "5",
//       "date": "2026-01-05",
//       "status": "Completed",
//     },
//     {
//       "hospitalName": "Green Clinic",
//       "queueNumber": "3",
//       "date": "2026-01-03",
//       "status": "Pending",
//     },
//     {
//       "hospitalName": "Sunrise Hospital",
//       "queueNumber": "8",
//       "date": "2026-01-01",
//       "status": "Completed",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF6FAFF),
//       appBar: AppBar(
//         title: const Text('Patient Profile'),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             _buildHeader(),
//             const SizedBox(height: 20),
//             _buildInfoCard(),
//             const SizedBox(height: 20),
//             _buildActionCard(),
//             const SizedBox(height: 20),
//             if (showHistory) _buildQueueHistorySection(),
//             const SizedBox(height: 40),
//           ],
//         ),
//       ),
//     );
//   }

//   // ================= HEADER =================
//   Widget _buildHeader() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 32),
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color(0xFFEAF4FF),
//             Color(0xFFF6FAFF),
//           ],
//         ),
//       ),
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(18),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.blue.shade100,
//             ),
//             child: const Icon(
//               Icons.person,
//               size: 64,
//               color: Colors.blue,
//             ),
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             'Claudia Jerome',
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             'Patient',
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey.shade600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ================= INFO CARD =================
//   Widget _buildInfoCard() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Card(
//         elevation: 4,
//         shadowColor: Colors.blue.withOpacity(0.1),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [
//               Text(
//                 'Patient Information',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               SizedBox(height: 20),
//               _InfoRow(
//                 icon: Icons.email_outlined,
//                 text: 'claudia@email.com',
//               ),
//               _InfoRow(
//                 icon: Icons.phone_outlined,
//                 text: '+91 98765 43210',
//               ),
//               _InfoRow(
//                 icon: Icons.history,
//                 text: 'Queues Joined: 5',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ================= ACTION CARD WITH SMALL ICON BUTTONS =================
//   Widget _buildActionCard() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Card(
//         elevation: 4,
//         shadowColor: Colors.blue.withOpacity(0.1),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _smallIconButton(
//                 icon: Icons.edit,
//                 color: Colors.blue,
//                 tooltip: "Edit Profile",
//                 onTap: () {},
//               ),
//               _smallIconButton(
//                 icon: Icons.logout,
//                 color: Colors.red,
//                 tooltip: "Logout",
//                 onTap: () {},
//               ),
//               _smallIconButton(
//                 icon: Icons.history, // Fixed: using valid icon
//                 color: Colors.green,
//                 tooltip: showHistory ? "Hide History" : "Show History",
//                 onTap: () => setState(() => showHistory = !showHistory),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _smallIconButton({
//     required IconData icon,
//     required Color color,
//     required String tooltip,
//     required VoidCallback onTap,
//   }) {
//     return Column(
//       children: [
//         Ink(
//           decoration: ShapeDecoration(
//             color: color.withOpacity(0.1),
//             shape: const CircleBorder(),
//           ),
//           child: IconButton(
//             icon: Icon(icon),
//             color: color,
//             iconSize: 22,
//             tooltip: tooltip,
//             onPressed: onTap,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           tooltip,
//           style: const TextStyle(fontSize: 10),
//         ),
//       ],
//     );
//   }

//   // ================= QUEUE HISTORY =================
//   Widget _buildQueueHistorySection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Card(
//         elevation: 4,
//         shadowColor: Colors.blue.withOpacity(0.1),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: queueHistory.length,
//             itemBuilder: (context, index) {
//               final queue = queueHistory[index];
//               return Card(
//                 margin: const EdgeInsets.symmetric(vertical: 5),
//                 child: ListTile(
//                   title: Text("Hospital: ${queue['hospitalName']}"),
//                   subtitle: Text(
//                       "Queue Number: ${queue['queueNumber']}\n"
//                       "Date: ${queue['date']}\n"
//                       "Status: ${queue['status']}"),
//                   trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             QueueDetailsScreen(queue: queue),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ================= INFO ROW =================
// class _InfoRow extends StatelessWidget {
//   final IconData icon;
//   final String text;

//   const _InfoRow({required this.icon, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 14),
//       child: Row(
//         children: [
//           Icon(icon, size: 22, color: Colors.blue),
//           const SizedBox(width: 14),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(fontSize: 15),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({super.key});

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  bool showHistory = false;

  // Hardcoded queue history
  final List<Map<String, String>> queueHistory = [
    {
      "hospitalName": "City Hospital",
      "queueNumber": "5",
      "date": "2026-01-05",
      "status": "Completed",
    },
    {
      "hospitalName": "Green Clinic",
      "queueNumber": "3",
      "date": "2026-01-03",
      "status": "Pending",
    },
    {
      "hospitalName": "Sunrise Hospital",
      "queueNumber": "8",
      "date": "2026-01-01",
      "status": "Completed",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFF),
      appBar: AppBar(
        title: const Text('Patient Profile'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildInfoCard(),
            const SizedBox(height: 20),
            _buildActionCard(),
            const SizedBox(height: 20),
            if (showHistory) _buildQueueHistorySection(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ================= HEADER =================
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFEAF4FF),
            Color(0xFFF6FAFF),
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.shade100,
            ),
            child: const Icon(
              Icons.person,
              size: 64,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Claudia Jerome',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Patient',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  // ================= INFO CARD =================
  Widget _buildInfoCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 4,
        shadowColor: Colors.blue.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Patient Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              _InfoRow(
                icon: Icons.email_outlined,
                text: 'claudia@email.com',
              ),
              _InfoRow(
                icon: Icons.phone_outlined,
                text: '+91 98765 43210',
              ),
              _InfoRow(
                icon: Icons.history,
                text: 'Queues Joined: 5',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= ACTION CARD WITH SMALL ICON BUTTONS =================
  Widget _buildActionCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 4,
        shadowColor: Colors.blue.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _smallIconButton(
                icon: Icons.edit,
                color: Colors.blue,
                tooltip: "Edit Profile",
                onTap: () {
                  // Placeholder for Edit Profile action
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Edit Profile clicked")),
                  );
                },
              ),
              _smallIconButton(
                icon: Icons.logout,
                color: Colors.red,
                tooltip: "Logout",
                onTap: () {
                  // Placeholder for Logout action
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Logout clicked")),
                  );
                },
              ),
              _smallIconButton(
                icon: Icons.history,
                color: Colors.green,
                tooltip: showHistory ? "Hide History" : "Show History",
                onTap: () => setState(() => showHistory = !showHistory),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _smallIconButton({
    required IconData icon,
    required Color color,
    required String tooltip,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        Ink(
          decoration: ShapeDecoration(
            color: color.withValues(alpha: 0.1),
            shape: const CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(icon),
            color: color,
            iconSize: 22,
            tooltip: tooltip,
            onPressed: onTap,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          tooltip,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }

  // ================= QUEUE HISTORY =================
  Widget _buildQueueHistorySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 4,
        shadowColor: Colors.blue.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: queueHistory.length,
            itemBuilder: (context, index) {
              final queue = queueHistory[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  title: Text("Hospital: ${queue['hospitalName']}"),
                  subtitle: Text("Queue Number: ${queue['queueNumber']}\n"
                      "Date: ${queue['date']}\n"
                      "Status: ${queue['status']}"),
                  // Removed navigation onTap
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ================= INFO ROW =================
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Icon(icon, size: 22, color: Colors.blue),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
