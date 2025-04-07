part of 'comment_bloc.dart';

sealed class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

final class CommentGetEvent extends CommentEvent {
  final String articleUrl;

  const CommentGetEvent({required this.articleUrl});

  @override
  List<Object> get props => [articleUrl];
}

final class CommentAddEvent extends CommentEvent {
  final String author;
  final String articleUrl;
  final String content;

  const CommentAddEvent({
    required this.author,
    required this.articleUrl,
    required this.content,
  });
  @override
  List<Object> get props => [author, articleUrl, content];
}


