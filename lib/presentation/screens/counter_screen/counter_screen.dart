import 'package:counterapp/presentation/screens/counter_screen/widgets/flare_circle_widget.dart';
import 'package:counterapp/presentation/screens/counter_screen/widgets/rive_particles_widget.dart';
import 'package:flutter/material.dart';

import 'package:counterapp/presentation/screens/counter_screen/widgets/counter_slider_widget.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          RiveParticlesBackground(),
          Positioned(
            top: 48,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // FlareCircleBackground(),
                CounterValue(),
              ],
            ),
          ),
          Positioned(
            bottom: 48,
            child: CounterSlider(),
          ),
        ],
      ),
    );
  }
}

class CounterValue extends StatelessWidget {
  const CounterValue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '0',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 128,
          ),
    );
  }
}
