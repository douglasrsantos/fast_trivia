import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AlternativeModel {
  int? id;
  String? title;
  int? idQuestion;
  int? idQuestionnaire;

  AlternativeModel({
    this.id,
    this.title,
    this.idQuestion,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'title': title,
      'id_question': idQuestion,
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory AlternativeModel.fromMap(Map<String, dynamic> map) {
    return AlternativeModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      idQuestion: map['id_question'] != null ? map['id_question'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AlternativeModel.fromJson(String source) =>
      AlternativeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
