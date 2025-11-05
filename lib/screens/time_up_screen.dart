// time_up_screen.dart - KODE LENGKAP YANG SUDAH DIPERBAIKI

import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import 'quiz_home_screen.dart';

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
    final size = MediaQuery.of(context).size;

    // 🔥 PERBAIKAN: Mengatur ulang circleSize agar konsisten dengan ScoreScreen (0.40)
    final circleSize = size.width * 0.40; 

    // Mengambil userName dari argument Route (seperti yang Anda lakukan di onPressed)
    // Jika tidak ada, default ke 'User'
    final userName = ModalRoute.of(context)?.settings.arguments as String? ?? 'User';

    return Scaffold(
      extendBodyBehindAppBar: true, 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),

                  // indikator lingkaran skor (gradient ring + inner circle)
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // ring gradient luar
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

                        // inner circle
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
                  ),

                  const SizedBox(height: 30),

                  // Tambahkan nama pengguna untuk konsistensi dengan ScoreScreen
                  Text(
                    "Time’s Up, $userName!", 
                    style: const TextStyle(
                      color: Color(0xFF0F4BA5),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Your quiz has ended",
                    style: TextStyle(
                      color: Color(0xFF0F4BA5),
                      fontSize: 15,
                    ),
                  ),

                  // Jarak yang lebih dinamis untuk tampilan yang rapi
                  SizedBox(height: size.height * 0.18), 
                  
                  // Tombol Back to Home (Sudah benar menggunakan Gradient)
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        gradient: LinearGradient(
                          colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          final userName = ModalRoute.of(context)?.settings.arguments as String? ?? 'User';
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              // 🔥 PERBAIKAN KECIL: Menambahkan const
                              builder: (_) => const QuizHomeScreen(), 
                              settings: RouteSettings(arguments: userName),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.zero, // Menghapus padding agar gradient terlihat sempurna
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