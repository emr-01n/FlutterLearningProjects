import 'package:f5_weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaxMinSicaklikWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Maximum : " + (state as WeatherLoadedState).weather.consolidatedWeather[0].maxTemp.floor().toString() + "C",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Minimum : " + (state as WeatherLoadedState).weather.consolidatedWeather[0].minTemp.floor().toString() + "C",
                style: TextStyle(fontSize: 20),
              ),
            ],
          );
        }),
      ),
    );
  }
}
