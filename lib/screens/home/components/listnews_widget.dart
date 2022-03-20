import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news/helpers/constants.dart';
import 'package:my_news/models/article_model.dart';
import 'package:my_news/screens/detailNews/bloc/detailnews_bloc.dart';

class ListNewsWidget extends StatelessWidget {
  const ListNewsWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<ArticleModel> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent.shade100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final detail = BlocProvider.of<DetailnewsBloc>(context);
          if (index == 0) {
            return InkWell(
              onTap: () {
                detail.add(SelectedDetailNews(item: items[index]));

                Navigator.of(context, rootNavigator: false)
                    .pushNamed('/detailnews');
              },
              child: _header(items: items, index: index),
            );
          } else {
            return _body(detail: detail, items: items, index: index);
          }
        },
      ),
    );
  }
}

class _header extends StatelessWidget {
  const _header({
    Key? key,
    required this.items,
    required this.index,
  }) : super(key: key);

  final List<ArticleModel> items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              items[index].urlToImage ?? '',
              // Constants.dummyUrlImage,
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
          Text(items[index].title ?? ''),
          Text(items[index].author ?? ''),
        ],
      ),
    );
  }
}

class _body extends StatelessWidget {
  const _body({
    Key? key,
    required this.detail,
    required this.items,
    required this.index,
  }) : super(key: key);

  final DetailnewsBloc detail;
  final List<ArticleModel> items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        detail.add(SelectedDetailNews(item: items[index]));

        Navigator.of(context, rootNavigator: false).pushNamed('/detailnews');
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          items[index].urlToImage ?? Constants.dummyUrlImage,
          width: MediaQuery.of(context).size.width / 4,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const CircularProgressIndicator();
          },
        ),
      ),
      title: Text(items[index].title ?? ''),
      subtitle: Text(items[index].publishedAt.timeZoneName),
    );
  }
}
