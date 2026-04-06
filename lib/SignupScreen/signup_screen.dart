import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:saidpure_service/SignupScreen/signup_screen_controller.dart';
import 'package:saidpure_service/utils/routes.dart';

class SignupScreen extends GetView<SignupScreenController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),

                /// TITLE
                Align(
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 5.h),

                Align(
                  child: Text(
                    "Signup",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 30.h),

                /// NAME
                CustomField(
                  hint: "Full Name",
                  icon: Icons.person,
                  controller: controller.nameController,
                  validator: controller.validateName,
                ),

                SizedBox(height: 16.h),

                /// EMAIL
                CustomField(
                  hint: "Email",
                  icon: Icons.email,
                  controller: controller.emailController,
                  validator: controller.validateEmail,
                ),

                SizedBox(height: 16.h),

                /// PASSWORD
                Obx(
                  () => CustomField(
                    hint: "Password",
                    icon: Icons.lock,
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

                SizedBox(height: 16.h),

                /// CONFIRM PASSWORD
                Obx(
                  () => CustomField(
                    hint: "Confirm Password",
                    icon: Icons.lock_outline,
                    controller: controller.confirmPasswordController,
                    isPassword: controller.isConfirmPasswordHidden.value,
                    validator: controller.validateConfirmPassword,
                    suffix: IconButton(
                      icon: Icon(
                        controller.isConfirmPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        controller.isConfirmPasswordHidden.value =
                            !controller.isConfirmPasswordHidden.value;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 25.h),

                /// BUTTON
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed:
                          controller.isLoading.value ? null : controller.signup,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child:
                          controller.isLoading.value
                              ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                              : Text(
                                "Sign Up",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                /// LOGIN
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have account? "),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.loginScreen),
                      child: const Text(
                        "Login",
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
    );
  }
}

class CustomField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String)? validator;
  final Widget? suffix;

  const CustomField({
    super.key,
    required this.hint,
    required this.icon,
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
      validator: (value) => validator?.call(value ?? ""),
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.black),
        ),
        suffixIcon: suffix,
      ),
    );
  }
}
