part of 'bottomnav_bloc.dart';

abstract class BottomnavState extends Equatable {
  const BottomnavState();

  @override
  List<Object> get props => [];
}

class BottomnavInitial extends BottomnavState {}

class MovedPage extends BottomnavState {
  final int page;

  MovedPage({required this.page});

  @override
  List<Object> get props => [page];
}
