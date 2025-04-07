import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_news_app/screens/helpers/format_date.dart';
import 'package:test_news_app/screens/widgets/image_widget.dart';

import '../../model/article.dart';
import 'bloc/comment_bloc.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)?.settings.arguments as Article?;
    if (article == null) {
      return const Scaffold(body: Center(child: Text('Artile not found')));
    }
    BlocProvider.of<CommentBloc>(
          context,
        ).add(CommentGetEvent(articleUrl: article.url));
    return Scaffold(
      appBar: AppBar(title: Text('Source: ${article.source.name}')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8),
        children: [
          Text(
            article.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          if (article.imageUrl != null)
            SizedBox(
              height: 300,
              child: ImageWidget(url: article.imageUrl!),
            ),
          Text(article.content ?? ''),
          Row(
            children: [
              if (article.author != null) Text('Author: ${article.author}'),
              Expanded(child: SizedBox(height: 5)),
              Text(formatToLocalDate(article.publishDate)),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text('Comments', style: TextStyle(fontSize: 20)),
              Expanded(child: SizedBox(height: 5)),
              ElevatedButton(
                onPressed:
                    () => _showAddCommentSheet(
                      context,
                      article.url,
                      BlocProvider.of<CommentBloc>(context),
                    ),
                child: Text('Add comment'),
              ),
            ],
          ),
          CommentsWidget(articleUrl: article.url),
        ],
      ),
    );
  }

  void _showAddCommentSheet(
    BuildContext context,
    String articleUrl,
    CommentBloc bloc,
  ) {
    String author = '';
    String comment = '';
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder:
          (context) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Add Comment', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 16),
                  TextField(
                    onChanged: (value) => author = value,
                    decoration: const InputDecoration(labelText: 'Author'),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    onChanged: (value) => comment = value,
                    decoration: const InputDecoration(
                      labelText: 'Comment',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      bloc.add(
                        CommentAddEvent(
                          author: author,
                          articleUrl: articleUrl,
                          content: comment,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({super.key, required this.articleUrl});
  final String articleUrl;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        switch (state) {
          case CommentInitialState _:
            return Container();
          case CommentFailureState _:
            return Center(child: Text(state.message));
          case CommentLoadedState _:
            final comments = state.comments;
            if (comments.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('There is no comments'),
                ),
              );
            }
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'UserName: ${comments[index].author}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comments[index].content,
                        style: TextStyle(fontSize: 18),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          formatToLocalDate(comments[index].createdAt),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
        }
      },
    );
  }
}
