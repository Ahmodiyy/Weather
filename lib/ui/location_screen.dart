import 'package:flutter/material.dart';
import 'package:weather_app/services/WeatherModel.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/ui/city_screen.dart';

class LocationScreen extends StatefulWidget {
  final locationData;
  LocationScreen(this.locationData);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  late int temp;
  late String weatherEmoji;
  late String weatherMessage;
  late String location;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationData);
  }

  void updateUI(dynamic data) {
    setState(() {
      if (data == null) {
        temp = 0;
        weatherEmoji = 'error';
        weatherMessage = 'Unable to get data';
        location = '';
        return;
      }
      double tempe = data['main']['temp'];
      temp = tempe.toInt();
      int condition = data['weather'][0]['id'];
      weatherEmoji = weatherModel.getWeatherIcon(condition);
      weatherMessage = weatherModel.getMessage(temp);
      location = data['name'];
      print('--------------------------------');
      print(temp);
      print(weatherEmoji);
      print(location);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/loc1.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      onPressed: () async {
                        dynamic data = await weatherModel.getLocationWeather();
                        updateUI(data);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        var cityName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CityScreen()));
                        print(cityName);
                        if (cityName != null) {
                          dynamic data =
                              await weatherModel.getCityWeather(cityName);
                          updateUI(data);
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$temp',
                        style: kTempTextStyle,
                      ),
                      Text(
                        '$weatherEmoji',
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    '$weatherMessage in $location',
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
