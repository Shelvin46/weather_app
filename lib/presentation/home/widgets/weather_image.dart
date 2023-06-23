import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/widgets/for_icon.dart';
import 'package:weather_app/presentation/widgets/for_text.dart';

import '../../../core/color_const.dart';

class WeatherImage extends StatelessWidget {
  WeatherImage({super.key, required this.image});
  String image;

  @override
  Widget build(BuildContext context) {
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
                  child: const CupertinoSearchTextField(
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
              content: "Palakkad",
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
                      content: "3^",
                      color: kWhite,
                      size: 80),
                  const SizedBox(
                    width: 20,
                  ),
                  ForText(
                      weight: FontWeight.normal,
                      content: "Feels like -2^",
                      color: kWhite,
                      size: 20),
                ],
              )),
          Positioned(
              left: 320,
              top: 310,
              child: ForText(
                  weight: FontWeight.normal,
                  content: "Day 3",
                  color: kWhite,
                  size: 20)),
          Positioned(
              left: 10,
              top: 340,
              child: ForText(
                  weight: FontWeight.normal,
                  content: "January 18, 18:29",
                  color: kWhite,
                  size: 20)),
          Positioned(
              left: 320,
              top: 340,
              child: ForText(
                  weight: FontWeight.normal,
                  content: "Night",
                  color: kWhite,
                  size: 20))
        ],
      ),
    );
  }
}
