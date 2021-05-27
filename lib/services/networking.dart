import 'package:clima/services/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.urlOfApi);
  final String urlOfApi;
  Future getData() async {
    print("Weather data");
    print(urlOfApi);
    http.Response response = await http.get(urlOfApi);
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
