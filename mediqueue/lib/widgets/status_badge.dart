import 'package:flutter/material.dart';

/// A reusable status badge widget for displaying queue and appointment statuses
/// across the MediQueue app.
///
/// Supports different status types with appropriate colors and icons:
/// - Active/In Progress
/// - Waiting
/// - Completed
/// - Cancelled
/// - No Show
///
/// Features:
/// - Consistent visual design
/// - Color-coded status indicators
/// - Optional icons
/// - Compact or expanded display modes
///
/// Example usage:
/// ```dart
/// StatusBadge(
///   status: QueueStatus.active,
///   label: 'In Queue',
/// )
/// ```

class StatusBadge extends StatelessWidget {
  final String status;
  final String? label;
  final bool showIcon;
  final bool compact;

  const StatusBadge({
    Key? key,
    required this.status,
    this.label,
    this.showIcon = true,
    this.compact = false, 
  }) : super(key: key);

  // Get color based on status
  Color get _statusColor {
    switch (status.toLowerCase()) {
      case 'called':
      case 'active':
        return Colors.green;
      case 'waiting':
        return Colors.orange;
      case 'inprogress':
      case 'completed':
        return Colors.blue;
      case 'cancelled':
        return Colors.red;
      case 'noshow':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  // Get icon based on status string
  IconData get _statusIcon {
    switch (status.toLowerCase()) {
      case 'called':
      case 'active':
        return Icons.volume_up;
      case 'waiting':
        return Icons.schedule;
      case 'inprogress':
        return Icons.play_circle;
      case 'completed':
        return Icons.check_circle;
      case 'cancelled':
        return Icons.cancel;
      case 'noshow':
        return Icons.person_off;
      default:
        return Icons.help_outline;
    }
  }

  // Get default label based on status string
  String get _defaultLabel {
    switch (status.toLowerCase()) {
      case 'called':
        return 'Called';
      case 'active':
        return 'Active';
      case 'waiting':
        return 'Waiting';
      case 'inprogress':
        return 'In Progress';
      case 'completed':
        return 'Completed';
      case 'cancelled':
        return 'Cancelled';
      case 'noshow':
        return 'No Show';
      default:
        return status;
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayLabel = label ?? _defaultLabel;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 8 : 12,
        vertical: compact ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: _statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _statusColor.withOpacity(0.5),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon) ...[
            Icon(
              _statusIcon,
              size: compact ? 14 : 16,
              color: _statusColor,
            ),
            SizedBox(width: compact ? 4 : 6),
          ],
          Text(
            displayLabel,
            style: TextStyle(
              color: _statusColor,
              fontSize: compact ? 12 : 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
