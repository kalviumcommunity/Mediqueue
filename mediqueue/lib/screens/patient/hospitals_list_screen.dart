// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../models/hospital_model.dart';
// import '../../services/firestore_service.dart';
// import 'hospital_location_screen.dart';
// import 'hospital_details_screen.dart';

// /// Screen that displays all hospitals registered by admins
// class HospitalsListScreen extends StatefulWidget {
//   const HospitalsListScreen({super.key});

//   @override
//   State<HospitalsListScreen> createState() => _HospitalsListScreenState();
// }

// class _HospitalsListScreenState extends State<HospitalsListScreen> {
//   final FirestoreService _firestoreService = FirestoreService();
//   final TextEditingController _searchController = TextEditingController();
//   String _searchQuery = '';

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('All Hospitals'),
//         backgroundColor: Colors.blue,
//         foregroundColor: Colors.white,
//       ),
//       body: Column(
//         children: [
//           // Search bar
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search hospitals...',
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey[100],
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   _searchQuery = value.toLowerCase();
//                 });
//               },
//             ),
//           ),
//           // Hospitals list
//           Expanded(
//             child: StreamBuilder<List<HospitalModel>>(
//               stream: _firestoreService.getHospitals(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }

//                 if (snapshot.hasError) {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(
//                           Icons.error_outline,
//                           size: 64,
//                           color: Colors.red,
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                           'Error loading hospitals',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           snapshot.error.toString(),
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey[600],
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   );
//                 }

//                 final hospitals = snapshot.data ?? [];

//                 if (hospitals.isEmpty) {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.local_hospital,
//                           size: 64,
//                           color: Colors.grey[400],
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                           'No hospitals registered yet',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           'Hospitals will appear here once admins register them',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey[600],
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   );
//                 }

//                 // Filter hospitals based on search query
//                 final filteredHospitals = _searchQuery.isEmpty
//                     ? hospitals
//                     : hospitals
//                         .where((hospital) =>
//                             hospital.name
//                                 .toLowerCase()
//                                 .contains(_searchQuery) ||
//                             hospital.location
//                                 .toLowerCase()
//                                 .contains(_searchQuery))
//                         .toList();

//                 if (filteredHospitals.isEmpty) {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.search_off,
//                           size: 64,
//                           color: Colors.grey[400],
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                           'No hospitals found',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           'Try a different search term',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }

