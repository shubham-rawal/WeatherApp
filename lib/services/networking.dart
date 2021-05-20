import 'package:clima/services/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/location.dart';

class NetworkHelper {
  NetworkHelper(this.urlOfApi);
  final String urlOfApi;
  Future getData(double latitude, double longitude) async {
    print("Weather data");
    var url = Uri.parse(
        '$urlOfApi?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    print(url);
    http.Response response = await http.get(url);
    print(response);
    if (response.statusCode == 200) {
      String data = response.body;
      print('console was here');
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
