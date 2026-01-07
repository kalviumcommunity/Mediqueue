// // // // import 'package:flutter/material.dart';

// // // // class UserInputForm extends StatefulWidget {
// // // //   const UserInputForm({Key? key}) : super(key: key);

// // // //   @override
// // // //   State<UserInputForm> createState() => _UserInputFormState();
// // // // }

// // // // class _UserInputFormState extends State<UserInputForm> {
// // // //   final _formKey = GlobalKey<FormState>();
// // // //   final _nameController = TextEditingController();
// // // //   final _emailController = TextEditingController();

// // // //   @override
// // // //   void dispose() {
// // // //     // Dispose controllers to avoid memory leaks
// // // //     _nameController.dispose();
// // // //     _emailController.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   void _submitForm() {
// // // //     if (_formKey.currentState!.validate()) {
// // // //       // Show success SnackBar
// // // //       ScaffoldMessenger.of(context).showSnackBar(
// // // //         const SnackBar(
// // // //           content: Text('Form Submitted Successfully!'),
// // // //           backgroundColor: Colors.green,
// // // //           duration: Duration(seconds: 2),
// // // //         ),
// // // //       );
// // // //       // Optionally, clear the form
// // // //       _formKey.currentState!.reset();
// // // //     }
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final screenWidth = MediaQuery.of(context).size.width;
// // // //     final isTablet = screenWidth > 600;
// // // //     final padding = isTablet ? 32.0 : 16.0;
// // // //     final inputFontSize = isTablet ? 20.0 : 16.0;

// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text('User Input Form'),
// // // //         centerTitle: true,
// // // //       ),
// // // //       body: SingleChildScrollView(
// // // //         padding: EdgeInsets.all(padding),
// // // //         child: Form(
// // // //           key: _formKey,
// // // //           child: Column(
// // // //             children: [
// // // //               // Name Field
// // // //               TextFormField(
// // // //                 controller: _nameController,
// // // //                 decoration: const InputDecoration(
// // // //                   labelText: 'Name',
// // // //                   border: OutlineInputBorder(),
// // // //                   prefixIcon: Icon(Icons.person),
// // // //                 ),
// // // //                 style: TextStyle(fontSize: inputFontSize),
// // // //                 validator: (value) {
// // // //                   if (value == null || value.isEmpty) {
// // // //                     return 'Please enter your name';
// // // //                   } else if (value.length < 3) {
// // // //                     return 'Name must be at least 3 characters';
// // // //                   }
// // // //                   return null;
// // // //                 },
// // // //               ),
// // // //               SizedBox(height: padding),
// // // //               // Email Field
// // // //               TextFormField(
// // // //                 controller: _emailController,
// // // //                 decoration: const InputDecoration(
// // // //                   labelText: 'Email',
// // // //                   border: OutlineInputBorder(),
// // // //                   prefixIcon: Icon(Icons.email),
// // // //                 ),
// // // //                 keyboardType: TextInputType.emailAddress,
// // // //                 style: TextStyle(fontSize: inputFontSize),
// // // //                 validator: (value) {
// // // //                   if (value == null || value.isEmpty) {
// // // //                     return 'Please enter your email';
// // // //                   } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
// // // //                     return 'Enter a valid email address';
// // // //                   }
// // // //                   return null;
// // // //                 },
// // // //               ),
// // // //               SizedBox(height: padding * 1.5),
// // // //               // Submit Button
// // // //               SizedBox(
// // // //                 width: double.infinity,
// // // //                 child: ElevatedButton(
// // // //                   onPressed: _submitForm,
// // // //                   child: Padding(
// // // //                     padding: const EdgeInsets.symmetric(vertical: 14.0),
// // // //                     child: Text(
// // // //                       'Submit',
// // // //                       style: TextStyle(fontSize: inputFontSize),
// // // //                     ),
// // // //                   ),
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
// // // import 'package:provider/provider.dart';
// // // import '../providers/patient_counter.dart';

