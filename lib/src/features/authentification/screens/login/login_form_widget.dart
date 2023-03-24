import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/common_widgets/buttons/progress_state_button.dart';
import 'package:luckyman_app/src/features/core/controllers/bus_booking_controllers.dart';
import 'package:luckyman_app/src/features/core/controllers/buttons_controller.dart';
import 'package:luckyman_app/src/features/authentification/controllers/login_controller.dart';
import 'package:luckyman_app/src/features/core/models/utils/validators.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:regexed_validator/regexed_validator.dart';
import '../../../../constants/input_decoration.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final LoginController loginController = Get.put(LoginController());

  final _formkey = GlobalKey<FormState>();

  final BusBookingController busBookingController =
      Get.put(BusBookingController());

  final ButtonController buttonController = Get.put(ButtonController());

ButtonState stateOnlyCustomIndicatorText = ButtonState.idle;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: tFormHeight - 10,
      ),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty || !validator.email(value.trim())) {
                  return "Please enter a valid email address";
                } else {
                  return null;
                }
              },
              autofillHints: const [AutofillHints.email],
              controller: loginController.email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8.0),
                prefixIcon: Icon(Icons.email_outlined),
                labelText: tEmail,
                hintText: tEmail,
                border: kOutlineInputBorder,
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            Obx(
              () => TextFormField(
                autofillHints: const [AutofillHints.newPassword],
                obscureText: loginController.passwordVisible.value,
                validator: (value) {
                  if (value!.isEmpty || value.isValidPassword) {
                    return "Please enter a valid password";
                  } else {
                    return null;
                  }
                },
                controller: loginController.password,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8.0),
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                    icon: Icon(loginController.passwordVisible.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                    onPressed: () {
                      loginController.passwordVisible.value =
                          !loginController.passwordVisible.value;
                    },
                  ),
                  labelText: tPassword,
                  hintText: tPassword,
                  border: kOutlineInputBorder,
                ),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ProgressStateButton(
                onPressedCustomIndicatorButton: () async {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      stateOnlyCustomIndicatorText = ButtonState.loading;
                    });
                    buttonController.isButtonClicked.value == true;

                    await LoginController.instance
                        .signInUser(
                      loginController.email.text.trim(),
                      loginController.password.text.trim(),
                    )
                        .whenComplete(() {
                      setState(() {
                        stateOnlyCustomIndicatorText = ButtonState.success;
                      });
                    });
                  } else {
                    setState(() {
                      stateOnlyCustomIndicatorText = ButtonState.fail;
                    });
                  }
                },
                stateOnlyCustomIndicatorText: stateOnlyCustomIndicatorText,
              ).buildCustomProgressIndicatorButton(),
              //  BottomButton(
              //   loadingIcon: Obx(() => SizedBox(
              //         child: buttonController.isButtonClicked.value == true
              //             ? const CircularProgressIndicator(color: Color.fromARGB(255, 206, 0, 0))
              //             : const Text(""),
              //       )),
              //   onPressed: () async {
              //     if (_formkey.currentState!.validate()) {
              //       buttonController.isButtonClicked.value == true;

              //       await LoginController.instance
              //           .signInUser(
              //         loginController.email.text.trim(),
              //         loginController.password.text.trim(),
              //       )
              //           .whenComplete(() {
              //       buttonController.isButtonClicked.value == false;
                      
              //       });
              //     }
              //   },
              //   bottomTextLabel: tLogin.toUpperCase(),
              //   height: size.width * 0.1,
              // ),
            )
          ],
        ),
      ),
    );
  }
}



// bool isAnimating = true;

// //enum to declare 3 state of button
// enum ButtonState { init, submitting, completed }

// class ButtonStates extends StatefulWidget {
//   const ButtonStates({Key? key}) : super(key: key);

//   @override
//   _ButtonStatesState createState() => _ButtonStatesState();
// }

// class _ButtonStatesState extends State<ButtonStates> {
//   ButtonState state = ButtonState.init;

//   @override
//   Widget build(BuildContext context) {
//     final buttonWidth = MediaQuery.of(context).size.width;

//     // update the UI depending on below variable values
//     final isInit = isAnimating || state == ButtonState.init;
//     final isDone = state == ButtonState.completed;

//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(40),
//         child: AnimatedContainer(
//             duration: Duration(milliseconds: 300),
//             onEnd: () => setState(() {
//                   isAnimating = !isAnimating;
//                 }),
//             width: state == ButtonState.init ? buttonWidth : 70,
//             height: 60,
//             // If Button State is Submiting or Completed  show 'buttonCircular' widget as below
//             child: isInit ? buildButton() : circularContainer(isDone)),
//       ),
//     );
//   }

//   // If Button State is init : show Normal submit button
//   Widget buildButton() => ElevatedButton(
//         style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
//         onPressed: () async {
//           // here when button is pressed
//           // we are changing the state
//           // therefore depending on state our button UI changed.
//           setState(() {
//             state = ButtonState.submitting;
//           });

//           //await 2 sec // you need to implement your server response here.
//           await Future.delayed(Duration(seconds: 2));
//           setState(() {
//             state = ButtonState.completed;
//           });
//           await Future.delayed(Duration(seconds: 2));
//           setState(() {
//             state = ButtonState.init;
//           });
//         },
//         child: const Text('SUBMIT'),
//       );

//   // this is custom Widget to show rounded container
//   // here is state is submitting, we are showing loading indicator on container then.
//   // if it completed then showing a Icon.

//   Widget circularContainer(bool done) {
//     final color = done ? Colors.green : Colors.blue;
//     return Container(
//       decoration: BoxDecoration(shape: BoxShape.circle, color: color),
//       child: Center(
//         child: done
//             ? const Icon(Icons.done, size: 50, color: Colors.white)
//             : const CircularProgressIndicator(
//                 color: Colors.white,
//               ),
//       ),
//     );
//   }
// }