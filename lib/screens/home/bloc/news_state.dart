part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class LoadingNews extends NewsState {}

class FailureLoadNews extends NewsState {
  String description;

  FailureLoadNews({
    required this.description,
  });

  @override
  List<Object> get props => [description];
}

class LoadedNews extends NewsState {
  List<ArticleModel> artikel;
  final String typel;

  LoadedNews({
    required this.artikel,
    required this.typel,
  });

  @override
  List<Object> get props => [artikel];

  @override
  String toString() => 'Loaded {items : ${artikel.length}}';
}
