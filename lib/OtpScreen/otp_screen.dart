import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:saidpure_service/OtpScreen/otp_screen_controller.dart';

class OtpScreen extends GetView<OtpScreenController> {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Verify OTP", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Text(
              "Enter the 4-digit code sent to your number",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            /// OTP BOXES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 40.h,
                  child: TextField(
                    controller: controller.otpControllers[index],
                    focusNode: controller.focusNodes[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,

                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    onChanged: (value) => controller.onOtpChange(value, index),
                  ),
                );
              }),
            ),

            SizedBox(height: 30.h),

            /// VERIFY BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: controller.verifyOtp,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Verify"),
              ),
            ),
            SizedBox(height: 20.h),

            /// RESEND
            Center(
              child: TextButton(
                onPressed: () {
                  Get.snackbar("OTP", "OTP Resent");
                },
                child: const Text("Resend OTP"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
