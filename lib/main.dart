import 'package:flutter/material.dart';
import 'screens/input_name_screen.dart';
import 'screens/quiz_home_screen.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const PlexaQuizApp());
}

class PlexaQuizApp extends StatelessWidget {
  const PlexaQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlexaQuiz',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const InputNameScreen(),
      routes: {
        '/quizHome': (context) => const QuizHomeScreen(),
      },
    );
  }
}
