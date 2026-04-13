import 'package:flutter/material.dart';
import 'package:flutter_last_app/layout/Home.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
      ),
      home: const Scaffold(
        body: Center(
          child: Text("Welcome To Profile"),
        ),
      ),
    );
    
  }
}