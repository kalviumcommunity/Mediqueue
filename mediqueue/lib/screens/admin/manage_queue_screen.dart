// ManageQueueScreen now streams live queue data from Firestore per department
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/hospital_model.dart';
import '../../models/queue_model.dart';
import '../../services/firestore_service.dart';
import '../../services/queue_service.dart';
import '../../widgets/status_badge.dart';

class ManageQueueScreen extends StatefulWidget {
  final String? departmentName;
  final String? hospitalId;

  const ManageQueueScreen({super.key, this.departmentName, this.hospitalId});

  @override
  State<ManageQueueScreen> createState() => _ManageQueueScreenState();
}

class _ManageQueueScreenState extends State<ManageQueueScreen> {
  final FirestoreService _firestoreService = FirestoreService();
  final QueueService _queueService = QueueService();

  String? _selectedHospitalId;
  String? _selectedDepartmentId;
  String? _selectedDepartmentName;
  bool _selectionInitialized = false;
  bool _isActionLoading = false;

  HospitalModel? _findHospitalById(List<HospitalModel> hospitals, String? id) {
    if (id == null) return null;
    try {
      return hospitals.firstWhere((h) => h.id == id);
    } catch (_) {
      return null;
    }
  }

  DepartmentModel? _findDepartmentById(
      HospitalModel hospital, String? departmentId) {
    if (departmentId == null) return null;
    try {
      return hospital.departments.firstWhere((d) => d.id == departmentId);
    } catch (_) {
      return null;
    }
  }

