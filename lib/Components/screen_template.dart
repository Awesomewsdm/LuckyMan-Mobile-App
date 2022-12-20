import 'package:angie_notebook/Components/bottom_button.dart';
import 'package:flutter/material.dart';

class ScreenTemplate extends StatelessWidget {
  const ScreenTemplate({
    Key? key,
    required this.child,
    required this.decoration,
    required this.title,
    required this.bottomTextLabel,
    required this.onPressed,
    required this.subTitle,
  }) : super(key: key);
  final Widget child;
  final Decoration decoration;
  final String title;
  final String subTitle;
  final String bottomTextLabel;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // const Color.fromARGB(255, 212, 179, 179),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
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
                            Colors.blueAccent.withOpacity(0.2),
                            BlendMode.dstATop),
                        image: const AssetImage(
                            'assets/images/Intercity-STC-Coaches.jpg'),
                      ),
                    ),
                    width: double.infinity,
                    height: 300.0,
                    child: SafeArea(
                      minimum: const EdgeInsets.only(top: 50.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
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
                ],
              ),
              Center(
                child: Container(
                  height: 560.0,
                  width: 320.0,
                  margin: const EdgeInsets.only(
                    top: 120.0,
                  ),
                  decoration: decoration,
                  child: child,

                  // todo: place booking info here
                ),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                Center(
                  child: BottomButton(
                    bottomTextLabel: bottomTextLabel,
                    onPressed: onPressed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
