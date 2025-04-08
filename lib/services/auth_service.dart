import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> login(String registerNumber, String password) async {
    try {
      String email = '$registerNumber@college.com';
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = _auth.currentUser;
      if (user != null) {
        return user.email?.contains('admin') ?? false ? 'admin' : 'student';
      }
      return 'User not found';
    } catch (e) {
      return 'Error: $e';
    }
  }
}
