import 'package:angie_notebook/Components/widgets.dart';
import 'package:angie_notebook/Constants/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String id = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CirclesBackgroundPage(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/man-with-guiter.jpg'),
                  ),
                  const Text(
                    'Awesome Wisdom',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      decoration: kHomeBackgroundBoxDecoration,
                      child: Column(
                        children: const [
                          Text('data'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
