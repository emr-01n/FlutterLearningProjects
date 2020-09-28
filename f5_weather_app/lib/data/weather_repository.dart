import 'package:f5_weather_app/data/weather_api_client.dart';
import 'package:f5_weather_app/locator.dart';
import 'package:f5_weather_app/models/weather.dart';

class WeatherRepository {
  WeatherApiClient _weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String sehir) async {
    final int sehirID = await _weatherApiClient.getLocationID(sehir);
    return await _weatherApiClient.getWeather(sehirID);
  }
}
