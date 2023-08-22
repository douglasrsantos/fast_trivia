import 'package:fast_trivia/app/models/questionnaire_completed_model.dart';
import 'package:fast_trivia/app/models/questionnaire_model.dart';

abstract class IQuestionnaire {
  Future<QuestionnaireModel> getQuestionnaire();
  Future<List<QuestionnaireCompletedModel>> getAllQuestionnairesCompleted();
  Future<QuestionnaireCompletedModel> getQuestionnaireCompletedById(int? questionnaireCompletedId);
  Future<void> save(QuestionnaireCompletedModel questionnaire);
}
