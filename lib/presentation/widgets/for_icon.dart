import 'package:flutter/material.dart';

class ForIcon extends StatelessWidget {
  ForIcon(
      {Key? key, required this.color, required this.size, required this.icon})
      : super(key: key);
  final color;
  double size;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
