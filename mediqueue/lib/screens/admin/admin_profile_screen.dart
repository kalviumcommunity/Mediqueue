import 'package:flutter/material.dart';
import '../../widgets/profile_header.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Admin Profile')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF0F7FF),
              Color(0xFFE6F3FF),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const ProfileHeader(
                  name: 'Dr. Alex Morgan',
                  role: 'Hospital Staff',
                  icon: Icons.admin_panel_settings,
                ),
                const SizedBox(height: 32),
                screenWidth > 600
                    ? Row(
                        children: [
                          Expanded(child: _buildAdminInfoCard()),
                          const SizedBox(width: 16),
                          Expanded(child: _buildAdminActions()),
                        ],
                      )
                    : Column(
                        children: [
                          _buildAdminInfoCard(),
                          const SizedBox(height: 16),
                          _buildAdminActions(),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAdminInfoCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Staff Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16),
            _InfoRow(icon: Icons.local_hospital, text: 'City Care Hospital'),
            _InfoRow(icon: Icons.badge, text: 'Staff ID: ADM1023'),
            _InfoRow(icon: Icons.apartment, text: 'Department: OPD'),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminActions() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.settings),
              label: const Text('Manage Account'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 12),
          Text(text),
        ],
      ),
    );
  }
}
