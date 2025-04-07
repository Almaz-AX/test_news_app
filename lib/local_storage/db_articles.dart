import 'package:drift/drift.dart';

class DbArticles extends Table {
  TextColumn get url => text().unique()();
  TextColumn get title => text()();
  TextColumn? get description => text().nullable()();
  TextColumn? get author => text().nullable()();
  TextColumn? get imageUrl => text().nullable()();
  DateTimeColumn get publishDate => dateTime()();
  TextColumn? get content => text().nullable()();
  TextColumn get sourceName => text()();
  TextColumn? get sourceId => text().nullable()();
}
