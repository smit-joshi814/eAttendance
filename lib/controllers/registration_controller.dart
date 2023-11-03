import 'package:e_attendance/auth/auth_repository.dart';
import 'package:e_attendance/models/user_model.dart';
import 'package:e_attendance/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  static RegistrationController get instance => Get.find();

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<User?> registerUser(String email, String password) async {
    return await AuthenticationRepository.instance
        .createUserWithNameEmailAndPassword(email, password);
  }

  Future<void> createUser(UserModel user) async {
    User? userCredential = await registerUser(user.email, user.password);

    user.id = userCredential!.uid;
    userRepo.createUser(user);
  }
}
