import 'package:flutter/material.dart';

class QuestionnaireButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final Color backgroundColor;

  const QuestionnaireButton({
    required this.onPressed,
    required this.label,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.all(4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
