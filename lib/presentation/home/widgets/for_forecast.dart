import 'package:flutter/material.dart';

import '../../../core/color_const.dart';
import '../../../core/const_widget.dart';
import '../../widgets/for_text.dart';

class ForecastDetails extends StatelessWidget {
  const ForecastDetails(
      {super.key,
      required this.image,
      required this.status,
      required this.when});
  final when;
  final image;
  final status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ForText(
            weight: FontWeight.normal, content: when, color: kBlack, size: 15),
        foreSmallGap,
        CircleAvatar(
          backgroundImage: NetworkImage('https:$image'),
        ),
        foreSmallGap,
        ForText(
            weight: FontWeight.normal,
            content: status,
            color: kBlack,
            size: 20),
      ],
    );
  }
}
