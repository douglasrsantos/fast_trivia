// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:asuka/asuka.dart' as asuka;
import 'package:fast_trivia/app/models/questionnaire_completed_model.dart';
import 'package:fast_trivia/app/repositories/questionnaire_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final _questionnaireRepository = QuestionnaireRepository();

  @observable
  bool isLoading = false;

  @observable
  List<QuestionnaireCompletedModel> questionnaires = [];

  void init() async {
    isLoading = true;
    await Future.wait([
      findAllQuestionnaireCompleted(),
    ]);
    isLoading = false;
  }

  @action
  Future<void> findAllQuestionnaireCompleted() async {
    questionnaires.clear();
    try {
      final result =
          await _questionnaireRepository.getAllQuestionnairesCompleted();

      questionnaires = result;
    } catch (e) {
      asuka.AsukaSnackbar.alert(
              'Erro ao obter dados do servidor.\nTente novamente.')
          .show();
      log(e.toString());
    }
  }
}
