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
  bool smsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopBar(),
            const SizedBox(height: 30),
            _buildProfileCard(),
            const SizedBox(height: 16),
            _buildQueueStatusCard(),
            const SizedBox(height: 16),
            _buildMiniStats(),
            const SizedBox(height: 16),
            _buildRecentVisits(),
            const SizedBox(height: 16),
            _buildPreferences(),
            const SizedBox(height: 20),
            _buildBottomButtons(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ================= TOP BAR =================
  Widget _buildTopBar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(13, 27, 140, 1),
            Color.fromRGBO(90, 140, 255, 1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          const SizedBox(width: 16),
          const Text(
            "MediQueue",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ================= PROFILE CARD =================
  Widget _buildProfileCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            colors: [Color(0xFF5FA8F5), Color(0xFF7BB9F9)],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: const Column(
          children: [
            CircleAvatar(
              radius: 34,
              backgroundColor: Colors.white,
              child: Text(
                "JS",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5FA8F5),
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              "John Smith",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Patient ID: #MH2024-0892",
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  // ================= QUEUE STATUS =================
  Widget _buildQueueStatusCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFEFFAF5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Current Queue Status",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF1FFF7),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF1BC47D)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "CARDIOLOGY DEPARTMENT",
                    style: TextStyle(
                      color: Color(0xFF1BC47D),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "A-15",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1BC47D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Your Token Number",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1BC47D),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "Est. Wait: 25 minutes",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= MINI STATS =================
  Widget _buildMiniStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _miniCard(
            icon: Icons.groups,
            value: "12",
            label: "Ahead of You",
            color: Colors.orange,
          ),
          const SizedBox(width: 12),
          _miniCard(
            icon: Icons.local_hospital,
            value: "A-13",
            label: "Now Serving",
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _miniCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  // ================= RECENT VISITS =================
  Widget _buildRecentVisits() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Recent Visits",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            _VisitTile(
              title: "Cardiology Consultation",
              doctor: "Dr. Emily Johnson",
              date: "December 8, 2024",
            ),
            Divider(),
            _VisitTile(
              title: "General Check-up",
              doctor: "Dr. Michael Chen",
              date: "November 22, 2024",
            ),
          ],
        ),
      ),
    );
  }

  // ================= PREFERENCES =================
  Widget _buildPreferences() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SMS Notifications",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  "Receive updates via text message",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            Switch(
              value: smsEnabled,
              onChanged: (val) => setState(() => smsEnabled = val),
              activeColor: const Color(0xFF5FA8F5),
            ),
          ],
        ),
      ),
    );
  }

  // ================= BOTTOM BUTTONS =================
  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: _onUpdateProfilePressed,
              icon: const Icon(Icons.edit),
              label: const Text("Update Profile"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5FA8F5),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.help_outline),
              label: const Text("Help"),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= UPDATE PROFILE ACTION =================
  void _onUpdateProfilePressed() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Update Profile"),
        content: const Text("This will open the profile update form."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Profile updated successfully!")),
              );
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }
}

// ================= VISIT TILE =================
class _VisitTile extends StatelessWidget {
  final String title;
  final String doctor;
  final String date;

  const _VisitTile({
    required this.title,
    required this.doctor,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        backgroundColor: Color(0xFFEDEBFF),
        child: Icon(Icons.favorite, color: Color(0xFF6C63FF)),
      ),
      title: Text(title),
      subtitle: Text("$doctor\n$date"),
      isThreeLine: true,
    );
  }
}
