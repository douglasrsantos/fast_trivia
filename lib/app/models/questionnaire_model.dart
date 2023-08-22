// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fast_trivia/app/models/question_model.dart';

class QuestionnaireModel {
  int? id;
  String? title;
  List<QuestionModel>? questions;
  DateTime? createdAt;
  DateTime? updatedAt;

  QuestionnaireModel({
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

  factory QuestionnaireModel.fromMap(Map<String, dynamic> map) {
    return QuestionnaireModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      questions: map['questions'] != null
          ? List<QuestionModel>.from(
              (map['questions']).map<QuestionModel?>(
                (x) => QuestionModel.fromMap(x as Map<String, dynamic>),
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

  factory QuestionnaireModel.fromJson(String source) =>
      QuestionnaireModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
