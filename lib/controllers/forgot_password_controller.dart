import 'package:e_attendance/repositories/auth/auth_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();
  final email = TextEditingController();

  void resetPassword(email) {
    AuthenticationRepository.instance.resetPassword(email);
  }
}
