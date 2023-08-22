// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fast_trivia/app/models/alternative_model.dart';

class QuestionModel {
  int? id;
  String? title;
  String? question;
  int? answerKey;
  List<AlternativeModel>? alternatives;

  QuestionModel({
    this.id,
    this.title,
    this.question,
    this.answerKey,
    this.alternatives,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'title': title,
      'question': question,
      'answer_key': answerKey,
      'alternatives': alternatives?.map((x) => x.toMap()).toList(),
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      question: map['question'] != null ? map['question'] as String : null,
      answerKey: map['answer_key'] != null ? map['answer_key'] as int : null,
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

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
