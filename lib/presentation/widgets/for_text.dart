import 'package:flutter/material.dart';

class ForText extends StatelessWidget {
  ForText(
      {Key? key,
      required this.weight,
      required this.content,
      required this.color,
      required this.size})
      : super(key: key);
  final content;
  double size;
  final color;
  final weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight),
    );
  }
}
