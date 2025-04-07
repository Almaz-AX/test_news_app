// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
  source: Source.fromJson(json['source'] as Map<String, dynamic>),
  author: json['author'] as String?,
  title: json['title'] as String,
  description: json['description'] as String?,
  url: json['url'] as String,
  imageUrl: json['urlToImage'] as String?,
  publishDate: DateTime.parse(json['publishedAt'] as String),
  content: json['content'] as String?,
);

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
  'source': instance.source,
  'author': instance.author,
  'title': instance.title,
  'description': instance.description,
  'url': instance.url,
  'urlToImage': instance.imageUrl,
  'publishedAt': instance.publishDate.toIso8601String(),
  'content': instance.content,
};

Source _$SourceFromJson(Map<String, dynamic> json) =>
    Source(id: json['id'] as String?, name: json['name'] as String);

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};
