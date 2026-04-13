import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saidpure_service/utils/routes.dart';

class BookingController extends GetxController {


  var serviceProvider = {
    "name": "AC Repair Service",
  };

  /// 🔹 Location
  TextEditingController locationController = TextEditingController();
  RxString selectedLocation = "".obs;

  /// 🔹 Set Current Location (dummy)
  void setLocation() {
    selectedLocation.value = "Current Location Selected";
    locationController.text = selectedLocation.value;
  }

  /// 🔹 Pick from Map (dummy)
  void pickFromMap() {
    selectedLocation.value = "Map Location Selected";
    locationController.text = selectedLocation.value;
  }

  /// 🔹 Save + Navigate
  void saveBookingDetails() {
    if (selectedLocation.value.isEmpty) {
      Get.snackbar("Error", "Please select location");
      return;
    }

    /// 👉 Data Save (you can send API here)
    print("Saved Location: ${selectedLocation.value}");

    /// 👉 Navigate with data
    Get.toNamed(
      Routes.previewPage,
      arguments: {
        "location": selectedLocation.value,
        "provider": serviceProvider,
      },
    );
  }








//   var selectedLocation = "".obs;
//   var serviceProvider;

//   TextEditingController locationController = TextEditingController();

//   @override
//   void onInit() {
//     super.onInit();
//     serviceProvider = Get.arguments;
//   }

//   void setLocation() {
//     String location = "Current Location (GPS)";
//     selectedLocation.value = location;
//     locationController.text = location; // 🔥 sync TextField
//   }

//   void pickFromMap() {
//     String location = "Picked from Map";
//     selectedLocation.value = location;
//     locationController.text = location; // 🔥 sync TextField
//   }

//   // void bookService() {
//   //   Get.snackbar("Success", "Service Booked Successfully!");
//   // }

//   void bookService({String paymentMethod = "Cash"}) {
//   print("Location: ${selectedLocation.value}");
//   print("Payment: $paymentMethod");

//   // এখানে API call যাবে
//   Get.snackbar("Success", "Booking done via $paymentMethod");
// }
}