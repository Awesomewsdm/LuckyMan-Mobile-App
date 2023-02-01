import 'package:get/get.dart';
import 'package:luckyman_app/src/repository/authentification/authentification_repository.dart';
import 'package:luckyman_app/src/repository/authentification/user_repository.dart';

class TicketController extends GetxController {
  static TicketController get instance => Get.find();

  final _authRepo = Get.put(
    AuthenticationRepository(),
  );
  final _userRepo = Get.put(
    UserRepository(),
  );



  getUserData() {
    var email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar('Error', 'Login to continue');
    }
  }
}