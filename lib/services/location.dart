import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
    } catch (e) {
      print(e);
    }
  }
}
