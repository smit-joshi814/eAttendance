import 'package:e_attendance/exceptions/auth/auth_exceptions.dart';
import 'package:e_attendance/models/faculty_model.dart';
import 'package:e_attendance/screens/authentication/login.dart';
import 'package:e_attendance/utility/constants.dart';
import 'package:e_attendance/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/screen_navigator.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  late Rx<Faculty?> faculty = Rx<Faculty?>(null);
  late SharedPreferences prefs;

  // final _auth = FirebaseAuth.instance;
  // late final Rx<User?> firebaseUser;

  @override
  void onReady() async {
    prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    if (isLoggedIn) {
      faculty.value = Faculty.fromJson(prefs.getString("faculty") ??
          Faculty(
                  facultyId: 0,
                  facultyEnrollment: 'facultyEnrollment',
                  facultyEmail: 'facultyEmail',
                  facultyName: 'facultyName',
                  facultyPassword: 'facultyPassword')
              .toJson());
    }
    // firebaseUser = Rx<User?>(_auth.currentUser);
    //firebaseUser.bindStream(_auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);

    // ever(faculty, _setInitialScreen);
    _setInitialScreen(faculty);
  }

  _setInitialScreen(Rx<Faculty?> user) {
    user.value == null
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const ScreenNavigator());
  }

  // Future<User?> createUserWithNameEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);

  //     if (firebaseUser.value != null) {
  //       Get.offAll(() => const ScreenNavigator());
  //     }
  //     return firebaseUser.value;
  //   } on FirebaseAuthException catch (e) {
  //     final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
  //     showSnackkBar(
  //       message: ex.message,
  //       title: 'Try Again',
  //       icon: const Icon(Icons.error),
  //     );
  //     // print('FIREBASE AUTH EXCEPTION - ${ex.message}');
  //     throw ex;
  //   } catch (_) {
  //     final ex = SignUpWithEmailAndPasswordFailure();
  //     showSnackkBar(
  //       message: ex.message,
  //       title: 'Try Again',
  //       icon: const Icon(Icons.error),
  //     );
  //     // print('EXCEPTION - ${ex.message}');
  //     throw ex;
  //   }
  // }

  Future<void> loginUserWithNameEmailAndPassword(
      String email, String password) async {
    try {
      final response =
          await http.get(Uri.parse("$apiUrl/faculty/auth/$email/$password"));

      if (response.statusCode == 200) {
        faculty = Rx<Faculty?>(Faculty.fromJson(response.body));

        await prefs.setBool("isLoggedIn", true);
        await prefs.setString("faculty", faculty.value!.toJson());
      }
      if (response.statusCode == 404) {
        throw SignUpWithEmailAndPasswordFailure.code("404");
      }
      // await _auth.signInWithEmailAndPassword(email: email, password: password);

      // Get.put(faculty);
      faculty.value != null
          ? Get.offAll(() => const ScreenNavigator())
          : Get.offAll(() => const LoginScreen());
    } catch (_) {
      final ex = SignUpWithEmailAndPasswordFailure();
      showSnackkBar(
        message: ex.message,
        title: 'Try Again',
        icon: const Icon(Icons.error),
      );

      // print('EXCEPTION - ${ex.message}');
    }
  }

  Future<void> resetPassword(email) async {
    // await _auth.sendPasswordResetEmail(email: email);
    Get.offAll(() => const LoginScreen());
    showSnackkBar(
      message: 'Password Reset Mail Send SuccessFully',
      title: 'Check Your Mail',
      icon: const Icon(Icons.done),
    );
  }

  Future<void> logOut() async {
    prefs.clear();
    Get.offAll(() => const LoginScreen());
  }
}
