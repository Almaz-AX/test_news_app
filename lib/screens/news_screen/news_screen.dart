import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_news_app/injection_container.dart';
import 'package:test_news_app/local_storage/app_database.dart';
import 'package:test_news_app/navigation/main_navigation.dart';
import 'package:test_news_app/screens/helpers/format_date.dart';
import 'package:test_news_app/screens/news_screen/bloc/news_bloc.dart';

import '../../model/article.dart';
import '../widgets/image_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: Center(
          child: const Text('News', style: TextStyle(fontSize: 16)),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            onChanged:
                (value) => BlocProvider.of<NewsBloc>(
                  context,
                ).add(NewsSearchEvent(query: value)),
            onTapOutside:
                (event) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              label: Text('Search local base'),
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              sl<AppDatabase>().changeAuthStatus(false);
              Navigator.of(context).pushNamedAndRemoveUntil(
                MainNavigationRouteNames.auth,
                (Route<dynamic> route) => false,
              );
            },
            child: Text('Exit'),
          ),
        ],
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          switch (state) {
            case NewsInitial _:
              return Container();
            case NewsLoading _:
              return Center(child: CircularProgressIndicator());
            case NewsFailure _:
              return Center(child: Text(state.message));
            case NewsLoaded _:
              final articles = state.articles;
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder:
                    (context, index) => ArticleWidget(article: articles[index]),
              );
          }
        },
      ),
    );
  }
}

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        onTap:
            () => Navigator.of(
              context,
            ).pushNamed(MainNavigationRouteNames.article, arguments: article),
        tileColor: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (article.imageUrl != null) ImageWidget(url: article.imageUrl!),
            Text(article.title),
          ],
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.description ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(formatToLocalDate(article.publishDate)),
          ],
        ),
      ),
    );
  }
}
