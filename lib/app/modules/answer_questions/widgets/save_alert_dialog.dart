import 'package:fast_trivia/app/core/ui/app_fonts.dart';
import 'package:flutter/material.dart';

class SaveAlertDialog extends StatelessWidget {
  final Map<int, int> chosenAlternatives;
  final Function()? onPressedNo;
  const SaveAlertDialog({
    super.key,
    required this.chosenAlternatives,
    required this.onPressedNo,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(
        'Perguntas respondidas: ${chosenAlternatives.length}',
      ),
      content: const Text(
        'Você não respondeu a todas as perguntas, responda todas para finalizar o questionário.',
      ),
      titleTextStyle: AppFonts.titleBigger,
      contentTextStyle: AppFonts.title,
      actions: [
        TextButton(
          onPressed: onPressedNo,
          child: Text(
            'NÃO',
            style: AppFonts.title.copyWith(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
