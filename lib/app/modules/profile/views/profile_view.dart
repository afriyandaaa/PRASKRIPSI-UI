import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praskripsi/app/routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: controller.getData(),
            builder: (context, snapshot) {
              return ListView(
                padding: EdgeInsets.all(20),
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: Container(
                              width: 70,
                              height: 70,
                              child: Image.network(
                                "https://picsum.photos/536/354",
                                // "https://ui-avatars.com/api/?name=${controller.nama}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "${controller.nama}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300],
                    ),
                    child: Table(
                      columnWidths: {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(3)
                      },
                      children: [
                        // TableRow(children: [
                        //   Text("NAMA", style: TextStyle(fontSize: 20)),
                        //   Text(": ${controller.nama}",
                        //       style: TextStyle(fontSize: 20))
                        // ]),
                        TableRow(children: [
                          Text("NIM", style: TextStyle(fontSize: 20)),
                          Text(": ${controller.nim}",
                              style: TextStyle(fontSize: 20))
                        ]),
                        TableRow(children: [
                          Text("PR.STUDI", style: TextStyle(fontSize: 20)),
                          Text(": ${controller.program_studi}",
                              style: TextStyle(fontSize: 20))
                        ]),
                        TableRow(children: [
                          Text("DOSEN_PA", style: TextStyle(fontSize: 20)),
                          Text(": ${controller.dosen_pa}",
                              style: TextStyle(fontSize: 20))
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    onTap: () => Get.toNamed(Routes.UPDATE_PROFILE),
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
                      // Get.offAllNamed(Routes.LOGIN);
                      print("Klik");
                    },
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                  ),
                ],
              );
            }),
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
