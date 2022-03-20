part of 'critics_bloc.dart';

abstract class CriticsEvent extends Equatable {
  const CriticsEvent();

  @override
  List<Object> get props => [];
}

class SendKritikSaran extends CriticsEvent {
  String email, kritiksaran;

  SendKritikSaran({
    required this.email,
    required this.kritiksaran,
  });

  @override
  List<Object> get props => [email, kritiksaran];
}

class ResetKritikSaran extends CriticsEvent {}
