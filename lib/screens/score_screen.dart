// score_screen.dart - KODE LENGKAP DENGAN PERBAIKAN GRADASI TOMBOL

import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import 'quiz_home_screen.dart'; // Pastikan path ini benar

class ScoreScreen extends StatelessWidget {
  final int score;
  final int totalPoints;
  final String quizName;
  final String userName;

  const ScoreScreen({
    super.key,
    required this.score,
    required this.totalPoints,
    required this.quizName,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final circleSize = size.width * 0.40;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            // PERBAIKAN: Memastikan konten dapat discroll
            child: SingleChildScrollView( 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),

                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: circleSize + 30,
                        height: circleSize + 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                      Container(
                        width: circleSize,
                        height: circleSize,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0F4BA5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Your Score",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "$score/$totalPoints",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "🎉 Congratulations",
                    style: TextStyle(
                      color: Color(0xFF0F4BA5),
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    "You completed the $quizName quiz!",
                    style: const TextStyle(
                      color: Color(0xFF0F4BA5),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 100),

                  // 🔥 BAGIAN PERBAIKAN: Tombol Back to Home dengan Gradasi
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: Container(
                      decoration: BoxDecoration( // Tambahkan Container untuk menampung Gradient
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          // Menggunakan warna gradient yang sama dengan AppBar/QuizScreen
                          colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const QuizHomeScreen(),
                              settings: RouteSettings(
                                arguments: userName, 
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          // Hapus warna latar belakang karena sudah dihandle Container/Gradient
                          backgroundColor: Colors.transparent, 
                          shadowColor: Colors.transparent, // Hilangkan shadow
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.zero, // Hapus padding default
                        ),
                        child: const Text(
                          "Back to Home",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 🔥 AKHIR BAGIAN PERBAIKAN

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}