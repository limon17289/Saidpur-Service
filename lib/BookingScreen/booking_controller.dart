import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  var selectedLocation = "".obs;
  var serviceProvider;

  TextEditingController locationController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    serviceProvider = Get.arguments;
  }

  void setLocation() {
    String location = "Current Location (GPS)";
    selectedLocation.value = location;
    locationController.text = location; // 🔥 sync TextField
  }

  void pickFromMap() {
    String location = "Picked from Map";
    selectedLocation.value = location;
    locationController.text = location; // 🔥 sync TextField
  }

  void bookService() {
    Get.snackbar("Success", "Service Booked Successfully!");
  }
}