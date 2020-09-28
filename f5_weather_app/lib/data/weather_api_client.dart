import 'package:f5_weather_app/models/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherApiClient {
  static const baseUrl = "https://www.metaweather.com/";
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String sehirAdi) async {
    final sehirUrl = "$baseUrl/api/location/search/?query=$sehirAdi";
    final gelenCevap = await httpClient.get(sehirUrl);

    if (gelenCevap.statusCode != 200) {
      throw Exception("Veri getirilemedi");
    }

    final gelenCevapJSON = (jsonDecode(gelenCevap.body)) as List;
    return gelenCevapJSON[0]["woeid"];
  }

  Future<Weather> getWeather(int sehirID) async {
    final havaDurumuUrl = "$baseUrl/api/location/$sehirID";
    final gelenCevap = await httpClient.get(havaDurumuUrl);

    if (gelenCevap.statusCode != 200) {
      throw Exception("Hava Verisi getirilemedi");
    }

    final gelenCevapJSON = jsonDecode(gelenCevap.body);
    return Weather.fromJson(gelenCevapJSON);
  }
}
