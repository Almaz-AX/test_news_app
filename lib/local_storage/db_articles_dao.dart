import 'package:drift/drift.dart';
import '../model/article.dart';
import 'db_articles.dart';

import 'app_database.dart';

part 'db_articles_dao.g.dart';

@DriftAccessor(tables: [DbArticles])
class DbArticlesDao extends DatabaseAccessor<AppDatabase>
    with _$DbArticlesDaoMixin {
  DbArticlesDao(super.db);

  Future<bool> existsByUrl(String url) async {
    return (await (select(dbArticles)
          ..where((tbl) => tbl.url.equals(url))).get())
        .isNotEmpty;
  }

  Future<void> insertIfNotExists(Article article) async {
    if (!await existsByUrl(article.url)) {
      await into(dbArticles).insert(
        DbArticlesCompanion.insert(
          url: article.url,
          title: article.title,
          description: Value(article.description),
          author: Value(article.author),
          imageUrl: Value(article.imageUrl),
          publishDate: article.publishDate,
          content: Value(article.content),
          sourceName: article.source.name,
          sourceId: Value(article.source.id),
        ),
      );
    }
  }

  Future<List<Article>> search(String query) async {
    final searchTerm = '%$query%';

    final articles =
        await (select(dbArticles)..where(
          (tbl) =>
              tbl.title.lower().like(searchTerm.toLowerCase()) |
              tbl.description.lower().like(searchTerm.toLowerCase()),
        )).get();

    return articles.map((dbArticle) => _mapToArticle(dbArticle)).toList();
  }

  Future<List<Article>> getAllArticles() async {
    final rows = await select(dbArticles).get();
    return rows.map(_mapToArticle).toList();
  }

  Article _mapToArticle(DbArticle row) {
    return Article(
      source: Source(id: row.sourceId, name: row.sourceName),
      author: row.author,
      title: row.title,
      description: row.description,
      url: row.url,
      imageUrl: row.imageUrl,
      publishDate: row.publishDate,
      content: row.content,
    );
  }
}
