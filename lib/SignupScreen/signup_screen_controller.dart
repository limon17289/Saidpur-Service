import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;
  var isLoading = false.obs;

  /// VALIDATION
  String? validateName(String value) {
    if (value.isEmpty) return "Name is required";
    if (value.length < 3) return "Enter valid name";
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) return "Email is required";
    if (!GetUtils.isEmail(value)) return "Invalid email";
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) return "Password required";
    if (value.length < 6) return "Minimum 6 characters";
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value != passwordController.text) {
      return "Password not match";
    }
    return null;
  }

  /// SIGNUP
  void signup() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2)); // fake API

    isLoading.value = false;

    Get.snackbar("Success", "Account created 🎉");
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}