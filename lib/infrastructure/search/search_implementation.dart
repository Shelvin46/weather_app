import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weather_app/domain/search/response.dart';

class SearchImplementation {
  // WeatherResponse? instance;
  Future<WeatherResponse> fetchWeather(String query) async {
    const apiKey = "a499aa4808mshb55de6435429a68p1cf586jsn749af8a5b1b7";
    const host = "weatherapi-com.p.rapidapi.com";
    const path = "/forecast.json";
    const headers = {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': host,
    };
    var uri = Uri.https(host, path, {'q': query});
    var response = await http.get(uri, headers: headers);
    try {
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        log(jsonData.toString());
        return WeatherResponse.fromJson(jsonData);
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    throw Exception('Failed to fetch weather');

    // return null;
    // return null;
  }
}
