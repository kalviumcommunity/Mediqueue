


// // // // // import 'package:flutter/material.dart';
// // // // // import '../../models/hospital_model.dart';

// // // // // class PatientHomeScreen extends StatelessWidget {
// // // // //   const PatientHomeScreen({super.key});

// // // // //   // Temporary dummy data (later replace with Firestore)
// // // // //   List<HospitalModel> get nearbyHospitals => [
// // // // //         HospitalModel(
// // // // //           id: '1',
// // // // //           name: 'City General Hospital',
// // // // //           address: 'Main Road, Chennai',
// // // // //           distance: 1.2,
// // // // //           departments: [
// // // // //             'General Medicine',
// // // // //             'Cardiology',
// // // // //             'Orthopedics',
// // // // //           ],
// // // // //         ),
// // // // //         HospitalModel(
// // // // //           id: '2',
// // // // //           name: 'Central Medical Center',
// // // // //           address: 'MG Street, Chennai',
// // // // //           distance: 2.8,
// // // // //           departments: [
// // // // //             'Pediatrics',
// // // // //             'Dermatology',
// // // // //           ],
// // // // //         ),
// // // // //       ];

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: const Text('Patient Dashboard'),
// // // // //       ),
// // // // //       body: SingleChildScrollView(
// // // // //         padding: const EdgeInsets.all(16),
// // // // //         child: Column(
// // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // //           children: [
// // // // //             _buildWelcomeCard(),
// // // // //             const SizedBox(height: 24),

// // // // //             const Text(
// // // // //               'Nearby Hospitals',
// // // // //               style: TextStyle(
// // // // //                 fontSize: 20,
// // // // //                 fontWeight: FontWeight.bold,
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 16),

// // // // //             ...nearbyHospitals.map(
// // // // //               (hospital) => _buildHospitalCard(context, hospital),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //       bottomNavigationBar: BottomNavigationBar(
// // // // //         currentIndex: 0,
// // // // //         items: const [
// // // // //           BottomNavigationBarItem(
// // // // //             icon: Icon(Icons.home),
// // // // //             label: 'Home',
// // // // //           ),
// // // // //           BottomNavigationBarItem(
// // // // //             icon: Icon(Icons.queue),
// // // // //             label: 'My Queue',
// // // // //           ),
// // // // //           BottomNavigationBarItem(
// // // // //             icon: Icon(Icons.person),
// // // // //             label: 'Profile',
// // // // //           ),
// // // // //         ],
// // // // //         onTap: (index) {
// // // // //           if (index == 1) {
// // // // //             Navigator.pushNamed(context, '/join-queue');
// // // // //           } else if (index == 2) {
// // // // //             Navigator.pushNamed(context, '/patient-profile');
// // // // //           }
// // // // //         },
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   // ---------------- WELCOME CARD ----------------

// // // // //   Widget _buildWelcomeCard() {
// // // // //     return Card(
// // // // //       shape: RoundedRectangleBorder(
// // // // //         borderRadius: BorderRadius.circular(16),
// // // // //       ),
// // // // //       child: Container(
// // // // //         padding: const EdgeInsets.all(20),
// // // // //         decoration: BoxDecoration(
// // // // //           gradient: LinearGradient(
// // // // //             colors: [
// // // // //               Colors.blue.shade600,
// // // // //               Colors.blue.shade400,
// // // // //             ],
// // // // //           ),
// // // // //           borderRadius: BorderRadius.circular(16),
// // // // //         ),
// // // // //         child: const Row(
// // // // //           children: [
// // // // //             Icon(
// // // // //               Icons.waving_hand,
// // // // //               color: Colors.white,
// // // // //               size: 36,
// // // // //             ),
// // // // //             SizedBox(width: 16),
// // // // //             Text(
// // // // //               'Welcome Back!',
// // // // //               style: TextStyle(
// // // // //                 color: Colors.white,
// // // // //                 fontSize: 22,
// // // // //                 fontWeight: FontWeight.bold,
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   // ---------------- HOSPITAL CARD ----------------

