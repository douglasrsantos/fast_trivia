import 'package:fast_trivia/app/core/ui/app_fonts.dart';
import 'package:flutter/material.dart';

class QuestionnaireCompletedPage extends StatelessWidget {
  const QuestionnaireCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Voltar a tela inicial',
            style: AppFonts.titleBigger,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight,
                  maxWidth: constraints.maxWidth,
                ),
                child: Column(
                  children: [
                    Image.asset('assets/checked.png'),
                    const SizedBox(height: 16),
                    Text(
                      'Questionário finalizado',
                      style: AppFonts.titleBigger,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Questões respondidas: ${arguments['questions_length']}',
                      style: AppFonts.title,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      arguments['correct_answers'] < 0
                          ? 'Acertos: 0'
                          : arguments['correct_answers'] >
                                  arguments['questions_length']
                              ? 'Acertos: ${arguments['questions_length']}'
                              : 'Acertos: ${arguments['correct_answers']}',
                      style: AppFonts.title,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
