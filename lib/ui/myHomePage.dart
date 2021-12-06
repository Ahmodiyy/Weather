import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String yourLocation = 'user location';

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.lat);
    print(location.long);
  }

  void getData() async {
    // var url = Uri.parse('api.openweathermap.org/data/2.5/weather');
    // var response = await http.post(url, body: {
    //   'lat': '3',
    //   'lon': '2',
    //   'appid': 'f0bbd4dc62d2f71478c056f8b430f928'
    // });
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    try {
      var response = await http.get(
        Uri.parse(
            'http://api.openweathermap.org/data/2.5/weather?lat=3&lon=2&appid=f0bbd4dc62d2f71478c056f8b430f928'),
      );
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(child: Text('$yourLocation')),
    );
  }
}
