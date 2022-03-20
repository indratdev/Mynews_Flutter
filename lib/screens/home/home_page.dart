import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news/helpers/constants.dart';
import 'package:my_news/models/article_model.dart';
import 'package:my_news/screens/detailNews/bloc/detailnews_bloc.dart';
import 'package:my_news/screens/home/bloc/news_bloc.dart';

import 'components/listnews_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is LoadingNews) {
          return Center(child: const CircularProgressIndicator());
        }

        if (state is FailureLoadNews) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                state.description.toString(),
                textAlign: TextAlign.justify,
              ),
            ),
          );
        }

        if (state is LoadedNews) {
          if (state.artikel == null || state.artikel.isEmpty) {
            return Text('Tidak ada data yang ditampilkan');
          } else {
            List<ArticleModel> items = state.artikel;
            return ListNewsWidget(items: items);
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
