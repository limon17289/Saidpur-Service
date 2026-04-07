import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saidpure_service/BookingScreen/booking_controller.dart';

class Booking extends GetView<BookingController> {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.serviceProvider ?? {};

    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Service"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Service Provider Info
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const CircleAvatar(child: Icon(Icons.person)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      data["name"] ?? "Unknown Service",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// 🔹 Location Title
            const Text(
              "Select Location",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 10),

            /// 🔹 Input Field
            TextField(
              controller: controller.locationController, // 🔥 important
              onChanged: (value) {
                controller.selectedLocation.value = value;
              },
              decoration: InputDecoration(
                hintText: "Enter your address",
                prefixIcon: const Icon(Icons.location_on),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.selectedLocation.value = "";
                    controller.locationController.clear();
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// 🔹 Buttons Row (Current + Map)
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: controller.setLocation,
                    icon: const Icon(Icons.my_location),
                    label: const Text("Current"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: controller.pickFromMap,
                    icon: const Icon(Icons.map),
                    label: const Text("Map"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            /// 🔹 Selected Location Preview
            // Obx(() => AnimatedContainer(
            //       duration: const Duration(milliseconds: 300),
            //       width: double.infinity,
            //       padding: const EdgeInsets.all(12),
            //       decoration: BoxDecoration(
            //         color: controller.selectedLocation.value.isEmpty
            //             ? Colors.grey.withOpacity(0.1)
            //             : Colors.green.withOpacity(0.1),
            //         borderRadius: BorderRadius.circular(10),
            //         border: Border.all(
            //           color: controller.selectedLocation.value.isEmpty
            //               ? Colors.grey
            //               : Colors.green,
            //         ),
            //       ),
            //       child: Row(
            //         children: [
            //           Icon(
            //             controller.selectedLocation.value.isEmpty
            //                 ? Icons.location_off
            //                 : Icons.location_on,
            //             color: controller.selectedLocation.value.isEmpty
            //                 ? Colors.grey
            //                 : Colors.green,
            //           ),
            //           const SizedBox(width: 8),
            //           Expanded(
            //             child: Text(
            //               controller.selectedLocation.value.isEmpty
            //                   ? "No location selected"
            //                   : controller.selectedLocation.value,
            //               style: const TextStyle(fontSize: 14),
            //             ),
            //           ),
            //         ],
            //       ),
            //     )),

            const Spacer(),

            /// 🔹 Confirm Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.selectedLocation.value.isEmpty) {
                    Get.snackbar("Error", "Please select location");
                  } else {
                    controller.bookService();
                  }
                },
                child: const Text("Confirm Booking"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}