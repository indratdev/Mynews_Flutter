import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_news/models/article_model.dart';
import 'package:my_news/resources/repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final Repository repo;

  NewsBloc({required this.repo}) : super(NewsInitial()) {
    on<FetchNewsEvent>((event, emit) async {
      try {
        emit(LoadingNews());
        final items = await repo.fetchAllNews(category: event.type);

        emit(LoadedNews(artikel: items, typel: event.type));
      } catch (e) {
        print(e);
        emit(FailureLoadNews(description: e.toString()));
      }
    });

    on<FetchTrendingNewsEvent>((event, emit) async {
      try {
        emit(LoadingNews());
        final items = await repo.fetchTrendingNews(category: event.type);
        emit(LoadedNews(artikel: items, typel: event.type));
      } catch (e) {
        emit(FailureLoadNews(description: e.toString()));
      }
    });
  }
}
