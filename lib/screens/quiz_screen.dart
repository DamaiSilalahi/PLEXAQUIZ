import 'dart:async';
import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../themes/app_theme.dart';
import 'time_up_screen.dart';
import 'score_screen.dart';

class QuizScreen extends StatefulWidget {
  final List<QuizQuestion> questions;
  final String quizType;
  final String userName;

  const QuizScreen({
    super.key,
    required this.questions,
    required this.quizType,
    required this.userName,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int currentIndex = 0;
  late List<int?> userAnswers;
  late Timer timer;
  int remainingSeconds = 5;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    userAnswers = List.filled(widget.questions.length, null);
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remainingSeconds > 0) {
        setState(() => remainingSeconds--);
      } else {
        t.cancel();
        goToTimeUpScreen();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentIndex();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToCurrentIndex() {
    const double itemWidth = 36.0;
    if (_scrollController.hasClients) {
      double targetScroll = currentIndex * itemWidth -
          MediaQuery.of(context).size.width / 2 +
          itemWidth / 2;
      if (targetScroll < 0) targetScroll = 0;
      if (_scrollController.position.maxScrollExtent > 0 &&
          targetScroll > _scrollController.position.maxScrollExtent) {
        targetScroll = _scrollController.position.maxScrollExtent;
      }
      _scrollController.animateTo(
        targetScroll,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  int calculateScore() {
    int total = 0;
    for (int i = 0; i < widget.questions.length; i++) {
      if (userAnswers[i] == widget.questions[i].correctAnswer) {
        total += 10;
      }
    }
    return total;
  }

  void goToTimeUpScreen() {
    timer.cancel();
    final totalScore = calculateScore();
    final totalPoints = widget.questions.length * 10;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            TimeUpScreen(score: totalScore, totalPoints: totalPoints),
        settings: RouteSettings(arguments: widget.userName),
      ),
    );
  }

  void goToScoreScreen() {
    timer.cancel();
    final totalScore = calculateScore();
    final totalPoints = widget.questions.length * 10;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ScoreScreen(
          score: totalScore,
          totalPoints: totalPoints,
          quizName: widget.quizType,
          userName: widget.userName,
        ),
      ),
    );
  }

  void nextQuestion() {
    if (userAnswers[currentIndex] != null) {
      if (currentIndex < widget.questions.length - 1) {
        setState(() {
          currentIndex++;
          _scrollToCurrentIndex();
        });
      } else {
        goToScoreScreen();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an answer before proceeding')),
      );
    }
  }

  void prevQuestion() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        _scrollToCurrentIndex();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final question = widget.questions[currentIndex];
    final selectedAnswer = userAnswers[currentIndex];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Flexible(
          child: Text(
            widget.quizType,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 18,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(Icons.access_time, color: Colors.white, size: 18),
                const SizedBox(width: 4),
                Text(
                  "${(remainingSeconds ~/ 60).toString().padLeft(2, '0')}:${(remainingSeconds % 60).toString().padLeft(2, '0')}",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppTheme.secondaryColor, AppTheme.primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 35,
                          child: ListView.builder(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.questions.length,
                            itemBuilder: (context, index) {
                              bool isActive = index == currentIndex;
                              return GestureDetector(
                                onTap: () => setState(() {
                                  currentIndex = index;
                                  _scrollToCurrentIndex();
                                }),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    gradient: isActive
                                        ? const LinearGradient(
                                            colors: [
                                              AppTheme.secondaryColor,
                                              AppTheme.primaryColor
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          )
                                        : null,
                                    color: isActive ? null : const Color(0xFFE0E0E0),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${index + 1}",
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: isActive ? Colors.white : Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          question.question,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ...List.generate(question.options.length, (index) {
                          final isSelected = selectedAnswer == index;
                          return GestureDetector(
                            onTap: () => setState(() {
                              userAnswers[currentIndex] = index;
                            }),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppTheme.secondaryColor.withOpacity(0.1)
                                    : Colors.white,
                                border: Border.all(
                                  color: isSelected
                                      ? AppTheme.primaryColor
                                      : Colors.grey.shade300,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: isSelected
                                          ? const LinearGradient(
                                              colors: [
                                                AppTheme.secondaryColor,
                                                AppTheme.primaryColor
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            )
                                          : null,
                                      color: isSelected ? null : Colors.grey.shade400,
                                    ),
                                    child: Center(
                                      child: Text(
                                        String.fromCharCode(65 + index),
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      question.options[index],
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontSize: 16,
                                        color: isSelected
                                            ? AppTheme.primaryColor
                                            : Colors.black,
                                        fontWeight: isSelected
                                            ? FontWeight.w600
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: prevQuestion,
                      icon: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              AppTheme.secondaryColor,
                              AppTheme.primaryColor
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      height: 50,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          gradient: LinearGradient(
                            colors: [
                              AppTheme.secondaryColor,
                              AppTheme.primaryColor
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: nextQuestion,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            currentIndex == widget.questions.length - 1
                                ? "Submit Quiz"
                                : "Next",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
