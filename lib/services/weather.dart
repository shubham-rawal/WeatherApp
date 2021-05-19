import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '5baef41d319bad4110c35a05932e20ff';
const openWeatherMapURL = 'api.openweathermap.org';
const openWeatherMapEncodedURL = '/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper =
        NetworkHelper(openWeatherMapURL, openWeatherMapEncodedURL, {
      'lat': location.latitude,
      'lon': location.longitude,
      'appid': apiKey,
      'units': 'metric',
    });

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time in ';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in ';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 in ';
    } else {
      return 'Bring a 🧥 just in case in ';
    }
  }
}
