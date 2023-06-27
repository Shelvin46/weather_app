part of 'search_bloc.dart';

class SearchState {
  // S
  String place;
  String date;
  double temperature;
  double feelsLike;
  int dayOrNight;
  bool isLoading;
  double windKmp;
  dynamic chanceOfRain;
  double pressure;
  dynamic uv;

  SearchState(
      {required this.isLoading,
      required this.date,
      required this.dayOrNight,
      required this.feelsLike,
      required this.place,
      required this.temperature,
      required this.chanceOfRain,
      required this.pressure,
      required this.uv,
      required this.windKmp});
}

class SearchInitial extends SearchState {
  SearchInitial()
      : super(
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
        );
}
