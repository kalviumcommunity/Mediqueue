// import 'package:flutter/material.dart';

// class ProfileHeader extends StatelessWidget {
//   final String name;
//   final String role;
//   final IconData icon;

//   const ProfileHeader({
//     super.key,
//     required this.name,
//     required this.role,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.blue.shade50,
//             shape: BoxShape.circle,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.blue.withOpacity(0.2),
//                 blurRadius: 20,
//                 spreadRadius: 5,
//               ),
//             ],
//           ),
//           child: Icon(
//             icon,
//             size: 70,
//             color: Colors.blue.shade600,
//           ),
//         ),
//         const SizedBox(height: 16),
//         Text(
//           name,
//           style: const TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           role,
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.grey.shade600,
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String role;
  final IconData icon;

  const ProfileHeader({
    super.key,
    required this.name,
    this.role = 'Patient',        // ✅ default value
    this.icon = Icons.person,     // ✅ default value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBlue,
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
      child: Row(
        children: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: Icon(icon, color: AppColors.primaryBlue),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                role,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
