import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news/models/article_model.dart';
import 'package:my_news/screens/detailNews/bloc/detailnews_bloc.dart';
import 'package:my_news/screens/home/bloc/news_bloc.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is LoadingNews) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is FailureLoadNews) {
          return Center(child: Text('Gagal Memuat Data News'));
        }
        if (state is LoadedNews) {
          if (state.artikel.isEmpty || state.artikel == null) {
            return Center(
              child: Text('Tidak Ada Data'),
            );
          } else {
            List<ArticleModel> listItem = state.artikel;
            return Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  _title(),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: listItem.length,
                      itemBuilder: (context, index) {
                        final detail = BlocProvider.of<DetailnewsBloc>(context);
                        return InkWell(
                          onTap: () {
                            detail
                                .add(SelectedDetailNews(item: listItem[index]));
                            Navigator.of(context, rootNavigator: false)
                                .pushNamed('/detailnews');
                          },
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                flex: 5,
                                fit: FlexFit.tight,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        listItem[index].title.toString(),
                                      ),
                                      Text(
                                        listItem[index]
                                            .publishedAt
                                            .toIso8601String(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      // Constants.dummyUrlImage,
                                      listItem[index].urlToImage.toString(),
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class _title extends StatelessWidget {
  const _title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      child: Text(
        'Trending',
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }
}
