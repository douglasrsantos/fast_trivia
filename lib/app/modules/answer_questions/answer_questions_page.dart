import 'package:fast_trivia/app/core/ui/app_fonts.dart';
import 'package:fast_trivia/app/core/widgets/app_bars.dart';
import 'package:fast_trivia/app/modules/answer_questions/answer_questions_controller.dart';
import 'package:fast_trivia/app/modules/answer_questions/widgets/save_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AnswerQuestionsPage extends StatefulWidget {
  const AnswerQuestionsPage({super.key});

  @override
  State<AnswerQuestionsPage> createState() => _AnswerQuestionsPageState();
}

class _AnswerQuestionsPageState extends State<AnswerQuestionsPage> {
  final controller = AnswerQuestionsController();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(),
      floatingActionButton: Observer(builder: (context) {
        if (controller.isLoading) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
            ),
            onPressed: () async {
              if (controller.questionnaireModel?.questions?.length !=
                  controller.chosenAlternatives.length) {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SaveAlertDialog(
                      chosenAlternatives: controller.chosenAlternatives,
                      onPressedNo: () => Navigator.of(context).pop(),
                    );
                  },
                );
              } else {
                controller.verifyIsCorrect();
                controller.save();
                Navigator.of(context).popAndPushNamed(
                  '/questionnaire_completed',
                  arguments: {
                    'questions_length':
                        controller.questionnaireModel?.questions?.length ?? 0,
                    'correct_answers': controller.correctAnswers,
                  },
                );
              }
            },
            child: Text(
              'Finalizar questionário',
              style: AppFonts.titleBigger,
            ),
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Observer(builder: (context) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.green,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
              ),
            );
          }

          return Column(
            children: [
              Text(
                controller.questionnaireModel?.title ?? 'Questionário Geral',
                style: AppFonts.titleBigger,
              ),
              const SizedBox(height: 4),
              Text(
                'Questionário n° ${controller.questionnaireModel?.id ?? 1}',
                style: AppFonts.title,
              ),
              const SizedBox(height: 4),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount:
                      controller.questionnaireModel?.questions?.length ?? 0,
                  separatorBuilder: (context, qIndex) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, qIndex) {
                    final questions =
                        controller.questionnaireModel?.questions?[qIndex];

                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            questions?.question ?? 'Pergunta 1',
                            style: AppFonts.questionTitle,
                            textAlign: TextAlign.center,
                          ),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.questionnaireModel
                                    ?.questions?[qIndex].alternatives?.length ??
                                4,
                            separatorBuilder: (context, index) =>
                                const SizedBox.shrink(),
                            itemBuilder: (context, index) {
                              return CheckboxListTile.adaptive(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(
                                  questions?.alternatives?[index].title ??
                                      'Alternativa',
                                  style: AppFonts.questionAlternative,
                                ),
                                activeColor: Colors.deepOrange,
                                tileColor: Colors.grey.shade100,
                                value: controller.testIsChecked(
                                  questionId: questions?.id ?? 0,
                                  alternativeId:
                                      questions?.alternatives?[index].id ?? 0,
                                ),
                                shape: index == 3
                                    ? const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                        ),
                                      )
                                    : null,
                                onChanged: (value) {
                                  controller.insertToChosenAlternatives(
                                    questionId: questions?.id ?? 0,
                                    alternativeId:
                                        questions?.alternatives?[index].id ?? 0,
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
