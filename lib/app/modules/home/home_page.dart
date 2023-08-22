import 'package:fast_trivia/app/core/ui/app_fonts.dart';
import 'package:fast_trivia/app/core/widgets/app_bars.dart';
import 'package:fast_trivia/app/core/widgets/icon_message.dart';
import 'package:fast_trivia/app/modules/home/home_controller.dart';
import 'package:fast_trivia/app/modules/home/widgets/questionnaire_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(),
      floatingActionButton: Observer(builder: (_) {
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
              await Navigator.of(context).pushNamed('/answer_questions');
              controller.findAllQuestionnaireCompleted();
            },
            child: Text(
              'Iniciar novo questionário',
              style: AppFonts.titleBigger,
            ),
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Observer(builder: (_) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.green,
              valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
            ),
          );
        }

        if (controller.questionnaires.isEmpty) {
          return const IconMessage(
            title: 'Não há questionários respondidos',
            subtitle:
                'Clique no botão "Iniciar novo questionário"\npara responder',
          );
        }

        return Column(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Questionários respondidos:',
                    style: AppFonts.titleBigger,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                      child: Observer(builder: (_) {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: controller.questionnaires.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 4),
                          itemBuilder: (context, index) {
                            final questionnaire =
                                controller.questionnaires[index];

                            final formatDate = DateFormat('dd/MM/yyyy').format(
                                questionnaire.createdAt ?? DateTime.now());

                            return ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              contentPadding: const EdgeInsets.all(8),
                              tileColor: Colors.grey.shade100,
                              title: Text(
                                questionnaire.title ?? '',
                                style: AppFonts.title,
                              ),
                              subtitle: Text(
                                'Concluído em: $formatDate',
                                style: AppFonts.questionAlternative.copyWith(
                                  color: Colors.black.withAlpha(150),
                                ),
                              ),
                              trailing: QuestionnaireButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      '/detail_questionnaire_completed',
                                      arguments: questionnaire.id);
                                },
                                label: 'Visualizar\nrespostas',
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
