import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../exceptions/sign_up_exceptions.dart';
import 'package:luckyman_app/src/common_widgets/bottom_nav/bottom_nav.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

// Variables
  final auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
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
      await auth.createUserWithEmailAndPassword(
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
      // QR.toName(Routes.homePage);

      Get.to(() => const Home());
      // QR.toName(Routes.homePage);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Sorry', 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Sorry', 'You provided a wrong password.');
      }
    }
  }

  Future<void> resetUserPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async => await auth.signOut();
}
