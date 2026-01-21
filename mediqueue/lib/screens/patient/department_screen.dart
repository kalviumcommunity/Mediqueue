import 'package:flutter/material.dart';
import 'join_queue_status_screen.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({super.key});

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  String? departmentName;

  final List<Map<String, dynamic>> departments = [
    {
      "name": "Cardiology",
      "subtitle": "Heart & Vascular",
      "icon": Icons.favorite,
      "color": Colors.lightBlue,
    },
    {
      "name": "Neurology",
      "subtitle": "Brain & Nervous System",
      "icon": Icons.psychology,
      "color": Colors.teal,
    },
    {
      "name": "Orthopedics",
      "subtitle": "Bones & Joints",
      "icon": Icons.accessibility,
      "color": Colors.indigo,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // 🔹 APP BAR
      appBar: AppBar(
        title: const Text("Department"),
        leading: const BackButton(),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(13, 27, 140, 1),
                Color.fromRGBO(90, 140, 255, 1),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Department",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: GridView.builder(
                itemCount: departments.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final dept = departments[index];
                  final selected = departmentName == dept["name"];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        departmentName = dept["name"];
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: selected
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2,
                        ),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 8, color: Colors.black12)
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(dept["icon"],
                              color: dept["color"], size: 36),
                          const SizedBox(height: 12),
                          Text(
                            dept["name"],
                            style:
                                const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            dept["subtitle"],
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // 🔹 JOIN QUEUE BUTTON
      bottomNavigationBar: departmentName == null
          ? null
          : Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 56,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add_circle_outline),
                  label: Text(
                    "Join Queue - $departmentName",
                    style: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => JoinQueueStatusScreen(
                          departmentName: departmentName!,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(255, 148, 237, 201),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
