import 'package:flutter/material.dart';
import 'package:weather_app/services/WeatherModel.dart';
import 'package:weather_app/ui/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String yourLocation = 'user location';

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    dynamic data = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (buildContext) {
      return LocationScreen(data);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 50.0,
          
        ),
      ),
    );
  }
}
