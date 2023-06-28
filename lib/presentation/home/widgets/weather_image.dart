import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/application/search_bloc.dart';
import 'package:weather_app/presentation/widgets/for_icon.dart';
import 'package:weather_app/presentation/widgets/for_text.dart';

import '../../../core/color_const.dart';

class WeatherImage extends StatelessWidget {
  WeatherImage({super.key, required this.image, required this.state});
  String image;
  SearchState state;

  @override
  Widget build(BuildContext context) {
    String day = state.dayOrNight.toString();
    String dateString = state.date;
    DateTime dateTime = DateTime.parse(dateString);
    DateFormat format = DateFormat('MMMM d');
    String newDate = format.format(dateTime);
    String dayChecking = "";
    if (state.dayOrNight == 1) {
      dayChecking = 'Day';
    } else {
      dayChecking = 'Night';
    }
    // log(state.date);
    return Container(
      width: 200,
      height: 400,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35))),
      child: Stack(
        children: [
          Positioned(
              top: 20,
              left: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  width: 350,
                  color: bacColor,
                  child: CupertinoSearchTextField(
                    onSubmitted: (value) {
                      context
                          .read<SearchBloc>()
                          .add(SearchInitialize(query: value));
                    },
                    style: TextStyle(color: kBlack),
                    itemSize: 26,
                    itemColor: kBlack,
                  ),
                ),
              )),
          Positioned(
            left: 10,
            top: 80,
            child: ForText(
              weight: FontWeight.bold,
              content: state.place,
              color: kWhite,
              size: 25,
            ),
          ),
          Positioned(
              left: 30,
              height: 400,
              child: Row(
                children: [
                  ForText(
                      weight: FontWeight.bold,
                      content: state.temperature.toString(),
                      color: kWhite,
                      size: 80),
                  const SizedBox(
                    width: 20,
                  ),
                  ForText(
                      weight: FontWeight.normal,
                      content: 'Feels Like ${state.feelsLike}',
                      color: kWhite,
                      size: 20),
                ],
              )),
          Positioned(
              left: 320,
              top: 310,
              child: ForText(
                  weight: FontWeight.normal,
                  content: "Day $day",
                  color: kWhite,
                  size: 20)),
          Positioned(
              left: 10,
              top: 340,
              child: ForText(
                  weight: FontWeight.normal,
                  content: newDate,
                  color: kWhite,
                  size: 20)),
          Positioned(
              left: 320,
              top: 340,
              child: ForText(
                  weight: FontWeight.normal,
                  content: dayChecking,
                  color: kWhite,
                  size: 20))
        ],
      ),
    );
  }
}
