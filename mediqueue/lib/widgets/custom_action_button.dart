import 'package:flutter/material.dart';

/// A reusable custom button widget that provides consistent styling
/// and behavior across the MediQueue app.
///
/// Supports three button types:
/// - Primary: Filled button with solid background color
/// - Secondary: Outlined button with border
/// - Text: Simple text button
///
/// Features:
/// - Consistent visual design and spacing
/// - Support for icons
/// - Loading state
/// - Customizable colors
/// - Responsive sizing
///
/// Example usage:
/// ```dart
/// CustomActionButton(
///   label: 'Login',
///   onPressed: () => handleLogin(),
///   icon: Icons.login,
///   type: ButtonType.primary,
/// )
/// ```
enum ButtonType { primary, secondary, text }

class CustomActionButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final ButtonType type;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isLoading;
  final double? width;
  final double height;

  const CustomActionButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.type = ButtonType.primary,
    this.backgroundColor,
    this.foregroundColor,
    this.isLoading = false,
    this.width,
    this.height = 56,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultBgColor = backgroundColor ?? Colors.blue;
    final defaultFgColor = foregroundColor ??
        (type == ButtonType.primary ? Colors.white : Colors.blue);

    Widget buttonChild = isLoading
        ? SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(
                type == ButtonType.primary ? Colors.white : Colors.blue,
              ),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 24),
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );

    Widget button;

    switch (type) {
      case ButtonType.primary:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: defaultBgColor,
            foregroundColor: defaultFgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          child: buttonChild,
        );
        break;

      case ButtonType.secondary:
        button = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: defaultFgColor,
            side: BorderSide(
              color: defaultFgColor,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          child: buttonChild,
        );
        break;

      case ButtonType.text:
        button = TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            foregroundColor: defaultFgColor,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          child: buttonChild,
        );
        break;
    }

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: button,
    );
  }
}
