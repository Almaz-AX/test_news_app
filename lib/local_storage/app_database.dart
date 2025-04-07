import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_news_app/local_storage/db_articles_dao.dart';
import 'package:test_news_app/local_storage/auth.dart';

import 'comments.dart';
import 'comments_dao.dart';
import 'db_articles.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Auth, DbArticles, Comments], daos: [DbArticlesDao, CommentsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'app_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<void> changeAuthStatus(bool authStatus) async {
    await into(auth).insertOnConflictUpdate(
      AuthCompanion(id: const Value(1), isAuth: Value(authStatus)),
    );
  }
}