//                 return ListView.builder(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   itemCount: filteredHospitals.length,
//                   itemBuilder: (context, index) {
//                     final hospital = filteredHospitals[index];
//                     return _buildHospitalCard(hospital);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHospitalCard(HospitalModel hospital) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => HospitalDetailsScreen(hospital: hospital),
//               settings: RouteSettings(arguments: hospital),
//             ),
//           );
//         },
//         borderRadius: BorderRadius.circular(12),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.blue.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Icon(
//                       Icons.local_hospital,
//                       color: Colors.blue,
//                       size: 28,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           hospital.name,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Row(
//                           children: [
//                             const Icon(
//                               Icons.location_on,
//                               size: 16,
//                               color: Colors.grey,
//                             ),
//                             const SizedBox(width: 4),
//                             Expanded(
//                               child: Text(
//                                 hospital.location,
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey[600],
//                                 ),
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               if (hospital.departments.isNotEmpty) ...[
//                 const SizedBox(height: 12),
//                 const Divider(),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Departments:',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Wrap(
//                   spacing: 8,
//                   runSpacing: 8,
//                   children: hospital.departments
//                       .take(3)
//                       .map(
//                         (dept) => Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 8,
//                             vertical: 4,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.blue.withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Text(
//                             dept.name,
//                             style: const TextStyle(
//                               fontSize: 12,
//                               color: Colors.blue,
//                             ),
//                           ),
//                         ),
//                       )
//                       .toList(),
//                 ),
//                 if (hospital.departments.length > 3)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 8),
//                     child: Text(
//                       '+${hospital.departments.length - 3} more',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ),
//               ],
//               const SizedBox(height: 12),
//               Row(
//                 children: [
//                   Expanded(
//                     child: OutlinedButton.icon(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) =>
//                                 HospitalLocationScreen(hospital: hospital),
//                           ),
//                         );
//                       },
//                       icon: const Icon(Icons.location_on, size: 18),
//                       label: const Text('View Location'),
//                       style: OutlinedButton.styleFrom(
//                         foregroundColor: Colors.blue,
//                         side: const BorderSide(color: Colors.blue),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => HospitalDetailsScreen(hospital: hospital),
//                             settings: RouteSettings(arguments: hospital),
//                           ),
//                         );
//                       },
//                       icon: const Icon(Icons.info_outline, size: 18),
//                       label: const Text('Details'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/hospital_model.dart';
import '../../services/firestore_service.dart';
import '../../utils/app_colors.dart';
import '../../utils/logout_notifier.dart';

import 'hospital_location_screen.dart';
import 'hospital_details_screen.dart';
import 'patient_profile_screen.dart';
import 'join_queue_screen.dart';
import 'my_queues_screen.dart';
import '../common/history_screen.dart';
import '../auth_screen.dart';
import '../backend_test_screen.dart';

/// Screen that displays all hospitals registered by admins
class HospitalsListScreen extends StatefulWidget {
  const HospitalsListScreen({super.key});

  @override
  State<HospitalsListScreen> createState() => _HospitalsListScreenState();
}

class _HospitalsListScreenState extends State<HospitalsListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final FirestoreService _firestoreService = FirestoreService();
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';
  bool _isLoggingOut = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      /// ✅ DRAWER ATTACHED
      drawer: _buildDrawer(context),

      /// ✅ MENU ICON ADDED
      appBar: AppBar(
        title: const Text('All Hospitals'),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),

      body: Stack(
        children: [
          Column(
            children: [
              /// 🔍 Search bar
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search hospitals...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value.toLowerCase();
                    });
                  },
                ),
              ),

              /// 🏥 Hospitals list
              Expanded(
                child: StreamBuilder<List<HospitalModel>>(
                  stream: _firestoreService.getHospitals(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error loading hospitals'),
                      );
                    }

                    final hospitals = snapshot.data ?? [];

                    if (hospitals.isEmpty) {
                      return const Center(
                        child: Text('No hospitals registered yet'),
                      );
                    }

                    final filteredHospitals = _searchQuery.isEmpty
                        ? hospitals
                        : hospitals
                            .where(
                              (h) =>
                                  h.name
                                      .toLowerCase()
                                      .contains(_searchQuery) ||
                                  h.location
                                      .toLowerCase()
                                      .contains(_searchQuery),
                            )
                            .toList();

                    if (filteredHospitals.isEmpty) {
                      return const Center(
                        child: Text('No hospitals found'),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: filteredHospitals.length,
                      itemBuilder: (context, index) {
                        return _buildHospitalCard(filteredHospitals[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),

          /// 🚪 LOGOUT OVERLAY
          if (_isLoggingOut)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  // ===========================
  // 🏥 Hospital Card
  // ===========================
  Widget _buildHospitalCard(HospitalModel hospital) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HospitalDetailsScreen(hospital: hospital),
              settings: RouteSettings(arguments: hospital),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hospital.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                hospital.location,
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.location_on),
                      label: const Text('Location'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                HospitalLocationScreen(hospital: hospital),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.info_outline),
                      label: const Text('Details'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HospitalDetailsScreen(hospital: hospital),
                            settings: RouteSettings(arguments: hospital),
                          ),
                        );
                      },
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

  // ===========================
  // 📂 DRAWER (FULL)
  // ===========================
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
              const Text(
                'MediQueue',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 30),

              _drawerItem(Icons.person, 'My Profile', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PatientProfileScreen(),
                  ),
                );
              }),

              _drawerItem(Icons.queue, 'My Queue', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MyQueuesScreen(),
                  ),
                );
              }),

              _drawerItem(Icons.history, 'History', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const HistoryScreen(visit: {}, visits: []),
                  ),
                );
              }),

              _drawerItem(Icons.science, 'Backend Test', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const BackendTestScreen(),
                  ),
                );
              }),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDDEEFF),
                    foregroundColor: Colors.black,
                    elevation: 0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() => _isLoggingOut = true);
                    LogoutNotifier.setShouldShowMessage();
                    await FirebaseAuth.instance.signOut();
                    if (mounted) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AuthScreen(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
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
