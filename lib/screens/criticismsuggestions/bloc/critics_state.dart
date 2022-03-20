part of 'critics_bloc.dart';

abstract class CriticsState extends Equatable {
  const CriticsState();

  @override
  List<Object> get props => [];
}

class CriticsInitial extends CriticsState {}

class LoadingKritikSaran extends CriticsState {}

class FailureKritikSaran extends CriticsState {
  String description;

  FailureKritikSaran({required this.description});

  @override
  List<Object> get props => [description];
}

class LoadedKritikSaran extends CriticsState {
  KritikModel value;

  LoadedKritikSaran({required this.value});

  @override
  List<Object> get props => [value];
}
