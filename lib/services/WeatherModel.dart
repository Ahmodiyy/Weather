import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/weather.dart';

const appID = 'f0bbd4dc62d2f71478c056f8b430f928';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Location location = Location();
    await location.getCurrentLocation();
    Weather weather = Weather(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$appID');
    var data = await weather.getData();
    return data;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    Weather weather = Weather(
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.long}&appid=$appID&units=metric');
    var data = await weather.getData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
