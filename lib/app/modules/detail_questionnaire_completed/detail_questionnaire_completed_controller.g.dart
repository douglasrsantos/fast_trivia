// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_questionnaire_completed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailQuestionnaireCompletedController
    on _DetailQuestionnaireCompletedControllerBase, Store {
  late final _$isLoadingAtom = Atom(
      name: '_DetailQuestionnaireCompletedControllerBase.isLoading',
      context: context);

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

  late final _$questionnaireCompletedAtom = Atom(
      name:
          '_DetailQuestionnaireCompletedControllerBase.questionnaireCompleted',
      context: context);

  @override
  QuestionnaireCompletedModel? get questionnaireCompleted {
    _$questionnaireCompletedAtom.reportRead();
    return super.questionnaireCompleted;
  }

  @override
  set questionnaireCompleted(QuestionnaireCompletedModel? value) {
    _$questionnaireCompletedAtom
        .reportWrite(value, super.questionnaireCompleted, () {
      super.questionnaireCompleted = value;
    });
  }

  late final _$getQuestionnaireCompletedAsyncAction = AsyncAction(
      '_DetailQuestionnaireCompletedControllerBase.getQuestionnaireCompleted',
      context: context);

  @override
  Future<void> getQuestionnaireCompleted(int questionnaireId) {
    return _$getQuestionnaireCompletedAsyncAction
        .run(() => super.getQuestionnaireCompleted(questionnaireId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
questionnaireCompleted: ${questionnaireCompleted}
    ''';
  }
}
