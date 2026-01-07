import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  final FirestoreService _firestore = FirestoreService();
  final AuthService _auth = AuthService();
  final TextEditingController noteController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _auth.logout();
              Navigator.pushReplacementNamed(context, "/login");
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: noteController,
              decoration: InputDecoration(
                hintText: "Enter note",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    _firestore.addNote(noteController.text);
                    noteController.clear();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: _firestore.getNotes(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                final docs = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(docs[index]['text']),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _firestore.deleteNote(docs[index].id),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
