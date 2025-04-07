import 'package:drift/drift.dart';

import 'app_database.dart';
import 'comments.dart';
import 'db_articles.dart';

part 'comments_dao.g.dart';

@DriftAccessor(tables: [DbArticles, Comments])
class CommentsDao extends DatabaseAccessor<AppDatabase> with _$CommentsDaoMixin {
  CommentsDao(super.db);

  // Добавляем комментарий
  Future<int> addComment(
    String articleUrl,
    String author,
    String content,
  ) async {
    return await into(comments).insert(
      CommentsCompanion.insert(
        articleUrl: articleUrl,
        author: author,
        content: content,
      ),
    );
  }
  // Получаем комментарии для статьи
  Future<List<Comment>> getCommentsForArticle(String articleUrl) async {
    return await (select(comments)
          ..where((c) => c.articleUrl.equals(articleUrl))
          ..orderBy([(c) => OrderingTerm.desc(c.createdAt)]))
        .get();
  }

  // Удаляем все комментарии статьи
  Future<void> deleteArticleComments(String articleUrl) async {
    await (delete(comments)
      ..where((c) => c.articleUrl.equals(articleUrl))).go();
  }
}
