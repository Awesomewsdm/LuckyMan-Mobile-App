import 'package:get/get.dart';
import 'package:luckyman_app/src/features/authentification/models/user_model.dart';
import 'package:luckyman_app/src/repository/authentification/authentification_repository.dart';
import 'package:luckyman_app/src/repository/authentification/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  Future<List<UserModel>> getAllUsersData() async {
    return await _userRepo.allUser();
  }

  getUserData() {
    var email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar('Error', 'Login to continue');
    }
  }
}
