// ignore_for_file: depend_on_referenced_packages
import 'package:fast_trivia/app/core/database/migrations/migration.dart';
import 'package:sqflite_common/sqlite_api.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      create table questionnaire_completed(
        id Integer primary key autoincrement,
        title text,
        created_at datetime,
        updated_at datetime
      )
    ''');

    batch.execute('''
      create table question_completed (
        id Integer primary key autoincrement,
        id_questionnaire integer,
        title text,
        question text,
        answer_key integer,
        chosen_alternative integer,
        foreign key (id_questionnaire) references questionnaire_completed(id)
      )
    ''');

    batch.execute('''
      create table alternative (
        id integer primary key,
        id_question integer,
        title text,
        foreign key (id_question) references question_completed(id)
      )
    ''');
  }

  @override
  void update(Batch batch) {}
}
