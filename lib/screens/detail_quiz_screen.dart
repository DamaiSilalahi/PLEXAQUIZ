import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import '../data/quiz_data.dart';
import 'quiz_screen.dart';

class DetailQuizScreen extends StatelessWidget {
  final String quizType;
  final String userName;
  
  const DetailQuizScreen({
    super.key,
    required this.quizType,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    final isUIUX = quizType.toLowerCase().contains('ui');

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient header
          Container(
            height: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Isi konten
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppBar manual
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Detail Quiz",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Kontainer putih utama
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$quizType Quiz",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "GET 100 Points",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            "Brief explanation about this quiz",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 14),

                          // Info rows
                          Row(
                            children: const [
                              Icon(Icons.help_outline, size: 20, color: Colors.blueGrey),
                              SizedBox(width: 8),
                              Text("10 Questions"),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              Icon(Icons.access_time, size: 20, color: Colors.blueGrey),
                              SizedBox(width: 8),
                              Text("15 minutes total duration"),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              Icon(Icons.star, size: 20, color: Colors.blueGrey),
                              SizedBox(width: 8),
                              Text("Win 10 stars if all correct"),
                            ],
                          ),

                          const SizedBox(height: 22),
                          const Text(
                            "Please read the text below carefully so you can understand it:",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text("• 10 points for a correct answer, 0 for wrong."),
                          const Text("• Tap an option to select your answer."),
                          const Text("• Click Start when you're ready."),

                          const SizedBox(height: 40),

                          // Tombol Start Quiz — WARNA DIGANTI
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                onPressed: () {
                                  final questions = isUIUX
                                      ? QuizData.uiuxQuestions
                                      : QuizData.webQuestions;
                                  Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (_) => QuizScreen(
      questions: questions,
      quizType: quizType,
      userName: userName, // kirim nama user
    ),
  ),
);
                                },
                                child: const Text(
                                  "Start Quiz",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
