import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saidpure_service/SignupScreen/signup_screen_controller.dart';

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
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                /// TITLE
                Align(
                  child: const Text(
                    "Create Account",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 5),

                Align(
                  child: Text(
                    "Signup",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 30),

                /// NAME
                CustomField(
                  hint: "Full Name",
                  icon: Icons.person,
                  controller: controller.nameController,
                  validator: controller.validateName,
                ),

                const SizedBox(height: 16),

                /// EMAIL
                CustomField(
                  hint: "Email",
                  icon: Icons.email,
                  controller: controller.emailController,
                  validator: controller.validateEmail,
                ),

                const SizedBox(height: 16),

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

                const SizedBox(height: 16),

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

                const SizedBox(height: 25),

                /// BUTTON
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed:
                          controller.isLoading.value ? null : controller.signup,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child:
                          controller.isLoading.value
                              ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                              : const Text(
                                "Sign Up",
                                style: TextStyle(fontSize: 16),
                              ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// LOGIN
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have account? "),
                    GestureDetector(
                      onTap: () => Get.back(),
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
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.black),
        ),
        suffixIcon: suffix,
      ),
    );
  }
}
