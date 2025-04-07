import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_news_app/local_storage/app_database.dart';
import 'package:test_news_app/repository/news_repository.dart';

import '../../../model/article.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;
  final AppDatabase database;
  NewsBloc({required this.repository, required this.database})
    : super(NewsInitial()) {
    on<NewsGetEvent>(_onNewsGetEvent);
    on<NewsSearchEvent>(_onNewsSearchEvent);
  }

  Future<void> _onNewsGetEvent(
    NewsGetEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(NewsLoading());
    try {
      final articles = await repository.getNews();
      for (Article article in articles) {
        database.dbArticlesDao.insertIfNotExists(article);
      }
      emit(NewsLoaded(articles: articles));
    } catch (_) {
      emit(NewsFailure(message: 'Что-то пошло не так'));
    }
  }
  Future<void> _onNewsSearchEvent(
    NewsSearchEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(NewsLoading());
    try {
      final articles = await database.dbArticlesDao.search(event.query);
      emit(NewsLoaded(articles: articles));
    } catch (_) {
      emit(NewsFailure(message: 'Что-то пошло не так'));
    }
  }
}
