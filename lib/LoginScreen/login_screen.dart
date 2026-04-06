import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:saidpure_service/utils/routes.dart';
import 'login_screen_controller.dart';
import 'package:flutter/material.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),

                  // Title
                  Align(
                    child: Text(
                      "Welcome to saidpur service",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Align(
                    child: Text(
                      "Login ",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),

                  // Email
                  CustomTextField(
                    hint: "Email",
                    controller: controller.emailController,
                    validator: controller.validateEmail,
                  ),

                  SizedBox(height: 16.h),

                  // Password
                  Obx(
                    () => CustomTextField(
                      hint: "Password",
                      controller: controller.passwordController,
                      isPassword: controller.isPasswordHidden.value,
                      validator: controller.validatePassword,
                      suffix: IconButton(
                        icon: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          controller.isPasswordHidden.value =
                              !controller.isPasswordHidden.value;
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  // Forgot password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.ForgetPasswordScreen);
                      },
                      child: const Text("Forgot Password?"),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  GestureDetector(
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {
                        // Validation successful
                        Get.toNamed(Routes.homePage); // HomePage এ navigate
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

                  // Login Button
                  // Obx(
                  //   () => SizedBox(
                  //     width: double.infinity,
                  //     height: 50.h,
                  //     child: ElevatedButton(
                  //       onPressed:
                  //           controller.isLoading.value
                  //               ? null
                  //               : controller.login,
                  //       style: ElevatedButton.styleFrom(
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(10.r),
                  //         ),
                  //       ),
                  //       child:
                  //           controller.isLoading.value
                  //               ? const CircularProgressIndicator(
                  //                 color: Colors.white,
                  //               )
                  //               : const Text("Login"),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 20.h),

                  // Signup
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.signupScreen);
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String)? validator;
  final Widget? suffix;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.validator,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: (value) => validator!(value ?? ""),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffix,
      ),
    );
  }
}
