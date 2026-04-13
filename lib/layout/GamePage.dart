import 'package:flutter/material.dart';
import 'package:flutter_last_app/layout/Home.dart';

void main() {
  runApp(const GamePage());
}

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Mister',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
      ),
      home: const Scaffold(
        body: Center(
          child: Text("Hello Mister"),
        ),
      ),
    );
  }
}