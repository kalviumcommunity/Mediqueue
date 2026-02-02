import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/queue_model.dart';
import '../../services/queue_service.dart';
import '../../widgets/status_badge.dart';
import 'hospitals_list_screen.dart';
import 'patient_home_screen.dart' hide HospitalsListScreen;

class MyQueuesScreen extends StatefulWidget {
  const MyQueuesScreen({super.key});

  @override
  State<MyQueuesScreen> createState() => _MyQueuesScreenState();
}

class _MyQueuesScreenState extends State<MyQueuesScreen> {
  final QueueService _queueService = QueueService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _leavingQueueId;

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('My Queue')),
        body: const Center(
          child: Text('You need to be signed in to view your queues.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Queue'),
      ),
      body: StreamBuilder<List<QueueModel>>(
        stream: _queueService.watchPatientQueues(user.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.error_outline, size: 40, color: Colors.red),
                    SizedBox(height: 12),
                    Text('Could not load your queues right now.'),
                  ],
                ),
              ),
            );
          }

          final queues = snapshot.data ?? [];

          if (queues.isEmpty) {
            return _EmptyState(onBrowseHospitals: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HospitalsListScreen(),
                ),
              );
            });
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: queues.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final queue = queues[index];
              return _QueueCard(
                queue: queue,
                isLeaving: _leavingQueueId == queue.id,
                onViewDetails: () => _showQueueDetails(queue),
                onLeave: (queue.status == QueueStatus.waiting ||
                        queue.status == QueueStatus.called)
                    ? () => _confirmLeave(queue)
                    : null,
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _confirmLeave(QueueModel queue) async {
    final shouldLeave = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Leave queue?'),
        content: Text(
          'You are currently #${queue.queueNumber} in ${queue.departmentName} at ${queue.hospitalName}. Do you want to leave this queue?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Stay'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Leave', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (shouldLeave == true) {
      await _leaveQueue(queue.id);
    }
  }

  Future<void> _leaveQueue(String queueId) async {
    setState(() {
      _leavingQueueId = queueId;
    });

    final result = await _queueService.leaveQueue(queueId);

    if (!mounted) return;

    setState(() {
      _leavingQueueId = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result['message'] ?? 'Updated queue status'),
        backgroundColor: result['success'] == true ? Colors.green : Colors.red,
      ),
    );
  }

  void _showQueueDetails(QueueModel queue) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          queue.hospitalName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          queue.departmentName,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  StatusBadge(status: queue.status.name),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 8,
                children: [
                  _InfoChip(
                    icon: Icons.tag,
                    label: 'Queue #${queue.queueNumber}',
                  ),
                  _InfoChip(
                    icon: Icons.access_time,
                    label: 'Est. wait ${queue.estimatedWaitTime} min',
                  ),
                  if (queue.doctorName != null && queue.doctorName!.isNotEmpty)
                    _InfoChip(
                      icon: Icons.person,
                      label: queue.doctorName!,
                    ),
                  _InfoChip(
                    icon: Icons.event,
                    label: DateFormat('MMM d, h:mm a').format(queue.joinedAt),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              FutureBuilder<Map<String, dynamic>>(
                future: _queueService.getQueuePosition(queue.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: LinearProgressIndicator(minHeight: 4),
                    );
                  }

                  final data = snapshot.data;
                  final position =
                      data?['position'] as int? ?? queue.queueNumber;
                  return Row(
                    children: [
                      const Icon(Icons.flag_circle, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text('Current position: #$position'),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              if (queue.notes != null && queue.notes!.isNotEmpty) ...[
                const Text(
                  'Notes',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(queue.notes!),
                const SizedBox(height: 12),
              ],
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: (queue.status == QueueStatus.waiting ||
                          queue.status == QueueStatus.called)
                      ? () {
                          Navigator.pop(context);
                          _confirmLeave(queue);
                        }
                      : null,
                  icon: const Icon(Icons.logout),
                  label: const Text('Leave queue'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _QueueCard extends StatelessWidget {
  final QueueModel queue;
  final bool isLeaving;
  final VoidCallback onViewDetails;
  final VoidCallback? onLeave;

  const _QueueCard({
    required this.queue,
    required this.isLeaving,
    required this.onViewDetails,
    this.onLeave,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onViewDetails,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          queue.hospitalName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          queue.departmentName,
                          style: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  StatusBadge(status: queue.status.name, compact: true),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _StatBlock(
                    label: 'Queue #',
                    value: '#${queue.queueNumber}',
                  ),
                  const SizedBox(width: 12),
                  _StatBlock(
                    label: 'Est. wait',
                    value: '${queue.estimatedWaitTime} min',
                  ),
                  const Spacer(),
                  if (queue.doctorName != null && queue.doctorName!.isNotEmpty)
                    _StatBlock(
                      label: 'Doctor',
                      value: queue.doctorName!,
                      alignEnd: true,
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    DateFormat('MMM d, h:mm a').format(queue.joinedAt),
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: onViewDetails,
                    child: const Text('Details'),
                  ),
                  if (onLeave != null)
                    TextButton(
                      onPressed: isLeaving ? null : onLeave,
                      child: isLeaving
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text(
                              'Leave',
                              style: TextStyle(color: Colors.red),
                            ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatBlock extends StatelessWidget {
  final String label;
  final String value;
  final bool alignEnd;

  const _StatBlock({
    required this.label,
    required this.value,
    this.alignEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(color: Colors.black54, fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
        ),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback onBrowseHospitals;

  const _EmptyState({required this.onBrowseHospitals});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.queue_music, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 12),
            const Text(
              'No active queues',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            const Text(
              'Join a department queue to see it here.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: onBrowseHospitals,
              icon: const Icon(Icons.local_hospital),
              label: const Text('Browse hospitals'),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 16),
      label: Text(label),
      backgroundColor: Colors.grey.shade200,
    );
  }
}
