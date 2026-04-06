// forget_password_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  void sendResetLink() {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.snackbar(
        'Success',
        'Password reset link sent!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}

