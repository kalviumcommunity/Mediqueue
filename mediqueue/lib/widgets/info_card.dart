import 'package:flutter/material.dart';

/// A reusable info card widget for displaying statistics and metrics
/// across the MediQueue app.
///
/// Perfect for dashboard displays showing counts, averages, and other
/// key performance indicators.
///
/// Features:
/// - Consistent card design with icon, title, and value
/// - Customizable colors for different categories
/// - Optional gradient backgrounds
/// - Responsive sizing
/// - Tap interaction support
///
/// Example usage:
/// ```dart
/// InfoCard(
///   title: 'Total Patients',
///   value: '125',
///   icon: Icons.people,
///   color: Colors.blue,
/// )
/// ```
class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
  final bool useGradient;

  const InfoCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.onTap,
    this.useGradient = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: useGradient
                ? LinearGradient(
                    colors: [
                      color,
                      color.withOpacity(0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: useGradient ? null : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon container
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: useGradient 
                      ? Colors.white.withOpacity(0.3) 
                      : color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: useGradient ? Colors.white : color,
                  size: 28,
                ),
              ),
              const SizedBox(height: 12),
              
              // Value text
              Text(
                value,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: useGradient ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              
              // Title text
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: useGradient 
                      ? Colors.white.withOpacity(0.9) 
                      : Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
