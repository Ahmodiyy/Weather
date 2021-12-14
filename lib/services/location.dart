import 'package:geolocator/geolocator.dart';

class Location {
  late double lat;
  late double long;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      lat = position.latitude;
      long = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
