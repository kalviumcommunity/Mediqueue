import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
    super.dispose();
  }

  Future<void> _handleLogin() async {
    // Validate input
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

    setState(() => _isLoading = true);

    try {
      final result = await _authService.login(
        emailController.text.trim(),
        passwordController.text,
      );

      if (!mounted) return;

      if (result['success']) {
        // Role-based navigation
        if (_selectedRole == 'patient') {
          Navigator.pushReplacementNamed(context, "/patient-home");
        } else {
          Navigator.pushReplacementNamed(context, "/admin-dashboard");
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result['error'] ?? "Login failed")),
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
      appBar: AppBar(title: const Text("Login")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Icon(
              Icons.login,
              size: 80,
              color: Colors.blue.shade600,
            ),
            const SizedBox(height: 24),
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Login to continue',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
              enabled: !_isLoading,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
              enabled: !_isLoading,
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
                        'Login as:',
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
                        child: RadioListTile<String>(
                          title: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.person, size: 20),
                              SizedBox(width: 8),
                              Text('Patient'),
                            ],
                          ),
                          value: 'patient',
                          groupValue: _selectedRole,
                          onChanged: _isLoading
                              ? null
                              : (value) {
                                  setState(() {
                                    _selectedRole = value!;
                                  });
                                },
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.admin_panel_settings, size: 20),
                              SizedBox(width: 8),
                              Text('Admin'),
                            ],
                          ),
                          value: 'admin',
                          groupValue: _selectedRole,
                          onChanged: _isLoading
                              ? null
                              : (value) {
                                  setState(() {
                                    _selectedRole = value!;
                                  });
                                },
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, "/signup"),
                  child: const Text("Sign Up"),
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
