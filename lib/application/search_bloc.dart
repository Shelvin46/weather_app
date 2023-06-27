import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/domain/search/response.dart';
import 'package:weather_app/infrastructure/search/search_implementation.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<InitialResponse>((event, emit) async {
      emit(SearchState(
        isLoading: true,
        date: '',
        dayOrNight: 0,
        feelsLike: 0,
        place: "",
        temperature: 0,
        chanceOfRain: 0,
        pressure: 0,
        uv: 0,
        windKmp: 0,
      ));
      List<Map<String, dynamic>> forForecastList = [];
      WeatherResponse response =
          await SearchImplementation().fetchWeather("kochi");
      DateTime now = DateTime.now();
      String formattedTime = DateFormat.H().format(now);
      int forChecking = int.parse(formattedTime);
      int finding = int.parse(formattedTime);
      int limit = finding + 5;
      List<Hour> hourList = response.forecast.forecastday[0].hour;
      for (finding; finding < limit; finding++) {
        if (finding == forChecking) {
          forForecastList.add({
            "time": 'Now',
            "icon": hourList[finding].condition.icon,
            "temp": hourList[finding].tempC
          });
        } else {
          forForecastList.add({
            "time": finding,
            "icon": hourList[finding].condition.icon,
            "temp": hourList[finding].tempC
          });
        }
      }
      emit(SearchState(
          isLoading: false,
          date: response.location.localtime.split(' ')[0],
          dayOrNight: response.current.isDay,
          feelsLike: response.current.feelslikeC,
          place: response.location.name,
          temperature: response.current.tempC,
          windKmp: response.current.windKph,
          uv: response.current.uv,
          pressure: response.current.pressureMb,
          chanceOfRain:
              response.forecast.forecastday[0].day.dailyChanceOfRain));
    });
  }
}