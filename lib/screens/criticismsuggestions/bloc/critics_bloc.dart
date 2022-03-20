import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_news/models/kritik_model.dart';
import 'package:my_news/resources/repository.dart';

part 'critics_event.dart';
part 'critics_state.dart';

class CriticsBloc extends Bloc<CriticsEvent, CriticsState> {
  CriticsBloc() : super(CriticsInitial()) {
    on<SendKritikSaran>((event, emit) async {
      try {
        emit(LoadingKritikSaran());
        var items = await Repository()
            .postKritikSaran(email: event.email, kritik: event.kritiksaran);

        emit(LoadedKritikSaran(value: items));
        // await Future.delayed(Duration(seconds: 2));

        // emit(CriticsInitial());
      } catch (e) {
        emit(FailureKritikSaran(description: e.toString()));
      }
    });
    on<ResetKritikSaran>((event, emit) {
      emit(CriticsInitial());
    });
  }
}
