
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/features/core/models/Routes_model/routes2.dart';
import 'package:luckyman_app/src/repository/authentification/authentification_repository.dart';

class RouteGuard extends GetMiddleware {
  @override
 RouteSettings? redirect(String? route) {
  final authService = Get.find<AuthenticationRepository>();
  return authService.auth.currentUser != null  ? null :  RouteSettings(name: Routes.loginPage);
}
}
