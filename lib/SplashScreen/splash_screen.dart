import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saidpure_service/SplashScreen/splash_screen_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // একটি সুন্দর ডার্ক গ্রেডিয়েন্ট ব্যাকগ্রাউন্ড ব্যবহার করা হয়েছে
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A1A), // Dark Grey
              Color(0xFF000000), // Pure Black
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: FadeTransition(
                opacity: controller.opacity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // লোগো সেকশন: একটি হালকা শ্যাডো বা গ্লো এফেক্ট দেওয়া হয়েছে
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.05),
                      ),
                      child: const Icon(
                        Icons.home_repair_service_rounded,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 25),
                    // অ্যাপের নাম: মডার্ন ফন্ট স্টাইল এবং লেটার স্পেসিং
                    const Text(
                      "SAIDPUR SERVICE",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2.5,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // একটি ছোট ট্যাগলাইন যোগ করা হয়েছে প্রফেশনাল লুকের জন্য
                    Text(
                      "Your Trusted Solutions Partner",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.6),
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // স্ক্রিনের নিচের দিকে একটি প্রিমিয়াম লোডিং ইন্ডিকেটর
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}