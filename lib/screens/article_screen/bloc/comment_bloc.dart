import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../local_storage/app_database.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final AppDatabase database;
  CommentBloc({required this.database}) : super(CommentInitialState()) {
    on<CommentGetEvent>(_onCommentGetEvent);
    on<CommentAddEvent>(_onCommentAddEvent);
  }

  Future<void> _onCommentGetEvent(
    CommentGetEvent event,
    Emitter<CommentState> emit,
  ) async {
    try {
      final comments = await database.commentsDao.getCommentsForArticle(
        event.articleUrl,
      );
      emit(CommentLoadedState(comments: comments));
    } catch (_) {
      emit(CommentFailureState(message: 'Что то пошло не так'));
    }
  }

  Future<void> _onCommentAddEvent(
    CommentAddEvent event,
    Emitter<CommentState> emit,
  ) async {
    if (event.author.isEmpty || event.content.isEmpty) {
      return;
    }
    await database.commentsDao.addComment(
      event.articleUrl,
      event.author,
      event.content,
    );
    add(CommentGetEvent(articleUrl: event.articleUrl));
  }
}
