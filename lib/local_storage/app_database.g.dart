// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AuthTable extends Auth with TableInfo<$AuthTable, AuthData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _isAuthMeta = const VerificationMeta('isAuth');
  @override
  late final GeneratedColumn<bool> isAuth = GeneratedColumn<bool>(
    'is_auth',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_auth" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, isAuth];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'auth';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuthData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_auth')) {
      context.handle(
        _isAuthMeta,
        isAuth.isAcceptableOrUnknown(data['is_auth']!, _isAuthMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuthData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      isAuth:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_auth'],
          )!,
    );
  }

  @override
  $AuthTable createAlias(String alias) {
    return $AuthTable(attachedDatabase, alias);
  }
}

class AuthData extends DataClass implements Insertable<AuthData> {
  final int id;
  final bool isAuth;
  const AuthData({required this.id, required this.isAuth});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['is_auth'] = Variable<bool>(isAuth);
    return map;
  }

  AuthCompanion toCompanion(bool nullToAbsent) {
    return AuthCompanion(id: Value(id), isAuth: Value(isAuth));
  }

  factory AuthData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthData(
      id: serializer.fromJson<int>(json['id']),
      isAuth: serializer.fromJson<bool>(json['isAuth']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isAuth': serializer.toJson<bool>(isAuth),
    };
  }

  AuthData copyWith({int? id, bool? isAuth}) =>
      AuthData(id: id ?? this.id, isAuth: isAuth ?? this.isAuth);
  AuthData copyWithCompanion(AuthCompanion data) {
    return AuthData(
      id: data.id.present ? data.id.value : this.id,
      isAuth: data.isAuth.present ? data.isAuth.value : this.isAuth,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthData(')
          ..write('id: $id, ')
          ..write('isAuth: $isAuth')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isAuth);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthData && other.id == this.id && other.isAuth == this.isAuth);
}

class AuthCompanion extends UpdateCompanion<AuthData> {
  final Value<int> id;
  final Value<bool> isAuth;
  const AuthCompanion({
    this.id = const Value.absent(),
    this.isAuth = const Value.absent(),
  });
  AuthCompanion.insert({
    this.id = const Value.absent(),
    this.isAuth = const Value.absent(),
  });
  static Insertable<AuthData> custom({
    Expression<int>? id,
    Expression<bool>? isAuth,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isAuth != null) 'is_auth': isAuth,
    });
  }

  AuthCompanion copyWith({Value<int>? id, Value<bool>? isAuth}) {
    return AuthCompanion(id: id ?? this.id, isAuth: isAuth ?? this.isAuth);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isAuth.present) {
      map['is_auth'] = Variable<bool>(isAuth.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthCompanion(')
          ..write('id: $id, ')
          ..write('isAuth: $isAuth')
          ..write(')'))
        .toString();
  }
}

class $DbArticlesTable extends DbArticles
    with TableInfo<$DbArticlesTable, DbArticle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbArticlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _publishDateMeta = const VerificationMeta(
    'publishDate',
  );
  @override
  late final GeneratedColumn<DateTime> publishDate = GeneratedColumn<DateTime>(
    'publish_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceNameMeta = const VerificationMeta(
    'sourceName',
  );
  @override
  late final GeneratedColumn<String> sourceName = GeneratedColumn<String>(
    'source_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    url,
    title,
    description,
    author,
    imageUrl,
    publishDate,
    content,
    sourceName,
    sourceId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_articles';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbArticle> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('publish_date')) {
      context.handle(
        _publishDateMeta,
        publishDate.isAcceptableOrUnknown(
          data['publish_date']!,
          _publishDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_publishDateMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('source_name')) {
      context.handle(
        _sourceNameMeta,
        sourceName.isAcceptableOrUnknown(data['source_name']!, _sourceNameMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceNameMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DbArticle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbArticle(
      url:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}url'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      publishDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}publish_date'],
          )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      ),
      sourceName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}source_name'],
          )!,
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_id'],
      ),
    );
  }

  @override
  $DbArticlesTable createAlias(String alias) {
    return $DbArticlesTable(attachedDatabase, alias);
  }
}

