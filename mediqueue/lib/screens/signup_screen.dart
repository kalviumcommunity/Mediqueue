import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_action_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String _selectedRole = 'patient'; // Default role

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Get the intended role from navigation arguments if provided
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null && args['intendedRole'] != null) {
      setState(() {
        _selectedRole = args['intendedRole'];
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    // Validate input
    if (nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter your name")),
      );
      return;
    }

    if (emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter your email")),
      );
      return;
    }

    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter your password")),
      );
      return;
    }

    if (passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password must be at least 6 characters")),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final result = await _authService.signUp(
        emailController.text.trim(),
        passwordController.text,
      );

      if (!mounted) return;

      if (result['success']) {
        // Store role information (in a real app, save to Firestore)
        // For now, just navigate based on selected role
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Account created as ${_selectedRole == 'patient' ? 'Patient' : 'Admin'}'),
            backgroundColor: Colors.green,
          ),
        );

        // Role-based navigation
        if (_selectedRole == 'patient') {
          Navigator.pushReplacementNamed(context, "/patient-home");
        } else {
          Navigator.pushReplacementNamed(context, "/admin-dashboard");
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result['error'] ?? "Signup failed")),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Icon(
              Icons.person_add,
              size: 80,
              color: Colors.blue.shade600,
            ),
            const SizedBox(height: 24),
            const Text(
              'Create Account',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Sign up to get started',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 32),
            CustomTextField(
              controller: nameController,
              label: "Full Name",
              prefixIcon: Icons.person,
              enabled: !_isLoading, hintText: '', helperText: '',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: emailController,
              label: "Email",
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              enabled: !_isLoading, hintText: '', helperText: '',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: passwordController,
              label: "Password",
              prefixIcon: Icons.lock,
              obscureText: true,
              helperText: "At least 6 characters",
              enabled: !_isLoading, hintText: '',
            ),
            const SizedBox(height: 20),

            // Role Selection
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_outline,
                          color: Colors.blue.shade700, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'I am a:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: _isLoading
                              ? null
                              : () {
                                  setState(() {
                                    _selectedRole = 'patient';
                                  });
                                },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  margin:
                                      const EdgeInsets.only(left: 12, right: 8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: _selectedRole == 'patient'
                                          ? Colors.blue
                                          : Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                  child: _selectedRole == 'patient'
                                      ? Center(
                                          child: Container(
                                            width: 10,
                                            height: 10,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        )
                                      : null,
                                ),
                                const Icon(Icons.person, size: 20),
                                const SizedBox(width: 8),
                                const Text('Patient'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: _isLoading
                              ? null
                              : () {
                                  setState(() {
                                    _selectedRole = 'admin';
                                  });
                                },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  margin:
                                      const EdgeInsets.only(left: 12, right: 8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: _selectedRole == 'admin'
                                          ? Colors.blue
                                          : Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                  child: _selectedRole == 'admin'
                                      ? Center(
                                          child: Container(
                                            width: 10,
                                            height: 10,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        )
                                      : null,
                                ),
                                const Icon(Icons.admin_panel_settings,
                                    size: 20),
                                const SizedBox(width: 8),
                                const Text('Admin'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CustomActionButton(
              label: "Sign Up",
              onPressed: _handleSignup,
              icon: Icons.person_add,
              type: ButtonType.primary,
              isLoading: _isLoading,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, "/login"),
                  child: const Text("Login"),
                ),
              ],
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, "/"),
              child: const Text("Back to Welcome"),
            ),
          ],
        ),
      ),
    );
  }
}
