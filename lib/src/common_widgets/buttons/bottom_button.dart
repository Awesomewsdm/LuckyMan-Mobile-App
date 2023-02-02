import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.lightBlue,
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 0.15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              bottomTextLabel,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            const Icon(
              FontAwesomeIcons.arrowRightLong,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

// /         style: ButtonStyle(
      //           shape: MaterialStatePropertyAll(
      //             RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(0.0),
      //             ),
      //           ),
      // //           backgroundColor: const MaterialStatePropertyAll(
      // // // 0xFFFFCA28
      
      // //             Colors.lightBlue,
      // //           ),
      //         ),