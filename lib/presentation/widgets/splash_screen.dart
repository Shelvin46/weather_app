import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/application/search_bloc.dart';
import 'package:weather_app/core/color_const.dart';
import 'package:weather_app/presentation/home/main_home.dart';
import 'package:weather_app/presentation/widgets/for_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    forWait();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/ivan-ulamec-F-kdP4Hk7lg-unsplash.jpg')),
      ),
      child: Center(
        child: ForText(
            weight: FontWeight.bold,
            content: "Explore the Weathers",
            color: kWhite,
            size: 30),
      ),
    ));
  }

  Future<void> forWait() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return HomePage();
      },
    ));
  }
}
