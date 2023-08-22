import 'package:fast_trivia/app/core/database/migrations/migration.dart';
import 'package:fast_trivia/app/core/database/migrations/migration_v1.dart';

class SqLiteMigrationFactory {
  List<Migration> getCreateMigration() => [
        MigrationV1(),
      ];

  List<Migration> getUpgradeMigration(int version) {
    final migrations = <Migration>[];

    if (version == 1) {
      //migrations.add(MigrationV2());
    }

    return migrations;
  }
}
