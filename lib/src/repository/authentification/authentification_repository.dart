import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/common_widgets/bottom_nav/bottom_nav.dart';
import 'package:luckyman_app/src/features/core/models/Routes_model/routes2.dart';
import 'package:qlevar_router/qlevar_router.dart';
import '../exceptions/sign_up_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

// Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  // _setInitialScreen(User? user) {
  //   user == null
  //       ? Get.offAll(() => const SignUpScreen())
  //       : Get.offAll(() => const Home());
  // }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      Get.snackbar('SORRY', ex.message);
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();

      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('SUCCESS', 'You,ve been successfully logged in');
      QR.toName(Routes.homePage);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Sorry', 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Sorry', 'You provided a wrong password.');
      }
    }
  }

  Future<void> resetUserPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async => await _auth.signOut();
}
