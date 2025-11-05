import 'package:flutter/material.dart';

class QuizInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const QuizInfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blueGrey),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(fontSize: 14), 
          ),
        ],
      ),
    );
  }
}