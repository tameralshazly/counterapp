// ignore_for_file: unused_field, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

import 'package:counterapp/core/themes/app_theme.dart';

class PlayCircleAnimation extends StatefulWidget {
  const PlayCircleAnimation({Key? key}) : super(key: key);

  @override
  _PlayCircleAnimationState createState() => _PlayCircleAnimationState();
}

class _PlayCircleAnimationState extends State<PlayCircleAnimation> {
  Artboard? _riveArtboard;
  StateMachineController? _controller;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/rive/circle.flr').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      var controller = StateMachineController.fromArtboard(artboard, "Alarm");
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
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Positioned(
            child: SizedBox(
              width: screenSize.width,
              height: screenSize.height,
              child: _riveArtboard == null
                  ? const CircularProgressIndicator()
                  : Rive(artboard: _riveArtboard!, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}

class FlareCircleBackground extends StatelessWidget {
  const FlareCircleBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background.withOpacity(0.3),
        backgroundBlendMode: BlendMode.srcOver,
      ),
      child: const PlayCircleAnimation(),
    );
  }
}
