import 'package:flutter/material.dart';

Widget ticketDetailsWidget(String firstTitle, Widget firstDesc,
    String secondTitle, Widget secondDesc, ) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: firstDesc,
            )
          ],
        ),
      ),
    
    ],
  );
}
