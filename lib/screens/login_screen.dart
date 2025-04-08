import 'package:flutter/material.dart';
import 'student_home.dart'; // For student home screen
import 'admin_home.dart'; // For admin home screen
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _registerNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  _login() async {
    String result = await _authService.login(
      _registerNumberController.text,
      _passwordController.text,
    );
    if (result == 'student') {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (result == 'admin') {
      Navigator.pushReplacementNamed(context, '/adminHome');
    } else {
      // Show error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _registerNumberController,
              decoration: InputDecoration(labelText: 'Register Number'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
