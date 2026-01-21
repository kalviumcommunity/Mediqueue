// import 'package:flutter/material.dart';

// class JoinQueueStatusScreen extends StatelessWidget {
//   final String departmentName;

//   const JoinQueueStatusScreen({
//     super.key,
//     required this.departmentName,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       appBar: AppBar(
//         title: const Text(
//           "My Queue",
//           style: TextStyle(color: Colors.black),
//         ),
//         leading: const BackButton(color: Colors.black),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 16.0),
//             child: Icon(Icons.location_on, color: Colors.black),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             _queueDetailsCard(),
//             const SizedBox(height: 24),
//             _recentActivityCard(),
//             const SizedBox(height: 24),
//             _importantInfoCard(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _queueDetailsCard() {
//     const currentServing = 8;
//     const totalPatients = 25;
//     const avgTime = 12; // in minutes

//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Queue Details - $departmentName",
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Text(
//                   "ACTIVE",
//                   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),

//           // Position, Wait, Doctor
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               _detailColumn("Current Position", "#13", Colors.blue),
//               _detailColumn("Estimated Wait", "45 min", Colors.red),
//               _detailColumn("Doctor Available", "Dr. Sarah Wilson", Colors.black),
//             ],
//           ),
//           const SizedBox(height: 16),

//           // Queue Progress Box
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.blue.shade50,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("$currentServing/$totalPatients patients",
//                         style: const TextStyle(fontWeight: FontWeight.bold)),
//                     Text("Avg. time: $avgTime min",
//                         style: TextStyle(color: Colors.grey.shade700)),
//                   ],
//                 ),
//                 const SizedBox(height: 6),
//                 LinearProgressIndicator(
//                   value: currentServing / totalPatients,
//                   color: const Color.fromARGB(255, 39, 144, 176),
//                   backgroundColor: const Color.fromARGB(255, 190, 223, 231),
//                   minHeight: 10,
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   "Currently serving #$currentServing",
//                   style: TextStyle(color: Colors.grey.shade700),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _recentActivityCard() {
//     final recentActivities = [
//       {"text": "Patient #7 completed consultation", "color": Colors.green, "time": "2 minutes ago"},
//       {"text": "Patient #8 called for consultation", "color": Colors.blue, "time": "5 minutes ago"},
//       {"text": "New patient joined queue (#25)", "color": Colors.teal, "time": "8 minutes ago"},
//     ];

//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Recent Queue Activity",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 12),
//           ...recentActivities.map(
//             (activity) => Padding(
//               padding: const EdgeInsets.symmetric(vertical: 4),
//               child: Row(
//                 children: [
//                   Icon(Icons.circle, size: 10, color: activity["color"] as Color),
//                   const SizedBox(width: 8),
//                   Expanded(child: Text(activity["text"] as String)),
//                   Text(activity["time"] as String, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _importantInfoCard() {
//     final infoList = [
//       "Please arrive 10 minutes before your estimated time",
//       "Bring your ID and insurance card",
//       "Queue position may change based on emergency",
//     ];

//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.blue.shade50,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Icon(Icons.info, color: Color.fromARGB(255, 39, 144, 176)),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Important Information",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 39, 144, 176),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 ...infoList.map((item) => Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 2),
//                       child: Row(
//                         children: [
//                           const Text("• ", style: TextStyle(color: Color.fromARGB(255, 39, 144, 176))),
//                           Expanded(child: Text(item)),
//                         ],
//                       ),
//                     )),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   static Widget _detailColumn(String title, String value, Color valueColor) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: TextStyle(color: Colors.grey.shade700, fontSize: 12)),
//         const SizedBox(height: 4),
//         Text(
//           value,
//           style: TextStyle(fontWeight: FontWeight.bold, color: valueColor),
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';

class JoinQueueStatusScreen extends StatelessWidget {
  final String departmentName;

  const JoinQueueStatusScreen({
    super.key,
    required this.departmentName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          flexibleSpace: Container(
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
          ),
          title: const Text(
            "My Queue",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: const BackButton(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.location_on, color: Colors.white),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _queueDetailsCard(),
            const SizedBox(height: 24),
            _recentActivityCard(),
            const SizedBox(height: 24),
            _importantInfoCard(),
          ],
        ),
      ),
    );
  }

  Widget _queueDetailsCard() {
    const currentServing = 8;
    const totalPatients = 25;
    const avgTime = 12; // in minutes

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Queue Details - $departmentName",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "ACTIVE",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Position, Wait, Doctor
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _detailColumn("Current Position", "#13", Colors.blue),
              _detailColumn("Estimated Wait", "45 min", Colors.red),
              _detailColumn("Doctor Available", "Dr. Sarah Wilson", Colors.black),
            ],
          ),
          const SizedBox(height: 16),

          // Queue Progress Box
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$currentServing/$totalPatients patients",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text("Avg. time: $avgTime min",
                        style: TextStyle(color: Colors.grey.shade700)),
                  ],
                ),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  value: currentServing / totalPatients,
                  color: const Color.fromRGBO(13, 27, 140, 1), // gradient primary color
                  backgroundColor: const Color.fromARGB(255, 190, 223, 231),
                  minHeight: 10,
                ),
                const SizedBox(height: 6),
                Text(
                  "Currently serving #$currentServing",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _recentActivityCard() {
    final recentActivities = [
      {"text": "Patient #7 completed consultation", "color": Colors.green, "time": "2 minutes ago"},
      {"text": "Patient #8 called for consultation", "color": Colors.blue, "time": "5 minutes ago"},
      {"text": "New patient joined queue (#25)", "color": Colors.teal, "time": "8 minutes ago"},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent Queue Activity",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...recentActivities.map(
            (activity) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Icon(Icons.circle, size: 10, color: activity["color"] as Color),
                  const SizedBox(width: 8),
                  Expanded(child: Text(activity["text"] as String)),
                  Text(activity["time"] as String, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _importantInfoCard() {
    final infoList = [
      "Please arrive 10 minutes before your estimated time",
      "Bring your ID and insurance card",
      "Queue position may change based on emergency",
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info, color: Color.fromRGBO(13, 27, 140, 1)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Important Information",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(13, 27, 140, 1),
                  ),
                ),
                const SizedBox(height: 8),
                ...infoList.map((item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          const Text("• ", style: TextStyle(color: Color.fromRGBO(13, 27, 140, 1))),
                          Expanded(child: Text(item)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _detailColumn(String title, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.grey.shade700, fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, color: valueColor),
        ),
      ],
    );
  }
}
