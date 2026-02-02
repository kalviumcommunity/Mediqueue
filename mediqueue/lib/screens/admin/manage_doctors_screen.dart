import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/hospital_model.dart';
import '../../models/queue_model.dart';
import '../../services/user_service.dart';
import '../../services/queue_service.dart';

class ManageDoctorsScreen extends StatefulWidget {
  const ManageDoctorsScreen({super.key});

  @override
  State<ManageDoctorsScreen> createState() => _ManageDoctorsScreenState();
}

class _ManageDoctorsScreenState extends State<ManageDoctorsScreen>
    with SingleTickerProviderStateMixin {
  final UserService _userService = UserService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final QueueService _queueService = QueueService();

  late TabController _tabController;
  String? _hospitalId;
  bool _isLoading = true;

  // Normalize department IDs to avoid duplicates which break dropdowns and doctor counts
  Future<HospitalModel> _fetchNormalizedHospital() async {
    final hospitalDoc =
        await _firestore.collection('hospitals').doc(_hospitalId).get();
    final hospital = HospitalModel.fromFirestore(hospitalDoc);

    final seenIds = <String>{};
    var changed = false;
    var counter = 0;

    final normalizedDepartments = hospital.departments.map((dept) {
      var newId = dept.id;
      if (newId.isEmpty || seenIds.contains(newId)) {
        changed = true;
        counter++;
        newId =
            '${dept.name.replaceAll(' ', '_')}_${DateTime.now().microsecondsSinceEpoch}_$counter';
      }
      seenIds.add(newId);

      return DepartmentModel(
        id: newId,
        name: dept.name,
        description: dept.description,
        openingTime: dept.openingTime,
        closingTime: dept.closingTime,
        queueCount: dept.queueCount,
        averageWaitTime: dept.averageWaitTime,
        isOpen: dept.isOpen,
        openingHours: dept.openingHours,
        doctors: dept.doctors,
      );
    }).toList();

    if (changed) {
      await _firestore.collection('hospitals').doc(_hospitalId).update({
        'departments': normalizedDepartments.map((d) => d.toMap()).toList(),
      });
    }

    return hospital.copyWith(departments: normalizedDepartments);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadHospitalData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadHospitalData() async {
    try {
      final hospitalId = await _userService.getAdminHospitalId();
      if (hospitalId == null || hospitalId.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('No hospital assigned to your account')),
          );
          Navigator.of(context).pop();
        }
        return;
      }
      _hospitalId = hospitalId;
      // Normalize department IDs once on load to prevent duplicate IDs in dropdowns
      await _fetchNormalizedHospital();

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading hospital data: $e')),
        );
      }
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Doctors & Departments'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Departments', icon: Icon(Icons.medical_services)),
            Tab(text: 'Doctors', icon: Icon(Icons.person)),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: [
                _buildDepartmentsTab(),
                _buildDoctorsTab(),
              ],
            ),
    );
  }

  Widget _buildDepartmentsTab() {
    if (_hospitalId == null) {
      return const Center(child: Text('No hospital assigned'));
    }

    return StreamBuilder<DocumentSnapshot>(
      stream: _firestore.collection('hospitals').doc(_hospitalId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Center(child: Text('Hospital not found'));
        }

        final hospital = HospitalModel.fromFirestore(snapshot.data!);

        if (hospital.departments.isEmpty) {
          return _buildEmptyState(
            icon: Icons.medical_services_outlined,
            title: 'No Departments',
            subtitle: 'Add your first department',
            onPressed: () => _showAddDepartmentDialog(),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: hospital.departments.length,
                itemBuilder: (context, index) {
                  final department = hospital.departments[index];
                  return _buildDepartmentCard(department);
                },
              ),
            ),
            _buildFloatingAddButton(
              onPressed: () => _showAddDepartmentDialog(),
              label: 'Add Department',
            ),
          ],
        );
      },
    );
  }

  Widget _buildDoctorsTab() {
    if (_hospitalId == null) {
      return const Center(child: Text('No hospital assigned'));
    }

    return StreamBuilder<DocumentSnapshot>(
      stream: _firestore.collection('hospitals').doc(_hospitalId).snapshots(),
      builder: (context, snapshot) {
        print(
            'DEBUG: StreamBuilder rebuilding - ConnectionState: ${snapshot.connectionState}');

        if (snapshot.hasError) {
          print('DEBUG: StreamBuilder error: ${snapshot.error}');
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          print('DEBUG: No data or document does not exist');
          return const Center(child: Text('Hospital not found'));
        }

        final hospital = HospitalModel.fromFirestore(snapshot.data!);
        print(
            'DEBUG: Hospital loaded - Departments: ${hospital.departments.length}');

        // Use Map to ensure unique doctors by ID (prevent duplicates)
        final doctorsMap = <String, DoctorModel>{};

        for (var dept in hospital.departments) {
          print(
              'DEBUG: Department ${dept.name} has ${dept.doctors.length} doctors');
          for (var doctor in dept.doctors) {
            // Only add if not already present (prevents duplicates)
            if (!doctorsMap.containsKey(doctor.id)) {
              doctorsMap[doctor.id] = doctor;
            } else {
              print(
                  'DEBUG: WARNING - Duplicate doctor ID found: ${doctor.id} (${doctor.name})');
            }
          }
        }

        final allDoctors = doctorsMap.values.toList();
        print('DEBUG: Total unique doctors: ${allDoctors.length}');

        if (allDoctors.isEmpty) {
          return _buildEmptyState(
            icon: Icons.person_outline,
            title: 'No Doctors',
            subtitle: 'Add your first doctor',
            onPressed: () async =>
                await _showAddDoctorDialog(hospital.departments),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: allDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = allDoctors[index];
                  // Find department name
                  String departmentName = '';
                  for (var dept in hospital.departments) {
                    if (dept.doctors.any((d) => d.id == doctor.id)) {
                      departmentName = dept.name;
                      break;
                    }
                  }
                  return _buildDoctorCard(
                      doctor, departmentName, hospital.departments);
                },
              ),
            ),
            _buildFloatingAddButton(
              onPressed: () async =>
                  await _showAddDoctorDialog(hospital.departments),
              label: 'Add Doctor',
            ),
          ],
        );
      },
    );
  }

  Widget _buildDepartmentCard(DepartmentModel department) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.medical_services,
                    color: Colors.blue.shade700,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        department.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      StreamBuilder<List<QueueModel>>(
                        stream: department.name.isEmpty || _hospitalId == null
                            ? null
                            : _queueService.watchDepartmentQueue(
                                _hospitalId!, department.name),
                        builder: (context, snapshot) {
                          final queueLength =
                              snapshot.data?.length ?? department.queueCount;
                          return Text(
                            '${queueLength} in queue • ${department.doctors.length} doctor${department.doctors.length != 1 ? 's' : ''}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _showEditDepartmentDialog(department),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteDepartment(department.id),
                ),
              ],
            ),
            if (department.description.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                department.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                _buildInfoChip(
                  icon: Icons.access_time,
                  label: department.isOpen ? 'Open' : 'Closed',
                  color: department.isOpen ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 8),
                if (department.openingTime.isNotEmpty &&
                    department.closingTime.isNotEmpty)
                  _buildInfoChip(
                    icon: Icons.schedule,
                    label:
                        '${department.openingTime} - ${department.closingTime}',
                    color: Colors.orange,
                  ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () => _showDepartmentQueue(department),
                  icon: const Icon(Icons.list_alt),
                  label: const Text('View Queue'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorCard(DoctorModel doctor, String departmentName,
      List<DepartmentModel> departments) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue.shade100,
                  child: Icon(
                    Icons.person,
                    size: 32,
                    color: Colors.blue.shade700,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        doctor.specialization,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      if (departmentName.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          departmentName,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _showEditDoctorDialog(doctor, departments),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteDoctor(doctor.id),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildInfoChip(
                  icon: Icons.school,
                  label: doctor.qualification ?? 'N/A',
                  color: Colors.purple,
                ),
                const SizedBox(width: 8),
                _buildInfoChip(
                  icon: Icons.work,
                  label: '${doctor.experience ?? 0} years',
                  color: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: doctor.isAvailable
                    ? Colors.green.withOpacity(0.1)
                    : Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: doctor.isAvailable
                      ? Colors.green.withOpacity(0.3)
                      : Colors.grey.withOpacity(0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    doctor.isAvailable ? Icons.check_circle : Icons.cancel,
                    color: doctor.isAvailable ? Colors.green : Colors.grey,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      doctor.isAvailable ? 'Available' : 'Not Available',
                      style: TextStyle(
                        fontSize: 14,
                        color: doctor.isAvailable ? Colors.green : Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Switch(
                    value: doctor.isAvailable,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      _toggleDoctorAvailability(doctor.id, value);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _showDepartmentQueue(DepartmentModel department) {
    if (_hospitalId == null) return;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.list_alt, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      '${department.name} Queue',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: StreamBuilder<List<QueueModel>>(
                    stream: _queueService.watchDepartmentQueue(
                        _hospitalId!, department.name),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final queues = snapshot.data!;
                      if (queues.isEmpty) {
                        return const Center(
                          child: Text('No patients in queue'),
                        );
                      }
                      return ListView.builder(
                        itemCount: queues.length,
                        itemBuilder: (context, index) {
                          final q = queues[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue.shade100,
                              child: Text(q.queueNumber.toString()),
                            ),
                            title: Text(q.patientName),
                            subtitle: Text(
                                'Status: ${q.status.name} • Doctor: ${q.doctorName ?? 'Any'}'),
                            trailing: Text('#${q.queueNumber}'),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onPressed,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.add),
            label: Text(subtitle),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingAddButton({
    required VoidCallback onPressed,
    required String label,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  void _showAddDepartmentDialog() {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    final openingTimeController = TextEditingController();
    final closingTimeController = TextEditingController();
    bool isOpen = true;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Add Department'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Department Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: openingTimeController,
                  decoration: const InputDecoration(
                    labelText: 'Opening Time (e.g., 9:00 AM)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: closingTimeController,
                  decoration: const InputDecoration(
                    labelText: 'Closing Time (e.g., 5:00 PM)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  title: const Text('Is Open'),
                  value: isOpen,
                  onChanged: (value) {
                    setDialogState(() => isOpen = value);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please enter department name')),
                  );
                  return;
                }

                await _addDepartment(
                  name: nameController.text,
                  description: descriptionController.text,
                  openingTime: openingTimeController.text,
                  closingTime: closingTimeController.text,
                  isOpen: isOpen,
                );

                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDepartmentDialog(DepartmentModel department) {
    final nameController = TextEditingController(text: department.name);
    final descriptionController =
        TextEditingController(text: department.description);
    final openingTimeController =
        TextEditingController(text: department.openingTime);
    final closingTimeController =
        TextEditingController(text: department.closingTime);
    bool isOpen = department.isOpen;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Edit Department'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Department Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: openingTimeController,
                  decoration: const InputDecoration(
                    labelText: 'Opening Time',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: closingTimeController,
                  decoration: const InputDecoration(
                    labelText: 'Closing Time',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  title: const Text('Is Open'),
                  value: isOpen,
                  onChanged: (value) {
                    setDialogState(() => isOpen = value);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please enter department name')),
                  );
                  return;
                }

                await _updateDepartment(
                  departmentId: department.id,
                  name: nameController.text,
                  description: descriptionController.text,
                  openingTime: openingTimeController.text,
                  closingTime: closingTimeController.text,
                  isOpen: isOpen,
                );

                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAddDoctorDialog(List<DepartmentModel> departments) async {
    final hospital = await _fetchNormalizedHospital();
    final freshDepartments = hospital.departments;

    if (freshDepartments.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please create a department first')),
        );
      }
      return;
    }

    final nameController = TextEditingController();
    final specializationController = TextEditingController();
    final qualificationController = TextEditingController();
    final experienceController = TextEditingController();

    // Create a stable local copy with fresh data
    // Deduplicate departments by id to avoid duplicate dropdown values
    final seenIds = <String>{};
    final departmentsList = <DepartmentModel>[];
    for (final dept in freshDepartments) {
      if (seenIds.add(dept.id)) {
        departmentsList.add(dept);
      }
    }

    // Use ValueNotifier for state management with first department's ID
    final selectedDepartmentNotifier =
        ValueNotifier<String>(departmentsList.first.id);
    final isAvailableNotifier = ValueNotifier<bool>(true);

    print('DEBUG: Dialog opened with ${departmentsList.length} departments');
    print('DEBUG: Initial selected department ID: ${departmentsList.first.id}');
    for (var dept in departmentsList) {
      print('DEBUG: Department available: ${dept.name} (ID: ${dept.id})');
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Doctor'),
        contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Doctor Name*',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: specializationController,
                  decoration: const InputDecoration(
                    labelText: 'Specialization*',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: qualificationController,
                  decoration: const InputDecoration(
                    labelText: 'Qualification',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: experienceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Years of Experience',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Department*',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ValueListenableBuilder<String>(
                        valueListenable: selectedDepartmentNotifier,
                        builder: (context, selectedValue, _) {
                          // Ensure the current value exists in the items
                          final hasMatch =
                              departmentsList.any((d) => d.id == selectedValue);
                          final effectiveValue = hasMatch
                              ? selectedValue
                              : (departmentsList.isNotEmpty
                                  ? departmentsList.first.id
                                  : null);

                          return DropdownButtonFormField<String>(
                            value: effectiveValue,
                            decoration: InputDecoration(
                              labelText: 'Department',
                              border: const OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.medical_services,
                                  color: Colors.blue.shade700),
                            ),
                            isExpanded: true,
                            items: departmentsList.map((dept) {
                              return DropdownMenuItem(
                                value: dept.id,
                                child: Text(
                                  dept.name,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              if (value != null) {
                                selectedDepartmentNotifier.value = value;
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                ValueListenableBuilder<bool>(
                  valueListenable: isAvailableNotifier,
                  builder: (context, isAvailable, _) {
                    return SwitchListTile(
                      title: const Text('Available'),
                      value: isAvailable,
                      onChanged: (value) {
                        isAvailableNotifier.value = value;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (nameController.text.isEmpty ||
                  specializationController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Please fill in required fields')),
                );
                return;
              }

              await _addDoctor(
                departmentId: selectedDepartmentNotifier.value,
                name: nameController.text,
                specialization: specializationController.text,
                qualification: qualificationController.text,
                experience: int.tryParse(experienceController.text) ?? 0,
                isAvailable: isAvailableNotifier.value,
              );

              print(
                  'DEBUG: Add operation completed, selected dept ID was: ${selectedDepartmentNotifier.value}');

              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showEditDoctorDialog(
      DoctorModel doctor, List<DepartmentModel> departments) {
    if (departments.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No departments available')),
      );
      return;
    }

    final nameController = TextEditingController(text: doctor.name);
    final specializationController =
        TextEditingController(text: doctor.specialization);
    final qualificationController =
        TextEditingController(text: doctor.qualification);
    final experienceController =
        TextEditingController(text: doctor.experience?.toString() ?? '0');

    // Create a stable local copy
    final departmentsList = List<DepartmentModel>.from(departments);

    // Find current department
    String initialDepartmentId = departmentsList.first.id;
    for (var dept in departmentsList) {
      if (dept.doctors.any((d) => d.id == doctor.id)) {
        initialDepartmentId = dept.id;
        break;
      }
    }

    // Ensure ID is valid
    if (!departmentsList.any((d) => d.id == initialDepartmentId)) {
      initialDepartmentId = departmentsList.first.id;
    }

    // Use ValueNotifier for state management
    final selectedDepartmentNotifier =
        ValueNotifier<String>(initialDepartmentId);
    final isAvailableNotifier = ValueNotifier<bool>(doctor.isAvailable);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Doctor'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Doctor Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: specializationController,
                decoration: const InputDecoration(
                  labelText: 'Specialization',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: qualificationController,
                decoration: const InputDecoration(
                  labelText: 'Qualification',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: experienceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Years of Experience',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              ValueListenableBuilder<String>(
                valueListenable: selectedDepartmentNotifier,
                builder: (context, selectedValue, _) {
                  print(
                      'DEBUG: Edit Dialog Dropdown - selectedValue: $selectedValue');

                  return DropdownButtonFormField<String>(
                    value: selectedValue,
                    decoration: const InputDecoration(
                      labelText: 'Department',
                      border: OutlineInputBorder(),
                    ),
                    items: departmentsList.map((dept) {
                      return DropdownMenuItem(
                        value: dept.id,
                        child: Text(dept.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        print('DEBUG: Edit - Department selected: $value');
                        selectedDepartmentNotifier.value = value;
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 12),
              ValueListenableBuilder<bool>(
                valueListenable: isAvailableNotifier,
                builder: (context, isAvailable, _) {
                  return SwitchListTile(
                    title: const Text('Available'),
                    value: isAvailable,
                    onChanged: (value) {
                      isAvailableNotifier.value = value;
                    },
                  );
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (nameController.text.isEmpty ||
                  specializationController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Please fill in required fields')),
                );
                return;
              }

              await _updateDoctor(
                doctorId: doctor.id,
                departmentId: selectedDepartmentNotifier.value,
                name: nameController.text,
                specialization: specializationController.text,
                qualification: qualificationController.text,
                experience: int.tryParse(experienceController.text) ?? 0,
                isAvailable: isAvailableNotifier.value,
              );

              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  // Department operations
  Future<void> _addDepartment({
    required String name,
    required String description,
    required String openingTime,
    required String closingTime,
    required bool isOpen,
  }) async {
    try {
      final hospital = await _fetchNormalizedHospital();

      final newDepartment = DepartmentModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        description: description,
        openingTime: openingTime,
        closingTime: closingTime,
        isOpen: isOpen,
        queueCount: 0,
        doctors: [],
      );

      final updatedDepartments = [...hospital.departments, newDepartment];

      await _firestore.collection('hospitals').doc(_hospitalId).update({
        'departments': updatedDepartments.map((d) => d.toMap()).toList(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Department added successfully'),
              backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding department: $e')),
        );
      }
    }
  }

  Future<void> _updateDepartment({
    required String departmentId,
    required String name,
    required String description,
    required String openingTime,
    required String closingTime,
    required bool isOpen,
  }) async {
    try {
      final hospital = await _fetchNormalizedHospital();

      final updatedDepartments = hospital.departments.map((dept) {
        if (dept.id == departmentId) {
          return DepartmentModel(
            id: dept.id,
            name: name,
            description: description,
            openingTime: openingTime,
            closingTime: closingTime,
            isOpen: isOpen,
            queueCount: dept.queueCount,
            doctors: dept.doctors,
          );
        }
        return dept;
      }).toList();

      await _firestore.collection('hospitals').doc(_hospitalId).update({
        'departments': updatedDepartments.map((d) => d.toMap()).toList(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Department updated successfully'),
              backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating department: $e')),
        );
      }
    }
  }

  Future<void> _deleteDepartment(String departmentId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Department'),
        content: const Text(
            'Are you sure? This will also remove all doctors in this department.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      final hospitalDoc =
          await _firestore.collection('hospitals').doc(_hospitalId).get();
      final hospital = HospitalModel.fromFirestore(hospitalDoc);

      final updatedDepartments =
          hospital.departments.where((d) => d.id != departmentId).toList();

      await _firestore.collection('hospitals').doc(_hospitalId).update({
        'departments': updatedDepartments.map((d) => d.toMap()).toList(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Department deleted successfully'),
              backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting department: $e')),
        );
      }
    }
  }

  // Doctor operations
  Future<void> _toggleDoctorAvailability(
      String doctorId, bool isAvailable) async {
    try {
      print(
          'DEBUG: Toggling doctor availability - ID: $doctorId, New value: $isAvailable');

      final hospitalDoc =
          await _firestore.collection('hospitals').doc(_hospitalId).get();
      final hospital = HospitalModel.fromFirestore(hospitalDoc);

      bool doctorFound = false;
      final updatedDepartments = hospital.departments.map((dept) {
        final updatedDoctors = dept.doctors.map((doctor) {
          if (doctor.id == doctorId) {
            doctorFound = true;
            print(
                'DEBUG: Found doctor ${doctor.name} in ${dept.name}, updating availability');
            return DoctorModel(
              id: doctor.id,
              name: doctor.name,
              specialization: doctor.specialization,
              qualification: doctor.qualification,
              experience: doctor.experience,
              isAvailable: isAvailable,
            );
          }
          return doctor;
        }).toList();

        return DepartmentModel(
          id: dept.id,
          name: dept.name,
          description: dept.description,
          openingTime: dept.openingTime,
          closingTime: dept.closingTime,
          isOpen: dept.isOpen,
          queueCount: dept.queueCount,
          doctors: updatedDoctors,
        );
      }).toList();

      if (!doctorFound) {
        print('DEBUG: ERROR - Doctor not found: $doctorId');
        throw Exception('Doctor not found');
      }

      await _firestore.collection('hospitals').doc(_hospitalId).update({
        'departments': updatedDepartments.map((d) => d.toMap()).toList(),
      });

      print('DEBUG: Doctor availability updated successfully');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Doctor marked as ${isAvailable ? "available" : "unavailable"}',
            ),
            backgroundColor: isAvailable ? Colors.green : Colors.orange,
            duration: const Duration(seconds: 1),
          ),
        );
      }
    } catch (e) {
      print('DEBUG: Error toggling availability: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating availability: $e')),
        );
      }
    }
  }

  Future<void> _addDoctor({
    required String departmentId,
    required String name,
    required String specialization,
    required String qualification,
    int? experience,
    required bool isAvailable,
  }) async {
    try {
      print('DEBUG: Starting to add doctor...');
      final hospital = await _fetchNormalizedHospital();
      print('DEBUG: Current departments count: ${hospital.departments.length}');

      var newDoctor = DoctorModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        specialization: specialization,
        qualification: qualification,
        experience: experience,
        isAvailable: isAvailable,
      );
      print(
          'DEBUG: Created new doctor: ${newDoctor.name} (ID: ${newDoctor.id})');

      // Verify department exists
      final departmentExists =
          hospital.departments.any((d) => d.id == departmentId);
      if (!departmentExists) {
        print('DEBUG: ERROR - Department ID not found: $departmentId');
        print(
            'DEBUG: Available department IDs: ${hospital.departments.map((d) => d.id).join(", ")}');
        throw Exception('Selected department not found');
      }

      final updatedDepartments = hospital.departments.map((dept) {
        if (dept.id == departmentId) {
          print(
              'DEBUG: Found target department: ${dept.name}, current doctors: ${dept.doctors.length}');
          print('DEBUG: Doctor will be added to: ${dept.name}');

          // Check if doctor already exists to prevent duplicates
          final doctorExists = dept.doctors.any((d) => d.id == newDoctor.id);
          if (doctorExists) {
            print('DEBUG: WARNING - Doctor ID already exists, regenerating...');
            // Regenerate ID if conflict (should be rare)
            newDoctor = DoctorModel(
              id: '${DateTime.now().millisecondsSinceEpoch}_${dept.doctors.length}',
              name: newDoctor.name,
              specialization: newDoctor.specialization,
              qualification: newDoctor.qualification,
              experience: newDoctor.experience,
              isAvailable: newDoctor.isAvailable,
            );
          }

          final updatedDept = DepartmentModel(
            id: dept.id,
            name: dept.name,
            description: dept.description,
            openingTime: dept.openingTime,
            closingTime: dept.closingTime,
            isOpen: dept.isOpen,
            queueCount: dept.queueCount,
            doctors: [...dept.doctors, newDoctor],
          );
          print(
              'DEBUG: Updated department ${updatedDept.name} now has ${updatedDept.doctors.length} doctors');
          return updatedDept;
        }
        print(
            'DEBUG: Department ${dept.name} unchanged with ${dept.doctors.length} doctors');
        return dept;
      }).toList();

      print('DEBUG: Updated departments prepared');
      print('DEBUG: Verification - departments after mapping:');
      for (var dept in updatedDepartments) {
        print('DEBUG:   ${dept.name}: ${dept.doctors.length} doctors');
      }

      final departmentsData = updatedDepartments.map((d) => d.toMap()).toList();
      print(
          'DEBUG: Departments data serialized, count: ${departmentsData.length}');

      await _firestore.collection('hospitals').doc(_hospitalId).update({
        'departments': departmentsData,
      });

      print('DEBUG: Firestore update completed');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Doctor added successfully'),
              backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      print('DEBUG: Error occurred: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding doctor: $e')),
        );
      }
    }
  }

  Future<void> _updateDoctor({
    required String doctorId,
    required String departmentId,
    required String name,
    required String specialization,
    required String qualification,
    int? experience,
    required bool isAvailable,
  }) async {
    try {
      final hospitalDoc =
          await _firestore.collection('hospitals').doc(_hospitalId).get();
      final hospital = HospitalModel.fromFirestore(hospitalDoc);

      // Remove doctor from old department and add to new one
      final updatedDepartments = hospital.departments.map((dept) {
        // Remove from all departments first
        final filteredDoctors =
            dept.doctors.where((d) => d.id != doctorId).toList();

        // Add to target department
        if (dept.id == departmentId) {
          final updatedDoctor = DoctorModel(
            id: doctorId,
            name: name,
            specialization: specialization,
            qualification: qualification,
            experience: experience,
            isAvailable: isAvailable,
          );
          return DepartmentModel(
            id: dept.id,
            name: dept.name,
            description: dept.description,
            openingTime: dept.openingTime,
            closingTime: dept.closingTime,
            isOpen: dept.isOpen,
            queueCount: dept.queueCount,
            doctors: [...filteredDoctors, updatedDoctor],
          );
        }

        return DepartmentModel(
          id: dept.id,
          name: dept.name,
          description: dept.description,
          openingTime: dept.openingTime,
          closingTime: dept.closingTime,
          isOpen: dept.isOpen,
          queueCount: dept.queueCount,
          doctors: filteredDoctors,
        );
      }).toList();

      await _firestore.collection('hospitals').doc(_hospitalId).update({
        'departments': updatedDepartments.map((d) => d.toMap()).toList(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Doctor updated successfully'),
              backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating doctor: $e')),
        );
      }
    }
  }

  Future<void> _deleteDoctor(String doctorId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Doctor'),
        content: const Text('Are you sure you want to delete this doctor?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      final hospitalDoc =
          await _firestore.collection('hospitals').doc(_hospitalId).get();
      final hospital = HospitalModel.fromFirestore(hospitalDoc);

      final updatedDepartments = hospital.departments.map((dept) {
        return DepartmentModel(
          id: dept.id,
          name: dept.name,
          description: dept.description,
          openingTime: dept.openingTime,
          closingTime: dept.closingTime,
          isOpen: dept.isOpen,
          queueCount: dept.queueCount,
          doctors: dept.doctors.where((d) => d.id != doctorId).toList(),
        );
      }).toList();

      await _firestore.collection('hospitals').doc(_hospitalId).update({
        'departments': updatedDepartments.map((d) => d.toMap()).toList(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Doctor deleted successfully'),
              backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting doctor: $e')),
        );
      }
    }
  }
}
