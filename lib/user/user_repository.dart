import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_attendance/models/user_model.dart';
import 'package:e_attendance/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    try {
      await _db
          .collection("Users")
          .doc(user.id)
          .set(user.toJson())
          .whenComplete(() {
        showSnackkBar(
          message: "Success",
          title: 'Your Account Has Been Created',
          icon: const Icon(Icons.done_all),
        );
      });
    } catch (e) {
      showSnackkBar(
          message: 'Error',
          title: 'Something Went Wrong, Try Again',
          icon: const Icon(Icons.error));
    }
  }
}
