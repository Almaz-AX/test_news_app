part of 'comment_bloc.dart';

sealed class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

final class CommentInitialState extends CommentState {}

final class CommentLoadedState extends CommentState {
  final List<Comment> comments;
  const CommentLoadedState({required this.comments});
  @override
  List<Object> get props => [comments];
}

final class CommentFailureState extends CommentState {
  final String message;
  const CommentFailureState({required this.message});
}
