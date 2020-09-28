import 'dart:async';

import 'package:f5_weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:f5_weather_app/widgets/hava_durumu_resim.dart';
import 'package:f5_weather_app/widgets/location.dart';
import 'package:f5_weather_app/widgets/max_min_sicaklik.dart';
import 'package:f5_weather_app/widgets/sehir_sec.dart';
import 'package:f5_weather_app/widgets/son_guncelleme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherApp extends StatelessWidget {
  String kullanicininGirdigiSehir = "Manisa";
  Completer<void> _refreshCompleter = Completer<void>();

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Weather app"),
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  kullanicininGirdigiSehir = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SehirSecWidget()));
                  if (kullanicininGirdigiSehir != null) {
                    _weatherBloc.add(
                        FetchWeatherEvent(sehirAdi: kullanicininGirdigiSehir));
                  }
                }),
          ],
        ),
        body: Center(
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherInitial) {
                return Center(
                  child: Text("Şehir Seçiniz"),
                );
              }
              if (state is WeatherLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is WeatherLoadedState) {
                final getirilenWeather = state.weather;
                _refreshCompleter.complete();
                _refreshCompleter = Completer();
                return RefreshIndicator(
                  onRefresh: () {
                    _weatherBloc.add(RefreshWeatherEvent(
                        sehirAdi: kullanicininGirdigiSehir));
                    return _refreshCompleter.future;
                  },
                  child: ListView(
                    children: [
                      LocationWidget(
                        secilenSehir: getirilenWeather.title,
                      ),
                      SonGuncellemeWidget(),
                      HavaDurumuResimWidget(),
                      MaxMinSicaklikWidget(),
                    ],
                  ),
                );
              }
              if (state is WeatherErrorState) {
                return Center(
                  child: Text("Hata Oluştu"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
