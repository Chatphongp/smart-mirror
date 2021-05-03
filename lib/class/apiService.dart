import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:smartmirror/class/apiKey.dart';

class ApiService {
  static Future<List<dynamic>> getCalendar() async {
    try {
      var response = await http.get(
          Uri.https(ApiKey.GOOGLE_CALENDAR_URL, ApiKey.GOOGLE_CALENDAR_PATH));
      if (response.statusCode != 200) {
        throw HttpException(response.statusCode.toString());
      }

      return jsonDecode(response.body);
    } catch (_) {
      return [];
    }
  }

  static Future<dynamic> getNews() async {
    try {
      var response = await http.get(Uri.https(
          ApiKey.NEWS_API_URL,
          ApiKey.NEWS_API_PATH,
          {"q": "apple", "apiKey": ApiKey.NEWS_API_KEY}));

      if (response.statusCode != 200) {
        throw HttpException(response.statusCode.toString());
      }

      return jsonDecode(response.body);
    } catch (_) {
      return {};
    }
  }

  static Future<dynamic> getWeather() async {
    try {
      var response = await http.get(Uri.https(
          ApiKey.OPENWEATHER_URL,
          ApiKey.OPENWEATHER_PATH,
          {"q": ApiKey.OPENWEATHER_LOCATION, "appid": ApiKey.OPENWEATHER_KEY}));

      if (response.statusCode != 200) {
        throw HttpException(response.statusCode.toString());
      }
      return jsonDecode(response.body);
    } catch (_) {
      return {};
    }
  }
}
