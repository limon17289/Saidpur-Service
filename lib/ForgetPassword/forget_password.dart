import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:saidpure_service/ForgetPassword/forget_password_controller.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),

              // 🔙 Back (GetX use)
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
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Text(
                "Enter your email to reset password",
                style: TextStyle(color: Colors.grey.shade600),
              ),

              SizedBox(height: 30.h),

              // 📧 Input
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Email address",
                    prefixIcon: Icon(Icons.email_outlined),
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              // 🚀 Button
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    // 👉 Future: Controller call
                    Get.snackbar("Info", "Button Clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4A6CF7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    "Send Reset Link",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

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
    );
  }
}
