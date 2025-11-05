import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import 'home_screen.dart';

class TimeUpScreen extends StatelessWidget {
  final int score;
  final int totalPoints; 

  const TimeUpScreen({
    super.key,
    required this.score,
    required this.totalPoints, 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.timer_off, color: AppTheme.primaryColor, size: 120),
              const SizedBox(height: 20),
              const Text(
                "Time’s Up!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                "Your Score: $score / $totalPoints", 
                style: const TextStyle(fontSize: 22, color: AppTheme.primaryColor),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Back to Home",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
