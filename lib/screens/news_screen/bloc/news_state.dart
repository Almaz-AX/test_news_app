part of 'news_bloc.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsLoaded extends NewsState {
  final List<Article> articles;

  const NewsLoaded({required this.articles});
   @override
  List<Object> get props => [articles];
}

final class NewsFailure extends NewsState {
  final String message;

  const NewsFailure({required this.message});
   @override
  List<Object> get props => [message];
}