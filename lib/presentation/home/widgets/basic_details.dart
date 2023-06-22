import 'package:flutter/material.dart';
import 'package:weather_app/core/color_const.dart';
import 'package:weather_app/presentation/widgets/for_text.dart';

import '../../widgets/for_icon.dart';

class BasicDetails extends StatelessWidget {
  BasicDetails(
      {super.key,
      required this.icon,
      required this.edgeTitle,
      required this.mainTitle,
      required this.subTitle});
  IconData icon;
  final mainTitle;
  final subTitle;
  final edgeTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 170,
      decoration: BoxDecoration(
        color: infoColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 10,
              // left: 10,
              child: CircleAvatar(
                child: ForIcon(color: kBlack, size: 24, icon: icon),
              )),
          Positioned(
              left: 45,
              top: 10,
              child: ForText(
                  weight: FontWeight.normal,
                  content: mainTitle,
                  color: kBlack,
                  size: 15)),
          Positioned(
              left: 45,
              top: 30,
              child: ForText(
                  weight: FontWeight.normal,
                  content: subTitle,
                  color: kBlack,
                  size: 15)),
          Positioned(
              left: 120,
              top: 40,
              child: ForText(
                  weight: FontWeight.normal,
                  content: edgeTitle,
                  color: kBlack,
                  size: 12)),
        ],
      ),
    );
  }
}
