// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_attendance/controllers/login_controller.dart';

import '../../../utility/constants.dart';
import '../forgot_password.dart';

class LoginForm extends StatelessWidget {
  final AnimationController animationController;
  final Animation<double> animation;
  const LoginForm({
    Key? key,
    required this.animationController,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            appLogo,
            height: animationController.value * 125,
            width: animationController.value * 125,
          ),
          const SizedBox(height: 20),
          const Text(
            appName,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: controller.password,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // OutlinedButton(
                //   child: const Text('Sign Up'),
                //   onPressed: () async {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const RegisterScreen()));
                //   },
                // ),
                FilledButton(
                  child: const Text('LogIn'),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      LoginController.instance.loginUser(
                          controller.email.text.trim(),
                          controller.password.text.trim());
                    }
                  },
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen()));
            },
            child: const Text(
              'Forgot password?',
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
