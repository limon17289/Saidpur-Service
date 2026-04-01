import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  var isLoading = false.obs;
  var isPasswordHidden = true.obs;

  String? validateEmail(String value) {
    if (value.isEmpty) return "Email required";
    if (!GetUtils.isEmail(value)) return "Enter valid email";
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) return "Password required";
    if (value.length < 6) return "Minimum 6 characters";
    return null;
  }

  void login() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    Get.snackbar("Success", "Login Successful");
  }
}
