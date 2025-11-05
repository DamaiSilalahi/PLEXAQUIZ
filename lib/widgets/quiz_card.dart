import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final String questions;
  final String time;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const QuizCard({
    super.key,
    required this.title,
    required this.questions,
    required this.time,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(isTablet ? 20 : 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.transparent,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: isTablet ? 90 : 65,
                height: isTablet ? 90 : 65,
                fit: BoxFit.contain, // FIX: Mengatasi pemotongan gambar
                errorBuilder: (_, __, ___) => Container(
                  width: isTablet ? 90 : 65,
                  height: isTablet ? 90 : 65,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image, color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: isTablet ? 20 : 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: isTablet ? 20 : 16,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis, // FIX: Mengatasi pemotongan teks
                    maxLines: 1, 
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.description_outlined, color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      Text(questions, style: TextStyle(color: Colors.grey, fontSize: isTablet ? 16 : 13)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      Text(time, style: TextStyle(color: Colors.grey, fontSize: isTablet ? 16 : 13)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}