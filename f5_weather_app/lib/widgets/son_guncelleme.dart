import 'package:f5_weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SonGuncellemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          var yeniTerih = (state as WeatherLoadedState).weather.time.toLocal();

          return Text(
            "Son Güncelleme " + TimeOfDay.fromDateTime(yeniTerih).format(context),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          );
        },
      )),
    );
  }
}
