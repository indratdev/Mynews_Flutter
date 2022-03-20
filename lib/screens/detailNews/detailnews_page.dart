import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news/helpers/constants.dart';
import 'package:my_news/models/article_model.dart';
import 'package:my_news/screens/detailNews/bloc/detailnews_bloc.dart';

class DetailNewsPage extends StatelessWidget {
  const DetailNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      appBar: AppBar(
        title: Text(Constants.appName),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: BlocBuilder<DetailnewsBloc, DetailnewsState>(
            builder: (context, state) {
              if (state is LoadingDetailNews) {
                return Center(child: CircularProgressIndicator());
              }

              if (state is FailureDetailNews) {
                return Center(child: Text(state.description));
              }

              if (state is LoadedDetailNews) {
                ArticleModel item = state.artikel;
                return Column(
                  children: <Widget>[
                    Text(
                      // 'content, tgl',
                      item.publishedAt.toString(),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        // Constants.dummyUrlImage,
                        item.urlToImage.toString(),
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
                    SizedBox(height: 20),
                    Text(item.title.toString()),
                    SizedBox(height: 20),
                    Text(item.description.toString()),
                    SizedBox(height: 20),
                    Text(item.content.toString()),
                    SizedBox(height: 20),
                    Text(item.author.toString()),
                    SizedBox(height: 20),
                    Text('Link : ${item.url.toString()}'),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
