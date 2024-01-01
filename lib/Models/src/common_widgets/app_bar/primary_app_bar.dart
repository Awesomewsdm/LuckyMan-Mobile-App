import 'package:flutter/material.dart';

class PrimaryAppBar {
  PrimaryAppBar({
    required this.title,
    this.onPressed,
  });

  final String title;
  final void Function()? onPressed;
  AppBar getPrimaryAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.blue),
      elevation: 50.0,
      backgroundColor: Colors.white,
      toolbarHeight: 60,
      centerTitle: true,
      toolbarOpacity: 0.7,
      bottomOpacity: 0.2,
      shadowColor: Colors.white10,
      title: Text(
        title,
        style: const TextStyle(color: Colors.blue),
      ),
      leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }
}
