import 'package:flutter/material.dart';
import '../../models/hospital_model.dart';

class HospitalDetailsScreen extends StatelessWidget {
  const HospitalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hospital =
        ModalRoute.of(context)!.settings.arguments as HospitalModel;

    return Scaffold(
      appBar: AppBar(title: Text(hospital.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Departments',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: hospital.departments.length,
                itemBuilder: (context, index) {
                  final dept = hospital.departments[index];
                  return Card(
                    child: ListTile(
                      title: Text(dept),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/join-queue',
                          arguments: {
                            'hospitalId': hospital.id,
                            'department': dept,
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
