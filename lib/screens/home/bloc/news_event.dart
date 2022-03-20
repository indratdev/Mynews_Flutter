part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchNewsEvent extends NewsEvent {
  final String type;

  FetchNewsEvent({required this.type});

  @override
  List<Object> get props => [type];

  @override
  String toString() => 'Fetch $type news';
}

class FetchTrendingNewsEvent extends NewsEvent {
  final String type;

  FetchTrendingNewsEvent({this.type = 'entertainment'});

  @override
  List<Object> get props => [type];
}
