// // import 'package:flutter/material.dart';

// // class PatientCounter extends ChangeNotifier {
// //   int _count = 0;
// //   String _lastPatientName = '';

// //   int get count => _count;
// //   String get lastPatientName => _lastPatientName;

// //   void addPatient(String name) {
// //     _lastPatientName = name;
// //     _count++;
// //     notifyListeners();
// //   }

// //   void reset() {
// //     _count = 0;
// //     _lastPatientName = '';
// //     notifyListeners();
// //   }
// // }



// import 'package:flutter/material.dart';

// class PatientCounter extends ChangeNotifier {
//   int queuePosition = 15;
//   String patientName = '';

//   void submitPatient(String name) {
//     patientName = name;
//     queuePosition++;
//     notifyListeners();
//   }
// }
import 'package:flutter/foundation.dart';

class PatientCounter extends ChangeNotifier {
  int _count = 0;
  final List<Map<String, String>> _patients = [];

  int get count => _count;
  List<Map<String, String>> get patients => List.unmodifiable(_patients);

  void increment() {
    _count++;
    notifyListeners();
  }

  void addPatient(String name, String age) {
    _patients.add({'name': name, 'age': age});
    increment();
  }
}
  