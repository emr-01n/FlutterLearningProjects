part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final Weather weather;
  WeatherLoadedState({@required this.weather}):assert(weather != null);
  
  @override
  List<Object> get props => [weather];
}

class WeatherErrorState extends WeatherState{}
