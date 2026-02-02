import 'package:flutter/material.dart';
import '../models/queue_model.dart';

/// A reusable status badge widget for displaying queue and appointment statuses
/// across the MediQueue app.

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
    switch (status) {
      case QueueStatus.waiting:
        return Colors.orange;
      case QueueStatus.called:
        return Colors.blue;
      case QueueStatus.inProgress:
        return Colors.blueGrey;
      case QueueStatus.completed:
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
    switch (status) {
      case QueueStatus.waiting:
        return Icons.schedule;
      case QueueStatus.called:
        return Icons.campaign;
      case QueueStatus.inProgress:
        return Icons.play_arrow;
      case QueueStatus.completed:
        return Icons.check_circle;
      case 'cancelled':
        return Icons.cancel;
      case 'noshow':
        return Icons.person_off;
      default:
        return Icons.help;
    }
  }

  // Get default label based on status string
  String get _defaultLabel {
    switch (status) {
      case QueueStatus.waiting:
        return 'Waiting';
      case QueueStatus.called:
        return 'Called';
      case QueueStatus.inProgress:
        return 'In Progress';
      case QueueStatus.completed:
        return 'Completed';
      case 'cancelled':
        return 'Cancelled';
      case 'noshow':
        return 'No Show';
      default:
        return 'Unknown';
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
        color: _statusColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _statusColor.withOpacity(0.6),
          width: 1.3,
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
