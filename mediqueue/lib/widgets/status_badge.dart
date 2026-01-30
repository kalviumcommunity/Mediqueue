import 'package:flutter/material.dart';

/// A reusable status badge widget for displaying queue and appointment statuses
/// across the MediQueue app.
enum QueueStatus {
  active,
  waiting,
  completed,
  cancelled,
  noShow, inProgress, called,
}

class StatusBadge extends StatelessWidget {
  final QueueStatus status;
  final String? label;
  final bool showIcon;
  final bool compact;

  const StatusBadge({
    Key? key,
    required this.status,
    this.label,
    this.showIcon = true,
    this.compact = false, required MaterialColor color,
  }) : super(key: key);

  // Get color based on status
  Color get _statusColor {
    switch (status) {
      case QueueStatus.active:
        return Colors.green;
      case QueueStatus.waiting:
        return Colors.orange;
      case QueueStatus.completed:
        return Colors.blue;
      case QueueStatus.cancelled:
        return Colors.red;
      case QueueStatus.noShow:
        return Colors.grey;
      case QueueStatus.inProgress:
        // TODO: Handle this case.
        throw UnimplementedError();
      case QueueStatus.called:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  // Get icon based on status
  IconData get _statusIcon {
    switch (status) {
      case QueueStatus.active:
        return Icons.play_circle_fill;
      case QueueStatus.waiting:
        return Icons.schedule;
      case QueueStatus.completed:
        return Icons.check_circle;
      case QueueStatus.cancelled:
        return Icons.cancel;
      case QueueStatus.noShow:
        return Icons.person_off;
      case QueueStatus.inProgress:
        // TODO: Handle this case.
        throw UnimplementedError();
      case QueueStatus.called:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  // Get default label based on status
  String get _defaultLabel {
    switch (status) {
      case QueueStatus.active:
        return 'Active';
      case QueueStatus.waiting:
        return 'Waiting';
      case QueueStatus.completed:
        return 'Completed';
      case QueueStatus.cancelled:
        return 'Cancelled';
      case QueueStatus.noShow:
        return 'No Show';
      case QueueStatus.inProgress:
        // TODO: Handle this case.
        throw UnimplementedError();
      case QueueStatus.called:
        // TODO: Handle this case.
        throw UnimplementedError();
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
