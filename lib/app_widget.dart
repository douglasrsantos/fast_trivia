import 'package:asuka/asuka.dart';
import 'package:fast_trivia/app/core/database/sqlite_adm_connection.dart';
import 'package:fast_trivia/app/modules/answer_questions/answer_questions_page.dart';
import 'package:fast_trivia/app/modules/detail_questionnaire_completed/detail_questionnaire_completed_page.dart';
import 'package:fast_trivia/app/modules/home/home_page.dart';
import 'package:fast_trivia/app/modules/questionnaire_completed/questionnaire_completed_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final sqliteAdmConnection = SqLiteAdmConnection();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(sqliteAdmConnection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (BuildContext context, Widget? child) {
        return Asuka.builder(context, child);
      },
      navigatorObservers: [
        Asuka.asukaHeroController,
      ],
      title: 'Fast Trivia',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/answer_questions': (_) => const AnswerQuestionsPage(),
        '/questionnaire_completed': (_) => const QuestionnaireCompletedPage(),
        '/detail_questionnaire_completed': (_) =>
            const DetailQuestionnaireCompletedPage(),
      },
      home: const HomePage(),
    );
  }
}
