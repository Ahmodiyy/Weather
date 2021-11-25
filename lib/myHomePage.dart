import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    yourLocation = position.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('$yourLocation')),
    );
  }
}
