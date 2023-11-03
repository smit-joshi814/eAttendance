import 'package:e_attendance/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  void loginUser(String email, String password) {
    AuthenticationRepository.instance
        .loginUserWithNameEmailAndPassword(email, password);
  }
}
