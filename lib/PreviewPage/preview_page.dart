import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saidpure_service/PreviewPage/preview_page_controller.dart';
import 'package:saidpure_service/utils/routes.dart';

class PreviewPage extends GetView<PreviewPageController> {
  const PreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text("Booking Preview"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🔹 Card
            Obx(
              () => Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.05),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 26,
                          child: Icon(Icons.home_repair_service),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            controller.serviceName.value,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Divider(height: 30),

                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.red),
                        const SizedBox(width: 8),
                        Expanded(child: Text(controller.location.value)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// 🔹 Timer
            Obx(
              () =>
                  controller.isConfirmed.value
                      ? Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "Mistri on the way 🚀",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              controller.formatTime(),
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      )
                      : const SizedBox(),
            ),

            const Spacer(),

            /// 🔹 Buttons
            Obx(
              () =>
                  !controller.isConfirmed.value
                      ? Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: controller.cancelBooking,
                              child: const Text("Cancel"),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: controller.confirmBooking,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              child: const Text("Confirm Booking"),
                            ),
                          ),
                        ],
                      )
                      : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.homePage);
                          },
                          child: const Text("Back to Home"),
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
