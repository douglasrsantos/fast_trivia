// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:fast_trivia/app/core/ui/app_fonts.dart';
import 'package:fast_trivia/app/core/widgets/app_bars.dart';
import 'package:fast_trivia/app/modules/detail_questionnaire_completed/detail_questionnaire_completed_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailQuestionnaireCompletedPage extends StatefulWidget {
  const DetailQuestionnaireCompletedPage({super.key});

  @override
  State<DetailQuestionnaireCompletedPage> createState() =>
      _DetailQuestionnaireCompletedPageState();
}

class _DetailQuestionnaireCompletedPageState
    extends State<DetailQuestionnaireCompletedPage> {
  final controller = DetailQuestionnaireCompletedController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final int? _id = ModalRoute.of(context)!.settings.arguments as int?;

      if (_id != null) {
        controller.init(_id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final formatDate = DateFormat('dd/MM/yyyy')
        .format(controller.questionnaireCompleted?.createdAt ?? DateTime.now());

    return Scaffold(
      appBar: AppBars(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Text(
              'Questionário n° ${controller.questionnaireCompleted?.id ?? 0}',
              style: AppFonts.titleBigger,
            ),
            Text(
              'Concluído em $formatDate',
              style: AppFonts.questionTitle.copyWith(
                color: Colors.black.withAlpha(150),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              controller.questionnaireCompleted?.title ?? 'Natureza Brasileira',
              style: AppFonts.title,
            ),
            const SizedBox(height: 4),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount:
                    controller.questionnaireCompleted?.questions?.length ?? 2,
                separatorBuilder: (context, questionsIndex) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, questionsIndex) {
                  final question = controller
                      .questionnaireCompleted?.questions?[questionsIndex];

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          question?.title ?? 'Pergunta 1',
                          style: AppFonts.questionTitle,
                          textAlign: TextAlign.center,
                        ),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller
                                  .questionnaireCompleted
                                  ?.questions?[questionsIndex]
                                  .alternatives
                                  ?.length ??
                              4,
                          separatorBuilder: (context, altIndex) =>
                              const SizedBox.shrink(),
                          itemBuilder: (context, altIndex) {
                            final alternative = controller
                                .questionnaireCompleted
                                ?.questions?[questionsIndex]
                                .alternatives?[altIndex];

                            return CheckboxListTile.adaptive(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(
                                alternative?.title ?? 'Item 2',
                                style: AppFonts.questionAlternative,
                              ),
                              activeColor: Colors.white,
                              tileColor: altIndex == 2
                                  ? Colors.green
                                  : altIndex == 0
                                      ? Colors.red
                                      : Colors.grey.shade100,
                              checkColor:
                                  altIndex == 2 ? Colors.green : Colors.red,
                              shape: altIndex == 3
                                  ? const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                        bottomLeft: Radius.circular(12),
                                      ),
                                    )
                                  : null,
                              value:
                                  altIndex == 2 || altIndex == 0 ? true : false,
                              onChanged: (value) {},
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
        ),
      ),
    );
  }
}
