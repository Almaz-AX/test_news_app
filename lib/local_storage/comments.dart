import 'package:drift/drift.dart';

import 'db_articles.dart';

class Comments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get author => text().withLength(min: 1, max: 50)(); 
  TextColumn get content => text().withLength(min: 1, max: 500)(); 
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get articleUrl => text().references(
    DbArticles,
    #url,
    onDelete: KeyAction.cascade,
  )(); 
}