// // // // //   Widget _buildHospitalCard(BuildContext context, HospitalModel hospital) {
// // // // //     return Card(
// // // // //       margin: const EdgeInsets.only(bottom: 16),
// // // // //       shape: RoundedRectangleBorder(
// // // // //         borderRadius: BorderRadius.circular(16),
// // // // //       ),
// // // // //       child: ListTile(
// // // // //         contentPadding: const EdgeInsets.all(16),
// // // // //         leading: const Icon(
// // // // //           Icons.local_hospital,
// // // // //           color: Colors.red,
// // // // //           size: 32,
// // // // //         ),
// // // // //         title: Text(
// // // // //           hospital.name,
// // // // //           style: const TextStyle(
// // // // //             fontSize: 18,
// // // // //             fontWeight: FontWeight.bold,
// // // // //           ),
// // // // //         ),
// // // // //         subtitle: Padding(
// // // // //           padding: const EdgeInsets.only(top: 6),
// // // // //           child: Text(
// // // // //             '${hospital.distance} km • ${hospital.address}',
// // // // //             style: TextStyle(
// // // // //               color: Colors.grey.shade600,
// // // // //             ),
// // // // //           ),
// // // // //         ),
// // // // //         trailing: const Icon(
// // // // //           Icons.arrow_forward_ios,
// // // // //           size: 16,
// // // // //         ),
// // // // //         onTap: () {
// // // // //           Navigator.pushNamed(
// // // // //             context,
// // // // //             '/hospital-details',
// // // // //             arguments: hospital,
// // // // //           );
// // // // //         },
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }


// // // // import 'package:flutter/material.dart';
// // // // import '../../models/hospital_model.dart';

// // // // class PatientHomeScreen extends StatelessWidget {
// // // //   const PatientHomeScreen({super.key});

// // // //   // Temporary dummy data (later replace with Firestore)
// // // //   List<HospitalModel> get nearbyHospitals => [
// // // //         HospitalModel(
// // // //           id: '1',
// // // //           name: 'City General Hospital',
// // // //           address: 'Main Road, Chennai',
// // // //           distance: 1.2,
// // // //           departments: [
// // // //             'General Medicine',
// // // //             'Cardiology',
// // // //             'Orthopedics',
// // // //           ],
// // // //         ),
// // // //         HospitalModel(
// // // //           id: '2',
// // // //           name: 'Central Medical Center',
// // // //           address: 'MG Street, Chennai',
// // // //           distance: 2.8,
// // // //           departments: [
// // // //             'Pediatrics',
// // // //             'Dermatology',
// // // //           ],
// // // //         ),
// // // //       ];

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text('Patient Dashboard'),
// // // //       ),
// // // //       body: SingleChildScrollView(
// // // //         padding: const EdgeInsets.all(16),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             _buildWelcomeCard(),
// // // //             const SizedBox(height: 24),
// // // //             const Text(
// // // //               'Nearby Hospitals',
// // // //               style: TextStyle(
// // // //                 fontSize: 20,
// // // //                 fontWeight: FontWeight.bold,
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 16),
// // // //             // Grid of square cards
// // // //             GridView.builder(
// // // //               shrinkWrap: true,
// // // //               physics: const NeverScrollableScrollPhysics(),
// // // //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // // //                 crossAxisCount: 2, // 2 cards per row
// // // //                 crossAxisSpacing: 16,
// // // //                 mainAxisSpacing: 16,
// // // //                 childAspectRatio: 1, // makes the cards square
// // // //               ),
// // // //               itemCount: nearbyHospitals.length,
// // // //               itemBuilder: (context, index) {
// // // //                 return _buildHospitalCard(context, nearbyHospitals[index]);
// // // //               },
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //       bottomNavigationBar: BottomNavigationBar(
// // // //         currentIndex: 0,
// // // //         items: const [
// // // //           BottomNavigationBarItem(
// // // //             icon: Icon(Icons.home),
// // // //             label: 'Home',
// // // //           ),
// // // //           BottomNavigationBarItem(
// // // //             icon: Icon(Icons.queue),
// // // //             label: 'My Queue',
// // // //           ),
// // // //           BottomNavigationBarItem(
// // // //             icon: Icon(Icons.person),
// // // //             label: 'Profile',
// // // //           ),
// // // //         ],
// // // //         onTap: (index) {
// // // //           if (index == 1) {
// // // //             Navigator.pushNamed(context, '/join-queue');
// // // //           } else if (index == 2) {
// // // //             Navigator.pushNamed(context, '/patient-profile');
// // // //           }
// // // //         },
// // // //       ),
// // // //     );
// // // //   }

