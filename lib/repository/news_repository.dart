// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:test_news_app/model/article.dart';

class NewsRepository {
  final Dio dio;
  
  NewsRepository({required this.dio});

  Future<List<Article>> getNews() async {
    const url = 'https://newsapi.org/v2/top-headlines?country=us';
    final response = (await dio.get(url)).data as Map<dynamic, dynamic>;
    final articles = response["articles"] as List;
    return articles.map((article) => Article.fromJson(article)).toList();
  }
}
