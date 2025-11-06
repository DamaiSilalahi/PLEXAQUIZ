import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import '../data/quiz_data.dart';
import '../widgets/quiz_info_row.dart';
import 'quiz_screen.dart';

class DetailQuizScreen extends StatelessWidget {
  final String quizType;
  final String userName;

  const DetailQuizScreen({
    super.key,
    required this.quizType,
    required this.userName,
  });

  Widget _buildRuleRow(String text, double fontSize) {
    return Padding(
      padding: EdgeInsets.only(bottom: fontSize * 0.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: fontSize * 0.25, right: fontSize * 0.5),
            child: const Icon(Icons.circle, size: 6, color: Colors.black87),
          ),
          Expanded(
            child: Text(
              text,
              style: AppTheme.poppinsRegular.copyWith(
                color: Colors.black87,
                fontSize: fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final titleSize = isTablet ? 26.0 : 20.0;
    final bodySize = isTablet ? 18.0 : 14.0;
    final spacing = size.height * 0.02;
    final containerRadius = size.width * 0.07;

    final isUIUX = quizType.toLowerCase().contains('ui');

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.28,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.015,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                        iconSize: isTablet ? 32 : 24,
                      ),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        "Detail Quiz",
                        style: AppTheme.poppinsBold.copyWith(
                          color: Colors.white,
                          fontSize: titleSize,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: spacing),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(size.width * 0.06),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(containerRadius),
                        topRight: Radius.circular(containerRadius),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$quizType Quiz",
                            style: AppTheme.poppinsBold.copyWith(
                              fontSize: isTablet ? 28 : 22,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: spacing * 0.3),
                          Text(
                            "GET 100 Points",
                            style: AppTheme.poppinsRegular.copyWith(
                              color: Colors.grey,
                              fontSize: bodySize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: spacing),
                          Text(
                            "Brief explanation about this quiz",
                            style: AppTheme.poppinsBold.copyWith(
                              fontSize: bodySize + 2,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: spacing * 0.7),
                          Column(
                            children: const [
                              QuizInfoRow(
                                icon: Icons.help_outline,
                                text: "10 Questions",
                              ),
                              QuizInfoRow(
                                icon: Icons.access_time,
                                text: "15 minutes total duration",
                              ),
                              QuizInfoRow(
                                icon: Icons.star,
                                text: "Win 10 stars if all correct",
                              ),
                            ],
                          ),
                          SizedBox(height: spacing * 0.6),
                          Text(
                            "Please read the text below carefully so you can understand it:",
                            style: AppTheme.poppinsRegular.copyWith(
                              color: Colors.black87,
                              fontSize: bodySize,
                            ),
                          ),
                          SizedBox(height: spacing * 0.5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildRuleRow("10 points for a correct answer, 0 for wrong.", bodySize),
                              _buildRuleRow("Tap an option to select your answer.", bodySize),
                              _buildRuleRow("Click Start when you're ready.", bodySize),
                            ],
                          ),
                          SizedBox(height: spacing * 2),
                          SizedBox(
                            width: double.infinity,
                            height: isTablet ? 65 : 55,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    AppTheme.secondaryColor,
                                    AppTheme.primaryColor
                                  ],
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
                                        userName: userName,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Start Quiz",
                                  style: AppTheme.poppinsBold.copyWith(
                                    fontSize: bodySize + 2,
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
