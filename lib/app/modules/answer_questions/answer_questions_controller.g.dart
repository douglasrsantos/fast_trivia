// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_questions_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnswerQuestionsController on _AnswerQuestionsControllerBase, Store {
  late final _$chosenAlternativesAtom = Atom(
      name: '_AnswerQuestionsControllerBase.chosenAlternatives',
      context: context);

  @override
  Map<int, int> get chosenAlternatives {
    _$chosenAlternativesAtom.reportRead();
    return super.chosenAlternatives;
  }

  @override
  set chosenAlternatives(Map<int, int> value) {
    _$chosenAlternativesAtom.reportWrite(value, super.chosenAlternatives, () {
      super.chosenAlternatives = value;
    });
  }

  late final _$isCheckedAtom =
      Atom(name: '_AnswerQuestionsControllerBase.isChecked', context: context);

  @override
  bool get isChecked {
    _$isCheckedAtom.reportRead();
    return super.isChecked;
  }

  @override
  set isChecked(bool value) {
    _$isCheckedAtom.reportWrite(value, super.isChecked, () {
      super.isChecked = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AnswerQuestionsControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$questionnaireCompletedModelAtom = Atom(
      name: '_AnswerQuestionsControllerBase.questionnaireCompletedModel',
      context: context);

  @override
  QuestionnaireCompletedModel get questionnaireCompletedModel {
    _$questionnaireCompletedModelAtom.reportRead();
    return super.questionnaireCompletedModel;
  }

  @override
  set questionnaireCompletedModel(QuestionnaireCompletedModel value) {
    _$questionnaireCompletedModelAtom
        .reportWrite(value, super.questionnaireCompletedModel, () {
      super.questionnaireCompletedModel = value;
    });
  }

  late final _$questionnaireModelAtom = Atom(
      name: '_AnswerQuestionsControllerBase.questionnaireModel',
      context: context);

  @override
  QuestionnaireModel? get questionnaireModel {
    _$questionnaireModelAtom.reportRead();
    return super.questionnaireModel;
  }

  @override
  set questionnaireModel(QuestionnaireModel? value) {
    _$questionnaireModelAtom.reportWrite(value, super.questionnaireModel, () {
      super.questionnaireModel = value;
    });
  }

  late final _$findQuestionnaireAsyncAction = AsyncAction(
      '_AnswerQuestionsControllerBase.findQuestionnaire',
      context: context);

  @override
  Future<void> findQuestionnaire() {
    return _$findQuestionnaireAsyncAction.run(() => super.findQuestionnaire());
  }

  late final _$saveAsyncAction =
      AsyncAction('_AnswerQuestionsControllerBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$_AnswerQuestionsControllerBaseActionController =
      ActionController(
          name: '_AnswerQuestionsControllerBase', context: context);

  @override
  void insertToChosenAlternatives(
      {required int questionId, required int alternativeId}) {
    final _$actionInfo =
        _$_AnswerQuestionsControllerBaseActionController.startAction(
            name: '_AnswerQuestionsControllerBase.insertToChosenAlternatives');
    try {
      return super.insertToChosenAlternatives(
          questionId: questionId, alternativeId: alternativeId);
    } finally {
      _$_AnswerQuestionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool testIsChecked({required int questionId, required int alternativeId}) {
    final _$actionInfo = _$_AnswerQuestionsControllerBaseActionController
        .startAction(name: '_AnswerQuestionsControllerBase.testIsChecked');
    try {
      return super
          .testIsChecked(questionId: questionId, alternativeId: alternativeId);
    } finally {
      _$_AnswerQuestionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chosenAlternatives: ${chosenAlternatives},
isChecked: ${isChecked},
isLoading: ${isLoading},
questionnaireCompletedModel: ${questionnaireCompletedModel},
questionnaireModel: ${questionnaireModel}
    ''';
  }
}
