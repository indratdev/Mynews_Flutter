part of 'detailnews_bloc.dart';

abstract class DetailnewsState extends Equatable {
  const DetailnewsState();

  @override
  List<Object> get props => [];
}

class DetailnewsInitial extends DetailnewsState {}

class LoadingDetailNews extends DetailnewsState {}

class FailureDetailNews extends DetailnewsState {
  String description;

  FailureDetailNews({required this.description});

  @override
  List<Object> get props => [description];
}

class LoadedDetailNews extends DetailnewsState {
  ArticleModel artikel;

  LoadedDetailNews({required this.artikel});

  @override
  List<Object> get props => [artikel];
}
