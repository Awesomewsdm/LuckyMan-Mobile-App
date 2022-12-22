import 'package:circles_background/circles_background.dart';
import 'package:flutter/material.dart';

class CirclesBackgroundPage extends StatelessWidget {
  CirclesBackgroundPage({Key? key, this.child}) : super(key: key);
  final Widget? child;

  final List<CircleInfo> circles = [
    CircleInfo(
        size: const Size(300, 500),
        color: Colors.blue,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(200),
        ),
        alignment: Alignment.topRight),
    CircleInfo(
        size: const Size(300, 900),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[800]!, Colors.blue]),
        borderRadius: const BorderRadius.only(),
        alignment: Alignment.topLeft),
    CircleInfo(
        size: const Size(200, 500),
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.blue]),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50), topLeft: Radius.circular(150)),
        alignment: Alignment.bottomRight),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CirclesBackground(
        circles: circles,
        child: child,
      ),
    );
  }
}

class ThreeCirclesBackgroundPage extends StatelessWidget {
  final GradientColor gradientColor;
  final Widget child;
  const ThreeCirclesBackgroundPage(this.gradientColor,
      {Key? key,  required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThreeCirclesBackground(
        gradientColor: gradientColor,
        customColors: getCustomColors(),
        sizeOfScreen: MediaQuery.of(context).size,
        child: child,
      ),
    );
  }

  List<List<Color>>? getCustomColors() {
    if (gradientColor == GradientColor.custom) {
      return [
        [Colors.pink[700]!, Colors.pink[900]!],
        [Colors.pink[700]!, Colors.pink[900]!],
        [Colors.pink[700]!, Colors.pink[900]!],
      ];
    }
    return null;
  }
}
