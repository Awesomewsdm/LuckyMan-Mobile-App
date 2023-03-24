import 'package:flutter/material.dart';
import 'package:progress_state_button/progress_button.dart';

class ProgressStateButton {
final Function? onPressedCustomIndicatorButton;
   
final ButtonState? stateOnlyCustomIndicatorText;
  ProgressStateButton( {this.stateOnlyCustomIndicatorText, this.onPressedCustomIndicatorButton});



  Widget buildCustomProgressIndicatorButton() {
    var progressTextButton = ProgressButton(
      stateWidgets: const {
        ButtonState.idle: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        ButtonState.loading: Text(
          "Loading",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        ButtonState.fail: Text(
          "Fail",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        ButtonState.success: Text(
          "Success",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        )
      },
      progressIndicator: const CircularProgressIndicator(
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation(Colors.red),
        strokeWidth: 1,
      ),
      stateColors: {
        ButtonState.idle: Colors.grey.shade400,
        ButtonState.loading: Colors.blue.shade300,
        ButtonState.fail: Colors.red.shade300,
        ButtonState.success: Colors.green.shade400,
      },
      onPressed: onPressedCustomIndicatorButton,
      state: stateOnlyCustomIndicatorText,
      padding: const EdgeInsets.all(8.0),
    );
    return progressTextButton;
  }
 
  }

