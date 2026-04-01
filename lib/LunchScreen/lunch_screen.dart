import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              /// APP TITLE
              const Text(
                "Welcome to Saidpur Service",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Login or Signup to continue",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),

              const SizedBox(height: 40),

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

              const SizedBox(height: 20),

              /// OR SEPARATOR
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.grey.shade300, thickness: 1),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
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

              const SizedBox(height: 20),

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
              const SizedBox(height: 16),

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
              SizedBox(height: 30),
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
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
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
        height: 55,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16),
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
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
