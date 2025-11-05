import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import '../widgets/quiz_card.dart';
import '../data/quiz_data.dart';
import 'quiz_screen.dart';


class QuizHomeScreen extends StatefulWidget {
  const QuizHomeScreen({super.key});

  @override
  State<QuizHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {
  String? selectedQuiz;

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)?.settings.arguments as String? ?? 'User';
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.35,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                  SizedBox(height: isTablet ? 30 : 20),
                  Text(
                    "Hello, $name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isTablet ? 22 : 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Let's test your knowledge",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: isTablet ? 24 : 20,
                    ),
                  ),
                  SizedBox(height: isTablet ? 40 : 30),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: isTablet ? 20 : 12,
                        vertical: isTablet ? 30 : 24,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          topRight: Radius.circular(28),
                        ),
                      ),
                      child: Column(
                        children: [
                          QuizCard(
                            title: "UI UX Design",
                            questions: "10 Question",
                            time: "1 hour 15 min",
                            imagePath: "assets/images/uiux.png",
                            isSelected: selectedQuiz == "UI UX Design",
                            onTap: () => setState(() => selectedQuiz = "UI UX Design"),
                          ),
                          const SizedBox(height: 16),
                          QuizCard(
                            title: "Web Development",
                            questions: "10 Question",
                            time: "1 hour 15 min",
                            imagePath: "assets/images/webdev.png",
                            isSelected: selectedQuiz == "Web Development",
                            onTap: () => setState(() => selectedQuiz = "Web Development"),
                          ),
                          const Spacer(),
                          GestureDetector(
                          onTap: selectedQuiz == null
                              ? null
                              : () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) {
                                        final questions = selectedQuiz == "UI UX Design"
                                            ? QuizData.uiuxQuestions
                                            : QuizData.webQuestions;
                                        return QuizScreen(
                                          questions: questions,
                                          quizType: selectedQuiz!,
                                        );
                                      },
                                    ),
                                  );
                                },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: double.infinity,
                            height: isTablet ? 65 : 55,
                            decoration: BoxDecoration(
                              gradient: selectedQuiz != null
                                  ? const LinearGradient(
                                      colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    )
                                  : LinearGradient(
                                      colors: [
                                        Colors.grey.shade400,
                                        Colors.grey.shade500,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: selectedQuiz != null
                                      ? AppTheme.primaryColor.withOpacity(0.3)
                                      : Colors.grey.withOpacity(0.3),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Start Quiz",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isTablet ? 22 : 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
