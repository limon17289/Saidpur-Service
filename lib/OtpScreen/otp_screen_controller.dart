import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreenController extends GetxController {
  final otpControllers = List.generate(4, (index) => TextEditingController());
  final focusNodes = List.generate(4, (index) => FocusNode());

  void onOtpChange(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        focusNodes[index + 1].requestFocus();
      }
    } else {
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    }
  }

  String getOtp() {
    return otpControllers.map((e) => e.text).join();
  }

  void verifyOtp() {
    String otp = getOtp();

    if (otp.length < 4) {
      Get.snackbar("Error", "Enter complete OTP");
    } else {
      Get.snackbar("Success", "OTP Verified");
    }
  }
}