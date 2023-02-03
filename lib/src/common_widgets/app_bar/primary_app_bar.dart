
  import 'package:flutter/material.dart';

AppBar getPrimaryAppBar(String title) {
    
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.blue),
      elevation: 20.0,
      backgroundColor: Colors.white,
      toolbarHeight: 60,
      centerTitle: true,
      toolbarOpacity: 0.7,
      bottomOpacity: 0.8,
      shadowColor: Colors.white10,
      title:  Text(title,
          style: const TextStyle(color: Colors.blue)),
    );
  }