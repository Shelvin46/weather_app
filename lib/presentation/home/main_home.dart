import 'package:flutter/material.dart';
import 'package:weather_app/core/color_const.dart';
import 'package:weather_app/core/const_widget.dart';
import 'package:weather_app/presentation/home/widgets/basic_details.dart';
import 'package:weather_app/presentation/home/widgets/weather_image.dart';
import 'package:weather_app/presentation/widgets/for_icon.dart';
import 'package:weather_app/presentation/widgets/for_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bacColor,
      body: ListView(
        children: [
          WeatherImage(
            image: 'assets/jonathan-bowers-BqKdvJ8a5TI-unsplash.jpg',
          ),
          homeGapOne,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BasicDetails(
                  icon: Icons.wind_power_rounded,
                  edgeTitle: "2km/h",
                  mainTitle: 'Wind speed',
                  subTitle: '12km/h'),
              BasicDetails(
                  icon: Icons.cloudy_snowing,
                  edgeTitle: "10%",
                  mainTitle: 'Rain Chance',
                  subTitle: '24%'),
            ],
          ),
          homeGapOne,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BasicDetails(
                  icon: Icons.laptop_windows_outlined,
                  edgeTitle: "32 hpa",
                  mainTitle: 'Pressure',
                  subTitle: '720 hpa'),
              BasicDetails(
                  icon: Icons.sunny,
                  edgeTitle: "0.3",
                  mainTitle: 'UV Index',
                  subTitle: '2,3'),
            ],
          ) // Work with

          // DefaultTabController(
          //   length: 3,
          //   child: Column(
          //     children: [
          //       Material(
          //         child: Container(
          //           height: 80,
          //           color: bacColor,
          //           child: TabBar(
          //               padding: const EdgeInsets.only(
          //                 top: 20,
          //                 left: 10,
          //                 right: 10,
          //                 bottom: 23,
          //               ),
          //               physics: const ClampingScrollPhysics(),
          //               unselectedLabelColor: kWhite,
          //               indicatorSize: TabBarIndicatorSize.label,
          //               indicator: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(30),
          //                   color: tabSelColor),
          //               tabs: [
          //                 Tab(
          //                   child: Container(
          //                     height: 35,
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(30),
          //                         border: Border.all()),
          //                     child: Align(
          //                       alignment: Alignment.center,
          //                       child: ForText(
          //                           weight: FontWeight.normal,
          //                           content: "Today",
          //                           color: kBlack,
          //                           size: 12),
          //                     ),
          //                   ),
          //                 ),
          //                 Tab(
          //                   child: Container(
          //                     height: 35,
          //                     // color: kWhite,
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(30),
          //                         border: Border.all(
          //                           // color: kWhite,
          //                           width: 1,
          //                         )),
          //                     child: Align(
          //                       alignment: Alignment.center,
          //                       child: ForText(
          //                           weight: FontWeight.normal,
          //                           content: "Tomorrow",
          //                           color: kBlack,
          //                           size: 12),
          //                     ),
          //                   ),
          //                 ),
          //                 Tab(
          //                   child: Container(
          //                     height: 35,
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(30),
          //                         border: Border.all(
          //                           // color: kWhite,
          //                           width: 1,
          //                         )),
          //                     child: Align(
          //                       alignment: Alignment.center,
          //                       child: ForText(
          //                           weight: FontWeight.normal,
          //                           content: "10 Days",
          //                           color: kBlack,
          //                           size: 12),
          //                     ),
          //                   ),
          //                 ),
          //               ]),
          //         ),
          //       ),
          //       // TabBarView(
          //       //   children: [
          //       //     Center(
          //       //       child: Text("Content for Today"),
          //       //     ),
          //       //     Center(
          //       //       child: Text("Content for Tomorrow"),
          //       //     ),
          //       //     Center(
          //       //       child: Text("Content for 10 Days"),
          //       //     ),
          //       //   ],
          //       // ),
          //       // TabBarView(children: [
          //       //   Center(
          //       //     child: Text("dfdfbdbg"),
          //       //   ),
          //       //   Center(
          //       //     child: Text("dfdfbdbg"),
          //       //   ),
          //       //   Center(
          //       //     child: Text("dfdfbdbg"),
          //       //   ),
          //       // ])
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
