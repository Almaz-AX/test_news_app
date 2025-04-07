import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:test_news_app/local_storage/app_database.dart';
import 'package:test_news_app/repository/news_repository.dart';
import 'package:test_news_app/screens/loader_screen/loader_bloc/loader_bloc.dart';

import 'screens/article_screen/bloc/comment_bloc.dart';
import 'screens/news_screen/bloc/news_bloc.dart';


final sl = GetIt.instance;

Future<void> init() async {

  sl.registerFactory(() => CommentBloc(
    database: sl<AppDatabase>()
    ));

  sl.registerFactory(() => NewsBloc(
    repository: sl<NewsRepository>(),
    database: sl<AppDatabase>()
    ));

  sl.registerFactory(() => LoaderBloc(database: sl<AppDatabase>()));

  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());

  sl.registerLazySingleton<NewsRepository>(() => NewsRepository(dio: sl<Dio>()));

  await dotenv.load(fileName: '.env');
  
  sl.registerLazySingleton<Dio>(() => Dio(
    BaseOptions(queryParameters: {'apiKey': dotenv.env["API_KEY"]})));
  
}