// // // //   // ---------------- WELCOME CARD ----------------

// // // //   Widget _buildWelcomeCard() {
// // // //     return Card(
// // // //       shape: RoundedRectangleBorder(
// // // //         borderRadius: BorderRadius.circular(16),
// // // //       ),
// // // //       child: Container(
// // // //         padding: const EdgeInsets.all(20),
// // // //         decoration: BoxDecoration(
// // // //           gradient: LinearGradient(
// // // //             colors: [
// // // //               Colors.blue.shade600,
// // // //               Colors.blue.shade400,
// // // //             ],
// // // //           ),
// // // //           borderRadius: BorderRadius.circular(16),
// // // //         ),
// // // //         child: const Row(
// // // //           children: [
// // // //             Icon(
// // // //               Icons.waving_hand,
// // // //               color: Colors.white,
// // // //               size: 36,
// // // //             ),
// // // //             SizedBox(width: 16),
// // // //             Text(
// // // //               'Welcome Back!',
// // // //               style: TextStyle(
// // // //                 color: Colors.white,
// // // //                 fontSize: 22,
// // // //                 fontWeight: FontWeight.bold,
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   // ---------------- HOSPITAL CARD ----------------

// // // //   Widget _buildHospitalCard(BuildContext context, HospitalModel hospital) {
// // // //     return GestureDetector(
// // // //       onTap: () {
// // // //         Navigator.pushNamed(
// // // //           context,
// // // //           '/hospital-details',
// // // //           arguments: hospital,
// // // //         );
// // // //       },
// // // //       child: Card(
// // // //         shape: RoundedRectangleBorder(
// // // //           borderRadius: BorderRadius.circular(16),
// // // //         ),
// // // //         elevation: 3,
// // // //         child: Container(
// // // //           padding: const EdgeInsets.all(16),
// // // //           decoration: BoxDecoration(
// // // //             borderRadius: BorderRadius.circular(16),
// // // //           ),
// // // //           child: Column(
// // // //             mainAxisAlignment: MainAxisAlignment.center,
// // // //             children: [
// // // //               // Icon removed as requested
// // // //               // const Icon(
// // // //               //   Icons.local_hospital,
// // // //               //   color: Colors.red,
// // // //               //   size: 36,
// // // //               // ),
// // // //               const SizedBox(height: 12),
// // // //               Text(
// // // //                 hospital.name,
// // // //                 textAlign: TextAlign.center,
// // // //                 style: const TextStyle(
// // // //                   fontWeight: FontWeight.bold,
// // // //                   fontSize: 16,
// // // //                 ),
// // // //               ),
// // // //               const SizedBox(height: 8),
// // // //               Text(
// // // //                 '${hospital.distance} km • ${hospital.address}',
// // // //                 textAlign: TextAlign.center,
// // // //                 style: TextStyle(
// // // //                   color: Colors.grey.shade600,
// // // //                   fontSize: 12,
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import '../../utils/app_colors.dart';
// // // import '../../widgets/profile_header.dart';
// // // import '../../widgets/hospital_card.dart';

// // // class PatientHomeScreen extends StatelessWidget {
// // //   const PatientHomeScreen({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: AppColors.bgColor,
// // //       drawer: buildDrawer(),
// // //       body: Column(
// // //         children: [
// // //           const ProfileHeader(name: 'Sarah Johnson'),

// // //           // Search bar
// // //           Container(
// // //             color: const Color.fromRGBO(13, 27, 140, 1),
// // //             padding: const EdgeInsets.all(16),
// // //             child: Container(
// // //               padding: const EdgeInsets.symmetric(horizontal: 14),
// // //               decoration: BoxDecoration(
// // //                 color: Colors.white,
// // //                 borderRadius: BorderRadius.circular(14),
// // //               ),
// // //               child: const TextField(
// // //                 decoration: InputDecoration(
// // //                   icon: Icon(Icons.search),
// // //                   hintText: 'Search hospitals, doctors, specialties...',
// // //                   border: InputBorder.none,
// // //                 ),
// // //               ),
// // //             ),
// // //           ),

