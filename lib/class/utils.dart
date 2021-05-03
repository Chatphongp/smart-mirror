import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Utilities {
  static IconData getIconFromWeather(String openWxIcon) {
/*     01d.png 	01n.png 	clear sky
02d.png 	02n.png 	few clouds
03d.png 	03n.png 	scattered clouds
04d.png 	04n.png 	broken clouds
09d.png 	09n.png 	shower rain
10d.png 	10n.png 	rain
11d.png 	11n.png 	thunderstorm
13d.png 	13n.png 	snow
50d.png 	50n.png 	mist */

    switch (openWxIcon) {
      case "01d":
        return WeatherIcons.day_sunny;
      case "02d":
        return WeatherIcons.day_cloudy;
      case "03d":
        return WeatherIcons.day_cloudy;
      case "04d":
        return WeatherIcons.day_sunny_overcast;
      case "09d":
        return WeatherIcons.day_showers;
      case "10d":
        return WeatherIcons.day_rain;
      case "11d":
        return WeatherIcons.day_thunderstorm;
      case "13d":
        return WeatherIcons.day_snow;
      case "01n":
        return WeatherIcons.night_clear;
      case "02n":
        return WeatherIcons.night_cloudy;
      case "03n":
        return WeatherIcons.night_cloudy;
      case "04n":
        return WeatherIcons.night_cloudy;
      case "09n":
        return WeatherIcons.night_showers;
      case "10n":
        return WeatherIcons.night_rain;
      case "11n":
        return WeatherIcons.night_thunderstorm;
      case "13n":
        return WeatherIcons.night_snow;
      default:
        return WeatherIcons.alien;
    }
  }
}
