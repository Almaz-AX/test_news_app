part of 'news_bloc.dart';

sealed class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

final class NewsGetEvent extends NewsEvent {}

final class NewsSearchEvent extends NewsEvent {
  const NewsSearchEvent({required this.query});
  final String query;
  
  @override
  List<Object> get props => [query];
}
