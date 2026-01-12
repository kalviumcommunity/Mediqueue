class HospitalModel {
  final String id;
  final String name;
  final String address;
  final double distance; // in km
  final List<String> departments;

  HospitalModel({
    required this.id,
    required this.name,
    required this.address,
    required this.distance,
    required this.departments,
  });
}
