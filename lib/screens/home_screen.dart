import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: const Color(0xFF06B6D4),
      ),
      body: const Center(
        child: Text('Welcome to PlexaQuiz!'),
      ),
    );
  }
}
