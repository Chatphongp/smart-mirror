import 'package:flutter/material.dart';
import 'package:smartmirror/class/apiService.dart';
import 'package:smartmirror/class/utils.dart';

class WeatherView extends StatefulWidget {
  WeatherView({Key key}) : super(key: key);

  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  String icon = "";
  String maxTemp = "";
  String minTemp = "";
  @override
  void initState() { 
    super.initState();
    loadWeather();
  }

  void loadWeather() async {
    var weather = await ApiService.getWeather();

    setState(() {
      icon = weather["weather"][0]["icon"];
      maxTemp = (weather["main"]["temp_max"] / 10).toStringAsFixed(1);
      minTemp = (weather["main"]["temp_min"] / 10).toStringAsFixed(1);
    });

    print(icon);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(right: 30),
              child: Icon(
                Utilities.getIconFromWeather(icon),
                size: 60,
                color: Colors.white,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(maxTemp + " °C", style: TextStyle(color: Colors.white, fontSize: 40)),
              Text(minTemp + " °C",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 30))
            ],
          )
        ],
      ),
    );
  }
}
