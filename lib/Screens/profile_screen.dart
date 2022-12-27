import 'package:angie_notebook/Components/widgets.dart';
import 'package:angie_notebook/Constants/constants.dart';
import 'package:angie_notebook/src/constants/image_strings.dart';
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
                  Container(
                    width: 100.0,
                    height: 100.0,
                    padding: const EdgeInsets.all(20.0),
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                          image: AssetImage(manWithGuitar), fit: BoxFit.fill),
                      border: Border.all(
                        width: 3,
                        color: Colors.grey.shade800,
                      ),
                    ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Card(
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(
                                      Icons.credit_card,
                                      color: Colors.lightBlue[500],
                                    ),
                                    title: const Text('Student ID: 20768928'),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.email,
                                      color: Colors.lightBlue[500],
                                    ),
                                    title: const Text(
                                        'E-mail: awesomewsdm@gmail.com'),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.phone_outlined,
                                      color: Colors.lightBlue[500],
                                    ),
                                    title:
                                        const Text('Mobile Number: 0206447220'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
