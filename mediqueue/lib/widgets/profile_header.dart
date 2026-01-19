// // // // import 'package:flutter/material.dart';

// // // // class ProfileHeader extends StatelessWidget {
// // // //   final String name;
// // // //   final String role;
// // // //   final IconData icon;

// // // //   const ProfileHeader({
// // // //     super.key,
// // // //     required this.name,
// // // //     required this.role,
// // // //     required this.icon,
// // // //   });

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Column(
// // // //       children: [
// // // //         Container(
// // // //           padding: const EdgeInsets.all(20),
// // // //           decoration: BoxDecoration(
// // // //             color: Colors.blue.shade50,
// // // //             shape: BoxShape.circle,
// // // //             boxShadow: [
// // // //               BoxShadow(
// // // //                 color: Colors.blue.withOpacity(0.2),
// // // //                 blurRadius: 20,
// // // //                 spreadRadius: 5,
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           child: Icon(
// // // //             icon,
// // // //             size: 70,
// // // //             color: Colors.blue.shade600,
// // // //           ),
// // // //         ),
// // // //         const SizedBox(height: 16),
// // // //         Text(
// // // //           name,
// // // //           style: const TextStyle(
// // // //             fontSize: 24,
// // // //             fontWeight: FontWeight.bold,
// // // //           ),
// // // //         ),
// // // //         const SizedBox(height: 4),
// // // //         Text(
// // // //           role,
// // // //           style: TextStyle(
// // // //             fontSize: 16,
// // // //             color: Colors.grey.shade600,
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import '../utils/app_colors.dart';

// // // class ProfileHeader extends StatelessWidget {
// // //   final String name;
// // //   final String role;
// // //   final IconData icon;

// // //   const ProfileHeader({
// // //     super.key,
// // //     required this.name,
// // //     this.role = 'Patient',        // ✅ default value
// // //     this.icon = Icons.person,     // ✅ default value
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       color: AppColors.primaryBlue,
// // //       padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
// // //       child: Row(
// // //         children: [
// // //           Builder(
// // //             builder: (context) => IconButton(
// // //               icon: const Icon(Icons.menu, color: Colors.white),
// // //               onPressed: () => Scaffold.of(context).openDrawer(),
// // //             ),
// // //           ),
// // //           CircleAvatar(
// // //             radius: 18,
// // //             backgroundColor: Colors.white,
// // //             child: Icon(icon, color: AppColors.primaryBlue),
// // //           ),
// // //           const SizedBox(width: 10),
// // //           Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               Text(
// // //                 name,
// // //                 style: const TextStyle(
// // //                   color: Colors.white,
// // //                   fontSize: 18,
// // //                   fontWeight: FontWeight.w600,
// // //                 ),
// // //               ),
// // //               Text(
// // //                 role,
// // //                 style: const TextStyle(
// // //                   color: Colors.white70,
// // //                   fontSize: 13,
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';

// // class ProfileHeader extends StatelessWidget {
// //   final String name;
// //   final String role;
// //   final IconData icon;

// //   const ProfileHeader({
// //     super.key,
// //     required this.name,
// //     this.role = 'Patient',
// //     this.icon = Icons.person, required String subtitle, required Color backgroundColor,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
// //       decoration: const BoxDecoration(
// //         gradient: LinearGradient(
// //           colors: [
// //             Color(0xFF6EC6FF), // light blue
// //             Color(0xFF4D9DE0), // slightly darker blue
// //           ],
// //           begin: Alignment.topLeft,
// //           end: Alignment.bottomRight,
// //         ),
// //         borderRadius: BorderRadius.vertical(
// //           bottom: Radius.circular(24),
// //         ),
// //       ),
// //       child: Row(
// //         children: [
// //           // ☰ Drawer menu
// //           Builder(
// //             builder: (context) => IconButton(
// //               icon: const Icon(Icons.menu, color: Colors.white),
// //               onPressed: () => Scaffold.of(context).openDrawer(),
// //             ),
// //           ),

// //           const SizedBox(width: 6),

// //           CircleAvatar(
// //             radius: 18,
// //             backgroundColor: Colors.white,
// //             child: Icon(icon, color: Color(0xFF4D9DE0)),
// //           ),

// //           const SizedBox(width: 10),

// //           Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 name,
// //                 style: const TextStyle(
// //                   color: Colors.white,
// //                   fontSize: 18,
// //                   fontWeight: FontWeight.w600,
// //                 ),
// //               ),
// //               Text(
// //                 role,
// //                 style: const TextStyle(
// //                   color: Colors.white70,
// //                   fontSize: 13,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class ProfileHeader extends StatelessWidget {
//   final String name;
//   final String role;
//   final IconData icon;
//   final Color backgroundColor;
//   final VoidCallback? onMenuTap;
//   final VoidCallback? onPowerTap;

//   const ProfileHeader({
//     super.key,
//     required this.name,
//     this.role = 'Patient',
//     this.icon = Icons.person,
//     required this.backgroundColor,
//     this.onMenuTap,
//     this.onPowerTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             backgroundColor.withOpacity(0.85),
//             backgroundColor,
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: const BorderRadius.vertical(
//           bottom: Radius.circular(24),
//         ),
//       ),
//       child: Row(
//         children: [
//           // ☰ MENU
//           IconButton(
//             icon: const Icon(Icons.menu, color: Colors.white),
//             onPressed: onMenuTap,
//           ),

//           const SizedBox(width: 6),

//           // 👤 AVATAR
//           CircleAvatar(
//             radius: 18,
//             backgroundColor: Colors.white,
//             child: Icon(icon, color: backgroundColor),
//           ),

//           const SizedBox(width: 10),

//           // NAME + ROLE
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Text(
//                   role,
//                   style: const TextStyle(
//                     color: Colors.white70,
//                     fontSize: 13,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // ⏻ POWER BUTTON (optional)
//           if (onPowerTap != null)
//             IconButton(
//               icon: const Icon(
//                 Icons.power_settings_new,
//                 color: Colors.white,
//               ),
//               onPressed: onPowerTap,
//             ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import '../utils/app_colors.dart'; // Make sure you have this file

class ProfileHeader extends StatelessWidget {
  final String name;
  final String role;
  final VoidCallback onMenuTap;
  final VoidCallback? onPowerTap;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.role,
    required this.onMenuTap,
    this.onPowerTap, required Color backgroundColor, required IconData icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBlue, // ✅ SOLID COLOR (no gradient)
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
      child: Row(
        children: [
          // ☰ Menu
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: onMenuTap,
          ),

          const SizedBox(width: 6),

          // 👤 Avatar
          const CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: AppColors.primaryBlue),
          ),

          const SizedBox(width: 10),

          // 👤 Name + Role
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

          const Spacer(),

          // ⏻ Power icon
          if (onPowerTap != null)
            IconButton(
              icon: const Icon(
                Icons.power_settings_new,
                color: Colors.white,
              ),
              onPressed: onPowerTap,
            ),
        ],
      ),
    );
  }
}
