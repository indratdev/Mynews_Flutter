import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_news/models/article_model.dart';

part 'detailnews_event.dart';
part 'detailnews_state.dart';

class DetailnewsBloc extends Bloc<DetailnewsEvent, DetailnewsState> {
  DetailnewsBloc() : super(DetailnewsInitial()) {
    on<SelectedDetailNews>((event, emit) async {
      try {
        emit(LoadingDetailNews());
        emit(LoadedDetailNews(artikel: event.item));
      } catch (e) {
        emit(FailureDetailNews(description: e.toString()));
      }
    });
  }
}
