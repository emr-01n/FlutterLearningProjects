import 'package:f5_weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HavaDurumuResimWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return Column(
              children: [
                Text((state as WeatherLoadedState).weather.consolidatedWeather[0].theTemp.floor().toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),

                Image.network(
                  "https://www.metaweather.com/static/img/weather/png/${(state as WeatherLoadedState).weather.consolidatedWeather[0].weatherStateAbbr}.png",
                  width: 300,
                  height: 300,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
