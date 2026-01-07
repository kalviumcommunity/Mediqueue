// // // import 'package:flutter/material.dart';

// // // class QueueProvider extends ChangeNotifier {
// // //   int _queuePosition = 15; // initial position

// // //   int get queuePosition => _queuePosition;

// // //   void incrementPosition() {
// // //     _queuePosition++;
// // //     notifyListeners();
// // //   }

// // //   void decrementPosition() {
// // //     if (_queuePosition > 1) {
// // //       _queuePosition--;
// // //       notifyListeners();
// // //     }
// // //   }

// // //   void setPosition(int pos) {
// // //     _queuePosition = pos;
// // //     notifyListeners();
// // //   }
// // // }


// // import 'package:flutter/material.dart';

// // class QueueProvider extends ChangeNotifier {
// //   int _position = 0;
// //   String _patientName = '';

// //   int get position => _position;
// //   String get patientName => _patientName;

// //   void submitPatient(String name) {
// //     _patientName = name;
// //     _position++;
// //     notifyListeners();
// //   }

// //   void reset() {
// //     _position = 0;
// //     _patientName = '';
// //     notifyListeners();
// //   }
// // }

// import 'package:flutter/material.dart';

// class QueueProvider extends ChangeNotifier {
//   int _position = 15;
//   String _patientName = '';

//   int get position => _position;
//   String get patientName => _patientName;

//   void submitPatient(String name) {
//     _patientName = name;
//     _position++;
//     notifyListeners();
//   }
// }


import 'package:flutter/material.dart';

class QueueProvider extends ChangeNotifier {
  int _position = 0;

  int get position => _position;

  void submitPatient(String name) {
    _position++;
    notifyListeners();
    // Optionally store patient details here
  }
}
