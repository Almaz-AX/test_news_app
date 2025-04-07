import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article extends Equatable {
  final Source source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  @JsonKey(name: 'urlToImage')
  final String? imageUrl;
  @JsonKey(name: 'publishedAt')
  final DateTime publishDate;
  final String? content;

  const Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.imageUrl,
    required this.publishDate,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        imageUrl,
        publishDate,
        content,
      ];
}

@JsonSerializable()
class Source extends Equatable {
  final String? id;
  final String name;

  const Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);

  @override
  List<Object?> get props => [id, name];
}