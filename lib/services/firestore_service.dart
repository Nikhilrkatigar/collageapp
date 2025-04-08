import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addStudent(String registerNumber, String password) async {
    await _db.collection('students').doc(registerNumber).set({
      'password': password,
      'profile': {
        'name': 'Student Name',
        'marks': '85',
        'attendance': '90%',
      }
    });
  }

  Future<Map<String, dynamic>> getStudent(String registerNumber) async {
    DocumentSnapshot doc = await _db.collection('students').doc(registerNumber).get();
    return doc.data() as Map<String, dynamic>;
  }
}
