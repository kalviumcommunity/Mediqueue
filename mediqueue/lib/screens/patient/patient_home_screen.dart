


// import 'package:flutter/material.dart';
// import '../../models/hospital_model.dart';

// class PatientHomeScreen extends StatelessWidget {
//   const PatientHomeScreen({super.key});

//   // Temporary dummy data (later replace with Firestore)
//   List<HospitalModel> get nearbyHospitals => [
//         HospitalModel(
//           id: '1',
//           name: 'City General Hospital',
//           address: 'Main Road, Chennai',
//           distance: 1.2,
//           departments: [
//             'General Medicine',
//             'Cardiology',
//             'Orthopedics',
//           ],
//         ),
//         HospitalModel(
//           id: '2',
//           name: 'Central Medical Center',
//           address: 'MG Street, Chennai',
//           distance: 2.8,
//           departments: [
//             'Pediatrics',
//             'Dermatology',
//           ],
//         ),
//       ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Patient Dashboard'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildWelcomeCard(),
//             const SizedBox(height: 24),

//             const Text(
//               'Nearby Hospitals',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),

//             ...nearbyHospitals.map(
//               (hospital) => _buildHospitalCard(context, hospital),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.queue),
//             label: 'My Queue',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         onTap: (index) {
//           if (index == 1) {
//             Navigator.pushNamed(context, '/join-queue');
//           } else if (index == 2) {
//             Navigator.pushNamed(context, '/patient-profile');
//           }
//         },
//       ),
//     );
//   }

//   // ---------------- WELCOME CARD ----------------

//   Widget _buildWelcomeCard() {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.blue.shade600,
//               Colors.blue.shade400,
//             ],
//           ),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: const Row(
//           children: [
//             Icon(
//               Icons.waving_hand,
//               color: Colors.white,
//               size: 36,
//             ),
//             SizedBox(width: 16),
//             Text(
//               'Welcome Back!',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ---------------- HOSPITAL CARD ----------------

//   Widget _buildHospitalCard(BuildContext context, HospitalModel hospital) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: ListTile(
//         contentPadding: const EdgeInsets.all(16),
//         leading: const Icon(
//           Icons.local_hospital,
//           color: Colors.red,
//           size: 32,
//         ),
//         title: Text(
//           hospital.name,
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         subtitle: Padding(
//           padding: const EdgeInsets.only(top: 6),
//           child: Text(
//             '${hospital.distance} km • ${hospital.address}',
//             style: TextStyle(
//               color: Colors.grey.shade600,
//             ),
//           ),
//         ),
//         trailing: const Icon(
//           Icons.arrow_forward_ios,
//           size: 16,
//         ),
//         onTap: () {
//           Navigator.pushNamed(
//             context,
//             '/hospital-details',
//             arguments: hospital,
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../../models/hospital_model.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  // Temporary dummy data (later replace with Firestore)
  List<HospitalModel> get nearbyHospitals => [
        HospitalModel(
          id: '1',
          name: 'City General Hospital',
          address: 'Main Road, Chennai',
          distance: 1.2,
          departments: [
            'General Medicine',
            'Cardiology',
            'Orthopedics',
          ],
        ),
        HospitalModel(
          id: '2',
          name: 'Central Medical Center',
          address: 'MG Street, Chennai',
          distance: 2.8,
          departments: [
            'Pediatrics',
            'Dermatology',
          ],
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeCard(),
            const SizedBox(height: 24),
            const Text(
              'Nearby Hospitals',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Grid of square cards
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 cards per row
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1, // makes the cards square
              ),
              itemCount: nearbyHospitals.length,
              itemBuilder: (context, index) {
                return _buildHospitalCard(context, nearbyHospitals[index]);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.queue),
            label: 'My Queue',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/join-queue');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/patient-profile');
          }
        },
      ),
    );
  }

  // ---------------- WELCOME CARD ----------------

  Widget _buildWelcomeCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade600,
              Colors.blue.shade400,
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.waving_hand,
              color: Colors.white,
              size: 36,
            ),
            SizedBox(width: 16),
            Text(
              'Welcome Back!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- HOSPITAL CARD ----------------

  Widget _buildHospitalCard(BuildContext context, HospitalModel hospital) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/hospital-details',
          arguments: hospital,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon removed as requested
              // const Icon(
              //   Icons.local_hospital,
              //   color: Colors.red,
              //   size: 36,
              // ),
              const SizedBox(height: 12),
              Text(
                hospital.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${hospital.distance} km • ${hospital.address}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
