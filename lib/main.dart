import 'package:flutter/material.dart';
import 'login_screen.dart';  // Import the LoginScreen widget
import 'register_screen.dart';  // Import the RegisterScreen widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),  // Set LoginScreen as the home screen
    );
  }
}
