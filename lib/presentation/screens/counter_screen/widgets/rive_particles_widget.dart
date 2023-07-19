// ignore_for_file: unused_field, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';

import 'package:counterapp/core/themes/app_theme.dart';

class PlayOneShotAnimation extends StatefulWidget {
  const PlayOneShotAnimation({Key? key}) : super(key: key);

  @override
  _PlayOneShotAnimationState createState() => _PlayOneShotAnimationState();
}

class _PlayOneShotAnimationState extends State<PlayOneShotAnimation> {
  Artboard? _riveArtboard;
  StateMachineController? _controller;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/rive/693-1350-bubbles-floating.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      var controller =
          StateMachineController.fromArtboard(artboard, "Animation 1");
      if (controller != null) {
        artboard.addController(controller);
      }

      // artboard.forEachComponent((child) {
      //   if (child is Shape) {
      //     final Shape shape = child;
      //     child.fills.first.paint.color = Theme.of(context).particlesColor;
      //     if (shape.name == 'Elipse') {
      //       shape.fills.first.paint.color = Theme.of(context).particlesColor;
      //     }
      //   }
      // });

      artboard.forEachComponent((child) => child is Shape
          ? child.fills.first.paint.color = Theme.of(context).particlesColor
          : null);

      setState(() {
        _riveArtboard = artboard;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: 100.0.w,
            height: 100.0.h,
            child: _riveArtboard == null
                ? const CircularProgressIndicator()
                : Rive(artboard: _riveArtboard!),
          ),
        ],
      ),
    );
  }
}

class RiveParticlesBackground extends StatelessWidget {
  const RiveParticlesBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background.withOpacity(0.3),
        backgroundBlendMode: BlendMode.srcOver,
      ),
      child: const PlayOneShotAnimation(),
    );
  }
}