// // //           Expanded(
// // //             child: ListView(
// // //               padding: const EdgeInsets.all(16),
// // //               children: [
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: const [
// // //                     Text(
// // //                       'Nearby Hospitals',
// // //                       style:
// // //                           TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
// // //                     ),
// // //                     Row(
// // //                       children: [
// // //                         Icon(Icons.location_on,
// // //                             size: 16, color: Colors.blue),
// // //                         SizedBox(width: 4),
// // //                         Text('2.5 km radius',
// // //                             style: TextStyle(color: Colors.blue)),
// // //                       ],
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 16),

// // //                 HospitalCard(
// // //                   iconBg: const Color(0xFFD8D5FF),
// // //                   icon: Icons.add,
// // //                   iconColor: const Color(0xFF0D1B8C),
// // //                   name: 'City General Hospital',
// // //                   distance: '1.2 km • Downtown',
// // //                 ),
// // //                 HospitalCard(
// // //                   iconBg: const Color(0xFFCFF5EF),
// // //                   icon: Icons.local_hospital,
// // //                   iconColor: const Color(0xFF2EC4B6),
// // //                   name: 'MediCare Clinic',
// // //                   distance: '0.8 km • Medical District',
// // //                 ),
// // //                 HospitalCard(
// // //                   iconBg: const Color(0xFFFFE0CF),
// // //                   icon: Icons.healing,
// // //                   iconColor: const Color(0xFFFF8C42),
// // //                   name: "St. Mary's Medical Center",
// // //                   distance: '0.8 km • Medical District',
// // //                 ),
// // //                 HospitalCard(
// // //                   iconBg: const Color(0xFFE8E9FF),
// // //                   icon: Icons.emergency,
// // //                   iconColor: const Color(0xFF0D1B8C),
// // //                   name: 'Emergency Care Center',
// // //                   distance: '1.5 km • Central',
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // Drawer buildDrawer() {
// // //   return Drawer(
// // //     shape: const RoundedRectangleBorder(
// // //       borderRadius: BorderRadius.horizontal(right: Radius.circular(24)),
// // //     ),
// // //     child: SafeArea(
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(16),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             const Text(
// // //               'MediQueue',
// // //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
// // //             ),
// // //             const SizedBox(height: 30),
// // //             drawerItem(Icons.person, 'My Account'),
// // //             drawerItem(Icons.notifications, 'Notification'),
// // //             drawerItem(Icons.history, 'History'),
// // //             const Spacer(),
// // //             Center(
// // //               child: OutlinedButton(
// // //                 onPressed: () {},
// // //                 style: OutlinedButton.styleFrom(
// // //                   padding: const EdgeInsets.symmetric(
// // //                       horizontal: 40, vertical: 12),
// // //                   shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(20),
// // //                   ),
// // //                 ),
// // //                 child: const Text('Logout'),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     ),
// // //   );
// // // }

// // // Widget drawerItem(IconData icon, String title) {
// // //   return Padding(
// // //     padding: const EdgeInsets.only(bottom: 20),
// // //     child: Row(
// // //       children: [
// // //         Icon(icon),
// // //         const SizedBox(width: 14),
// // //         Text(title, style: const TextStyle(fontSize: 16)),
// // //       ],
// // //     ),
// // //   );
// // // }
// // import 'package:flutter/material.dart';
// // import '../../utils/app_colors.dart';
// // import '../../widgets/profile_header.dart';
// // import '../../widgets/hospital_card.dart';
// // import 'patient_profile_screen.dart';
// // import 'join_queue_screen.dart';

// // class PatientHomeScreen extends StatelessWidget {
// //   const PatientHomeScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: AppColors.bgColor,
// //       drawer: _buildDrawer(context),
// //       body: Column(
// //         children: [
// //           ProfileHeader(
// //               name: 'Sarah Johnson',
// //               role: 'Patient',
// //               icon: Icons.person,
// //               subtitle: '',  // provide empty string if no subtitle
// //               backgroundColor: AppColors.primaryBlue, // or any Color you want
// //               decoration: const BoxDecoration(), // or any decoration you want
// //             ),


// //           // Search bar
// //           Container(
// //             color: AppColors.primaryBlue,
// //             padding: const EdgeInsets.all(16),
// //             child: Container(
// //               padding: const EdgeInsets.symmetric(horizontal: 14),
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(14),
// //               ),
// //               child: const TextField(
// //                 decoration: InputDecoration(
// //                   icon: Icon(Icons.search),
// //                   hintText: 'Search hospitals, doctors, specialties...',
// //                   border: InputBorder.none,
// //                 ),
// //               ),
// //             ),
// //           ),

// //           Expanded(
// //             child: ListView(
// //               padding: const EdgeInsets.all(16),
// //               children: [
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: const [
// //                     Text(
// //                       'Nearby Hospitals',
// //                       style: TextStyle(
// //                         fontSize: 18,
// //                         fontWeight: FontWeight.w600,
// //                       ),
// //                     ),
// //                     Row(
// //                       children: [
// //                         Icon(Icons.location_on,
// //                             size: 16, color: Colors.blue),
// //                         SizedBox(width: 4),
// //                         Text(
// //                           '2.5 km radius',
// //                           style: TextStyle(color: Colors.blue),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 16),

// //                 HospitalCard(
// //                   iconBg: Color(0xFFD8D5FF),
// //                   icon: Icons.add,
// //                   iconColor: Color(0xFF4B4DED),
// //                   name: 'City General Hospital',
// //                   distance: '1.2 km • Downtown',
// //                   department: 'General Medicine',
// //                   rating: '4.5',
// //                   waitTime: '20 mins',
// //                   onOpen: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (_) => const JoinQueueScreen(),
// //                       ),
// //                     );
// //                   },
// //                 ),

// //                 HospitalCard(
// //                   iconBg: Color(0xFFCFF5EF),
// //                   icon: Icons.local_hospital,
// //                   iconColor: Color(0xFF2EC4B6),
// //                   name: 'MediCare Clinic',
// //                   distance: '0.8 km • Medical District',
// //                   department: 'Multi-Speciality',
// //                   rating: '4.2',
// //                   waitTime: '15 mins',
// //                   onOpen: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (_) => const JoinQueueScreen(),
// //                       ),
// //                     );
// //                   },
// //                 ),

// //                 HospitalCard(
// //                   iconBg: Color(0xFFFFE0CC),
// //                   icon: Icons.healing,
// //                   iconColor: Color(0xFFFF8A50),
// //                   name: 'St. Mary’s Medical Center',
// //                   distance: '1.5 km • Central',
// //                   department: 'Cardiology',
// //                   rating: '4.7',
// //                   waitTime: '25 mins',
// //                   onOpen: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (_) => const JoinQueueScreen(),
// //                       ),
// //                     );
// //                   },
// //                 ),

// //                 HospitalCard(
// //                   iconBg: Color(0xFFE3F2FD),
// //                   icon: Icons.local_hospital_outlined,
// //                   iconColor: Color(0xFF1E88E5),
// //                   name: 'LifeCare Hospital',
// //                   distance: '2.0 km • East End',
// //                   department: 'Orthopedics',
// //                   rating: '4.3',
// //                   waitTime: '18 mins',
// //                   onOpen: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (_) => const JoinQueueScreen(),
// //                       ),
// //                     );
// //                   },
// //                 ),

// //                 HospitalCard(
// //                   iconBg: Color(0xFFFCE4EC),
// //                   icon: Icons.favorite,
// //                   iconColor: Color(0xFFD81B60),
// //                   name: 'HeartPlus Clinic',
// //                   distance: '2.2 km • Riverside',
// //                   department: 'Cardiology',
// //                   rating: '4.6',
// //                   waitTime: '22 mins',
// //                   onOpen: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (_) => const JoinQueueScreen(),
// //                       ),
// //                     );
// //                   },
// //                 ),

// //                 HospitalCard(
// //                   iconBg: Color(0xFFE8F5E9),
// //                   icon: Icons.medical_services,
// //                   iconColor: Color(0xFF43A047),
// //                   name: 'GreenCross Hospital',
// //                   distance: '1.9 km • Park Area',
// //                   department: 'General Surgery',
// //                   rating: '4.1',
// //                   waitTime: '30 mins',
// //                   onOpen: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (_) => const JoinQueueScreen(),
// //                       ),
// //                     );
// //                   },
// //                 ),

// //                 HospitalCard(
// //                   iconBg: Color(0xFFFFF3E0),
// //                   icon: Icons.child_care,
// //                   iconColor: Color(0xFFFB8C00),
// //                   name: 'LittleCare Children Hospital',
// //                   distance: '2.4 km • West Avenue',
// //                   department: 'Pediatrics',
// //                   rating: '4.8',
// //                   waitTime: '12 mins',
// //                   onOpen: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (_) => const JoinQueueScreen(),
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   // ✅ DRAWER WITH LOGOUT BUTTON
// //   Drawer _buildDrawer(BuildContext context) {
// //     return Drawer(
// //       shape: const RoundedRectangleBorder(
// //         borderRadius: BorderRadius.horizontal(right: Radius.circular(24)),
// //       ),
// //       child: SafeArea(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               const Text(
// //                 'MediQueue',
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.w600,
// //                 ),
// //               ),
// //               const SizedBox(height: 30),

// //               _drawerItem(
// //                 context,
// //                 Icons.person,
// //                 'My Account',
// //                 () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (_) => const PatientProfileScreen(),
// //                     ),
// //                   );
// //                 },
// //               ),

// //               _drawerItem(
// //                 context,
// //                 Icons.notifications,
// //                 'Notification',
// //                 () {
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     const SnackBar(
// //                       content: Text('Notifications coming soon'),
// //                     ),
// //                   );
// //                 },
// //               ),

// //               _drawerItem(
// //                 context,
// //                 Icons.history,
// //                 'History',
// //                 () {
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     const SnackBar(
// //                       content: Text('History page coming soon'),
// //                     ),
// //                   );
// //                 },
// //               ),

// //               const SizedBox(height: 10),

// //               // 🔴 LOGOUT BUTTON
// //               SizedBox(
// //                 width: double.infinity,
// //                 child: ElevatedButton.icon(
// //                   onPressed: () {
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       const SnackBar(
// //                         content: Text('Logged out'),
// //                       ),
// //                     );
// //                   },
// //                   icon: const Icon(Icons.logout),
// //                   label: const Text('Logout'),
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: const Color.fromARGB(255, 221, 238, 251),
// //                     foregroundColor: const Color.fromARGB(255, 0, 0, 0),
// //                     elevation: 0,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(14),
// //                     ),
// //                     padding: const EdgeInsets.symmetric(vertical: 12),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _drawerItem(
// //     BuildContext context,
// //     IconData icon,
// //     String title,
// //     VoidCallback onTap,
// //   ) {
// //     return InkWell(
// //       onTap: () {
// //         Navigator.pop(context);
// //         onTap();
// //       },
// //       child: Padding(
// //         padding: const EdgeInsets.only(bottom: 20),
// //         child: Row(
// //           children: [
// //             Icon(icon),
// //             const SizedBox(width: 14),
// //             Text(title, style: const TextStyle(fontSize: 16)),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import '../../utils/app_colors.dart';
// import '../../widgets/profile_header.dart';
// import '../../widgets/hospital_card.dart';
// import 'patient_profile_screen.dart';
// import 'join_queue_screen.dart';

// class PatientHomeScreen extends StatelessWidget {
//   const PatientHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgColor,
//       drawer: _buildDrawer(context),
//       body: Column(
//         children: [
//           ProfileHeader(
//             name: 'Sarah Johnson',
//             role: 'Patient',
//             icon: Icons.person,
//             backgroundColor: AppColors.primaryBlue,
//             onMenuTap: () => Scaffold.of(context).openDrawer(),
//             onPowerTap: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Power clicked')),
//               );
//             },
//           ),

//           // Search bar
//           Container(
//             color: AppColors.primaryBlue,
//             padding: const EdgeInsets.all(16),
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 14),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(14),
//               ),
//               child: const TextField(
//                 decoration: InputDecoration(
//                   icon: Icon(Icons.search),
//                   hintText: 'Search hospitals, doctors, specialties...',
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//           ),

//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16),
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     Text(
//                       'Nearby Hospitals',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Icon(Icons.location_on,
//                             size: 16, color: Colors.blue),
//                         SizedBox(width: 4),
//                         Text(
//                           '2.5 km radius',
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),

//                 HospitalCard(
//                   iconBg: Color(0xFFD8D5FF),
//                   icon: Icons.add,
//                   iconColor: Color(0xFF4B4DED),
//                   name: 'City General Hospital',
//                   distance: '1.2 km • Downtown',
//                   department: 'General Medicine',
//                   rating: '4.5',
//                   waitTime: '20 mins',
//                   onOpen: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const JoinQueueScreen(),
//                       ),
//                     );
//                   },
//                 ),

//                 HospitalCard(
//                   iconBg: Color(0xFFCFF5EF),
//                   icon: Icons.local_hospital,
//                   iconColor: Color(0xFF2EC4B6),
//                   name: 'MediCare Clinic',
//                   distance: '0.8 km • Medical District',
//                   department: 'Multi-Speciality',
//                   rating: '4.2',
//                   waitTime: '15 mins',
//                   onOpen: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const JoinQueueScreen(),
//                       ),
//                     );
//                   },
//                 ),

//                 HospitalCard(
//                   iconBg: Color(0xFFFFE0CC),
//                   icon: Icons.healing,
//                   iconColor: Color(0xFFFF8A50),
//                   name: 'St. Mary’s Medical Center',
//                   distance: '1.5 km • Central',
//                   department: 'Cardiology',
//                   rating: '4.7',
//                   waitTime: '25 mins',
//                   onOpen: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const JoinQueueScreen(),
//                       ),
//                     );
//                   },
//                 ),

//                 HospitalCard(
//                   iconBg: Color(0xFFE3F2FD),
//                   icon: Icons.local_hospital_outlined,
//                   iconColor: Color(0xFF1E88E5),
//                   name: 'LifeCare Hospital',
//                   distance: '2.0 km • East End',
//                   department: 'Orthopedics',
//                   rating: '4.3',
//                   waitTime: '18 mins',
//                   onOpen: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const JoinQueueScreen(),
//                       ),
//                     );
//                   },
//                 ),

//                 HospitalCard(
//                   iconBg: Color(0xFFFCE4EC),
//                   icon: Icons.favorite,
//                   iconColor: Color(0xFFD81B60),
//                   name: 'HeartPlus Clinic',
//                   distance: '2.2 km • Riverside',
//                   department: 'Cardiology',
//                   rating: '4.6',
//                   waitTime: '22 mins',
//                   onOpen: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const JoinQueueScreen(),
//                       ),
//                     );
//                   },
//                 ),

//                 HospitalCard(
//                   iconBg: Color(0xFFE8F5E9),
//                   icon: Icons.medical_services,
//                   iconColor: Color(0xFF43A047),
//                   name: 'GreenCross Hospital',
//                   distance: '1.9 km • Park Area',
//                   department: 'General Surgery',
//                   rating: '4.1',
//                   waitTime: '30 mins',
//                   onOpen: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const JoinQueueScreen(),
//                       ),
//                     );
//                   },
//                 ),

//                 HospitalCard(
//                   iconBg: Color(0xFFFFF3E0),
//                   icon: Icons.child_care,
//                   iconColor: Color(0xFFFB8C00),
//                   name: 'LittleCare Children Hospital',
//                   distance: '2.4 km • West Avenue',
//                   department: 'Pediatrics',
//                   rating: '4.8',
//                   waitTime: '12 mins',
//                   onOpen: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const JoinQueueScreen(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ✅ DRAWER WITH LOGOUT BUTTON
//   Drawer _buildDrawer(BuildContext context) {
//     return Drawer(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.horizontal(right: Radius.circular(24)),
//       ),
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'MediQueue',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(height: 30),

//               _drawerItem(
//                 context,
//                 Icons.person,
//                 'My Account',
//                 () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => const PatientProfileScreen(),
//                     ),
//                   );
//                 },
//               ),

//               _drawerItem(
//                 context,
//                 Icons.notifications,
//                 'Notification',
//                 () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Notifications coming soon'),
//                     ),
//                   );
//                 },
//               ),

//               _drawerItem(
//                 context,
//                 Icons.history,
//                 'History',
//                 () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('History page coming soon'),
//                     ),
//                   );
//                 },
//               ),

//               const SizedBox(height: 10),

//               // 🔴 LOGOUT BUTTON
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton.icon(
//                   onPressed: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Logged out'),
//                       ),
//                     );
//                   },
//                   icon: const Icon(Icons.logout),
//                   label: const Text('Logout'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 221, 238, 251),
//                     foregroundColor: const Color.fromARGB(255, 0, 0, 0),
//                     elevation: 0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(14),
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _drawerItem(
//     BuildContext context,
//     IconData icon,
//     String title,
//     VoidCallback onTap,
//   ) {
//     return InkWell(
//       onTap: () {
//         Navigator.pop(context);
//         onTap();
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 20),
//         child: Row(
//           children: [
//             Icon(icon),
//             const SizedBox(width: 14),
//             Text(title, style: const TextStyle(fontSize: 16)),
//           ],
//         ),
//       ),
//     );
//   }
// }
























import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../widgets/profile_header.dart';
import '../../widgets/hospital_card.dart';
import 'join_queue_screen.dart';
import 'patient_profile_screen.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.bgColor,
      drawer: _buildDrawer(context),
      body: Column(
        children: [
          ProfileHeader(
            name: 'Sarah Johnson',
            role: 'Patient',
            icon: Icons.person,
            backgroundColor: AppColors.primaryBlue,
            onMenuTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            onPowerTap: () {},
          ),

          // 🔍 SEARCH
          Container(
            color: AppColors.primaryBlue,
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Search hospitals, doctors, specialties...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // 🏥 LIST
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Nearby Hospitals',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            size: 16, color: Colors.blue),
                        SizedBox(width: 4),
                        Text('2.5 km radius',
                            style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                _hospital(context,
                    name: 'City General Hospital',
                    distance: '1.2 km • Downtown',
                    dept: 'General Medicine',
                    rating: '4.5',
                    wait: '20 mins',
                    icon: Icons.add,
                    bg: const Color(0xFFD8D5FF),
                    color: const Color(0xFF4B4DED)),

                _hospital(context,
                    name: 'MediCare Clinic',
                    distance: '0.8 km • Medical District',
                    dept: 'Multi-Speciality',
                    rating: '4.2',
                    wait: '15 mins',
                    icon: Icons.local_hospital,
                    bg: const Color(0xFFCFF5EF),
                    color: const Color(0xFF2EC4B6)),

                _hospital(context,
                    name: 'St. Mary’s Medical Center',
                    distance: '1.5 km • Central',
                    dept: 'Cardiology',
                    rating: '4.7',
                    wait: '25 mins',
                    icon: Icons.healing,
                    bg: const Color(0xFFFFE0CC),
                    color: const Color(0xFFFF8A50)),

                _hospital(context,
                    name: 'LifeCare Hospital',
                    distance: '2.0 km • East End',
                    dept: 'Orthopedics',
                    rating: '4.3',
                    wait: '18 mins',
                    icon: Icons.local_hospital_outlined,
                    bg: const Color(0xFFE3F2FD),
                    color: const Color(0xFF1E88E5)),

                _hospital(context,
                    name: 'HeartPlus Clinic',
                    distance: '2.2 km • Riverside',
                    dept: 'Cardiology',
                    rating: '4.6',
                    wait: '22 mins',
                    icon: Icons.favorite,
                    bg: const Color(0xFFFCE4EC),
                    color: const Color(0xFFD81B60)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _hospital(
    BuildContext context, {
    required String name,
    required String distance,
    required String dept,
    required String rating,
    required String wait,
    required IconData icon,
    required Color bg,
    required Color color,
  }) {
    return HospitalCard(
      icon: icon,
      iconBg: bg,
      iconColor: color,
      name: name,
      distance: distance,
      department: dept,
      rating: rating,
      waitTime: wait,
      onOpen: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const JoinQueueScreen(),
          ),
        );
      },
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'MediQueue',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),

            _drawerItem(context, Icons.person, 'My Account', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PatientProfileScreen(),
                ),
              );
            }),

            _drawerItem(context, Icons.notifications, 'Notifications', () {}),
            _drawerItem(context, Icons.history, 'History', () {}),

            const SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: const Text('Logout')),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}
