import 'package:flutter_app_14_state_management/BLOC%20Pack/sayac/sayac_event.dart';
import 'package:flutter_app_14_state_management/BLOC%20Pack/sayac/sayac_state.dart';
import 'package:bloc/bloc.dart';

class SayacBloc extends Bloc<SayacEvent, SayacState> {
  SayacBloc(SayacState initialState) : super(initialState);

  @override
  SayacState get initialState => SayacState.initial();

  @override
  Stream<SayacState> mapEventToState(SayacEvent event) async* {
    final _currentState = state;

    if (event is SayacArttirEvent) {
      yield SayacState(sayi: _currentState.sayi +1);
    } else if (event is SayacAzaltEvent) {
      yield SayacState(sayi: _currentState.sayi -1);
    }
  }
}
