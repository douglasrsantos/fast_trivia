import 'dart:developer';

import 'package:fast_trivia/app/core/database/sqlite_connection_factory.dart';
import 'package:fast_trivia/app/interfaces/questionnaire_interface.dart';
import 'package:fast_trivia/app/models/questionnaire_completed_model.dart';
import 'package:fast_trivia/app/models/questionnaire_model.dart';

class QuestionnaireRepository implements IQuestionnaire {
  final _sqliteConnectionFactory = SqLiteConnectionFactory();

  @override
  Future<QuestionnaireModel> getQuestionnaire() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      final mockJson = {
        "questionnaire": {
          "id": 1,
          "title": "Natureza brasileira",
          "questions": [
            {
              "id": 1,
              "title": "Florestas brasileiras",
              "question": "Qual o nome da maior floresta brasileira?",
              "answer_key": 4,
              "alternatives": [
                {"id": 1, "title": "Caatinga", 'id_question': 1},
                {"id": 2, "title": "Cerrado", 'id_question': 1},
                {"id": 3, "title": "Mata Atlântica", 'id_question': 1},
                {"id": 4, "title": "Amazônica", 'id_question': 1}
              ]
            },
            {
              "id": 2,
              "title": "Praias brasileiras",
              "question": "Qual estado tem a maior faixa litorânea?",
              "answer_key": 3,
              "alternatives": [
                {"id": 1, "title": "São Paulo", 'id_question': 2},
                {"id": 2, "title": "Maranhão", 'id_question': 2},
                {"id": 3, "title": "Bahia", 'id_question': 2},
                {"id": 4, "title": "Rio de Janeiro", 'id_question': 2}
              ]
            }
          ],
          "created_at": "2023-08-20T12:01:00.000Z",
          "updated_at": "2023-08-20T12:01:00.000Z",
        }
      };

      return QuestionnaireModel.fromMap(mockJson['questionnaire'] ?? {});
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> save(QuestionnaireCompletedModel questionnaire) async {
    try {
      final conn = await _sqliteConnectionFactory.openConnection();
      final batch = conn.batch();

      ///insert to table questionnaire_completed
      batch.insert(
        'questionnaire_completed',
        {
          'id': null,
          'title': questionnaire.title,
          'created_at': DateTime.now().toIso8601String(),
          'updated_at': DateTime.now().toIso8601String(),
        },
      );

      ///insert to tabel question_completed
      if (questionnaire.questions != null) {
        for (int i = 0; i < questionnaire.questions!.length; i++) {
          final q = questionnaire.questions![i];

          batch.insert(
            'question_completed',
            {
              'id': null,
              'id_questionnaire': questionnaire.id,
              'title': q.title,
              'question': q.question,
              'answer_key': q.answerKey,
              'chosen_alternative': q.chosenAlternative,
            },
          );
        }
      }

      ///insert to table alternative
      if (questionnaire.questions != null) {
        for (int quest = 0; quest < questionnaire.questions!.length; quest++) {
          if (questionnaire.questions![quest].alternatives != null) {
            for (int a = 0;
                a < questionnaire.questions![quest].alternatives!.length;
                a++) {
              final alt = questionnaire.questions![quest].alternatives![a];

              batch.insert(
                'alternative',
                {
                  'id': null,
                  'id_question': alt.idQuestion ?? 0,
                  'title': alt.title,
                },
              );
            }
          }
        }
      }

      await batch.commit();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<QuestionnaireCompletedModel>>
      getAllQuestionnairesCompleted() async {
    try {
      final conn = await _sqliteConnectionFactory.openConnection();

      final result = await conn.rawQuery('''
        select *
        from questionnaire_completed
        order by created_at
      ''');

      return result.map((e) => QuestionnaireCompletedModel.fromMap(e)).toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<QuestionnaireCompletedModel> getQuestionnaireCompletedById(
    int? questionnaireCompletedId,
  ) async {
    try {
      final conn = await _sqliteConnectionFactory.openConnection();

      final questionnaireCompleted = await conn.rawQuery(
        '''
        select *
        from questionnaire_completed
        where id = ?
      ''',
        [questionnaireCompletedId],
      );

      final questionCompleted = await conn.rawQuery(
        '''
        select *
        from question_completed
        where id_questionnaire = ?
      ''',
        [questionnaireCompletedId],
      );

      final alternative = await conn.rawQuery(
        '''
        select alternative.id, alternative.id_question, alternative.title
        from alternative 
        left join question_completed 
        on alternative.id_question = question_completed.id_questionnaire 
        where question_completed.id_questionnaire = ?
        ''',
        [questionnaireCompletedId],
      );

      return transformMap(
        questionnaireCompleted,
        questionCompleted,
        alternative,
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  QuestionnaireCompletedModel transformMap(
    List<Map<String, Object?>> questionnaireCompletedMap,
    List<Map<String, Object?>> questionCompletedMap,
    List<Map<String, Object?>> alternativeMap,
  ) {
    Map<String, dynamic> questionnaireMap = {};
    Map<String, dynamic> questionMap = {};

    for (var map in questionnaireCompletedMap) {
      questionnaireMap.addAll(map);
    }
    for (var map in questionCompletedMap) {
      questionMap.addAll(map);
    }

    questionMap['alternatives'] = alternativeMap;
    questionnaireMap['questions'] = [questionMap];

    return QuestionnaireCompletedModel.fromMap(questionnaireMap);
  }
}
