import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/application/search_bloc.dart';
import 'package:weather_app/core/color_const.dart';
import 'package:weather_app/core/const_widget.dart';
import 'package:weather_app/infrastructure/search/search_implementation.dart';
import 'package:weather_app/presentation/home/widgets/basic_details.dart';
import 'package:weather_app/presentation/home/widgets/for_forecast.dart';
import 'package:weather_app/presentation/home/widgets/weather_image.dart';
import 'package:weather_app/presentation/widgets/for_icon.dart';
import 'package:weather_app/presentation/widgets/for_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(InitialResponse(query: "kochi"));
    });
    return Scaffold(
      backgroundColor: bacColor,
      body: ListView(
        children: [
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading == true) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return WeatherImage(
                state: state,
                image: 'assets/jonathan-bowers-BqKdvJ8a5TI-unsplash.jpg',
              );
            },
          ),
          homeGapOne,
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading == true) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BasicDetails(
                          icon: Icons.wind_power_rounded,
                          edgeTitle: "",
                          mainTitle: 'Wind speed',
                          subTitle: state.windKmp.toString() + ' Km/h'),
                      BasicDetails(
                          icon: Icons.cloudy_snowing,
                          edgeTitle: "",
                          mainTitle: 'Rain Chance',
                          subTitle: state.chanceOfRain.toString() + ' %'),
                    ],
                  ),
                  homeGapOne,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BasicDetails(
                          icon: Icons.speed,
                          edgeTitle: "",
                          mainTitle: 'Pressure',
                          subTitle: state.pressure.toString() + ' hpa'),
                      BasicDetails(
                        icon: Icons.sunny,
                        edgeTitle: "",
                        mainTitle: 'UV Index',
                        subTitle: state.uv.toString(),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          homeGapOne,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 170,
                width: 360,
                decoration: BoxDecoration(
                  color: infoColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      top: 10,
                      child: ForIcon(
                        color: kBlack,
                        size: 24,
                        icon: Icons.access_time_outlined,
                      ),
                    ),
                    Positioned(
                        left: 40,
                        top: 10,
                        child: ForText(
                            weight: FontWeight.normal,
                            content: 'Hourly forecast',
                            color: kBlack,
                            size: 15)),
                    const Positioned(
                      left: 10,
                      top: 40,
                      child: ForecastDetails(
                          image:
                              'assets/jonathan-bowers-BqKdvJ8a5TI-unsplash.jpg',
                          status: "10^",
                          when: "Now"),
                    ),
                    const Positioned(
                      left: 70,
                      top: 40,
                      child: ForecastDetails(
                          image:
                              'assets/jonathan-bowers-BqKdvJ8a5TI-unsplash.jpg',
                          status: "10^",
                          when: "12 PM"),
                    ),
                    const Positioned(
                      left: 140,
                      top: 40,
                      child: ForecastDetails(
                          image:
                              'assets/jonathan-bowers-BqKdvJ8a5TI-unsplash.jpg',
                          status: "10^",
                          when: "12 PM"),
                    ),
                    const Positioned(
                      left: 210,
                      top: 40,
                      child: ForecastDetails(
                        image:
                            'assets/jonathan-bowers-BqKdvJ8a5TI-unsplash.jpg',
                        status: "10^",
                        when: "12 PM",
                      ),
                    ),
                    const Positioned(
                      left: 280,
                      top: 40,
                      child: ForecastDetails(
                          image:
                              'assets/jonathan-bowers-BqKdvJ8a5TI-unsplash.jpg',
                          status: "10^",
                          when: "12 PM"),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
