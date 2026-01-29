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
//   PatientHomeScreen({super.key});

//   // ✅ GlobalKey to control Scaffold drawer safely
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey, // Assign the key here
//       backgroundColor: AppColors.bgColor,
//       drawer: _buildDrawer(context),
//       body: Column(
//         children: [
//           // ✅ ProfileHeader with menu button using GlobalKey
//           ProfileHeader(
//             name: 'Sarah Johnson',
//             role: 'Patient',
//             icon: Icons.person,
//             backgroundColor: AppColors.primaryBlue,
//             onMenuTap: () {
//               _scaffoldKey.currentState?.openDrawer(); // opens drawer safely
//             },
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

//           // Hospital list
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16),
//               children: [
//                 // Header
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
//                         Icon(Icons.location_on, size: 16, color: Colors.blue),
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

//                 // Hospital cards
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

//   // ✅ Drawer
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

//               // Logout Button
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
//                     foregroundColor: Colors.black,
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
//         Navigator.pop(context); // Close drawer
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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediqueue/utils/logout_notifier.dart';
import '../../utils/app_colors.dart';
import '../../widgets/profile_header.dart';
import '../../widgets/hospital_card.dart';
import 'patient_profile_screen.dart';
import 'join_queue_screen.dart';
import '../hospital_map_screen.dart';
import '../add_sample_data_screen.dart';
import '../auth_screen.dart';
import '../backend_test_screen.dart';
import '../../services/user_service.dart'; // Import UserService

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoggingOut = false;
  late UserService _userService;
  String _userName = 'Patient';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _userService = UserService();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      // Get user's display name from UserService
      final userName = await _userService.getDisplayName();

      setState(() {
        _userName = userName;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading user data in home screen: $e');
      // Fallback to Firebase Auth display name
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        setState(() {
          _userName = currentUser.displayName ?? 'Patient';
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _refreshUserData() async {
    setState(() {
      _isLoading = true;
    });
    await _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.bgColor,
      drawer: _buildDrawer(context),
      body: Stack(
        children: [
          // Main content
          Column(
            children: [
              // ✅ ProfileHeader with menu button using GlobalKey
              ProfileHeader(
                name: _userName,
                role: 'Patient',
                icon: Icons.person,
                backgroundColor: AppColors.primaryBlue,
                onMenuTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                onRefresh: _isLoading ? null : _refreshUserData,
                isLoading: _isLoading,
              ),

              // Search bar
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

              // Hospital list
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nearby Hospitals',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                size: 16, color: Colors.blue),
                            const SizedBox(width: 4),
                            const Text(
                              '2.5 km radius',
                              style: TextStyle(color: Colors.blue),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const HospitalMapScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.map,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Map',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Hospital cards
                    HospitalCard(
                      iconBg: const Color(0xFFD8D5FF),
                      icon: Icons.add,
                      iconColor: const Color(0xFF4B4DED),
                      name: 'City General Hospital',
                      distance: '1.2 km • Downtown',
                      department: 'General Medicine',
                      rating: '4.5',
                      waitTime: '20 mins',
                      onOpen: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const JoinQueueScreen(
                              departmentName: '',
                            ),
                          ),
                        );
                      },
                    ),

                    HospitalCard(
                      iconBg: const Color(0xFFCFF5EF),
                      icon: Icons.local_hospital,
                      iconColor: const Color(0xFF2EC4B6),
                      name: 'MediCare Clinic',
                      distance: '0.8 km • Medical District',
                      department: 'Multi-Speciality',
                      rating: '4.2',
                      waitTime: '15 mins',
                      onOpen: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const JoinQueueScreen(
                              departmentName: '',
                            ),
                          ),
                        );
                      },
                    ),

                    HospitalCard(
                      iconBg: const Color(0xFFFFE0CC),
                      icon: Icons.healing,
                      iconColor: const Color(0xFFFF8A50),
                      name: 'St. Mary\'s Medical Center',
                      distance: '1.5 km • Central',
                      department: 'Cardiology',
                      rating: '4.7',
                      waitTime: '25 mins',
                      onOpen: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const JoinQueueScreen(
                              departmentName: '',
                            ),
                          ),
                        );
                      },
                    ),

                    HospitalCard(
                      iconBg: const Color(0xFFE3F2FD),
                      icon: Icons.local_hospital_outlined,
                      iconColor: const Color(0xFF1E88E5),
                      name: 'LifeCare Hospital',
                      distance: '2.0 km • East End',
                      department: 'Orthopedics',
                      rating: '4.3',
                      waitTime: '18 mins',
                      onOpen: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const JoinQueueScreen(
                              departmentName: '',
                            ),
                          ),
                        );
                      },
                    ),

                    HospitalCard(
                      iconBg: const Color(0xFFFCE4EC),
                      icon: Icons.favorite,
                      iconColor: const Color(0xFFD81B60),
                      name: 'HeartPlus Clinic',
                      distance: '2.2 km • Riverside',
                      department: 'Cardiology',
                      rating: '4.6',
                      waitTime: '22 mins',
                      onOpen: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const JoinQueueScreen(
                              departmentName: '',
                            ),
                          ),
                        );
                      },
                    ),

                    HospitalCard(
                      iconBg: const Color(0xFFE8F5E9),
                      icon: Icons.medical_services,
                      iconColor: const Color(0xFF43A047),
                      name: 'GreenCross Hospital',
                      distance: '1.9 km • Park Area',
                      department: 'General Surgery',
                      rating: '4.1',
                      waitTime: '30 mins',
                      onOpen: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const JoinQueueScreen(
                              departmentName: '',
                            ),
                          ),
                        );
                      },
                    ),

                    HospitalCard(
                      iconBg: const Color(0xFFFFF3E0),
                      icon: Icons.child_care,
                      iconColor: const Color(0xFFFB8C00),
                      name: 'LittleCare Children Hospital',
                      distance: '2.4 km • West Avenue',
                      department: 'Pediatrics',
                      rating: '4.8',
                      waitTime: '12 mins',
                      onOpen: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const JoinQueueScreen(
                              departmentName: '',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Logout Overlay - This should be at the END of Stack
          if (_isLoggingOut)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primaryBlue),
                          strokeWidth: 3,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Signing out...',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ✅ Drawer - WITH "MediQueue" title restored and logout button in original position
  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ MediQueue title RESTORED
              const Text(
                'MediQueue',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 30),

              _drawerItem(
                context,
                Icons.person,
                'My Profile',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PatientProfileScreen(),
                    ),
                  );
                },
              ),

              _drawerItem(
                context,
                Icons.notifications,
                'Notification',
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Notifications coming soon'),
                    ),
                  );
                },
              ),

              _drawerItem(
                context,
                Icons.history,
                'History',
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('History page coming soon'),
                    ),
                  );
                },
              ),

              _drawerItem(
                context,
                Icons.map_outlined,
                'Hospital Map',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HospitalMapScreen(),
                    ),
                  );
                },
              ),

              _drawerItem(
                context,
                Icons.add_location_alt,
                'Add Sample Data 🧪',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AddSampleDataScreen(),
                    ),
                  );
                },
              ),

              _drawerItem(
                context,
                Icons.science,
                'Backend Test 🔧',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const BackendTestScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              // ✅ Logout Button - MOVED BACK to original position (NOT at bottom)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    // Close drawer
                    Navigator.pop(context);

                    // Show overlay
                    setState(() {
                      _isLoggingOut = true;
                    });

                    try {
                      // ✅ Set logout flag BEFORE signing out
                      LogoutNotifier.setShouldShowMessage();

                      // Add a small delay for smooth UI
                      await Future.delayed(const Duration(milliseconds: 300));

                      // Perform Firebase logout
                      await FirebaseAuth.instance.signOut();

                      // ✅ IMPORTANT: Navigate back to AuthScreen
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                        (route) => false,
                      );
                    } catch (e) {
                      // Hide overlay on error
                      if (mounted) {
                        setState(() {
                          _isLoggingOut = false;
                        });
                      }

                      // Show error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Logout failed: ${e.toString()}'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 221, 238, 251),
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: () {
        Navigator.pop(context); // Close drawer
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 14),
            Text(title, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