  void _initializeSelection(List<HospitalModel> hospitals) {
    if (_selectionInitialized || hospitals.isEmpty) return;

    HospitalModel hospital = hospitals.first;
    if (widget.hospitalId != null) {
      final matched =
          hospitals.where((h) => h.id == widget.hospitalId).toList();
      if (matched.isNotEmpty) hospital = matched.first;
    }

    DepartmentModel? department;
    if (widget.departmentName != null) {
      final match = hospital.departments
          .where((d) =>
              d.name.toLowerCase() == widget.departmentName!.toLowerCase())
          .toList();
      if (match.isNotEmpty) {
        department = match.first;
      }
    }

    department ??=
        hospital.departments.isNotEmpty ? hospital.departments.first : null;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _selectedHospitalId = hospital.id;
        _selectedDepartmentId = department?.id;
        _selectedDepartmentName = department?.name;
        _selectionInitialized = true;
      });
    });
  }

  Future<void> _callNextPatient() async {
    final hospitalId = _selectedHospitalId;
    final departmentId = _selectedDepartmentId;
    if (hospitalId == null || departmentId == null) return;
    setState(() => _isActionLoading = true);
    final result = await _queueService.callNextPatient(
      hospitalId,
      _selectedDepartmentName ?? '',
    );
    if (mounted) setState(() => _isActionLoading = false);
    _showSnack(result['message'] ?? 'Action completed',
        success: result['success'] == true);
  }

  Future<void> _markCompleted(String queueId) async {
    setState(() => _isActionLoading = true);
    final result = await _queueService.markPatientCompleted(queueId);
    if (mounted) setState(() => _isActionLoading = false);
    _showSnack(result['message'] ?? 'Updated',
        success: result['success'] == true);
  }

  Future<void> _markNoShow(String queueId) async {
    setState(() => _isActionLoading = true);
    final result = await _queueService.markPatientNoShow(queueId);
    if (mounted) setState(() => _isActionLoading = false);
    _showSnack(result['message'] ?? 'Updated',
        success: result['success'] == true);
  }

  void _showSnack(String message, {bool success = true}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );

    try {
      const hospitalId = 'default_hospital_id';

      final result = await _queueService.callNextPatientWithNotification(
        hospitalId: hospitalId,
        departmentName: widget.department ?? 'General',
      );

      Navigator.pop(context);

      if (result['success'] == true) {
        final notificationResult =
            result['notificationResult'] as Map<String, dynamic>? ?? {};
        final smsSent = notificationResult['smsSent'] ?? false;
        final smsEnabled = notificationResult['smsEnabled'] ?? false;

        String message = 'Patient has been notified';
        if (smsEnabled && smsSent) {
          message += ' (SMS sent successfully)';
        } else if (smsEnabled) {
          message += ' (SMS not sent - check phone number)';
        } else {
          message += ' (In-app notification only - SMS disabled)';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result['message'] ?? 'Failed to notify patient'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: const Color(0xFFF6FAFD),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFD),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 120,
        flexibleSpace: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(13, 27, 140, 1),
                  Color.fromRGBO(90, 140, 255, 1)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back,
                      color: Colors.white, size: 28),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Queue Management',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      body: StreamBuilder<List<HospitalModel>>(
        stream: _firestoreService.getHospitals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final hospitals = snapshot.data ?? [];
          if (hospitals.isEmpty) {
            return const Center(child: Text('No hospitals available.'));
          }

          _initializeSelection(hospitals);

          final resolvedHospital =
              _findHospitalById(hospitals, _selectedHospitalId) ??
                  (hospitals.isNotEmpty ? hospitals.first : null);
          final resolvedDepartment = resolvedHospital != null
              ? (_findDepartmentById(resolvedHospital, _selectedDepartmentId) ??
                  (resolvedHospital.departments.isNotEmpty
                      ? resolvedHospital.departments.first
                      : null))
              : null;

          if (_selectedHospitalId != resolvedHospital?.id ||
              _selectedDepartmentId != resolvedDepartment?.id) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              setState(() {
                _selectedHospitalId = resolvedHospital?.id;
                _selectedDepartmentId = resolvedDepartment?.id;
                _selectedDepartmentName = resolvedDepartment?.name;
              });
            });
          }

          if (resolvedHospital == null || resolvedDepartment == null) {
            return const Center(
                child: Text(
                    'Select a hospital and department to view the queue.'));
          }

          return Column(
            children: [
              _buildSelectors(hospitals, resolvedHospital, resolvedDepartment),
              _summaryCard(resolvedDepartment),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: _isActionLoading ? null : _callNextPatient,
                    icon: const Icon(Icons.volume_up),
                    label: const Text('Notify Next Patient',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 254, 254, 254),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child:
                      _buildQueueStream(resolvedHospital, resolvedDepartment)),
              if (_isActionLoading)
                Container(
                  color: Colors.black.withOpacity(0.2),
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSelectors(List<HospitalModel> hospitals, HospitalModel hospital,
      DepartmentModel department) {
    final departments = hospital.departments;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            value: hospitals.any((h) => h.id == _selectedHospitalId)
                ? _selectedHospitalId
                : hospitals.isNotEmpty
                    ? hospitals.first.id
                    : null,
            decoration: const InputDecoration(
                labelText: 'Hospital', border: OutlineInputBorder()),
            items: hospitals
                .map((h) => DropdownMenuItem(value: h.id, child: Text(h.name)))
                .toList(),
            onChanged: (hospital) {
              if (hospital == null) return;
              final selected = hospitals.firstWhere((h) => h.id == hospital);
              setState(() {
                _selectedHospitalId = selected.id;
                _selectedDepartmentId = selected.departments.isNotEmpty
                    ? selected.departments.first.id
                    : null;
                _selectedDepartmentName = selected.departments.isNotEmpty
                    ? selected.departments.first.name
                    : null;
              });
            },
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: departments.any((d) => d.id == _selectedDepartmentId)
                ? _selectedDepartmentId
                : (departments.isNotEmpty ? departments.first.id : null),
            decoration: const InputDecoration(
                labelText: 'Department', border: OutlineInputBorder()),
            items: departments
                .where((d) => d.id.isNotEmpty)
                .map((d) => DropdownMenuItem(value: d.id, child: Text(d.name)))
                .toList(),
            onChanged: (deptId) {
              if (deptId == null) return;
              final dept = departments.firstWhere((d) => d.id == deptId);
              setState(() {
                _selectedDepartmentId = deptId;
                _selectedDepartmentName = dept.name;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _summaryCard(DepartmentModel department) {
    final queueCount = department.queueCount;
    final avgWait = department.averageWaitTime;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _summaryItem(queueCount.toString(), 'In Queue', Colors.blue),
          _summaryItem(
              avgWait > 0 ? '${avgWait}m' : '-', 'Avg Wait', Colors.orange),
          _summaryItem(department.name, 'Department', Colors.green),
        ],
      ),
    );
  }

  Widget _summaryItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: color)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildQueueStream(HospitalModel hospital, DepartmentModel department) {
    return StreamBuilder<List<QueueModel>>(
      stream: _queueService.watchDepartmentQueue(
        hospital.id,
        department.name,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final queues = snapshot.data ?? [];
        if (queues.isEmpty) {
          return const Center(child: Text('Queue is empty'));
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: queues.length,
          itemBuilder: (context, index) {
            final queue = queues[index];
            final isNext = index == 0 && queue.status == QueueStatus.waiting;
            return _queueTile(queue, isNext);
          },
        );
      },
    );
  }

  Widget _queueTile(QueueModel queue, bool isNext) {
    final timeLabel =
        DateFormat('MMM d • hh:mm a').format(queue.joinedAt.toLocal());

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 58,
            height: 58,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isNext ? Colors.blue.shade50 : Colors.orange.shade50,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              '#${queue.queueNumber}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isNext ? Colors.blue : Colors.orange,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        queue.patientName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    StatusBadge(
                      status: queue.status,
                      label: queue.statusText,
                      compact: true,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text('Joined: $timeLabel',
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
                if (queue.doctorName != null && queue.doctorName!.isNotEmpty)
                  Text('Doctor: ${queue.doctorName}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Row(
                  children: [
                    Expanded(
                      child: Text('Wait: ~${queue.estimatedWaitTime} min',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
                    ),
                    if (queue.priority != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: queue.priority == 'emergency'
                              ? Colors.red.shade50
                              : Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          queue.priority ?? 'normal',
                          style: TextStyle(
                            fontSize: 11,
                            color: queue.priority == 'emergency'
                                ? Colors.red
                                : Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _isActionLoading
                            ? null
                            : () => _markCompleted(queue.id),
                        icon: const Icon(Icons.check_circle, size: 18),
                        label: const Text('Complete'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.green,
                          side: const BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _isActionLoading
                            ? null
                            : () => _markNoShow(queue.id),
                        icon: const Icon(Icons.person_off, size: 18),
                        label: const Text('No-Show'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
                if (patient.priority != 'normal' && patient.priority != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: patient.priority == 'urgent'
                            ? Colors.orange[100]
                            : Colors.red[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        patient.priority!.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          color: patient.priority == 'urgent'
                              ? Colors.orange[800]
                              : Colors.red[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
