// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:mediqueue/utils/app_colors.dart';
// import 'package:mediqueue/utils/logout_notifier.dart';
// import 'package:mediqueue/widgets/custom_text_field.dart';
// import 'package:mediqueue/widgets/social_auth_button.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   bool _isLoading = false;
//   bool _obscurePassword = true;
//   String _userType = 'patient'; // 'patient' or 'admin'

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);

//     // ✅ Check for logout message when screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _checkForLogoutMessage();
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   // ✅ New method to check for logout message
//   void _checkForLogoutMessage() {
//     if (LogoutNotifier.getAndClearShouldShowMessage() && mounted) {
//       _showLogoutSuccessMessage();
//     }
//   }

//   // ✅ New method to show logout success message
//   void _showLogoutSuccessMessage() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Row(
//           children: [
//             const Icon(Icons.check_circle, color: Colors.white, size: 20),
//             const SizedBox(width: 8),
//             const Expanded(
//               child: Text(
//                 'Logged out successfully!',
//                 style: TextStyle(fontSize: 14),
//               ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.close, size: 18, color: Colors.white),
//               onPressed: () {
//                 ScaffoldMessenger.of(context).hideCurrentSnackBar();
//               },
//               padding: EdgeInsets.zero,
//               constraints: const BoxConstraints(),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.green,
//         duration: const Duration(seconds: 4),
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         margin: const EdgeInsets.all(20),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//             child: Column(
//               children: [
//                 _buildLogoSection(),
//                 const SizedBox(height: 32),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.08),
//                         blurRadius: 25,
//                         spreadRadius: 1,
//                         offset: const Offset(0, 6),
//                       ),
//                     ],
//                     border: Border.all(
//                       color: Colors.grey.withOpacity(0.08),
//                       width: 1,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(24),
//                     child: Column(
//                       children: [
//                         _buildTabBar(),
//                         const SizedBox(height: 28),
//                         _buildTabContent(),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 Text(
//                   "© 2024 MediQueue. All rights reserved.",
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLogoSection() {
//     return Column(
//       children: [
//         Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ShaderMask(
//                   shaderCallback: (bounds) {
//                     return LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         AppColors.primaryBlue,
//                         AppColors.primaryBlue.withOpacity(0.8),
//                       ],
//                     ).createShader(bounds);
//                   },
//                   child: const Text(
//                     "Medi",
//                     style: TextStyle(
//                       fontSize: 36,
//                       fontWeight: FontWeight.w800,
//                       color: Colors.white,
//                       letterSpacing: -0.5,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   "Queue",
//                   style: TextStyle(
//                     fontSize: 36,
//                     fontWeight: FontWeight.w800,
//                     color: Colors.grey[900],
//                     letterSpacing: -0.5,
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               width: 100,
//               height: 3,
//               margin: const EdgeInsets.symmetric(vertical: 8),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     AppColors.primaryBlue.withOpacity(0.8),
//                     Colors.grey[300]!.withOpacity(0.8),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//             Text(
//               "Smart Hospital Queue Management",
//               style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey[600],
//                 letterSpacing: 0.3,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildTabBar() {
//     return Container(
//       height: 44,
//       decoration: BoxDecoration(
//         color: Colors.grey[50],
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: TabBar(
//         controller: _tabController,
//         indicator: const BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               width: 3,
//               color: AppColors.primaryBlue,
//             ),
//           ),
//         ),
//         indicatorPadding: EdgeInsets.zero,
//         labelColor: AppColors.primaryBlue,
//         unselectedLabelColor: Colors.grey[600],
//         labelStyle: const TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.w600,
//         ),
//         unselectedLabelStyle: const TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.w500,
//         ),
//         onTap: (index) {
//           setState(() {
//             _emailController.clear();
//             _passwordController.clear();
//           });
//         },
//         tabs: const [
//           Tab(text: 'Create Account'),
//           Tab(text: 'Log In'),
//         ],
//       ),
//     );
//   }

//   Widget _buildTabContent() {
//     return SizedBox(
//       height: 480,
//       child: TabBarView(
//         controller: _tabController,
//         children: [
//           _buildCreateAccountForm(),
//           _buildLoginForm(),
//         ],
//       ),
//     );
//   }

//   Widget _buildUserTypeSelection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 16),
//         Text(
//           "I am a:",
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//             color: Colors.black87,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Row(
//           children: [
//             Expanded(
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _userType = 'patient';
//                   });
//                 },
//                 child: Container(
//                   height: 48,
//                   decoration: BoxDecoration(
//                     color: _userType == 'patient'
//                         ? AppColors.primaryBlue.withOpacity(0.1)
//                         : Colors.grey[50],
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       color: _userType == 'patient'
//                           ? AppColors.primaryBlue
//                           : Colors.grey[300]!,
//                       width: _userType == 'patient' ? 2 : 1.5,
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.person,
//                         size: 20,
//                         color: _userType == 'patient'
//                             ? AppColors.primaryBlue
//                             : Colors.grey[600],
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         "Patient",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: _userType == 'patient'
//                               ? AppColors.primaryBlue
//                               : Colors.grey[700],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _userType = 'admin';
//                   });
//                 },
//                 child: Container(
//                   height: 48,
//                   decoration: BoxDecoration(
//                     color: _userType == 'admin'
//                         ? AppColors.primaryBlue.withOpacity(0.1)
//                         : Colors.grey[50],
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       color: _userType == 'admin'
//                           ? AppColors.primaryBlue
//                           : Colors.grey[300]!,
//                       width: _userType == 'admin' ? 2 : 1.5,
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.admin_panel_settings,
//                         size: 20,
//                         color: _userType == 'admin'
//                             ? AppColors.primaryBlue
//                             : Colors.grey[600],
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         "Hospital Admin",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: _userType == 'admin'
//                               ? AppColors.primaryBlue
//                               : Colors.grey[700],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 4),
//         Text(
//           _userType == 'patient'
//               ? "Book appointments and join queues"
//               : "Manage hospital queues and appointments",
//           style: TextStyle(
//             fontSize: 12,
//             color: Colors.grey[600],
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildCreateAccountForm() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Create Account",
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.w700,
//               color: Colors.black87,
//             ),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             "Let's get started by filling out the form below.",
//             style: TextStyle(
//               fontSize: 13,
//               color: Colors.grey[600],
//               height: 1.4,
//             ),
//           ),
//           const SizedBox(height: 24),
//           CustomTextField(
//             label: "Email",
//             hintText: "Enter your email",
//             controller: _emailController,
//             prefixIcon: Icons.email_outlined,
//             enabled: !_isLoading,
//           ),
//           const SizedBox(height: 16),
//           CustomTextField(
//             label: "Password",
//             hintText: "Enter your password",
//             obscureText: _obscurePassword,
//             controller: _passwordController,
//             prefixIcon: Icons.lock_outline,
//             enabled: !_isLoading,
//             suffixIcon: IconButton(
//               icon: Icon(
//                 _obscurePassword ? Icons.visibility_off : Icons.visibility,
//                 color: Colors.grey[500],
//                 size: 20,
//               ),
//               onPressed: () {
//                 setState(() {
//                   _obscurePassword = !_obscurePassword;
//                 });
//               },
//             ),
//           ),
//           _buildUserTypeSelection(),
//           const SizedBox(height: 24),
//           SizedBox(
//             width: double.infinity,
//             height: 46,
//             child: _isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : ElevatedButton(
//                     onPressed: _handleCreateAccount,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primaryBlue,
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 0,
//                     ),
//                     child: const Text(
//                       "Get Started",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//           ),
//           const SizedBox(height: 24),
//           _buildDivider("Or sign up with"),
//           const SizedBox(height: 20),
//           _buildSocialAuthButtons(),
//         ],
//       ),
//     );
//   }

//   Widget _buildLoginForm() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Welcome Back",
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.w700,
//               color: Colors.black87,
//             ),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             "Fill out the information below in order to access your account.",
//             style: TextStyle(
//               fontSize: 13,
//               color: Colors.grey[600],
//               height: 1.4,
//             ),
//           ),
//           const SizedBox(height: 24),
//           CustomTextField(
//             label: "Email",
//             hintText: "Enter your email",
//             controller: _emailController,
//             prefixIcon: Icons.email_outlined,
//           ),
//           const SizedBox(height: 16),
//           CustomTextField(
//             label: "Password",
//             hintText: "Enter your password",
//             obscureText: _obscurePassword,
//             controller: _passwordController,
//             prefixIcon: Icons.lock_outline,
//             suffixIcon: IconButton(
//               icon: Icon(
//                 _obscurePassword ? Icons.visibility_off : Icons.visibility,
//                 color: Colors.grey[500],
//                 size: 20,
//               ),
//               onPressed: () {
//                 setState(() {
//                   _obscurePassword = !_obscurePassword;
//                 });
//               },
//             ),
//           ),
//           _buildUserTypeSelection(),
//           const SizedBox(height: 12),
//           Align(
//             alignment: Alignment.centerRight,
//             child: TextButton(
//               onPressed: () {
//                 _showForgotPasswordDialog();
//               },
//               style: TextButton.styleFrom(
//                 padding: EdgeInsets.zero,
//               ),
//               child: Text(
//                 "Forgot Password?",
//                 style: TextStyle(
//                   color: AppColors.primaryBlue,
//                   fontSize: 13,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           SizedBox(
//             width: double.infinity,
//             height: 46,
//             child: _isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : ElevatedButton(
//                     onPressed: _handleLogin,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primaryBlue,
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 0,
//                     ),
//                     child: const Text(
//                       "Sign In",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//           ),
//           const SizedBox(height: 24),
//           _buildDivider("Or sign in with"),
//           const SizedBox(height: 20),
//           _buildSocialAuthButtons(),
//         ],
//       ),
//     );
//   }

//   Widget _buildDivider(String text) {
//     return Row(
//       children: [
//         Expanded(
//           child: Divider(
//             color: Colors.grey[300],
//             thickness: 1,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           child: Text(
//             text,
//             style: TextStyle(
//               color: Colors.grey[500],
//               fontSize: 13,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         Expanded(
//           child: Divider(
//             color: Colors.grey[300],
//             thickness: 1,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildSocialAuthButtons() {
//     return Column(
//       children: [
//         SocialAuthButton(
//           text: "Continue with Google",
//           icon: Container(
//             width: 22,
//             height: 22,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white,
//               border: Border.all(color: Colors.grey[300]!, width: 1),
//             ),
//             child: Center(
//               child: Text(
//                 "G",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey[700],
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//           ),
//           backgroundColor: Colors.white,
//           textColor: Colors.black87,
//           borderColor: Colors.grey[300]!,
//           height: 44,
//           fontSize: 14,
//           onPressed: () {
//             _handleSocialAuth('google');
//           },
//         ),
//         const SizedBox(height: 10),
//         SocialAuthButton(
//           text: "Continue with Apple",
//           icon: Container(
//             width: 22,
//             height: 22,
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.black,
//             ),
//             child: const Center(
//               child: Icon(
//                 Icons.apple,
//                 color: Colors.white,
//                 size: 16,
//               ),
//             ),
//           ),
//           backgroundColor: Colors.black,
//           textColor: Colors.white,
//           borderColor: Colors.black,
//           height: 44,
//           fontSize: 14,
//           onPressed: () {
//             _handleSocialAuth('apple');
//           },
//         ),
//       ],
//     );
//   }

//   void _handleCreateAccount() async {
//     final email = _emailController.text.trim();
//     final password = _passwordController.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//       _showErrorDialog("Please fill in all fields");
//       return;
//     }

//     if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
//       _showErrorDialog("Please enter a valid email address");
//       return;
//     }

//     if (password.length < 6) {
//       _showErrorDialog("Password must be at least 6 characters long");
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final UserCredential userCredential =
//           await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       final user = userCredential.user;

//       if (user != null) {
//         await user.sendEmailVerification();

//         print("✅ Account created successfully!");
//         print("User ID: ${user.uid}");
//         print("Email: ${user.email}");
//         print("User Type: $_userType");

//         _showSuccessDialog("Account created successfully! "
//             "Please check your email to verify your account. "
//             "You can now log in.");

//         _emailController.clear();
//         _passwordController.clear();

//         _tabController.animateTo(1);
//       }
//     } on FirebaseAuthException catch (e) {
//       String errorMessage = "An error occurred";

//       if (e.code == 'email-already-in-use') {
//         errorMessage =
//             "This email is already registered. Please log in instead.";
//       } else if (e.code == 'invalid-email') {
//         errorMessage = "Invalid email address format.";
//       } else if (e.code == 'weak-password') {
//         errorMessage = "Password is too weak. Use at least 6 characters.";
//       } else if (e.code == 'operation-not-allowed') {
//         errorMessage = "Email/password accounts are not enabled.";
//       }

//       _showErrorDialog(errorMessage);
//     } catch (e) {
//       _showErrorDialog("Failed to create account: $e");
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _handleLogin() async {
//     final email = _emailController.text.trim();
//     final password = _passwordController.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//       _showErrorDialog("Please fill in all fields");
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final UserCredential userCredential =
//           await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       final user = userCredential.user;

//       if (user != null) {
//         print("✅ Login successful!");
//         print("User ID: ${user.uid}");
//         print("Email: ${user.email}");
//         print("User Type: $_userType");

//         _emailController.clear();
//         _passwordController.clear();
//       }
//     } on FirebaseAuthException catch (e) {
//       String errorMessage = "Login failed";

//       if (e.code == 'user-not-found') {
//         errorMessage = "No account found with this email.";
//       } else if (e.code == 'wrong-password') {
//         errorMessage = "Incorrect password. Please try again.";
//       } else if (e.code == 'invalid-email') {
//         errorMessage = "Invalid email address format.";
//       } else if (e.code == 'user-disabled') {
//         errorMessage = "This account has been disabled.";
//       } else if (e.code == 'too-many-requests') {
//         errorMessage = "Too many attempts. Try again later.";
//       }

//       _showErrorDialog(errorMessage);
//     } catch (e) {
//       _showErrorDialog("Login failed: $e");
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _handleSocialAuth(String provider) {
//     _showErrorDialog("$provider authentication is not yet implemented. "
//         "Please use email and password for now.");
//   }

//   void _showForgotPasswordDialog() {
//     final emailController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) => StatefulBuilder(
//         builder: (context, setState) {
//           bool isLoading = false;

//           return AlertDialog(
//             title: const Text(
//               "Reset Password",
//               style: TextStyle(fontWeight: FontWeight.w600),
//             ),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Enter your email address and we'll send you a password reset link.",
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: 14,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 TextField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     hintText: "Enter your email",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: Colors.grey[300]!),
//                     ),
//                     filled: true,
//                     fillColor: Colors.grey[50],
//                   ),
//                 ),
//               ],
//             ),
//             actions: [
//               if (isLoading)
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: CircularProgressIndicator(),
//                 )
//               else
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text("Cancel"),
//                 ),
//               if (!isLoading)
//                 ElevatedButton(
//                   onPressed: () async {
//                     final email = emailController.text.trim();

//                     if (email.isEmpty) {
//                       _showErrorDialog("Please enter your email address");
//                       return;
//                     }

//                     if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
//                         .hasMatch(email)) {
//                       _showErrorDialog("Please enter a valid email address");
//                       return;
//                     }

//                     setState(() => isLoading = true);

//                     try {
//                       await _auth.sendPasswordResetEmail(email: email);
//                       Navigator.pop(context);
//                       _showSuccessDialog("Password reset link sent to $email. "
//                           "Please check your inbox.");
//                     } on FirebaseAuthException catch (e) {
//                       Navigator.pop(context);
//                       _showErrorDialog(
//                           "Failed to send reset email: ${e.message}");
//                     } catch (e) {
//                       Navigator.pop(context);
//                       _showErrorDialog("Failed to send reset email: $e");
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.primaryBlue,
//                   ),
//                   child: const Text("Send Link"),
//                 ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text(
//           "Error",
//           style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
//         ),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showSuccessDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text(
//           "Success",
//           style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
//         ),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }

//   String get userType => _userType == 'patient' ? 'Patient' : 'Hospital Admin';
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediqueue/utils/app_colors.dart';
import 'package:mediqueue/utils/logout_notifier.dart';
import 'package:mediqueue/widgets/custom_text_field.dart';
import 'package:mediqueue/widgets/social_auth_button.dart';
import 'package:mediqueue/services/firestore_service.dart';
import 'package:mediqueue/models/patient_model.dart';
import '../services/auth_service.dart';
import '../services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/patient/patient_home_screen.dart';
import '../screens/admin/admin_dashboard_screen.dart';

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
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController =
      TextEditingController(); // ADDED: Name controller

  // Use services instead of direct FirebaseAuth
  final AuthService _authService = AuthService();
  final UserService _userService = UserService();

  bool _isLoading = false;
  bool _obscurePassword = true;
  String _userType = 'patient'; // 'patient' or 'admin'

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // ✅ Check for logout message when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkForLogoutMessage();
    });
  }

  @override
  void dispose() {
    print("🗑️ AuthScreen DISPOSED");
    _tabController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _nameController.dispose(); // ADDED: Dispose name controller
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("🔄 AuthScreen didChangeDependencies");
  }

  // ✅ New method to check for logout message
  void _checkForLogoutMessage() {
    if (LogoutNotifier.getAndClearShouldShowMessage() && mounted) {
      _showLogoutSuccessMessage();
    }
  }

  // ✅ New method to show logout success message
  void _showLogoutSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                'Logged out successfully!',
                style: TextStyle(fontSize: 14),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, size: 18, color: Colors.white),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(20),
      ),
    );
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
                _buildLogoSection(),
                const SizedBox(height: 32),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.grey.withOpacity(0.08),
                        blurRadius: 25,
                        spreadRadius: 1,
                        offset: const Offset(0, 6),
                      ),
                    ],
                    border: Border.all(
                      // ignore: deprecated_member_use
                      color: Colors.grey.withOpacity(0.08),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        _buildTabBar(),
                        const SizedBox(height: 28),
                        _buildTabContent(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
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

  Widget _buildLogoSection() {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primaryBlue,
                        // ignore: deprecated_member_use
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
            Container(
              width: 100,
              height: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // ignore: deprecated_member_use
                    AppColors.primaryBlue.withOpacity(0.8),
                    // ignore: deprecated_member_use
                    Colors.grey[300]!.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
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
            _phoneController.clear();
            _nameController.clear(); // ADDED: Clear name on tab change
          });
        },
        tabs: const [
          Tab(text: 'Create Account'),
          Tab(text: 'Log In'),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return SizedBox(
      height: 520, // INCREASED: Made slightly taller to accommodate name field
      child: TabBarView(
        controller: _tabController,
        children: [
          _buildCreateAccountForm(),
          _buildLoginForm(),
        ],
      ),
    );
  }

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
                        // ignore: deprecated_member_use
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
                        // ignore: deprecated_member_use
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

          // ADDED: Name Field (first field)
          CustomTextField(
            label: "Full Name",
            hintText: "Enter your full name",
            controller: _nameController,
            prefixIcon: Icons.person_outline,
            enabled: !_isLoading,
          ),
          const SizedBox(height: 16),

          // Email Field
          CustomTextField(
            label: "Email",
            hintText: "Enter your email",
            controller: _emailController,
            prefixIcon: Icons.email_outlined,
            enabled: !_isLoading,
          ),
          const SizedBox(height: 16),

          // Phone Number Field
          CustomTextField(
            label: "Phone Number",
            hintText: "Enter your phone number",
            controller: _phoneController,
            prefixIcon: Icons.phone,
            enabled: !_isLoading,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),

          // Password Field
          CustomTextField(
            label: "Password",
            hintText: "Enter your password",
            obscureText: _obscurePassword,
            controller: _passwordController,
            prefixIcon: Icons.lock_outline,
            enabled: !_isLoading,
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
          _buildUserTypeSelection(),
          const SizedBox(height: 24),
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
          _buildDivider("Or sign up with"),
          const SizedBox(height: 20),
          _buildSocialAuthButtons(),
        ],
      ),
    );
  }

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
          CustomTextField(
            label: "Email",
            hintText: "Enter your email",
            controller: _emailController,
            prefixIcon: Icons.email_outlined,
          ),
          const SizedBox(height: 16),
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
          _buildUserTypeSelection(),
          const SizedBox(height: 12),
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
          _buildDivider("Or sign in with"),
          const SizedBox(height: 20),
          _buildSocialAuthButtons(),
        ],
      ),
    );
  }

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

  Widget _buildSocialAuthButtons() {
    return Column(
      children: [
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

  void _handleCreateAccount() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final phone = _phoneController.text.trim();

    print("🔄 Starting signup process...");
    print(
        "📝 Form data - Name: $name, Email: $email, UserType: $_userType, Phone: $phone");

    if (name.isEmpty || email.isEmpty || password.isEmpty || phone.isEmpty) {
      _showErrorDialog("Please fill in all fields");
      return;
    }

    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email)) {
      _showErrorDialog("Please enter a valid email address");
      return;
    }

    if (password.length < 6) {
      _showErrorDialog("Password must be at least 6 characters long");
      return;
    }

    if (name.length < 2) {
      _showErrorDialog("Please enter a valid name (at least 2 characters)");
      return;
    }

    if (!RegExp(r'^[0-9+\-\s]{10,15}$').hasMatch(phone.replaceAll(' ', ''))) {
      _showErrorDialog("Please enter a valid phone number (10-15 digits)");
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // ✅ Use AuthService for signup
      final result = await _authService.signUp(email, password);

      if (result['success'] == true) {
        final user = result['user'] as User?;

        if (user != null) {
          print("🎯 Creating user profile with EXACT userType: $_userType");
          // ✅ Use UserService to save user profile to Firestore WITH NAME AND PHONE
          await _userService.createUserProfile(
            email: email,
            userType: _userType,
            phoneNumber: phone,
            name: name,
          );

          // Add verification print
          print("✅ Profile creation completed");
          print("📋 Double-checking user type in Firestore...");

          // Wait a moment and check Firestore
          await Future.delayed(const Duration(seconds: 1));

          // Check what was actually saved
          final userDoc = await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();

          if (userDoc.exists) {
            print(
                "📊 ACTUAL saved userType in 'users': ${userDoc.data()?['userType']}");
            print(
                "📊 ACTUAL saved collection: ${userDoc.data()?['collection']}");
          }

          // Also check staff collection if admin
          if (_userType == 'admin') {
            final staffDoc = await FirebaseFirestore.instance
                .collection('staff')
                .doc(user.uid)
                .get();

            if (staffDoc.exists) {
              print(
                  "📊 ACTUAL saved userType in 'staff': ${staffDoc.data()?['userType']}");
              print(
                  "📊 ACTUAL saved role in 'staff': ${staffDoc.data()?['role']}");
            }
          }

          print("✅ Account created successfully!");
          print("User ID: ${user.uid}");
          print("Name: $name");
          print("Email: ${user.email}");
          print("Phone: $phone");
          print("User Type: $_userType");

          // ✅ IMPORTANT: Don't show success dialog - just let the app flow handle navigation
          // The auth state listener in main.dart will automatically redirect

          // Clear form fields
          _nameController.clear();
          _emailController.clear();
          _passwordController.clear();
          _phoneController.clear();

          print("⏳ Waiting for Firestore to save data...");
          await Future.delayed(const Duration(seconds: 1));

          if (mounted) {
            setState(() {
              // Switch to login tab (index 1)
              _tabController.animateTo(1);

              // Pre-fill the email field with the newly created email
              _emailController.text = email;

              // Keep the password in memory (don't show it for security)
              // User will need to re-enter password
            });

            _showSuccessDialog(
              "Account created successfully! Please log in with your credentials.",
              // autoSwitchToLogin: false, // We're already switching manually
            );
          }
        }
      } else {
        _showErrorDialog(result['error'] ?? "Signup failed");
      }
    } catch (e) {
      _showErrorDialog("Failed to create account: $e");
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog("Please fill in all fields");
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final result = await _authService.login(email, password);

      if (result['success'] == true) {
        final user = result['user'] as User?;

        if (user != null) {
          print("✅ Login successful!");
          print("User ID: ${user.uid}");
          print("Email: ${user.email}");

          // Check if user profile exists in Firestore
          final profileExists = await _userService.userProfileExists();
          print("Profile exists in database: $profileExists");

          // Clear form fields
          _emailController.clear();
          _passwordController.clear();

          // ✅✅✅ Navigate to appropriate screen based on user type
          _navigateBasedOnUserType();
        }
      } else {
        _showErrorDialog(result['error'] ?? "Login failed");
      }
    } catch (e) {
      _showErrorDialog("Login failed: $e");
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _navigateBasedOnUserType() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      // Get user type from Firestore
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      final userType = userDoc.data()?['userType'] ?? 'patient';

      print("🎯 Navigating based on user type: $userType");

      if (mounted) {
        // Clear entire navigation stack and push new screen
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => userType == 'admin'
                ? const AdminDashboardScreen()
                : const PatientHomeScreen(),
          ),
          (route) => false, // Remove all previous routes
        );
      }
    } catch (e) {
      print("❌ Error navigating: $e");
      // Fallback to patient home if error occurs
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const PatientHomeScreen()),
          (route) => false,
        );
      }
    }
  }

  void _handleSocialAuth(String provider) {
    _showErrorDialog("$provider authentication is not yet implemented. "
        "Please use email and password for now.");
  }

  void _showForgotPasswordDialog() {
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          bool isLoading = false;

          return AlertDialog(
            title: const Text(
              "Reset Password",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter your email address and we'll send you a password reset link.",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: emailController,
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
              if (isLoading)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )
              else
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
              if (!isLoading)
                ElevatedButton(
                  onPressed: () async {
                    final email = emailController.text.trim();

                    if (email.isEmpty) {
                      _showErrorDialog("Please enter your email address");
                      return;
                    }

                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(email)) {
                      _showErrorDialog("Please enter a valid email address");
                      return;
                    }

                    setState(() => isLoading = true);

                    try {
                      // Note: You might want to move this to AuthService too
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email);
                      Navigator.pop(context);
                      _showSuccessDialog("Password reset link sent to $email. "
                          "Please check your inbox.");
                    } on FirebaseAuthException catch (e) {
                      Navigator.pop(context);
                      _showErrorDialog(
                          "Failed to send reset email: ${e.message}");
                    } catch (e) {
                      Navigator.pop(context);
                      _showErrorDialog("Failed to send reset email: $e");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                  ),
                  child: const Text("Send Link"),
                ),
            ],
          );
        },
      ),
    );
  }

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

  void _showSuccessDialog(String message, {bool autoSwitchToLogin = true}) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 24),
            SizedBox(width: 8),
            Text(
              "Success",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog

              if (autoSwitchToLogin && mounted) {
                // Switch to login tab
                _tabController.animateTo(1);
              }
            },
            child: const Text("Continue to Login"),
          ),
        ],
      ),
    );
  }

  String get userType => _userType == 'patient' ? 'Patient' : 'Hospital Admin';
}
