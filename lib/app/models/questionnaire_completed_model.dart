import 'dart:convert';

import 'package:fast_trivia/app/models/question_completed_model.dart';

class QuestionnaireCompletedModel {
  int? id;
  String? title;
  List<QuestionCompletedModel>? questions;
  DateTime? createdAt;
  DateTime? updatedAt;

  QuestionnaireCompletedModel({
    this.id,
    this.title,
    this.questions,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'title': title,
      'questions': questions?.map((x) => x.toMap()).toList(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory QuestionnaireCompletedModel.fromMap(Map<String, dynamic> map) {
    return QuestionnaireCompletedModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      questions: map['questions'] != null
          ? List<QuestionCompletedModel>.from(
              (map['quests']).map<QuestionCompletedModel?>(
                (x) => QuestionCompletedModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt:
          map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionnaireCompletedModel.fromJson(String source) =>
      QuestionnaireCompletedModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
