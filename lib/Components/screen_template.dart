import 'package:flutter/material.dart';

class ScreenTemplate extends StatelessWidget {
  const ScreenTemplate({
    Key? key,
    required this.child,
    required this.decoration,
    required this.title,
    required this.bottomTextLabel,
    required this.subTitle,
  }) : super(key: key);
  final Widget child;
  final Decoration decoration;
  final String title;
  final String subTitle;
  final String bottomTextLabel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: const Color(0xFF10A2E0),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(34.0),
            bottomRight: Radius.circular(34.0),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.blueAccent.withOpacity(0.2), BlendMode.dstATop),
            image: const AssetImage('assets/images/Intercity-STC-Coaches.jpg'),
          ),
        ),
        width: double.infinity,
        height: size.height * 0.4,
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  const BackButton(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      Center(
        child: Container(
          height: size.height * 0.8,
          width: size.width * 0.85,
          margin: EdgeInsets.only(
            top: size.height * 0.09,
          ),
          decoration: decoration,
          child: child,
          // todo: place booking info here
        ),
      ),
    ]);
  }
}
