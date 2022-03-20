part of 'detailnews_bloc.dart';

abstract class DetailnewsEvent extends Equatable {
  const DetailnewsEvent();

  @override
  List<Object> get props => [];
}

class SelectedDetailNews extends DetailnewsEvent {
  ArticleModel item;

  SelectedDetailNews({
    required this.item,
  });

  @override
  List<Object> get props => [item];
}
