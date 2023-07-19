// ignore_for_file: unused_import

import 'package:counterapp/presentation/screens/counter_screen/widgets/counter_value.dart';
import 'package:counterapp/presentation/screens/counter_screen/widgets/flare_circle_widget.dart';
import 'package:counterapp/presentation/screens/counter_screen/widgets/rive_particles_widget.dart';
import 'package:flutter/material.dart';

import 'package:counterapp/presentation/screens/counter_screen/widgets/counter_slider_widget.dart';
import 'package:sizer/sizer.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const RiveParticlesBackground(),
          Positioned(
            top: 10.0.h,
            child: const Stack(
              alignment: Alignment.center,
              children: [
                FlareCircleBackground(),
                CounterValue(),
              ],
            ),
          ),
          Positioned(
            bottom: 8.0.h,
            child: const CounterSlider(),
          ),
        ],
      ),
    );
  }
}
