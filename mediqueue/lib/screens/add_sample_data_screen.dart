import 'package:flutter/material.dart';
import '../utils/add_sample_hospitals.dart';

/// Debug screen to populate Firebase with sample hospital data
/// Access this once to add dummy coordinates
class AddSampleDataScreen extends StatefulWidget {
  const AddSampleDataScreen({super.key});

  @override
  State<AddSampleDataScreen> createState() => _AddSampleDataScreenState();
}

class _AddSampleDataScreenState extends State<AddSampleDataScreen> {
  bool _isLoading = false;
  String _message = '';

  Future<void> _addSampleData() async {
    setState(() {
      _isLoading = true;
      _message = 'Adding sample hospitals...';
    });

    try {
      await addSampleHospitals();
      setState(() {
        _message =
            '✅ Sample hospitals added successfully!\n\nYou can now:\n1. Go to Patient Home\n2. Tap the Map button\n3. View hospitals on the map';
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _message = '❌ Error: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _resetAndAddData() async {
    setState(() {
      _isLoading = true;
      _message = 'Resetting and adding hospitals...';
    });

    try {
      await resetAndAddSampleHospitals();
      setState(() {
        _message = '✅ Hospitals reset and added successfully!';
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _message = '❌ Error: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Sample Hospital Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.local_hospital,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 24),
            const Text(
              'Add Sample Hospitals',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'This will add 8 sample hospitals with coordinates to your Firebase database. You only need to do this once.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _addSampleData,
              icon: const Icon(Icons.add_location),
              label: const Text('Add Sample Hospitals'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: _isLoading ? null : _resetAndAddData,
              icon: const Icon(Icons.refresh),
              label: const Text('Reset & Add Fresh Data'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 32),
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (_message.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _message.contains('✅')
                      ? Colors.green.shade50
                      : Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _message.contains('✅') ? Colors.green : Colors.red,
                  ),
                ),
                child: Text(
                  _message,
                  style: TextStyle(
                    color: _message.contains('✅')
                        ? Colors.green.shade900
                        : Colors.red.shade900,
                  ),
                ),
              ),
            const Spacer(),
            const Text(
              'Sample Data Includes:\n'
              '• 8 hospitals around New Delhi\n'
              '• Various departments per hospital\n'
              '• Realistic coordinates\n'
              '• Queue counts for testing',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
