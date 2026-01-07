import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(String text) {
    return notes.add({
      'text': text,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getNotes() {
    return notes.orderBy('timestamp', descending: true).snapshots();
  }

  Future<void> deleteNote(String id) {
    return notes.doc(id).delete();
  }
}
