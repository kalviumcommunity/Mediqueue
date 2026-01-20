
// import 'package:flutter/material.dart';
// import '../utils/app_colors.dart';

// class HospitalCard extends StatelessWidget {
//   final Color iconBg;
//   final IconData icon;
//   final Color iconColor;
//   final String name;
//   final String distance;

//   const HospitalCard({
//     super.key,
//     required this.iconBg,
//     required this.icon,
//     required this.iconColor,
//     required this.name,
//     required this.distance,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 14),
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: Row(
//         children: [
//           Container(
//             height: 56,
//             width: 56,
//             decoration: BoxDecoration(
//               color: iconBg,
//               borderRadius: BorderRadius.circular(14),
//             ),
//             child: Icon(icon, color: iconColor, size: 28),
//           ),
//           const SizedBox(width: 14),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 15,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     const Icon(Icons.location_on,
//                         size: 14, color: Colors.grey),
//                     const SizedBox(width: 4),
//                     Text(
//                       distance,
//                       style: const TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.buttonBlue,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//             child: const Text('Open'),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  final Color iconBg;
  final IconData icon;
  final Color iconColor;
  final String name;
  final String distance;
  final String department;
  final String rating;
  final String waitTime;
  final VoidCallback onOpen;

  const HospitalCard({
    super.key,
    required this.iconBg,
    required this.icon,
    required this.iconColor,
    required this.name,
    required this.distance,
    required this.department,
    required this.rating,
    required this.waitTime,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Hospital Icon
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),

          const SizedBox(width: 14),

          /// Hospital Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Name
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 4),

                /// Distance
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      distance,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                /// Department
                Text(
                  'Department: $department',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 4),

                /// Rating & Wait Time
                Row(
                  children: [
                    const Icon(Icons.star,
                        size: 14, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(fontSize: 13),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.timer,
                        size: 14, color: Colors.blueGrey),
                    const SizedBox(width: 4),
                    Text(
                      waitTime,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Open Button
          ElevatedButton(
            onPressed: onOpen,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 69, 132, 248),
              foregroundColor: Colors.white, // ✅ text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Open',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
