import 'package:flutter/material.dart';
import 'package:mediqueue/utils/app_colors.dart';
import 'package:mediqueue/widgets/custom_text_field.dart';
import 'package:mediqueue/widgets/social_auth_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  String _userType = 'patient'; // 'patient' or 'admin'

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                // Logo and Title
                _buildLogoSection(),

                const SizedBox(height: 32),

                // Main Card with curved edges
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.08),
                        blurRadius: 25,
                        spreadRadius: 1,
                        offset: const Offset(0, 6),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.08),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        // Tab Bar with straight line indicator
                        _buildTabBar(),

                        const SizedBox(height: 28),

                        // Tab Content
                        _buildTabContent(),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Footer text
                Text(
                  "© 2024 MediQueue. All rights reserved.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Logo Section
  Widget _buildLogoSection() {
    return Column(
      children: [
        // Unique and aesthetic MediQueue text
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Medi with gradient
                ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primaryBlue,
                        AppColors.primaryBlue.withOpacity(0.8),
                      ],
                    ).createShader(bounds);
                  },
                  child: const Text(
                    "Medi",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                // Queue with different style
                Text(
                  "Queue",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey[900],
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),

            // Subtle divider line
            Container(
              width: 100,
              height: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryBlue.withOpacity(0.8),
                    Colors.grey[300]!.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Subtitle
            Text(
              "Smart Hospital Queue Management",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Tab Bar with straight line indicator
  Widget _buildTabBar() {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 3,
              color: AppColors.primaryBlue,
            ),
          ),
        ),
        indicatorPadding: EdgeInsets.zero,
        labelColor: AppColors.primaryBlue,
        unselectedLabelColor: Colors.grey[600],
        labelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        onTap: (index) {
          setState(() {
            _emailController.clear();
            _passwordController.clear();
          });
        },
        tabs: const [
          Tab(text: 'Create Account'),
          Tab(text: 'Log In'),
        ],
      ),
    );
  }

  // Tab Content
  Widget _buildTabContent() {
    return SizedBox(
      height: 480, // Increased height for user type selection
      child: TabBarView(
        controller: _tabController,
        children: [
          // Create Account Tab
          _buildCreateAccountForm(),

          // Login Tab
          _buildLoginForm(),
        ],
      ),
    );
  }

  // User Type Selection Widget
  Widget _buildUserTypeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          "I am a:",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            // Patient Option
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _userType = 'patient';
                  });
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: _userType == 'patient'
                        ? AppColors.primaryBlue.withOpacity(0.1)
                        : Colors.grey[50],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _userType == 'patient'
                          ? AppColors.primaryBlue
                          : Colors.grey[300]!,
                      width: _userType == 'patient' ? 2 : 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 20,
                        color: _userType == 'patient'
                            ? AppColors.primaryBlue
                            : Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Patient",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: _userType == 'patient'
                              ? AppColors.primaryBlue
                              : Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Admin Option
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _userType = 'admin';
                  });
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: _userType == 'admin'
                        ? AppColors.primaryBlue.withOpacity(0.1)
                        : Colors.grey[50],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _userType == 'admin'
                          ? AppColors.primaryBlue
                          : Colors.grey[300]!,
                      width: _userType == 'admin' ? 2 : 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.admin_panel_settings,
                        size: 20,
                        color: _userType == 'admin'
                            ? AppColors.primaryBlue
                            : Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Hospital Admin",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: _userType == 'admin'
                              ? AppColors.primaryBlue
                              : Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          _userType == 'patient'
              ? "Book appointments and join queues"
              : "Manage hospital queues and appointments",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  // Create Account Form
  Widget _buildCreateAccountForm() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Create Account",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "Let's get started by filling out the form below.",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),

          const SizedBox(height: 24),

          // Email Field
          CustomTextField(
            label: "Email",
            hintText: "Enter your email",
            controller: _emailController,
            prefixIcon: Icons.email_outlined,
          ),

          const SizedBox(height: 16),

          // Password Field
          CustomTextField(
            label: "Password",
            hintText: "Enter your password",
            obscureText: _obscurePassword,
            controller: _passwordController,
            prefixIcon: Icons.lock_outline,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[500],
                size: 20,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),

          // User Type Selection
          _buildUserTypeSelection(),

          const SizedBox(height: 24),

          // Get Started Button
          SizedBox(
            width: double.infinity,
            height: 46,
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: _handleCreateAccount,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
          ),

          const SizedBox(height: 24),

          // Divider
          _buildDivider("Or sign up with"),

          const SizedBox(height: 20),

          // Social Auth Buttons
          _buildSocialAuthButtons(),
        ],
      ),
    );
  }

  // Login Form
  Widget _buildLoginForm() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome Back",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "Fill out the information below in order to access your account.",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),

          const SizedBox(height: 24),

          // Email Field
          CustomTextField(
            label: "Email",
            hintText: "Enter your email",
            controller: _emailController,
            prefixIcon: Icons.email_outlined,
          ),

          const SizedBox(height: 16),

          // Password Field
          CustomTextField(
            label: "Password",
            hintText: "Enter your password",
            obscureText: _obscurePassword,
            controller: _passwordController,
            prefixIcon: Icons.lock_outline,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[500],
                size: 20,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),

          // User Type Selection for Login
          _buildUserTypeSelection(),

          const SizedBox(height: 12),

          // Forgot Password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                _showForgotPasswordDialog();
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: AppColors.primaryBlue,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Sign In Button
          SizedBox(
            width: double.infinity,
            height: 46,
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
          ),

          const SizedBox(height: 24),

          // Divider
          _buildDivider("Or sign in with"),

          const SizedBox(height: 20),

          // Social Auth Buttons
          _buildSocialAuthButtons(),
        ],
      ),
    );
  }

  // Divider
  Widget _buildDivider(String text) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
        ),
      ],
    );
  }

  // Social Auth Buttons
  Widget _buildSocialAuthButtons() {
    return Column(
      children: [
        // Google Button
        SocialAuthButton(
          text: "Continue with Google",
          icon: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.grey[300]!, width: 1),
            ),
            child: Center(
              child: Text(
                "G",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          textColor: Colors.black87,
          borderColor: Colors.grey[300]!,
          height: 44,
          fontSize: 14,
          onPressed: () {
            _handleSocialAuth('google');
          },
        ),

        const SizedBox(height: 10),

        // Apple Button
        SocialAuthButton(
          text: "Continue with Apple",
          icon: Container(
            width: 22,
            height: 22,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: const Center(
              child: Icon(
                Icons.apple,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          backgroundColor: Colors.black,
          textColor: Colors.white,
          borderColor: Colors.black,
          height: 44,
          fontSize: 14,
          onPressed: () {
            _handleSocialAuth('apple');
          },
        ),
      ],
    );
  }

  // Handle Create Account
  void _handleCreateAccount() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog("Please fill in all fields");
      return;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      _showErrorDialog("Please enter a valid email address");
      return;
    }

    if (password.length < 6) {
      _showErrorDialog("Password must be at least 6 characters long");
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // TODO: Implement Firebase Auth
    print("Creating $userType account with: $email");

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });

      // Navigate based on user type
      if (_userType == 'patient') {
        Navigator.pushReplacementNamed(context, "/patient-home");
      } else {
        Navigator.pushReplacementNamed(context, "/admin-dashboard");
      }
    });
  }

  // Handle Login
  void _handleLogin() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog("Please fill in all fields");
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // TODO: Implement Firebase Auth
    print("Logging in as $userType with: $email");

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });

      // Navigate based on user type
      if (_userType == 'patient') {
        Navigator.pushReplacementNamed(context, "/patient-home");
      } else {
        Navigator.pushReplacementNamed(context, "/admin-dashboard");
      }
    });
  }

  // Handle Social Auth
  void _handleSocialAuth(String provider) {
    setState(() {
      _isLoading = true;
    });

    print("Signing in with $provider as $_userType");

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });

      // Navigate based on user type
      if (_userType == 'patient') {
        Navigator.pushReplacementNamed(context, "/patient-home");
      } else {
        Navigator.pushReplacementNamed(context, "/admin-dashboard");
      }
    });
  }

  // Get user type string for display
  String get userType => _userType == 'patient' ? 'Patient' : 'Hospital Admin';

  // Show Forgot Password Dialog
  void _showForgotPasswordDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Forgot Password",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter your email address and we'll send you a link to reset your password.",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showSuccessDialog("Reset link sent to your email!");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
            ),
            child: const Text("Send Link"),
          ),
        ],
      ),
    );
  }

  // Show Error Dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Error",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // Show Success Dialog
  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Success",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