class DbArticle extends DataClass implements Insertable<DbArticle> {
  final String url;
  final String title;
  final String? description;
  final String? author;
  final String? imageUrl;
  final DateTime publishDate;
  final String? content;
  final String sourceName;
  final String? sourceId;
  const DbArticle({
    required this.url,
    required this.title,
    this.description,
    this.author,
    this.imageUrl,
    required this.publishDate,
    this.content,
    required this.sourceName,
    this.sourceId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['url'] = Variable<String>(url);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['publish_date'] = Variable<DateTime>(publishDate);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    map['source_name'] = Variable<String>(sourceName);
    if (!nullToAbsent || sourceId != null) {
      map['source_id'] = Variable<String>(sourceId);
    }
    return map;
  }

  DbArticlesCompanion toCompanion(bool nullToAbsent) {
    return DbArticlesCompanion(
      url: Value(url),
      title: Value(title),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      imageUrl:
          imageUrl == null && nullToAbsent
              ? const Value.absent()
              : Value(imageUrl),
      publishDate: Value(publishDate),
      content:
          content == null && nullToAbsent
              ? const Value.absent()
              : Value(content),
      sourceName: Value(sourceName),
      sourceId:
          sourceId == null && nullToAbsent
              ? const Value.absent()
              : Value(sourceId),
    );
  }

  factory DbArticle.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbArticle(
      url: serializer.fromJson<String>(json['url']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      author: serializer.fromJson<String?>(json['author']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      publishDate: serializer.fromJson<DateTime>(json['publishDate']),
      content: serializer.fromJson<String?>(json['content']),
      sourceName: serializer.fromJson<String>(json['sourceName']),
      sourceId: serializer.fromJson<String?>(json['sourceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'url': serializer.toJson<String>(url),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'author': serializer.toJson<String?>(author),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'publishDate': serializer.toJson<DateTime>(publishDate),
      'content': serializer.toJson<String?>(content),
      'sourceName': serializer.toJson<String>(sourceName),
      'sourceId': serializer.toJson<String?>(sourceId),
    };
  }

  DbArticle copyWith({
    String? url,
    String? title,
    Value<String?> description = const Value.absent(),
    Value<String?> author = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    DateTime? publishDate,
    Value<String?> content = const Value.absent(),
    String? sourceName,
    Value<String?> sourceId = const Value.absent(),
  }) => DbArticle(
    url: url ?? this.url,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    author: author.present ? author.value : this.author,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    publishDate: publishDate ?? this.publishDate,
    content: content.present ? content.value : this.content,
    sourceName: sourceName ?? this.sourceName,
    sourceId: sourceId.present ? sourceId.value : this.sourceId,
  );
  DbArticle copyWithCompanion(DbArticlesCompanion data) {
    return DbArticle(
      url: data.url.present ? data.url.value : this.url,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      author: data.author.present ? data.author.value : this.author,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      publishDate:
          data.publishDate.present ? data.publishDate.value : this.publishDate,
      content: data.content.present ? data.content.value : this.content,
      sourceName:
          data.sourceName.present ? data.sourceName.value : this.sourceName,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbArticle(')
          ..write('url: $url, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('author: $author, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('publishDate: $publishDate, ')
          ..write('content: $content, ')
          ..write('sourceName: $sourceName, ')
          ..write('sourceId: $sourceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    url,
    title,
    description,
    author,
    imageUrl,
    publishDate,
    content,
    sourceName,
    sourceId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbArticle &&
          other.url == this.url &&
          other.title == this.title &&
          other.description == this.description &&
          other.author == this.author &&
          other.imageUrl == this.imageUrl &&
          other.publishDate == this.publishDate &&
          other.content == this.content &&
          other.sourceName == this.sourceName &&
          other.sourceId == this.sourceId);
}

class DbArticlesCompanion extends UpdateCompanion<DbArticle> {
  final Value<String> url;
  final Value<String> title;
  final Value<String?> description;
  final Value<String?> author;
  final Value<String?> imageUrl;
  final Value<DateTime> publishDate;
  final Value<String?> content;
  final Value<String> sourceName;
  final Value<String?> sourceId;
  final Value<int> rowid;
  const DbArticlesCompanion({
    this.url = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.author = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.publishDate = const Value.absent(),
    this.content = const Value.absent(),
    this.sourceName = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbArticlesCompanion.insert({
    required String url,
    required String title,
    this.description = const Value.absent(),
    this.author = const Value.absent(),
    this.imageUrl = const Value.absent(),
    required DateTime publishDate,
    this.content = const Value.absent(),
    required String sourceName,
    this.sourceId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : url = Value(url),
       title = Value(title),
       publishDate = Value(publishDate),
       sourceName = Value(sourceName);
  static Insertable<DbArticle> custom({
    Expression<String>? url,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? author,
    Expression<String>? imageUrl,
    Expression<DateTime>? publishDate,
    Expression<String>? content,
    Expression<String>? sourceName,
    Expression<String>? sourceId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (url != null) 'url': url,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (author != null) 'author': author,
      if (imageUrl != null) 'image_url': imageUrl,
      if (publishDate != null) 'publish_date': publishDate,
      if (content != null) 'content': content,
      if (sourceName != null) 'source_name': sourceName,
      if (sourceId != null) 'source_id': sourceId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbArticlesCompanion copyWith({
    Value<String>? url,
    Value<String>? title,
    Value<String?>? description,
    Value<String?>? author,
    Value<String?>? imageUrl,
    Value<DateTime>? publishDate,
    Value<String?>? content,
    Value<String>? sourceName,
    Value<String?>? sourceId,
    Value<int>? rowid,
  }) {
    return DbArticlesCompanion(
      url: url ?? this.url,
      title: title ?? this.title,
      description: description ?? this.description,
      author: author ?? this.author,
      imageUrl: imageUrl ?? this.imageUrl,
      publishDate: publishDate ?? this.publishDate,
      content: content ?? this.content,
      sourceName: sourceName ?? this.sourceName,
      sourceId: sourceId ?? this.sourceId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (publishDate.present) {
      map['publish_date'] = Variable<DateTime>(publishDate.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (sourceName.present) {
      map['source_name'] = Variable<String>(sourceName.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbArticlesCompanion(')
          ..write('url: $url, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('author: $author, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('publishDate: $publishDate, ')
          ..write('content: $content, ')
          ..write('sourceName: $sourceName, ')
          ..write('sourceId: $sourceId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CommentsTable extends Comments with TableInfo<$CommentsTable, Comment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 500,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _articleUrlMeta = const VerificationMeta(
    'articleUrl',
  );
  @override
  late final GeneratedColumn<String> articleUrl = GeneratedColumn<String>(
    'article_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES db_articles (url) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    author,
    content,
    createdAt,
    articleUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Comment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('article_url')) {
      context.handle(
        _articleUrlMeta,
        articleUrl.isAcceptableOrUnknown(data['article_url']!, _articleUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_articleUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Comment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Comment(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      author:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}author'],
          )!,
      content:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}content'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      articleUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}article_url'],
          )!,
    );
  }

  @override
  $CommentsTable createAlias(String alias) {
    return $CommentsTable(attachedDatabase, alias);
  }
}

class Comment extends DataClass implements Insertable<Comment> {
  final int id;
  final String author;
  final String content;
  final DateTime createdAt;
  final String articleUrl;
  const Comment({
    required this.id,
    required this.author,
    required this.content,
    required this.createdAt,
    required this.articleUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['author'] = Variable<String>(author);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['article_url'] = Variable<String>(articleUrl);
    return map;
  }

  CommentsCompanion toCompanion(bool nullToAbsent) {
    return CommentsCompanion(
      id: Value(id),
      author: Value(author),
      content: Value(content),
      createdAt: Value(createdAt),
      articleUrl: Value(articleUrl),
    );
  }

  factory Comment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Comment(
      id: serializer.fromJson<int>(json['id']),
      author: serializer.fromJson<String>(json['author']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      articleUrl: serializer.fromJson<String>(json['articleUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'author': serializer.toJson<String>(author),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'articleUrl': serializer.toJson<String>(articleUrl),
    };
  }

  Comment copyWith({
    int? id,
    String? author,
    String? content,
    DateTime? createdAt,
    String? articleUrl,
  }) => Comment(
    id: id ?? this.id,
    author: author ?? this.author,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
    articleUrl: articleUrl ?? this.articleUrl,
  );
  Comment copyWithCompanion(CommentsCompanion data) {
    return Comment(
      id: data.id.present ? data.id.value : this.id,
      author: data.author.present ? data.author.value : this.author,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      articleUrl:
          data.articleUrl.present ? data.articleUrl.value : this.articleUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Comment(')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('articleUrl: $articleUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, author, content, createdAt, articleUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comment &&
          other.id == this.id &&
          other.author == this.author &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.articleUrl == this.articleUrl);
}

class CommentsCompanion extends UpdateCompanion<Comment> {
  final Value<int> id;
  final Value<String> author;
  final Value<String> content;
  final Value<DateTime> createdAt;
  final Value<String> articleUrl;
  const CommentsCompanion({
    this.id = const Value.absent(),
    this.author = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.articleUrl = const Value.absent(),
  });
  CommentsCompanion.insert({
    this.id = const Value.absent(),
    required String author,
    required String content,
    this.createdAt = const Value.absent(),
    required String articleUrl,
  }) : author = Value(author),
       content = Value(content),
       articleUrl = Value(articleUrl);
  static Insertable<Comment> custom({
    Expression<int>? id,
    Expression<String>? author,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
    Expression<String>? articleUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (author != null) 'author': author,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (articleUrl != null) 'article_url': articleUrl,
    });
  }

  CommentsCompanion copyWith({
    Value<int>? id,
    Value<String>? author,
    Value<String>? content,
    Value<DateTime>? createdAt,
    Value<String>? articleUrl,
  }) {
    return CommentsCompanion(
      id: id ?? this.id,
      author: author ?? this.author,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      articleUrl: articleUrl ?? this.articleUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (articleUrl.present) {
      map['article_url'] = Variable<String>(articleUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommentsCompanion(')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('articleUrl: $articleUrl')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AuthTable auth = $AuthTable(this);
  late final $DbArticlesTable dbArticles = $DbArticlesTable(this);
  late final $CommentsTable comments = $CommentsTable(this);
  late final DbArticlesDao dbArticlesDao = DbArticlesDao(this as AppDatabase);
  late final CommentsDao commentsDao = CommentsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    auth,
    dbArticles,
    comments,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'db_articles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('comments', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$AuthTableCreateCompanionBuilder =
    AuthCompanion Function({Value<int> id, Value<bool> isAuth});
typedef $$AuthTableUpdateCompanionBuilder =
    AuthCompanion Function({Value<int> id, Value<bool> isAuth});

class $$AuthTableFilterComposer extends Composer<_$AppDatabase, $AuthTable> {
  $$AuthTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAuth => $composableBuilder(
    column: $table.isAuth,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuthTableOrderingComposer extends Composer<_$AppDatabase, $AuthTable> {
  $$AuthTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAuth => $composableBuilder(
    column: $table.isAuth,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuthTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuthTable> {
  $$AuthTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isAuth =>
      $composableBuilder(column: $table.isAuth, builder: (column) => column);
}

class $$AuthTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuthTable,
          AuthData,
          $$AuthTableFilterComposer,
          $$AuthTableOrderingComposer,
          $$AuthTableAnnotationComposer,
          $$AuthTableCreateCompanionBuilder,
          $$AuthTableUpdateCompanionBuilder,
          (AuthData, BaseReferences<_$AppDatabase, $AuthTable, AuthData>),
          AuthData,
          PrefetchHooks Function()
        > {
  $$AuthTableTableManager(_$AppDatabase db, $AuthTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AuthTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$AuthTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$AuthTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool> isAuth = const Value.absent(),
              }) => AuthCompanion(id: id, isAuth: isAuth),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool> isAuth = const Value.absent(),
              }) => AuthCompanion.insert(id: id, isAuth: isAuth),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuthTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuthTable,
      AuthData,
      $$AuthTableFilterComposer,
      $$AuthTableOrderingComposer,
      $$AuthTableAnnotationComposer,
      $$AuthTableCreateCompanionBuilder,
      $$AuthTableUpdateCompanionBuilder,
      (AuthData, BaseReferences<_$AppDatabase, $AuthTable, AuthData>),
      AuthData,
      PrefetchHooks Function()
    >;
typedef $$DbArticlesTableCreateCompanionBuilder =
    DbArticlesCompanion Function({
      required String url,
      required String title,
      Value<String?> description,
      Value<String?> author,
      Value<String?> imageUrl,
      required DateTime publishDate,
      Value<String?> content,
      required String sourceName,
      Value<String?> sourceId,
      Value<int> rowid,
    });
typedef $$DbArticlesTableUpdateCompanionBuilder =
    DbArticlesCompanion Function({
      Value<String> url,
      Value<String> title,
      Value<String?> description,
      Value<String?> author,
      Value<String?> imageUrl,
      Value<DateTime> publishDate,
      Value<String?> content,
      Value<String> sourceName,
      Value<String?> sourceId,
      Value<int> rowid,
    });

final class $$DbArticlesTableReferences
    extends BaseReferences<_$AppDatabase, $DbArticlesTable, DbArticle> {
  $$DbArticlesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CommentsTable, List<Comment>> _commentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.comments,
    aliasName: $_aliasNameGenerator(db.dbArticles.url, db.comments.articleUrl),
  );

  $$CommentsTableProcessedTableManager get commentsRefs {
    final manager = $$CommentsTableTableManager(
      $_db,
      $_db.comments,
    ).filter((f) => f.articleUrl.url.sqlEquals($_itemColumn<String>('url')!));

    final cache = $_typedResult.readTableOrNull(_commentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DbArticlesTableFilterComposer
    extends Composer<_$AppDatabase, $DbArticlesTable> {
  $$DbArticlesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publishDate => $composableBuilder(
    column: $table.publishDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> commentsRefs(
    Expression<bool> Function($$CommentsTableFilterComposer f) f,
  ) {
    final $$CommentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.url,
      referencedTable: $db.comments,
      getReferencedColumn: (t) => t.articleUrl,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CommentsTableFilterComposer(
            $db: $db,
            $table: $db.comments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbArticlesTableOrderingComposer
    extends Composer<_$AppDatabase, $DbArticlesTable> {
  $$DbArticlesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publishDate => $composableBuilder(
    column: $table.publishDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DbArticlesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DbArticlesTable> {
  $$DbArticlesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get publishDate => $composableBuilder(
    column: $table.publishDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  Expression<T> commentsRefs<T extends Object>(
    Expression<T> Function($$CommentsTableAnnotationComposer a) f,
  ) {
    final $$CommentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.url,
      referencedTable: $db.comments,
      getReferencedColumn: (t) => t.articleUrl,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CommentsTableAnnotationComposer(
            $db: $db,
            $table: $db.comments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DbArticlesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DbArticlesTable,
          DbArticle,
          $$DbArticlesTableFilterComposer,
          $$DbArticlesTableOrderingComposer,
          $$DbArticlesTableAnnotationComposer,
          $$DbArticlesTableCreateCompanionBuilder,
          $$DbArticlesTableUpdateCompanionBuilder,
          (DbArticle, $$DbArticlesTableReferences),
          DbArticle,
          PrefetchHooks Function({bool commentsRefs})
        > {
  $$DbArticlesTableTableManager(_$AppDatabase db, $DbArticlesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DbArticlesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DbArticlesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$DbArticlesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> url = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<DateTime> publishDate = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<String> sourceName = const Value.absent(),
                Value<String?> sourceId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbArticlesCompanion(
                url: url,
                title: title,
                description: description,
                author: author,
                imageUrl: imageUrl,
                publishDate: publishDate,
                content: content,
                sourceName: sourceName,
                sourceId: sourceId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String url,
                required String title,
                Value<String?> description = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                required DateTime publishDate,
                Value<String?> content = const Value.absent(),
                required String sourceName,
                Value<String?> sourceId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DbArticlesCompanion.insert(
                url: url,
                title: title,
                description: description,
                author: author,
                imageUrl: imageUrl,
                publishDate: publishDate,
                content: content,
                sourceName: sourceName,
                sourceId: sourceId,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$DbArticlesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({commentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (commentsRefs) db.comments],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (commentsRefs)
                    await $_getPrefetchedData<
                      DbArticle,
                      $DbArticlesTable,
                      Comment
                    >(
                      currentTable: table,
                      referencedTable: $$DbArticlesTableReferences
                          ._commentsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$DbArticlesTableReferences(
                                db,
                                table,
                                p0,
                              ).commentsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.articleUrl == item.url,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DbArticlesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DbArticlesTable,
      DbArticle,
      $$DbArticlesTableFilterComposer,
      $$DbArticlesTableOrderingComposer,
      $$DbArticlesTableAnnotationComposer,
      $$DbArticlesTableCreateCompanionBuilder,
      $$DbArticlesTableUpdateCompanionBuilder,
      (DbArticle, $$DbArticlesTableReferences),
      DbArticle,
      PrefetchHooks Function({bool commentsRefs})
    >;
typedef $$CommentsTableCreateCompanionBuilder =
    CommentsCompanion Function({
      Value<int> id,
      required String author,
      required String content,
      Value<DateTime> createdAt,
      required String articleUrl,
    });
typedef $$CommentsTableUpdateCompanionBuilder =
    CommentsCompanion Function({
      Value<int> id,
      Value<String> author,
      Value<String> content,
      Value<DateTime> createdAt,
      Value<String> articleUrl,
    });

final class $$CommentsTableReferences
    extends BaseReferences<_$AppDatabase, $CommentsTable, Comment> {
  $$CommentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DbArticlesTable _articleUrlTable(_$AppDatabase db) =>
      db.dbArticles.createAlias(
        $_aliasNameGenerator(db.comments.articleUrl, db.dbArticles.url),
      );

  $$DbArticlesTableProcessedTableManager get articleUrl {
    final $_column = $_itemColumn<String>('article_url')!;

    final manager = $$DbArticlesTableTableManager(
      $_db,
      $_db.dbArticles,
    ).filter((f) => f.url.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_articleUrlTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CommentsTableFilterComposer
    extends Composer<_$AppDatabase, $CommentsTable> {
  $$CommentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DbArticlesTableFilterComposer get articleUrl {
    final $$DbArticlesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.articleUrl,
      referencedTable: $db.dbArticles,
      getReferencedColumn: (t) => t.url,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbArticlesTableFilterComposer(
            $db: $db,
            $table: $db.dbArticles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CommentsTableOrderingComposer
    extends Composer<_$AppDatabase, $CommentsTable> {
  $$CommentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DbArticlesTableOrderingComposer get articleUrl {
    final $$DbArticlesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.articleUrl,
      referencedTable: $db.dbArticles,
      getReferencedColumn: (t) => t.url,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbArticlesTableOrderingComposer(
            $db: $db,
            $table: $db.dbArticles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CommentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CommentsTable> {
  $$CommentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$DbArticlesTableAnnotationComposer get articleUrl {
    final $$DbArticlesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.articleUrl,
      referencedTable: $db.dbArticles,
      getReferencedColumn: (t) => t.url,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DbArticlesTableAnnotationComposer(
            $db: $db,
            $table: $db.dbArticles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CommentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CommentsTable,
          Comment,
          $$CommentsTableFilterComposer,
          $$CommentsTableOrderingComposer,
          $$CommentsTableAnnotationComposer,
          $$CommentsTableCreateCompanionBuilder,
          $$CommentsTableUpdateCompanionBuilder,
          (Comment, $$CommentsTableReferences),
          Comment,
          PrefetchHooks Function({bool articleUrl})
        > {
  $$CommentsTableTableManager(_$AppDatabase db, $CommentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CommentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CommentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CommentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> author = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> articleUrl = const Value.absent(),
              }) => CommentsCompanion(
                id: id,
                author: author,
                content: content,
                createdAt: createdAt,
                articleUrl: articleUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String author,
                required String content,
                Value<DateTime> createdAt = const Value.absent(),
                required String articleUrl,
              }) => CommentsCompanion.insert(
                id: id,
                author: author,
                content: content,
                createdAt: createdAt,
                articleUrl: articleUrl,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CommentsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({articleUrl = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (articleUrl) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.articleUrl,
                            referencedTable: $$CommentsTableReferences
                                ._articleUrlTable(db),
                            referencedColumn:
                                $$CommentsTableReferences
                                    ._articleUrlTable(db)
                                    .url,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CommentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CommentsTable,
      Comment,
      $$CommentsTableFilterComposer,
      $$CommentsTableOrderingComposer,
      $$CommentsTableAnnotationComposer,
      $$CommentsTableCreateCompanionBuilder,
      $$CommentsTableUpdateCompanionBuilder,
      (Comment, $$CommentsTableReferences),
      Comment,
      PrefetchHooks Function({bool articleUrl})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AuthTableTableManager get auth => $$AuthTableTableManager(_db, _db.auth);
  $$DbArticlesTableTableManager get dbArticles =>
      $$DbArticlesTableTableManager(_db, _db.dbArticles);
  $$CommentsTableTableManager get comments =>
      $$CommentsTableTableManager(_db, _db.comments);
}