// // // class UserInputForm extends StatefulWidget {
// // //   const UserInputForm({Key? key}) : super(key: key);

// // //   @override
// // //   State<UserInputForm> createState() => _UserInputFormState();
// // // }

// // // class _UserInputFormState extends State<UserInputForm> {
// // //   final _formKey = GlobalKey<FormState>();
// // //   final _nameController = TextEditingController();
// // //   final _emailController = TextEditingController();

// // //   @override
// // //   void dispose() {
// // //     _nameController.dispose();
// // //     _emailController.dispose();
// // //     super.dispose();
// // //   }

// // //   void _submitForm() {
// // //     if (_formKey.currentState!.validate()) {
// // //       // Update patient counter with name
// // //       Provider.of<PatientCounter>(context, listen: false)
// // //           .addPatient(_nameController.text);

// // //       // Show success SnackBar
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(
// // //           content: Text('Form Submitted Successfully!'),
// // //           backgroundColor: Colors.green,
// // //           duration: Duration(seconds: 2),
// // //         ),
// // //       );

// // //       // Clear the form
// // //       _formKey.currentState!.reset();
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final screenWidth = MediaQuery.of(context).size.width;
// // //     final isTablet = screenWidth > 600;
// // //     final padding = isTablet ? 32.0 : 16.0;
// // //     final inputFontSize = isTablet ? 20.0 : 16.0;

// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('User Input Form'),
// // //         centerTitle: true,
// // //       ),
// // //       body: SingleChildScrollView(
// // //         padding: EdgeInsets.all(padding),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             // ------------------ LIVE COUNTER ------------------
// // //             Consumer<PatientCounter>(
// // //               builder: (context, counter, child) {
// // //                 return Text(
// // //                   'Total Patients Submitted: ${counter.count}',
// // //                   style: const TextStyle(
// // //                       fontSize: 20, fontWeight: FontWeight.bold),
// // //                 );
// // //               },
// // //             ),
// // //             const SizedBox(height: 24),

// // //             // ------------------ FORM ------------------
// // //             Form(
// // //               key: _formKey,
// // //               child: Column(
// // //                 children: [
// // //                   // Name Field
// // //                   TextFormField(
// // //                     controller: _nameController,
// // //                     decoration: const InputDecoration(
// // //                       labelText: 'Name',
// // //                       border: OutlineInputBorder(),
// // //                       prefixIcon: Icon(Icons.person),
// // //                     ),
// // //                     style: TextStyle(fontSize: inputFontSize),
// // //                     validator: (value) {
// // //                       if (value == null || value.isEmpty) {
// // //                         return 'Please enter your name';
// // //                       } else if (value.length < 3) {
// // //                         return 'Name must be at least 3 characters';
// // //                       }
// // //                       return null;
// // //                     },
// // //                   ),
// // //                   SizedBox(height: padding),

// // //                   // Email Field
// // //                   TextFormField(
// // //                     controller: _emailController,
// // //                     decoration: const InputDecoration(
// // //                       labelText: 'Email',
// // //                       border: OutlineInputBorder(),
// // //                       prefixIcon: Icon(Icons.email),
// // //                     ),
// // //                     keyboardType: TextInputType.emailAddress,
// // //                     style: TextStyle(fontSize: inputFontSize),
// // //                     validator: (value) {
// // //                       if (value == null || value.isEmpty) {
// // //                         return 'Please enter your email';
// // //                       } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
// // //                           .hasMatch(value)) {
// // //                         return 'Enter a valid email address';
// // //                       }
// // //                       return null;
// // //                     },
// // //                   ),
// // //                   SizedBox(height: padding * 1.5),

// // //                   // Submit Button
// // //                   SizedBox(
// // //                     width: double.infinity,
// // //                     child: ElevatedButton(
// // //                       onPressed: _submitForm,
// // //                       child: Padding(
// // //                         padding: const EdgeInsets.symmetric(vertical: 14.0),
// // //                         child: Text(
// // //                           'Submit',
// // //                           style: TextStyle(fontSize: inputFontSize),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }



// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import '../providers/queue_provider.dart';

// // class UserInputForm extends StatefulWidget {
// //   const UserInputForm({super.key});

// //   @override
// //   State<UserInputForm> createState() => _UserInputFormState();
// // }

// // class _UserInputFormState extends State<UserInputForm> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _nameController = TextEditingController();

// //   void _submitForm() {
// //     if (_formKey.currentState!.validate()) {
// //       context.read<QueueProvider>().submitPatient(
// //             _nameController.text.trim(),
// //           );

// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text('Patient added to queue'),
// //           backgroundColor: Colors.green,
// //         ),
// //       );

// //       _nameController.clear();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final queue = context.watch<QueueProvider>();

// //     return Scaffold(
// //       appBar: AppBar(title: const Text('User Input Form')),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // 🔹 LIVE COUNTER
// //             Text(
// //               'Total Patients Submitted: ${queue.position}',
// //               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 24),

// //             // 🔹 FORM
// //             Form(
// //               key: _formKey,
// //               child: Column(
// //                 children: [
// //                   TextFormField(
// //                     controller: _nameController,
// //                     decoration: const InputDecoration(
// //                       labelText: 'Patient Name',
// //                       border: OutlineInputBorder(),
// //                     ),
// //                     validator: (value) =>
// //                         value == null || value.isEmpty ? 'Enter name' : null,
// //                   ),
// //                   const SizedBox(height: 20),
// //                   SizedBox(
// //                     width: double.infinity,
// //                     child: ElevatedButton(
// //                       onPressed: _submitForm,
// //                       child: const Text('Submit'),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/patient_counter.dart';

// class UserInputForm extends StatefulWidget {
//   const UserInputForm({Key? key}) : super(key: key);

//   @override
//   State<UserInputForm> createState() => _UserInputFormState();
// }

// class _UserInputFormState extends State<UserInputForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       // Increment patient counter
//       Provider.of<PatientCounter>(context, listen: false).increment();

//       // Show success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Form Submitted Successfully!'),
//           backgroundColor: Colors.green,
//           duration: Duration(seconds: 2),
//         ),
//       );

//       // Reset form
//       _formKey.currentState!.reset();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isTablet = screenWidth > 600;
//     final padding = isTablet ? 32.0 : 16.0;
//     final inputFontSize = isTablet ? 20.0 : 16.0;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('User Input Form'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(padding),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ------------------ LIVE COUNTER ------------------
//             Consumer<PatientCounter>(
//               builder: (context, counter, child) {
//                 return Text(
//                   'Total Patients Submitted: ${counter.count}',
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.bold),
//                 );
//               },
//             ),
//             const SizedBox(height: 24),

//             // ------------------ FORM ------------------
//             Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: _nameController,
//                     decoration: const InputDecoration(
//                       labelText: 'Name',
//                       border: OutlineInputBorder(),
//                       prefixIcon: Icon(Icons.person),
//                     ),
//                     style: TextStyle(fontSize: inputFontSize),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       } else if (value.length < 3) {
//                         return 'Name must be at least 3 characters';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: padding),
//                   TextFormField(
//                     controller: _emailController,
//                     decoration: const InputDecoration(
//                       labelText: 'Email',
//                       border: OutlineInputBorder(),
//                       prefixIcon: Icon(Icons.email),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     style: TextStyle(fontSize: inputFontSize),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
//                           .hasMatch(value)) {
//                         return 'Enter a valid email address';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: padding * 1.5),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: _submitForm,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 14.0),
//                         child: Text(
//                           'Submit',
//                           style: TextStyle(fontSize: inputFontSize),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
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
      // Increment patient count
      context.read<PatientCounter>().increment();

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

