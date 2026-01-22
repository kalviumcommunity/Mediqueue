class HospitalModel {
  final String id;
  final String name;
  final String location;
  final double latitude;
  final double longitude;
  final List<Map<String, dynamic>> departments;

  HospitalModel({
    required this.id,
    required this.name,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.departments,
  });

  factory HospitalModel.fromMap(String id, Map<String, dynamic> data) {
    return HospitalModel(
      id: id,
      name: data['name'],
      location: data['location'],
      latitude: (data['latitude'] ?? 0.0).toDouble(),
      longitude: (data['longitude'] ?? 0.0).toDouble(),
      departments: List<Map<String, dynamic>>.from(data['departments']),
    );
  }
}
