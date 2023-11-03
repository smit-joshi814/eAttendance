import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String? id;
  final String name;
  final String email;
  final String password;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  toJson() {
    return {
      "Name": name,
      "email": email,
      "password": password,
    };
  }

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
        id: data?["Document ID"],
        name: data?['name'],
        email: data?['email'],
        password: data?['password']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "email": email,
      "country": password,
      if (id != null) "id": id,
    };
  }
}
