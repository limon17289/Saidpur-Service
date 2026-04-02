import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:saidpure_service/utils/routes.dart';

class LunchScreen extends GetView {
  const LunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              /// APP TITLE
              Text(
                "Welcome to Saidpur Service",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                "Login or Signup to continue",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade600),
              ),

              SizedBox(height: 40.h),

              /// EMAIL LOGIN BUTTON
              ModernLoginButton(
                text: "Login with Email",
                icon: Icons.email,
                gradient: const LinearGradient(
                  colors: [Colors.black, Colors.black87],
                ),
                onTap: () {
                  Get.toNamed(Routes.loginScreen);
                },
              ),

              SizedBox(height: 20.h),

              /// OR SEPARATOR
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.grey.shade300, thickness: 1),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.grey.shade300, thickness: 1),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              /// GOOGLE LOGIN BUTTON
              ModernLoginButton(
                text: "Login with Google",
                icon: Icons.g_mobiledata,
                gradient: const LinearGradient(
                  colors: [Colors.red, Colors.redAccent],
                ),
                onTap: () {
                  Get.snackbar("Google Login", "Clicked Google Login");
                },
              ),
              SizedBox(height: 16.h),

              /// APPLE LOGIN BUTTON
              ModernLoginButton(
                text: "Login with Apple",
                icon: Icons.apple,
                gradient: const LinearGradient(
                  colors: [Colors.black, Colors.grey],
                ),
                onTap: () {
                  Get.snackbar("Apple Login", "Clicked Apple Login");
                },
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.signupScreen);
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}

/// ================= Modern Login Button =================

class ModernLoginButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final LinearGradient gradient;
  final VoidCallback onTap;

  const ModernLoginButton({
    super.key,
    required this.text,
    required this.icon,
    required this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 12.w),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
