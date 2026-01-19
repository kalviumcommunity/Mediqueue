class HospitalModel {
  final String id;
  final String name;
  final String location;
  final List<Map<String, dynamic>> departments;

  HospitalModel({
    required this.id,
    required this.name,
    required this.location,
    required this.departments,
  });

  factory HospitalModel.fromMap(String id, Map<String, dynamic> data) {
    return HospitalModel(
      id: id,
      name: data['name'],
      location: data['location'],
      departments:
          List<Map<String, dynamic>>.from(data['departments']),
    );
  }
}
