import 'package:f5_weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:f5_weather_app/locator.dart';
import 'package:f5_weather_app/widgets/weather_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: BlocProvider<WeatherBloc>(
        create: (context) => WeatherBloc(),
        child: WeatherApp(),
      ),
    );
  }
}
