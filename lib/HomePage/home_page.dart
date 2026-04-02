import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saidpure_service/HomePage/home_page_controller.dart';


class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Location",
                style: TextStyle(fontSize: 12, color: Colors.grey)),
            Text("Dhaka, Bangladesh",
                style: TextStyle(fontSize: 16, color: Colors.black)),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?img=3"),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            /// 🔍 Search Bar
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Search services...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            /// 🎁 Banner
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1581578731548-c64695cc6952"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// 🧰 Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Categories",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See All", style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Obx(() => GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: controller.categories.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    var item = controller.categories[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(item["icon"] as IconData,
                              size: 30, color: Colors.blue),
                          const SizedBox(height: 8),
                          Text(item["name"].toString()),
                        ],
                      ),
                    );
                  },
                )),

            const SizedBox(height: 20),

            /// ⭐ Popular Services
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Popular Services",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See All", style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 130,
                    margin: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1581578731548-c64695cc6952"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text("Home Cleaning"),
                        const Text("\$25",
                            style: TextStyle(color: Colors.green)),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}