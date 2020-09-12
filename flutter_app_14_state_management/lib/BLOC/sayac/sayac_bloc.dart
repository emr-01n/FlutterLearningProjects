import 'dart:async';

import 'package:flutter_app_14_state_management/BLOC/sayac/sayac_event.dart';

class SayacBLOC {
  int _sayac = 0;

  //Eventler için StreamController
  final _sayacEventSC = StreamController<SayacEvent>();
  Stream<SayacEvent> get _sayacEventStream => _sayacEventSC.stream;
  StreamSink<SayacEvent> get sayacEventSink => _sayacEventSC.sink;

  //State için StreamController
  final _sayacStateSC = StreamController<int>();
  Stream<int> get sayacStateStream => _sayacStateSC.stream;
  StreamSink<int> get _sayacStateSink => _sayacStateSC.sink;

  SayacBLOC() {
    _sayacEventStream.listen(_mapEventToState);
  }

  void _mapEventToState(SayacEvent event) {
    if (event is SayacArttir) {
      _sayac++;
    } else {
      _sayac--;
    }
    _sayacStateSink.add(_sayac);
  }
}
