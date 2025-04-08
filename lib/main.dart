import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'package:college_app/screens/student_home.dart';
import 'package:college_app/screens/admin_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
      routes: {
        '/home': (context) => StudentHome(),
        // '/adminHome': (context) => AdminHome(),
      },
    );
  }
}
