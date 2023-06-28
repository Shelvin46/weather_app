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
        forForecast: [],
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
        String time = "";
        if (finding == forChecking) {
          time = 'Now';
        } else if (finding >= 0 && finding < 12) {
          time = '$finding am';
        } else if (finding >= 12 && finding <= 23) {
          time = '$finding pm';
        } else {
          break;
        }
        forForecastList.add({
          'time': time,
          'icon': hourList[finding].condition.icon,
          'temp': hourList[finding].tempC,
        });
      }
      emit(SearchState(
          forForecast: forForecastList,
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
    on<SearchInitialize>((event, emit) async {
      emit(SearchState(
        forForecast: [],
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
          await SearchImplementation().fetchWeather(event.query);
      DateTime now = DateTime.now();
      String formattedTime = DateFormat.H().format(now);
      int forChecking = int.parse(formattedTime);
      int finding = int.parse(formattedTime);
      int limit = finding + 5;
      List<Hour> hourList = response.forecast.forecastday[0].hour;
      for (finding; finding < limit; finding++) {
        String time = "";
        if (finding == forChecking) {
          time = 'Now';
        } else if (finding >= 0 && finding < 12) {
          time = '$finding am';
        } else if (finding >= 12 && finding <= 23) {
          time = '$finding pm';
        } else {
          break;
        }
        forForecastList.add({
          'time': time,
          'icon': hourList[finding].condition.icon,
          'temp': hourList[finding].tempC,
        });
      }
      emit(SearchState(
          forForecast: forForecastList,
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
