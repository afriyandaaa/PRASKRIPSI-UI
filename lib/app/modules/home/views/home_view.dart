import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:praskripsi/app/utils/notification_manager.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Text(
                'HOME',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: controller.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoadingAnimationWidget.staggeredDotsWave(
                              color: Colors.blue, size: 50),
                          const Text("Load data")
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.builder(
                        itemCount: controller.allKrs.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[300],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.allKrs[index].jadwal.namaMatkul,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                    "Hari: ${controller.allKrs[index].jadwal.hari}"),
                                SizedBox(height: 5),
                                Text(
                                    "Ruang: ${controller.allKrs[index].jadwal.ruang}"),
                                SizedBox(height: 5),
                                Text(
                                    "Sks: ${controller.allKrs[index].jadwal.sks}"),
                                SizedBox(height: 15),
                                ElevatedButton(
                                  onPressed: () {
                                    NotificationManager()
                                        .simpleNotificationShow(
                                      controller
                                          .allKrs[index].jadwal.namaMatkul,
                                      controller.allKrs[index].jadwal.jamMulai,
                                      controller.allKrs[index].jadwal.ruang,
                                    );
                                  },
                                  child: Text("Show Notification"),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        "${controller.allKrs[index].jadwal.jamMulai} - ${controller.allKrs[index].jadwal.jamSelesai}"),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.blue[800],
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: controller.pageC.pageIndex.value,
        onTap: (int i) => controller.pageC.gantiPage(i),
      ),
    );
  }
}
