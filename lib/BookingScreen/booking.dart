import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:saidpure_service/BookingScreen/booking_controller.dart';

class Booking extends GetView<BookingController> {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.serviceProvider ?? {};

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Book Service"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 Provider Card
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.blue.shade50,
                      child: const Icon(Icons.person, color: Colors.blue),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        data["name"] ?? "Unknown Service",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// 🔹 Section Title
              const Text(
                "Location Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 10),

              /// 🔹 Input Field
              TextField(
                controller: controller.locationController,
                onChanged: (value) {
                  controller.selectedLocation.value = value;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter your full address",
                  prefixIcon: const Icon(Icons.location_on),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      controller.selectedLocation.value = "";
                      controller.locationController.clear();
                    },
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              /// 🔹 Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: controller.setLocation,
                      icon: const Icon(Icons.my_location),
                      label: const Text("Current"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: controller.pickFromMap,
                      icon: const Icon(Icons.map),
                      label: const Text("Map"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              // const Spacer(),

              /// 🔹 Confirm Button
              /// 🔹 Confirm Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    if (controller.selectedLocation.value.isEmpty) {
                      Get.snackbar("Error", "Please select location");
                    } else {
                      _showPaymentSheet(context);
                    }
                  },
                  child: const Text(
                    "Confirm Booking",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPaymentSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Select Payment Method",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            /// 🔹 bKash
            ListTile(
              leading: const Icon(
                Icons.account_balance_wallet,
                color: Colors.pink,
              ),
              title: const Text("bKash"),
              onTap: () {
                Get.back();
                controller.bookService(paymentMethod: "bKash");
              },
            ),

            /// 🔹 Nagad
            ListTile(
              leading: const Icon(
                Icons.account_balance_wallet,
                color: Colors.orange,
              ),
              title: const Text("Nagad"),
              onTap: () {
                Get.back();
                controller.bookService(paymentMethod: "Nagad");
              },
            ),

            /// 🔹 Bank
            ListTile(
              leading: const Icon(Icons.account_balance, color: Colors.blue),
              title: const Text("Bank Transfer"),
              onTap: () {
                Get.back();
                controller.bookService(paymentMethod: "Bank");
              },
            ),

            /// 🔹 Cash
            ListTile(
              leading: const Icon(Icons.money, color: Colors.green),
              title: const Text("Cash on Delivery"),
              onTap: () {
                Get.back();
                controller.bookService(paymentMethod: "Cash");
              },
            ),
          ],
        ),
      ),
    );
  }
}
