import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onBack;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size. width * 0.05, vertical: 10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: onBack,
            iconSize: isTablet ? 32 : 24,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontSize: isTablet ? 26 : 20,
            fontWeight: FontWeight.bold,
          ),
          ),
        ],
      ),
    );
  }
}
