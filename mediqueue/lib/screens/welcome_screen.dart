import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  Future<void> _handleRoleSelection(BuildContext context, String role) async {
    // Check if user is logged in
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is logged in, navigate to appropriate dashboard
      if (role == 'patient') {
        Navigator.pushNamed(context, '/patient-home');
      } else {
        Navigator.pushNamed(context, '/admin-dashboard');
      }
    } else {
      // User is not logged in, redirect to login with role info
      await Navigator.pushNamed(
        context,
        '/login',
        arguments: {'intendedRole': role},
      );

      // If login was successful, the login screen handles navigation
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo and App Name
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.medical_services_rounded,
                      size: 80,
                      color: Colors.blue.shade600,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // App Title
                  const Text(
                    'MediQueue',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1976D2),
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Tagline
                  Text(
                    'Smart Hospital Queue Management',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Features List
                  _buildFeatureItem(
                    Icons.schedule,
                    'Skip the waiting room',
                  ),
                  const SizedBox(height: 12),
                  _buildFeatureItem(
                    Icons.notifications_active,
                    'Real-time queue updates',
                  ),
                  const SizedBox(height: 12),
                  _buildFeatureItem(
                    Icons.qr_code_scanner,
                    'Quick QR code check-in',
                  ),
                  const SizedBox(height: 48),

                  // User Type Selection Card
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const Text(
                            'Choose Your Role',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF424242),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Patient Button
                          _buildNavigationButton(
                            context,
                            label: 'I\'m a Patient',
                            icon: Icons.person,
                            color: Colors.blue,
                            onPressed: () {
                              _handleRoleSelection(context, 'patient');
                            },
                          ),
                          const SizedBox(height: 16),

                          // Admin/Hospital Staff Button
                          _buildNavigationButton(
                            context,
                            label: 'Hospital Staff',
                            icon: Icons.admin_panel_settings,
                            color: Colors.green,
                            onPressed: () {
                              _handleRoleSelection(context, 'admin');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Auth Links
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text('Login'),
                      ),
                      const Text('|'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.blue.shade600, size: 24),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF616161),
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 28),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
      ),
    );
  }
}
