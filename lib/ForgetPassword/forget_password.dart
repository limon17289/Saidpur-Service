// forget_password_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:saidpure_service/utils/routes.dart';
import 'forget_password_controller.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),

                // 🔙 Back Button
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),

                SizedBox(height: 30.h),

                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Enter your email to reset password",
                  style: TextStyle(color: Colors.grey.shade600),
                ),

                SizedBox(height: 30.h),

                // 📧 Email Input
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!GetUtils.isEmail(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Email address",
                      prefixIcon: Icon(Icons.email_outlined),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(height: 30.h),

                GestureDetector(
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                      // Validation successful
                      Get.toNamed(Routes.otpScreen); // HomePage এ navigate
                    }
                  },
                  child: Container(
                    height: 45.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Align(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                // // 🚀 Send Button
                // Obx(() => SizedBox(
                //       width: double.infinity,
                //       height: 50.h,
                //       child: ElevatedButton(
                //         onPressed: controller.isLoading.value
                //             ? null
                //             : controller.sendResetLink,
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: const Color(0xff4A6CF7),
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10.r),
                //           ),
                //         ),
                //         child: controller.isLoading.value
                //             ? const CircularProgressIndicator(color: Colors.white)
                //             : const Text(
                //                 "Send Reset Link",
                //                 style: TextStyle(
                //                     color: Colors.white, fontWeight: FontWeight.bold),
                //               ),
                //       ),
                //     )),
                SizedBox(height: 20.h),

                Center(
                  child: TextButton(
                    onPressed: () => Get.back(),
                    child: const Text("Back to Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
