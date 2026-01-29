import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import '../models/hospital_model.dart';
import '../services/places_service.dart';

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
  final PlacesService _placesService = PlacesService();
  final TextEditingController _searchController = TextEditingController();
  List<HospitalPlace> _nearbyHospitals = [];
  bool _showingNearbyHospitals = false;
  bool _isDisposed = false;
  Set<Marker>? _pendingMarkers;

  // Default location (you can change this to your preferred center)
  static const LatLng _defaultCenter = LatLng(28.6139, 77.2090); // New Delhi

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    if (_isDisposed) return;

    await _getCurrentLocation();

    if (_isDisposed) return;

    // Automatically show nearby hospitals based on user's current location
    if (_currentLocation != null) {
      await _searchNearbyHospitalsByCurrentLocation(showErrorMessages: false);
    } else {
      // Fallback to Firestore hospitals if location is not available
      await _loadHospitals();
    }

    if (!_isDisposed && mounted) {
      setState(() {
        _isLoading = false;
      });
    }
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

      if (mounted && !_isDisposed) {
        setState(() {
          _markers.addAll(markers);
        });

        // Move camera to first hospital or user location
        if (_mapController != null && markers.isNotEmpty) {
          _moveCameraToHospitals(markers);
        } else if (markers.isNotEmpty) {
          // Store markers to move camera after map is created
          _pendingMarkers = markers;
        }
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
    if (markers.isEmpty || _mapController == null || _isDisposed) return;

    try {
      // Calculate bounds to fit all markers
      double minLat = markers.first.position.latitude;
      double maxLat = markers.first.position.latitude;
      double minLng = markers.first.position.longitude;
      double maxLng = markers.first.position.longitude;

      for (var marker in markers) {
        if (marker.position.latitude < minLat)
          minLat = marker.position.latitude;
        if (marker.position.latitude > maxLat)
          maxLat = marker.position.latitude;
        if (marker.position.longitude < minLng) {
          minLng = marker.position.longitude;
        }
        if (marker.position.longitude > maxLng) {
          maxLng = marker.position.longitude;
        }
      }

      if (!_isDisposed && _mapController != null) {
        _mapController!.animateCamera(
          CameraUpdate.newLatLngBounds(
            LatLngBounds(
              southwest: LatLng(minLat, minLng),
              northeast: LatLng(maxLat, maxLng),
            ),
            50, // padding
          ),
        );
      }
    } catch (e) {
      debugPrint('Error moving camera: $e');
      // Silently fail if controller is disposed
    }
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
                      Text(dept.name),
                      const Spacer(),
                      Text('${dept.queueCount} in queue',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
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
    if (_isDisposed) {
      controller.dispose();
      return;
    }
    _mapController = controller;

    // If there are pending markers, move camera to show them
    if (_pendingMarkers != null &&
        _pendingMarkers!.isNotEmpty &&
        !_isDisposed) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (!_isDisposed && _mapController != null) {
          _moveCameraToHospitals(_pendingMarkers!);
          _pendingMarkers = null;
        }
      });
    }
  }

  Future<void> _searchNearbyHospitals() async {
    final searchQuery = _searchController.text.trim();
    if (searchQuery.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a location')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Search for nearby hospitals based on the place name
      final hospitals = await _placesService.searchNearbyHospitals(searchQuery,
          radius: 10000);

      if (hospitals.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('No hospitals found near this location')),
          );
        }
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // Clear existing markers and add new ones
      _markers.clear();
      _nearbyHospitals = hospitals;
      _showingNearbyHospitals = true;

      for (var hospital in hospitals) {
        _markers.add(
          Marker(
            markerId: MarkerId(hospital.placeId),
            position: hospital.location,
            infoWindow: InfoWindow(
              title: hospital.name,
              snippet:
                  '${hospital.address}${hospital.rating != null ? " ⭐ ${hospital.rating}" : ""}',
              onTap: () => _showNearbyHospitalDetails(hospital),
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueBlue,
            ),
          ),
        );
      }

      // Move camera to show all hospitals
      if (_markers.isNotEmpty && !_isDisposed) {
        if (_mapController != null) {
          _moveCameraToHospitals(_markers);
        } else {
          _pendingMarkers = Set.from(_markers);
        }
      }
    } catch (e) {
      if (mounted && !_isDisposed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error searching hospitals: $e')),
        );
      }
    } finally {
      if (mounted && !_isDisposed) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _searchNearbyHospitalsByCurrentLocation(
      {bool showErrorMessages = true}) async {
    if (_currentLocation == null) {
      if (showErrorMessages && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unable to get current location')),
        );
      }
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final location = LatLng(
        _currentLocation!.latitude!,
        _currentLocation!.longitude!,
      );

      final hospitals = await _placesService.searchNearbyHospitalsByCoords(
        location,
        radius: 5000,
      );

      if (hospitals.isEmpty) {
        if (showErrorMessages && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No hospitals found nearby')),
          );
        }
        setState(() {
          _isLoading = false;
        });
        return;
      }

      _markers.clear();
      _nearbyHospitals = hospitals;
      _showingNearbyHospitals = true;

      for (var hospital in hospitals) {
        _markers.add(
          Marker(
            markerId: MarkerId(hospital.placeId),
            position: hospital.location,
            infoWindow: InfoWindow(
              title: hospital.name,
              snippet:
                  '${hospital.address}${hospital.rating != null ? " ⭐ ${hospital.rating}" : ""}',
              onTap: () => _showNearbyHospitalDetails(hospital),
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueBlue,
            ),
          ),
        );
      }

      if (_markers.isNotEmpty && !_isDisposed) {
        if (_mapController != null) {
          _moveCameraToHospitals(_markers);
        } else {
          _pendingMarkers = Set.from(_markers);
        }
      }
    } catch (e) {
      if (mounted && !_isDisposed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error searching hospitals: $e')),
        );
      }
    } finally {
      if (mounted && !_isDisposed) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showNearbyHospitalDetails(HospitalPlace hospital) {
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
                  child: Text(hospital.address),
                ),
              ],
            ),
            if (hospital.rating != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.star, size: 16, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text('${hospital.rating} rating'),
                ],
              ),
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  hospital.isOpen ? Icons.check_circle : Icons.cancel,
                  size: 16,
                  color: hospital.isOpen ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 4),
                Text(hospital.isOpen ? 'Open now' : 'Closed'),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Could navigate to details or directions
                },
                child: const Text('Get Directions'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _resetToFirestoreHospitals() {
    setState(() {
      _showingNearbyHospitals = false;
      _nearbyHospitals = [];
    });
    _loadHospitals();
  }

  @override
  @override
  void dispose() {
    _isDisposed = true;
    _mapController?.dispose();
    _mapController = null;
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_showingNearbyHospitals
            ? 'Nearby Hospitals'
            : 'Hospital Locations'),
        actions: [
          if (_showingNearbyHospitals)
            IconButton(
              icon: const Icon(Icons.list),
              tooltip: 'Show All Hospitals',
              onPressed: _resetToFirestoreHospitals,
            ),
          IconButton(
            icon: const Icon(Icons.my_location),
            tooltip: 'Refresh Nearby Hospitals',
            onPressed: () => _searchNearbyHospitalsByCurrentLocation(
                showErrorMessages: true),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search hospitals in a specific area...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {});
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    onChanged: (value) => setState(() {}),
                    onSubmitted: (value) => _searchNearbyHospitals(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _searchNearbyHospitals,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(12),
                  ),
                  child: const Icon(Icons.search),
                ),
              ],
            ),
          ),
          // Map
          Expanded(
            child: _isLoading
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
                    myLocationButtonEnabled: false,
                    compassEnabled: true,
                    mapToolbarEnabled: true,
                    zoomControlsEnabled: true,
                    mapType: MapType.normal,
                  ),
          ),
        ],
      ),
      floatingActionButton: !_showingNearbyHospitals
          ? FloatingActionButton.extended(
              onPressed: _loadHospitals,
              label: const Text('Refresh'),
              icon: const Icon(Icons.refresh),
            )
          : null,
    );
  }
}
