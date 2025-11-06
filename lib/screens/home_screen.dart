import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final titleSize = isTablet ? 26.0 : 20.0;
    final bodySize = isTablet ? 20.0 : 16.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: AppTheme.poppinsBold.copyWith(
            color: Colors.white,
            fontSize: titleSize, 
          ),
        ),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Center(
        child: Text(
          'Welcome to PlexaQuiz!',
          style: AppTheme.poppinsRegular.copyWith(
            fontSize: bodySize, 
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
