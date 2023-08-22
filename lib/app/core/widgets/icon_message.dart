import 'package:fast_trivia/app/core/ui/app_fonts.dart';
import 'package:flutter/material.dart';

class IconMessage extends StatelessWidget {
  final String title;
  final String subtitle;

  const IconMessage({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blueGrey.shade100,
            ),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'assets/logo.png',
              height: 200,
              width: 200,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppFonts.titleBigger,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: AppFonts.questionTitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
