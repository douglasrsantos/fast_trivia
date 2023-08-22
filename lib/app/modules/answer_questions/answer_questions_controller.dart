// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:asuka/asuka.dart' as asuka;
import 'package:fast_trivia/app/models/alternative_model.dart';
import 'package:fast_trivia/app/models/question_completed_model.dart';
import 'package:fast_trivia/app/models/questionnaire_completed_model.dart';
import 'package:fast_trivia/app/models/questionnaire_model.dart';
import 'package:fast_trivia/app/repositories/questionnaire_repository.dart';
import 'package:mobx/mobx.dart';

part 'answer_questions_controller.g.dart';

class AnswerQuestionsController = _AnswerQuestionsControllerBase
    with _$AnswerQuestionsController;

abstract class _AnswerQuestionsControllerBase with Store {
  final _questionnaireRepository = QuestionnaireRepository();

  @observable
  Map<int, int> chosenAlternatives = {};

  @observable
  bool isChecked = false;

  @observable
  bool isLoading = false;

  @observable
  QuestionnaireCompletedModel questionnaireCompletedModel =
      QuestionnaireCompletedModel();

  @observable
  QuestionnaireModel? questionnaireModel;

  int correctAnswers = 0;

  void init() async {
    isLoading = true;
    await Future.wait([
      findQuestionnaire(),
    ]);
    isLoading = false;
  }

  @action
  Future<void> findQuestionnaire() async {
    try {
      final result = await _questionnaireRepository.getQuestionnaire();

      questionnaireModel = result;
    } catch (e) {
      asuka.AsukaSnackbar.alert(
              'Erro ao obter dados do servidor.\nTente novamente.')
          .show();
      log(e.toString());
    }
  }

  @action
  void insertToChosenAlternatives(
      {required int questionId, required int alternativeId}) {
    if (chosenAlternatives.containsKey(questionId)) {
      if (chosenAlternatives.containsValue(alternativeId)) {
        chosenAlternatives.remove(questionId);
      }
    }

    chosenAlternatives[questionId] = alternativeId;
  }

  @action
  bool testIsChecked({required int questionId, required int alternativeId}) {
    if (chosenAlternatives.entries.isNotEmpty) {
      for (final entry in chosenAlternatives.entries) {
        if (entry.key == questionId && entry.value == alternativeId) {
          return true;
        }
      }
    }
    return false;
  }

  @action
  Future<void> save() async {
    try {
      await fillQuestionnaireCompleted();

      _questionnaireRepository.save(questionnaireCompletedModel);
    } catch (e) {
      asuka.AsukaSnackbar.alert(
              'Erro ao obter dados do servidor.\nTente novamente.')
          .show();
      log(e.toString());
    }
  }

  fillQuestionnaireCompleted() {
    questionnaireCompletedModel.id = questionnaireModel?.id ?? 0;
    questionnaireCompletedModel.title = questionnaireModel?.title ?? '';
    questionnaireCompletedModel.questions =
        questionnaireModel?.questions?.map<QuestionCompletedModel>((q) {
      return QuestionCompletedModel(
        title: q.title,
        question: q.question,
        idQuestionnaire: questionnaireModel?.id ?? 0,
        answerKey: q.answerKey,
        chosenAlternative: chosenAlternatives[q.id],
        alternatives: q.alternatives?.map<AlternativeModel>((alt) {
          return AlternativeModel(
            idQuestion: q.id,
            title: alt.title,
          );
        }).toList(),
      );
    }).toList();
  }

  verifyIsCorrect() {
    if (questionnaireModel!.questions != null) {
      for (var key in questionnaireModel!.questions!) {
        if (chosenAlternatives['${key.id}'] == key.answerKey) {
          correctAnswers++;
          if (correctAnswers > questionnaireModel!.questions!.length) {
            correctAnswers = questionnaireModel!.questions!.length;
          }
        } else {
          correctAnswers--;
          if (correctAnswers < 0) {
            correctAnswers = 0;
          }
        }
      }
    }
  }
}
