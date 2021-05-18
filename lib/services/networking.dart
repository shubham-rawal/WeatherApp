import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.authority, this.encodedUrl, this.queries);
  final String authority;
  final String encodedUrl;
  final Map queries;

  Future getData() async {
    http.Response response =
        await http.get(Uri.https(authority, encodedUrl, queries));
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
