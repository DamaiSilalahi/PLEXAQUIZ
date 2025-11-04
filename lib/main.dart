import 'package:flutter/material.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const PlexaQuizApp());
}

class PlexaQuizApp extends StatelessWidget {
  const PlexaQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PlexaQuiz',
      theme: AppTheme.lightTheme, // ✅ Terapkan theme di sini
      home: const Scaffold(
        body: Center(
          child: Text(
            'Hello PlexaQuiz!',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
