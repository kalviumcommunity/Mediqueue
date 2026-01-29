import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediqueue/utils/sample_data_initializer.dart';
import 'package:mediqueue/services/firestore_service.dart';

class BackendTestScreen extends StatefulWidget {
  const BackendTestScreen({Key? key}) : super(key: key);

  @override
  State<BackendTestScreen> createState() => _BackendTestScreenState();
}

class _BackendTestScreenState extends State<BackendTestScreen> {
  final FirestoreService _firestoreService = FirestoreService();
  bool _isLoading = false;
  String _status = '';
  List<String> _logs = [];

  void _addLog(String message) {
    setState(() {
      _logs.insert(
          0, '${DateTime.now().toString().substring(11, 19)} - $message');
    });
    print(message);
  }

  Future<void> _initializeSampleData() async {
    setState(() {
      _isLoading = true;
      _status = 'Adding sample hospitals...';
      _logs.clear();
    });

    try {
      final initializer = SampleDataInitializer();
      _addLog('🚀 Starting sample data initialization...');

      await initializer.initializeSampleData();

      _addLog('✅ Sample hospitals added successfully!');
      _addLog('📊 Check Firebase Console → Firestore → hospitals');

      setState(() {
        _status = 'Sample data added successfully!';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✅ Sample hospitals added to Firestore!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      _addLog('❌ Error: $e');
      setState(() {
        _status = 'Error: $e';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('❌ Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _testHospitalRetrieval() async {
    setState(() {
      _isLoading = true;
      _status = 'Testing hospital retrieval...';
    });

    try {
      _addLog('🔍 Fetching hospitals from Firestore...');

      final hospitals = await _firestoreService.getHospitals().first;

      _addLog('✅ Found ${hospitals.length} hospitals');
      for (var hospital in hospitals) {
        _addLog('   - ${hospital.name}: ${hospital.totalQueueCount} in queue');
      }

      setState(() {
        _status = 'Found ${hospitals.length} hospitals';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('✅ Found ${hospitals.length} hospitals!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      _addLog('❌ Error: $e');
      setState(() {
        _status = 'Error: $e';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('❌ Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _testPatientProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('❌ Please sign in first!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _status = 'Checking patient profile...';
    });

    try {
      _addLog('🔍 Looking for patient profile...');

      final patient = await _firestoreService.getPatientByUserId(user.uid);

      if (patient != null) {
        _addLog('✅ Patient profile found!');
        _addLog('   ID: ${patient.id}');
        _addLog('   Name: ${patient.name}');
        _addLog('   Email: ${patient.email}');

        setState(() {
          _status = 'Patient profile exists';
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Patient profile found!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        _addLog('⚠️ No patient profile found');
        _addLog('💡 Patient profile should be created automatically on signup');

        setState(() {
          _status = 'No patient profile found';
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('⚠️ No patient profile found'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (e) {
      _addLog('❌ Error: $e');
      setState(() {
        _status = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backend Test & Setup'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Status Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: _isLoading ? Colors.blue[50] : Colors.grey[100],
            child: Column(
              children: [
                if (_isLoading)
                  const CircularProgressIndicator()
                else
                  const Icon(Icons.science, size: 40, color: Colors.blue),
                const SizedBox(height: 8),
                Text(
                  _status.isEmpty ? 'Ready to test' : _status,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _initializeSampleData,
                  icon: const Icon(Icons.add_business),
                  label: const Text('Add Sample Hospitals'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _testHospitalRetrieval,
                  icon: const Icon(Icons.search),
                  label: const Text('Test Hospital Retrieval'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _testPatientProfile,
                  icon: const Icon(Icons.person_search),
                  label: const Text('Check My Patient Profile'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              ],
            ),
          ),

          // Logs
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Logs',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.clear, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _logs.clear();
                          });
                        },
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey),
                  Expanded(
                    child: _logs.isEmpty
                        ? const Center(
                            child: Text(
                              'No logs yet. Run a test!',
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _logs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: Text(
                                  _logs[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'monospace',
                                    fontSize: 12,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
