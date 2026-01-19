import 'package:flutter/material.dart';
import '../widgets/custom_action_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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

                  // Call-to-Action Card
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          const Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF424242),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Join thousands managing their hospital visits',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Login Button
                          CustomActionButton(
                            label: 'Login',
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            icon: Icons.login,
                            type: ButtonType.primary,
                          ),
                          const SizedBox(height: 16),

                          // Sign Up Button
                          CustomActionButton(
                            label: 'Sign Up',
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            icon: Icons.person_add,
                            type: ButtonType.secondary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Footer text
                  Text(
                    'Experience hassle-free hospital visits',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                      fontStyle: FontStyle.italic,
                    ),
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
}
