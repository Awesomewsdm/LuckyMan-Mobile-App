import 'package:circles_background/circles_background.dart';
import 'package:flutter/material.dart';

class CirclesBackgroundPage extends StatelessWidget {
  CirclesBackgroundPage({Key? key, this.child}) : super(key: key);
  final Widget? child;

  final List<CircleInfo> circles = [
    CircleInfo(
        size: const Size(600, 1000),
        color: const Color.fromARGB(255, 174, 201, 241),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
        ),
        alignment: Alignment.topRight),
    // CircleInfo(
    //     turns: -40.0,
    //     size: const Size(50, 400),
    //     gradient: LinearGradient(
    //         begin: Alignment.topCenter,
    //         end: Alignment.bottomCenter,
    //         colors: [Colors.blue[800]!, Colors.blue]),
    //     borderRadius: const BorderRadius.only(
    //       bottomLeft: Radius.circular(200),
    //     ),
    //     alignment: Alignment.topCenter),
     CircleInfo(
      turns: 0.1,
      size: const Size(100, 800),
      gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 126, 190, 243),
            Color.fromARGB(255, 118, 183, 236)
          ]),
      borderRadius: const BorderRadius.all(
        Radius.circular(150),
      ),
      alignment: Alignment.topLeft,
    ),
    CircleInfo(
      turns: 0.1,
      size: const Size(100, 800),
      gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 126, 190, 243),
            Color.fromARGB(255, 118, 183, 236)
          ]),
      borderRadius: const BorderRadius.all(
        Radius.circular(150),
      ),
      alignment: Alignment.topLeft,
    ),

    CircleInfo(
      turns: 0.1,
      size: const Size(100, 800),
      gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 126, 190, 243),
            Color.fromARGB(255, 118, 183, 236)
          ]),
      borderRadius: const BorderRadius.all(
        Radius.circular(150),
      ),
      alignment: Alignment.bottomCenter,
    ),
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
      {Key? key, required this.child})
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
