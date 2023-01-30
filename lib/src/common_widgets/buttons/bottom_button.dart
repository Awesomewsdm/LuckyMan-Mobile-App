import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.onPressed,
    required this.bottomTextLabel,
  }) : super(key: key);

  final void Function() onPressed;
  final String bottomTextLabel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.12,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
//           backgroundColor: const MaterialStatePropertyAll(
// // 0xFFFFCA28

//             Colors.lightBlue,
//           ),
        ),
        child: Text(
          bottomTextLabel,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
