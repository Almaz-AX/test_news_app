import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_news_app/screens/article_screen/article_screen.dart';
import 'package:test_news_app/screens/article_screen/bloc/comment_bloc.dart';
import 'package:test_news_app/screens/auth_screen.dart';
import 'package:test_news_app/screens/loader_screen/loader_bloc/loader_bloc.dart';
import 'package:test_news_app/screens/news_screen/bloc/news_bloc.dart';

import 'package:test_news_app/screens/news_screen/news_screen.dart';

import '../injection_container.dart';
import '../screens/loader_screen/loader_screen.dart';

abstract class MainNavigationRouteNames {
  static const auth = '/auth';
  static const main = '/main';
  static const loader = 'loader';
  static const article = '/main/article';
}

class MainNavigation {
  final routes = {
    MainNavigationRouteNames.loader:
        (context) => BlocProvider(
          create: (context) => sl<LoaderBloc>()..add(LoaderAuthStatusEvent()),
          child: const LoaderScreen(),
        ),
    MainNavigationRouteNames.main:
        (context) => BlocProvider(
          create: (context) => sl<NewsBloc>()..add(NewsGetEvent()),
          child: const NewsScreen(),
        ),
    MainNavigationRouteNames.auth: (context) => const AuthScreen(),
    MainNavigationRouteNames.article:
        (context) => BlocProvider(
          create: (context) => sl<CommentBloc>(),
          child: const ArticleScreen(),
        ),
  };
}
