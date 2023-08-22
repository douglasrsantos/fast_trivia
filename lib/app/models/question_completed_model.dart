import 'dart:convert';

import 'package:fast_trivia/app/models/alternative_model.dart';

class QuestionCompletedModel {
  int? id;
  String? title;
  String? question;
  int? idQuestionnaire;
  int? answerKey;
  int? chosenAlternative;
  List<AlternativeModel>? alternatives;

  QuestionCompletedModel({
    this.id,
    this.title,
    this.question,
    this.idQuestionnaire,
    this.answerKey,
    this.chosenAlternative,
    this.alternatives,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'title': title,
      'question': question,
      'id_questionnaire': idQuestionnaire,
      'answer_key': answerKey,
      'chosen_alternative': chosenAlternative,
      'alternatives': alternatives?.map((x) => x.toMap()).toList(),
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory QuestionCompletedModel.fromMap(Map<String, dynamic> map) {
    return QuestionCompletedModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      question: map['question'] != null ? map['question'] as String : null,
      idQuestionnaire: map['id_questionnaire'] != null
          ? map['id_questionnaire'] as int
          : null,
      answerKey: map['answer_key'] != null ? map['answer_key'] as int : null,
      chosenAlternative: map['chosen_alternative'] != null
          ? map['chosen_alternative'] as int
          : null,
      alternatives: map['alternatives'] != null
          ? List<AlternativeModel>.from(
              (map['alternatives']).map<AlternativeModel?>(
                (x) => AlternativeModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionCompletedModel.fromJson(String source) =>
      QuestionCompletedModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
