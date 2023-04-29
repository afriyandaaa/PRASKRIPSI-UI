import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praskripsi/app/routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.getData(),
          builder: (context, snapshot) {
            return ListView(
              padding: EdgeInsets.all(20),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          "https://picsum.photos/536/354",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "${controller.nama}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 5),
                Text(
                  "${controller.nim}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.person),
                  title: Text("Update Profile"),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.vpn_key),
                  title: Text("Update Password"),
                ),
                ListTile(
                  onTap: () {
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                ),
              ],
            );
          }),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
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
