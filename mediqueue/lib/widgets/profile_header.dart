
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
    this.onPowerTap, required Color backgroundColor, required IconData icon, Future<void> Function()? onRefresh, required bool isLoading,
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
