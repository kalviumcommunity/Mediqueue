// import 'package:flutter/material.dart';
// import '../../widgets/status_badge.dart';
// import '../../models/queue_model.dart' hide QueueStatus;

// class HistoryScreen extends StatelessWidget {
//   const HistoryScreen({super.key, required Map<dynamic, dynamic> visit});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F6FA),
//       body: Column(
//         children: [
//           _buildTopBar(context),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: ListView(
//                 children: const [
//                   _HistoryCard(
//                     hospital: 'City General Hospital',
//                     department: 'Cardiology Department',
//                     date: 'March 15, 2024 • 2:30 PM',
//                     status: QueueStatus.completed,
//                   ),
//                   _HistoryCard(
//                     hospital: 'Metro Medical Center',
//                     department: 'Orthopedics Department',
//                     date: 'March 8, 2024 • 10:15 AM',
//                     status: QueueStatus.completed,
//                   ),
//                   _HistoryCard(
//                     hospital: 'Sunrise Healthcare',
//                     department: 'Dermatology Department',
//                     date: 'February 28, 2024 • 4:45 PM',
//                     status: QueueStatus.cancelled,
//                   ),
//                   _HistoryCard(
//                     hospital: 'Regional Medical Plaza',
//                     department: 'Internal Medicine',
//                     date: 'February 20, 2024 • 11:30 AM',
//                     status: QueueStatus.completed,
//                   ),
//                   _HistoryCard(
//                     hospital: 'Valley Health Institute',
//                     department: 'Neurology Department',
//                     date: 'January 15, 2024 • 9:00 AM',
//                     status: QueueStatus.completed,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ================= TOP BAR =================

//   Widget _buildTopBar(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.fromLTRB(16, 55, 16, 16),
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color.fromRGBO(13, 27, 140, 1),
//             Color.fromRGBO(90, 140, 255, 1),
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () => Navigator.pop(context),
//             child: const Icon(
//               Icons.arrow_back_ios_new_rounded,
//               color: Colors.white,
//               size: 20,
//             ),
//           ),
//           const SizedBox(width: 12),
//           const Text(
//             "Visit History",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ================= HISTORY CARD =================

// class _HistoryCard extends StatelessWidget {
//   final String hospital;
//   final String department;
//   final String date;
//   final QueueStatus status;

//   const _HistoryCard({
//     required this.hospital,
//     required this.department,
//     required this.date,
//     required this.status,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   hospital,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               StatusBadge(
//                 status: status,
//                 compact: true,
//                 color: status == QueueStatus.completed
//                     ? Colors.blue
//                     : Colors.red,
//               ),
//             ],
//           ),
//           const SizedBox(height: 6),
//           Text(
//             department,
//             style: const TextStyle(color: Colors.grey),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             date,
//             style: const TextStyle(color: Colors.grey, fontSize: 13),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../widgets/status_badge.dart';
import '../../models/queue_model.dart';
import '../../models/queue_model.dart' hide QueueStatus;

class HistoryScreen extends StatelessWidget {
  final List<dynamic> visits; // Changed to List<dynamic>

  const HistoryScreen({
    super.key,
    required this.visits,
    required Map<dynamic, dynamic> visit, // Removed duplicate parameter
  });

  @override
  Widget build(BuildContext context) {
    // Process visits data
    final List<Map<String, dynamic>> historyData = _processVisitsData();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Column(
        children: [
          _buildTopBar(context),
          Expanded(
            child: historyData.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: historyData.length,
                    itemBuilder: (context, index) {
                      final item = historyData[index];
                      return _HistoryCard(
                        hospital: item['hospital'] ?? 'Hospital',
                        department: item['department'] ?? 'Department',
                        date: item['date'] ?? 'Date',
                        status: item['status'] ?? QueueStatus.completed,
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'No history available',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _processVisitsData() {
    // If visits is empty or null, use default data
    if (visits.isEmpty) {
      return _getDefaultHistoryData();
    }

    final List<Map<String, dynamic>> processed = [];

    for (var visit in visits) {
      try {
        if (visit is Map<String, dynamic>) {
          processed.add({
            'hospital': visit['hospital'] ?? visit['title'] ?? 'Hospital',
            'department':
                visit['department'] ?? visit['doctor'] ?? 'Department',
            'date': visit['date'] ?? visit['createdAt']?.toString() ?? 'Recent',
            'status': _determineStatus(visit['status']),
          });
        } else if (visit is Map) {
          // Handle generic Map type
          final Map<String, dynamic> convertedVisit =
              Map<String, dynamic>.from(visit);
          processed.add({
            'hospital': convertedVisit['hospital'] ??
                convertedVisit['title'] ??
                'Hospital',
            'department': convertedVisit['department'] ??
                convertedVisit['doctor'] ??
                'Department',
            'date': convertedVisit['date'] ??
                convertedVisit['createdAt']?.toString() ??
                'Recent',
            'status': _determineStatus(convertedVisit['status']),
          });
        }
      } catch (e) {
        print('Error processing visit data: $e');
      }
    }

    // If no valid data was processed, use default
    return processed.isNotEmpty ? processed : _getDefaultHistoryData();
  }

  List<Map<String, dynamic>> _getDefaultHistoryData() {
    return [
      {
        'hospital': 'City General Hospital',
        'department': 'Cardiology Department',
        'date': 'March 15, 2024 • 2:30 PM',
        'status': QueueStatus.completed,
      },
      {
        'hospital': 'Metro Medical Center',
        'department': 'Orthopedics Department',
        'date': 'March 8, 2024 • 10:15 AM',
        'status': QueueStatus.completed,
      },
      {
        'hospital': 'Sunrise Healthcare',
        'department': 'Dermatology Department',
        'date': 'February 28, 2024 • 4:45 PM',
        'status': QueueStatus.cancelled,
      },
      {
        'hospital': 'Regional Medical Plaza',
        'department': 'Internal Medicine',
        'date': 'February 20, 2024 • 11:30 AM',
        'status': QueueStatus.completed,
      },
      {
        'hospital': 'Valley Health Institute',
        'department': 'Neurology Department',
        'date': 'January 15, 2024 • 9:00 AM',
        'status': QueueStatus.completed,
      },
    ];
  }

  QueueStatus _determineStatus(dynamic status) {
    if (status is String) {
      final statusStr = status.toLowerCase();
      switch (statusStr) {
        case 'completed':
        case 'done':
        case 'finished':
          return QueueStatus.completed;
        case 'cancelled':
        case 'canceled':
          return QueueStatus.cancelled;
        case 'inprogress':
        case 'in_progress':
        case 'in progress':
          return QueueStatus.inProgress;
        case 'waiting':
        case 'pending':
          return QueueStatus.waiting;
        case 'noshow':
        case 'no_show':
        case 'no show':
          return QueueStatus.noShow;
        case 'called':
          return QueueStatus.called;
        default:
          return QueueStatus.completed;
      }
    }
    return QueueStatus.completed;
  }

  // ================= TOP BAR =================

  Widget _buildTopBar(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 55, 16, 16),
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
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            "Visit History",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ================= HISTORY CARD =================

class _HistoryCard extends StatelessWidget {
  final String hospital;
  final String department;
  final String date;
  final QueueStatus status;

  const _HistoryCard({
    required this.hospital,
    required this.department,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  hospital,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              StatusBadge(
                status: status,
                compact: true,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            department,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            date,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
