import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:f5_weather_app/data/weather_repository.dart';
import 'package:f5_weather_app/locator.dart';
import 'package:f5_weather_app/models/weather.dart';
import 'package:flutter/cupertino.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

final WeatherRepository weatherRepo = locator<WeatherRepository>();

  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherLoadingState();
      try {
        final Weather getirilenWeather = await weatherRepo.getWeather(event.sehirAdi);
        yield WeatherLoadedState(weather: getirilenWeather);
      } catch (e) {
        yield WeatherErrorState();
      }
    }
    else if (event is RefreshWeatherEvent) {
      try {
        final Weather getirilenWeather = await weatherRepo.getWeather(event.sehirAdi);
        yield WeatherLoadedState(weather: getirilenWeather);
      } catch (e) {
        yield state;
      }
    }
  }
}
