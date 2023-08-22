// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:asuka/asuka.dart' as asuka;
import 'package:fast_trivia/app/models/questionnaire_completed_model.dart';
import 'package:fast_trivia/app/repositories/questionnaire_repository.dart';
import 'package:mobx/mobx.dart';

part 'detail_questionnaire_completed_controller.g.dart';

class DetailQuestionnaireCompletedController = _DetailQuestionnaireCompletedControllerBase
    with _$DetailQuestionnaireCompletedController;

abstract class _DetailQuestionnaireCompletedControllerBase with Store {
  final _questionnaireRepository = QuestionnaireRepository();

  @observable
  bool isLoading = false;

  @observable
  QuestionnaireCompletedModel? questionnaireCompleted;

  void init(int id) async {
    isLoading = true;
    await Future.wait([
      getQuestionnaireCompleted(id),
    ]);
    isLoading = false;
  }

  @action
  Future<void> getQuestionnaireCompleted(int questionnaireId) async {
    try {
      final result = await _questionnaireRepository
          .getQuestionnaireCompletedById(questionnaireId);

      questionnaireCompleted = result;
    } catch (e) {
      log(e.toString());
      asuka.AsukaSnackbar.alert(
              'Erro ao obter dados do servidor.\nTente novamente.')
          .show();
    }
  }
}
