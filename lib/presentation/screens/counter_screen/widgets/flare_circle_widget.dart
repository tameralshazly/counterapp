import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FlareCircleBackground extends StatelessWidget {
  const FlareCircleBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.0.w,
      height: 40.0.h,
      child: FlareActor(
        'assets/rive/circle.flr',
        animation: "Alarm",
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
