import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firestore_methods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<QuerySnapshot<Map<String, dynamic>>> get Meeting_history => _firestore
      .collection("users")
      .doc(_auth.currentUser!.uid)
      .collection('Meetings')
      .snapshots();

  void Add_meeting_history(String meeting_name) async {
    try {
      await _firestore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .collection('Meetings')
          .add({
        'MeetingName': meeting_name,
        'CreatedAt': DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
  }
}
