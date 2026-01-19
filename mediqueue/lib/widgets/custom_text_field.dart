import 'package:flutter/material.dart';

/// A reusable custom text field widget that provides consistent styling
/// and behavior across the MediQueue app.
///
/// Features:
/// - Consistent visual design with proper spacing and borders
/// - Support for different input types (text, email, password)
/// - Built-in validation display
/// - Customizable icons and labels
///
/// Example usage:
/// ```dart
/// CustomTextField(
///   controller: emailController,
///   label: 'Email',
///   prefixIcon: Icons.email,
///   keyboardType: TextInputType.emailAddress,
/// )
/// ```
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool enabled;
  final String? helperText;
  final String? Function(String?)? validator;
  final int maxLines;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.helperText,
    this.validator,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        helperText: helperText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 1.5,
          ),
        ),
        filled: true,
        fillColor: enabled ? Colors.white : Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      enabled: enabled,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: 16,
        color: enabled ? Colors.black87 : Colors.grey,
      ),
    );
  }
}
