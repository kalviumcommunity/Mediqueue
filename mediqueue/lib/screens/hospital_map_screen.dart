import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import '../models/hospital_model.dart';

class HospitalMapScreen extends StatefulWidget {
  const HospitalMapScreen({super.key});

  @override
  State<HospitalMapScreen> createState() => _HospitalMapScreenState();
}

class _HospitalMapScreenState extends State<HospitalMapScreen> {
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};
  LocationData? _currentLocation;
  bool _isLoading = true;

  // Default location (you can change this to your preferred center)
  static const LatLng _defaultCenter = LatLng(28.6139, 77.2090); // New Delhi

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    await _getCurrentLocation();
    await _loadHospitals();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _getCurrentLocation() async {
    try {
      Location location = Location();

      // Check if location service is enabled
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) return;
      }

      // Check if permission is granted
      PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) return;
      }

      // Get current location
      _currentLocation = await location.getLocation();
    } catch (e) {
      debugPrint('Error getting location: $e');
    }
  }

  Future<void> _loadHospitals() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('hospitals').get();

      final Set<Marker> markers = {};

      for (var doc in snapshot.docs) {
        final hospital = HospitalModel.fromMap(doc.id, doc.data());

        // Skip hospitals without valid coordinates
        if (hospital.latitude == 0.0 && hospital.longitude == 0.0) continue;

        markers.add(
          Marker(
            markerId: MarkerId(hospital.id),
            position: LatLng(hospital.latitude, hospital.longitude),
            infoWindow: InfoWindow(
              title: hospital.name,
              snippet: hospital.location,
              onTap: () => _showHospitalDetails(hospital),
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed,
            ),
          ),
        );
      }

      setState(() {
        _markers.addAll(markers);
      });

      // Move camera to first hospital or user location
      if (_mapController != null && markers.isNotEmpty) {
        _moveCameraToHospitals(markers);
      }
    } catch (e) {
      debugPrint('Error loading hospitals: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading hospitals: $e')),
        );
      }
    }
  }

  void _moveCameraToHospitals(Set<Marker> markers) {
    if (markers.isEmpty) return;

    // Calculate bounds to fit all markers
    double minLat = markers.first.position.latitude;
    double maxLat = markers.first.position.latitude;
    double minLng = markers.first.position.longitude;
    double maxLng = markers.first.position.longitude;

    for (var marker in markers) {
      if (marker.position.latitude < minLat) minLat = marker.position.latitude;
      if (marker.position.latitude > maxLat) maxLat = marker.position.latitude;
      if (marker.position.longitude < minLng)
        minLng = marker.position.longitude;
      if (marker.position.longitude > maxLng)
        maxLng = marker.position.longitude;
    }

    _mapController?.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(minLat, minLng),
          northeast: LatLng(maxLat, maxLng),
        ),
        50, // padding
      ),
    );
  }

  void _showHospitalDetails(HospitalModel hospital) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hospital.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(hospital.location),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Departments:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...hospital.departments.map((dept) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.local_hospital, size: 16),
                      const SizedBox(width: 8),
                      Text(dept['name'] ?? 'Unknown'),
                    ],
                  ),
                )),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigate to hospital details or queue screen
                },
                child: const Text('View Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Locations'),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: () {
              if (_currentLocation != null) {
                _mapController?.animateCamera(
                  CameraUpdate.newLatLngZoom(
                    LatLng(
                      _currentLocation!.latitude!,
                      _currentLocation!.longitude!,
                    ),
                    14,
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentLocation != null
                    ? LatLng(
                        _currentLocation!.latitude!,
                        _currentLocation!.longitude!,
                      )
                    : _defaultCenter,
                zoom: 12,
              ),
              markers: _markers,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              compassEnabled: true,
              mapToolbarEnabled: true,
              zoomControlsEnabled: true,
              mapType: MapType.normal,
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _loadHospitals,
        label: const Text('Refresh'),
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
