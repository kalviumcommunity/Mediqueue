// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import '../providers/patient_counter.dart';

// // class PatientFormPage extends StatefulWidget {
// //   const PatientFormPage({Key? key}) : super(key: key);

// //   @override
// //   State<PatientFormPage> createState() => _PatientFormPageState();
// // }

// // class _PatientFormPageState extends State<PatientFormPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _nameController = TextEditingController();
// //   final _emailController = TextEditingController();

// //   @override
// //   void dispose() {
// //     _nameController.dispose();
// //     _emailController.dispose();
// //     super.dispose();
// //   }

// //   void _submitForm() {
// //     if (_formKey.currentState!.validate()) {
// //       Provider.of<PatientCounter>(context, listen: false).increment();

// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text('Patient Added Successfully!'),
// //           backgroundColor: Colors.green,
// //           duration: Duration(seconds: 2),
// //         ),
// //       );

// //       Navigator.pop(context);
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Add Patient'), centerTitle: true),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             children: [
// //               TextFormField(
// //                 controller: _nameController,
// //                 decoration: const InputDecoration(
// //                   labelText: 'Patient Name',
// //                   border: OutlineInputBorder(),
// //                 ),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) return 'Enter name';
// //                   return null;
// //                 },
// //               ),
// //               const SizedBox(height: 16),
// //               TextFormField(
// //                 controller: _emailController,
// //                 decoration: const InputDecoration(
// //                   labelText: 'Email',
// //                   border: OutlineInputBorder(),
// //                 ),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) return 'Enter email';
// //                   if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'Enter valid email';
// //                   return null;
// //                 },
// //               ),
// //               const SizedBox(height: 24),
// //               SizedBox(
// //                 width: double.infinity,
// //                 child: ElevatedButton(
// //                   onPressed: _submitForm,
// //                   child: const Padding(
// //                     padding: EdgeInsets.symmetric(vertical: 16.0),
// //                     child: Text('Add Patient'),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/patient_counter.dart';

// class PatientFormPage extends StatefulWidget {
//   const PatientFormPage({super.key});

//   @override
//   State<PatientFormPage> createState() => _PatientFormPageState();
// }

// class _PatientFormPageState extends State<PatientFormPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _ageController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _ageController.dispose();
//     super.dispose();
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       context.read<PatientCounter>().increment();

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Patient added successfully!'),
//           backgroundColor: Colors.green,
//         ),
//       );

//       _formKey.currentState!.reset();
//       Navigator.pop(context); // Go back to WelcomeScreen
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isTablet = screenWidth > 600;
//     final padding = isTablet ? 32.0 : 16.0;
//     final fontSize = isTablet ? 20.0 : 16.0;

//     return Scaffold(
//       appBar: AppBar(title: const Text('Add Patient'), centerTitle: true),
//       body: Padding(
//         padding: EdgeInsets.all(padding),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.person),
//                 ),
//                 style: TextStyle(fontSize: fontSize),
//                 validator: (value) =>
//                     value == null || value.isEmpty ? 'Enter name' : null,
//               ),
//               SizedBox(height: padding),
//               TextFormField(
//                 controller: _ageController,
//                 decoration: const InputDecoration(
//                   labelText: 'Age',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.cake),
//                 ),
//                 keyboardType: TextInputType.number,
//                 style: TextStyle(fontSize: fontSize),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) return 'Enter age';
//                   if (int.tryParse(value) == null) return 'Enter valid age';
//                   return null;
//                 },
//               ),
//               SizedBox(height: padding * 1.5),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: _submitForm,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 14.0),
//                     child: Text('Submit', style: TextStyle(fontSize: fontSize)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/patient_counter.dart';

class PatientFormPage extends StatefulWidget {
  const PatientFormPage({super.key});

  @override
  State<PatientFormPage> createState() => _PatientFormPageState();
}

class _PatientFormPageState extends State<PatientFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      context.read<PatientCounter>().addPatient(
            _nameController.text.trim(),
            _ageController.text.trim(),
          );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Patient added successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      _formKey.currentState!.reset();
      Navigator.pop(context); // Go back to WelcomeScreen
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final padding = isTablet ? 32.0 : 16.0;
    final fontSize = isTablet ? 20.0 : 16.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Add Patient'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                style: TextStyle(fontSize: fontSize),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter name' : null,
              ),
              SizedBox(height: padding),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.cake),
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: fontSize),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter age';
                  if (int.tryParse(value) == null) return 'Enter valid age';
                  return null;
                },
              ),
              SizedBox(height: padding * 1.5),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Text('Submit', style: TextStyle(fontSize: fontSize)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
