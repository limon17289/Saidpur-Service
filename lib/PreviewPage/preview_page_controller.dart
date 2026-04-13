import 'dart:async';

import 'package:get/get.dart';

class PreviewPageController extends GetxController {
   /// 🔹 Data
  var serviceName = "".obs;
  var location = "".obs;

  /// 🔹 Booking State
  var isConfirmed = false.obs;

  /// 🔹 Timer
  var remainingSeconds = 0.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();

    var data = Get.arguments ?? {};

    serviceName.value = data["provider"]?["name"] ?? "Service";
    location.value = data["location"] ?? "No location";
  }

  /// 🔹 Confirm Booking
  void confirmBooking() {
    isConfirmed.value = true;
    startTimer();

    Get.snackbar("Success", "Booking Confirmed");
  }

  /// 🔹 Timer Start (30 min)
  void startTimer() {
    remainingSeconds.value = 1800;

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remainingSeconds.value == 0) {
        t.cancel();
      } else {
        remainingSeconds.value--;
      }
    });
  }

  /// 🔹 Format Time
  String formatTime() {
    int min = remainingSeconds.value ~/ 60;
    int sec = remainingSeconds.value % 60;
    return "$min:${sec.toString().padLeft(2, '0')}";
  }

  /// 🔹 Cancel
  void cancelBooking() {
    Get.back();
  }

  /// 🔹 Go Home
  void goHome() {
    Get.offAllNamed("/home"); // route change if needed
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}