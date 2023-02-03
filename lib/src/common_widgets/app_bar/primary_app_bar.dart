
  import 'package:flutter/material.dart';
import 'package:luckyman_app/src/constants/text.dart';

AppBar getPrimaryAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.blue),
      elevation: 20.0,
      backgroundColor: Colors.white,
      toolbarHeight: 60,
      centerTitle: true,
      toolbarOpacity: 0.7,
      bottomOpacity: 0.8,
      shadowColor: Colors.white10,
      title: const Text(tSeatSelectionScreenTitle,
          style: TextStyle(color: Colors.blue)),
    );
  }
