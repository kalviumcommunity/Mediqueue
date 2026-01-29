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


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/user_service.dart';
import '../../services/queue_service.dart';
import '../../models/queue_model.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({super.key});

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  late UserService _userService;
  late QueueService _queueService;
  Map<String, dynamic>? _userData;
  QueueModel? _currentQueue;
  List<QueueModel> _patientQueues = [];
  bool _isLoading = true;
  bool smsEnabled = true;
  List<Map<String, dynamic>> _recentVisits = [];
  StreamSubscription? _queueSubscription;
  int? _queuePosition;
  int? _recalculatedWaitTime;

  @override
  void initState() {
    super.initState();
    _userService = UserService();
    _queueService = QueueService();
    _loadUserData();
  }

  @override
  void dispose() {
    _queueSubscription?.cancel();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    try {
      // Get user data
      final userData = await _userService.getCompleteUserProfile();

      if (userData != null) {
        // Process medical history
        final medicalHistory =
            userData['medicalHistory'] as List<dynamic>? ?? [];
        final List<Map<String, dynamic>> processedVisits = [];

        for (var item in medicalHistory) {
          if (item is Map<String, dynamic>) {
            processedVisits.add(item);
          } else if (item is Map) {
            processedVisits.add(Map<String, dynamic>.from(item));
          }
        }

        // If no medical history, add sample data
        if (processedVisits.isEmpty) {
          processedVisits.addAll([
            {
              'title': 'Cardiology Consultation',
              'doctor': 'Dr. Emily Johnson',
              'date': 'December 8, 2024',
            },
            {
              'title': 'General Check-up',
              'doctor': 'Dr. Michael Chen',
              'date': 'November 22, 2024',
            },
          ]);
        }

        setState(() {
          _userData = userData;
          _recentVisits = processedVisits;

          // Load SMS preference
          final preferences = userData['preferences'] as Map<String, dynamic>?;
          if (preferences != null) {
            smsEnabled = preferences['smsEnabled'] ?? true;
          }
        });

        // Load queue data if user is patient
        if (userData['userType'] == 'patient' && userData['userId'] != null) {
          await _loadQueueData(userData['userId']);
        }
      } else {
        // If no data, show empty state with sample data
        setState(() {
          _recentVisits = [
            {
              'title': 'Cardiology Consultation',
              'doctor': 'Dr. Emily Johnson',
              'date': 'December 8, 2024',
            },
            {
              'title': 'General Check-up',
              'doctor': 'Dr. Michael Chen',
              'date': 'November 22, 2024',
            },
          ];
        });
      }
    } catch (e) {
      print('Error loading user data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load profile data: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loadQueueData(String patientId) async {
    try {
      // Get active queues for patient
      final stream = _queueService.watchPatientQueues(patientId);

      _queueSubscription = stream.listen((queues) {
        setState(() {
          _patientQueues = queues;

          // Find current active queue (waiting or in progress)
          _currentQueue = queues.firstWhere(
            (queue) =>
                queue.status == QueueStatus.waiting ||
                queue.status == QueueStatus.inProgress,
            orElse: () => QueueModel(
              id: '',
              hospitalId: '',
              hospitalName: '',
              departmentName: '',
              patientId: '',
              patientName: '',
              patientEmail: '',
              queueNumber: 0,
              estimatedWaitTime: 0,
              status: QueueStatus.waiting,
              joinedAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
          );

          // Reset position data if no active queue
          if (_currentQueue!.id.isEmpty) {
            _queuePosition = null;
            _recalculatedWaitTime = null;
          }
        });
      }, onError: (e) {
        print('Error loading queue data: $e');
      });
    } catch (e) {
      print('Error setting up queue stream: $e');
    }
  }

  Future<void> _getQueuePosition() async {
    if (_currentQueue != null && _currentQueue!.id.isNotEmpty) {
      try {
        final result = await _queueService.getQueuePosition(_currentQueue!.id);

        if (result['success'] == true) {
          setState(() {
            _queuePosition = result['position'];
            _recalculatedWaitTime = result['estimatedWaitTime'];
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Position: ${result['position']}, '
                'Wait time: ${result['estimatedWaitTime']} minutes',
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result['message'])),
          );
        }
      } catch (e) {
        print('Error getting queue position: $e');
      }
    }
  }

  Future<void> _leaveQueue() async {
    if (_currentQueue != null && _currentQueue!.id.isNotEmpty) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Leave Queue?'),
          content: const Text('Are you sure you want to leave the queue?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Leave'),
            ),
          ],
        ),
      );

      if (confirmed == true) {
        try {
          final result = await _queueService.leaveQueue(_currentQueue!.id);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result['message'])),
          );

          if (result['success'] == true) {
            setState(() {
              _currentQueue = null;
              _queuePosition = null;
              _recalculatedWaitTime = null;
            });
          }
        } catch (e) {
          print('Error leaving queue: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to leave queue: $e')),
          );
        }
      }
    }
  }

  Future<void> _updateSmsPreference(bool value) async {
    try {
      await _userService.updateUserProfile(
        additionalData: {
          'preferences.smsEnabled': value,
        },
      );
      setState(() {
        smsEnabled = value;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('SMS notifications ${value ? 'enabled' : 'disabled'}')),
      );
    } catch (e) {
      print('Error updating SMS preference: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update preference: $e')),
      );
      // Revert UI change on error
      setState(() {
        smsEnabled = !value;
      });
    }
  }

  Future<void> _updateProfile() async {
    // Show dialog for updating profile
    final result = await showDialog(
      context: context,
      builder: (context) => _UpdateProfileDialog(
        currentName: _userData?['name'] ?? '',
        currentPhone: _userData?['phone'] ?? '',
      ),
    );

    if (result != null && result is Map<String, String>) {
      try {
        await _userService.updateUserProfile(
          fullName: result['name'],
          phoneNumber: result['phone'],
        );

        // Reload data
        await _loadUserData();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully!')),
        );
      } catch (e) {
        print('Error updating profile: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile: $e')),
        );
      }
    }
  }

  String _getInitials(String name) {
    if (name.isEmpty) return 'U';
    final parts = name.split(' ');
    if (parts.length > 1) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }

  String _formatPatientId(String userId) {
    if (userId.isEmpty) return '#MH2024-0000';
    if (userId.length > 8) {
      return '#MH2024-${userId.substring(userId.length - 4).toUpperCase()}';
    }
    return '#MH2024-${userId.toUpperCase()}';
  }

  Color _getQueueStatusColor(QueueStatus status) {
    switch (status) {
      case QueueStatus.waiting:
        return Colors.orange;
      case QueueStatus.called:
        return Colors.blue;
      case QueueStatus.inProgress:
        return Colors.green;
      case QueueStatus.completed:
        return Colors.green;
      case QueueStatus.cancelled:
        return Colors.red;
      case QueueStatus.noShow:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: const Color(0xFFF6FAFF),
        body: Center(
          child: CircularProgressIndicator(
            color: const Color(0xFF5FA8F5),
          ),
        ),
      );
    }

    final name = _userData?['name'] ?? 'User';
    final email = _userData?['email'] ?? '';
    final phone = _userData?['phone'] ?? '';
    final userId = _userData?['userId'] ?? '';
    final initials = _getInitials(name);

    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopBar(),
            const SizedBox(height: 30),
            _buildProfileCard(name, email, userId, initials),
            const SizedBox(height: 16),
            if (_currentQueue != null && _currentQueue!.id.isNotEmpty)
              _buildQueueStatusCard(),
            const SizedBox(height: 16),
            if (_currentQueue != null && _currentQueue!.id.isNotEmpty)
              _buildQueueActions(),
            const SizedBox(height: 16),
            if (_currentQueue != null && _currentQueue!.id.isNotEmpty)
              _buildQueueStats(),
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
  Widget _buildProfileCard(
      String name, String email, String userId, String initials) {
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
        child: Column(
          children: [
            CircleAvatar(
              radius: 34,
              backgroundColor: Colors.white,
              child: Text(
                initials,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5FA8F5),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _formatPatientId(userId),
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 4),
            Text(
              email,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
            const SizedBox(height: 4),
            Text(
              "Phone: ${_userData?['phone'] ?? 'Not provided'}",
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  // ================= QUEUE STATUS CARD =================
  Widget _buildQueueStatusCard() {
    final waitTime = _recalculatedWaitTime ?? _currentQueue!.estimatedWaitTime;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Current Queue Status",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getQueueStatusColor(_currentQueue!.status),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _currentQueue!
                        .statusText, // Using the built-in statusText getter
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
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
                  Text(
                    _currentQueue!.hospitalName.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF1BC47D),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _currentQueue!.departmentName,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${_currentQueue!.queueNumber}',
                    style: const TextStyle(
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
                  if (_queuePosition != null) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.groups,
                              color: Colors.blue, size: 16),
                          const SizedBox(width: 8),
                          Text(
                            'Position: $_queuePosition',
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1BC47D),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Est. Wait: $waitTime minutes",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Joined: ${_formatTime(_currentQueue!.joinedAt)}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      if (_currentQueue!.calledAt != null)
                        Text(
                          'Called: ${_formatTime(_currentQueue!.calledAt!)}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                          ),
                        ),
                    ],
                  ),
                  if (_currentQueue!.priority != 'normal' &&
                      _currentQueue!.priority != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: _currentQueue!.priority == 'urgent'
                              ? Colors.orange[100]
                              : Colors.red[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Priority: ${_currentQueue!.priority!.toUpperCase()}',
                          style: TextStyle(
                            color: _currentQueue!.priority == 'urgent'
                                ? Colors.orange[800]
                                : Colors.red[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
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

  // ================= QUEUE ACTIONS =================
  Widget _buildQueueActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: _getQueuePosition,
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text("Check Position"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5FA8F5),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: _leaveQueue,
              icon: const Icon(Icons.exit_to_app, size: 18),
              label: const Text("Leave Queue"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: const BorderSide(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= QUEUE STATS =================
  Widget _buildQueueStats() {
    final waitingCount =
        _patientQueues.where((q) => q.status == QueueStatus.waiting).length;
    final inProgressCount =
        _patientQueues.where((q) => q.status == QueueStatus.inProgress).length;
    final completedCount =
        _patientQueues.where((q) => q.status == QueueStatus.completed).length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _miniCard(
            icon: Icons.groups,
            value: waitingCount.toString(),
            label: "Waiting",
            color: Colors.orange,
          ),
          const SizedBox(width: 12),
          _miniCard(
            icon: Icons.local_hospital,
            value: inProgressCount.toString(),
            label: "In Progress",
            color: Colors.green,
          ),
          const SizedBox(width: 12),
          _miniCard(
            icon: Icons.check_circle,
            value: completedCount.toString(),
            label: "Completed",
            color: Colors.blue,
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
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
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
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recent Visits",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () {
                    // View all visits
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('View all visits feature coming soon')),
                    );
                  },
                  child: const Text(
                    "View All",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_recentVisits.isNotEmpty)
              ..._recentVisits.asMap().entries.map((entry) {
                final index = entry.key;
                final visit = entry.value;
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFFEDEBFF),
                        child: Icon(Icons.favorite, color: Color(0xFF6C63FF)),
                      ),
                      title: Text(visit['title']?.toString() ?? 'Consultation'),
                      subtitle: Text(
                        "${visit['doctor']?.toString() ?? 'Doctor'}\n${visit['date']?.toString() ?? 'Recent'}",
                      ),
                      isThreeLine: true,
                    ),
                    if (index < _recentVisits.length - 1) const Divider(),
                  ],
                );
              }).toList()
            else
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "No recent visits",
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
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
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
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
              onChanged: _updateSmsPreference,
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
              onPressed: _updateProfile,
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
              onPressed: () {
                // Show help dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Help & Support"),
                    content: const Text(
                        "For assistance, please contact our support team:\n\n"
                        "Phone: 1-800-MED-QUEUE\n"
                        "Email: support@mediqueue.com\n\n"
                        "Operating Hours: 9 AM - 6 PM (Mon-Fri)"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Close"),
                      ),
                    ],
                  ),
                );
              },
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

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}

// Update Profile Dialog (unchanged)
class _UpdateProfileDialog extends StatefulWidget {
  final String currentName;
  final String currentPhone;

  const _UpdateProfileDialog({
    required this.currentName,
    required this.currentPhone,
  });

  @override
  State<_UpdateProfileDialog> createState() => _UpdateProfileDialogState();
}

class _UpdateProfileDialogState extends State<_UpdateProfileDialog> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _phoneController = TextEditingController(text: widget.currentPhone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Update Profile"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: "Full Name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: "Phone Number",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            if (_nameController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter your name')),
              );
              return;
            }

            if (_phoneController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter your phone number')),
              );
              return;
            }

            Navigator.pop(context, {
              'name': _nameController.text,
              'phone': _phoneController.text,
            });
          },
          child: const Text("Update"),
        ),
      ],
    );
  }
}
