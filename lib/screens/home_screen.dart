import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: AppTheme.poppinsBold.copyWith(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Center(
        child: Text(
          'Welcome to PlexaQuiz!',
          style: AppTheme.poppinsRegular.copyWith(
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
