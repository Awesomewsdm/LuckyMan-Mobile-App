import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    super.key,
    required this.contentLabel,
    required this.title, this.onpressed,
  });
  final String contentLabel;
  final String title;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(contentLabel),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text("No"),
        ),
        ElevatedButton(
          onPressed: onpressed,
          child: const Text("Yes"),
        )
      ],
    );
  }
}

class AlertDialogFb1 extends StatelessWidget {
  final String title;
  final String description;

  final List<TextButton> actions;

  const AlertDialogFb1({required this.title, required this.description, required this.actions, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content:
          Text(description),
      actions: actions,
    );
  }
}