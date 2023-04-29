import 'dart:convert';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praskripsi/app/routes/app_pages.dart';
import '../../../models/krs_model.dart';
import '../controllers/home_controller.dart';
import '../../../controllers/page_index_controller.dart';
import 'package:http/http.dart' as http;

class HomeView extends GetView<HomeController> {
  final pageC = Get.find<PageIndexController>();

  final String nim = "205410056";
  // API
  List<Kr> allKrs = [];
  final List<JadwalKrs> allData = [];
  Future getData() async {
    var response = await http.get(Uri.parse(
        "https://jadwal-krs-default-rtdb.firebaseio.com/jadwal-krs/-NU7-kXXNygFwsRy68j3/mahasiswa/$nim.json"));

    Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> dataKrs = data["krs"];
    JadwalKrs jadwalKrs = JadwalKrs.fromJson(data);
    for (var element in dataKrs) {
      allKrs.add(Kr.fromJson(element));
    }

    allData.add(jadwalKrs);
    print(jadwalKrs.nama);

    // List<dynamic> dataKrs =
    //     (jsonDecode(response.body) as Map<String, dynamic>)["krs"];
    // List<dynamic> dataMhs =
    //     (jsonDecode(response.body) as Map<String, dynamic>)[""];
    // for (var element in dataKrs) {
    //   allKrs.add(
    //     Kr.fromJson(element),
    //   );
    // }
    // allData.add(
    //     JadwalKrs.fromJson(dataMhs as Map<String, dynamic>));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME: ${allData[0].nama}'),
        // title: Text('HOME: ${allData[0].dosenPa}'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text("Loading..."),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: allKrs.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // nama matkul
                          Text(
                            allKrs[index].jadwal.namaMatkul,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Hari
                          Text(allKrs[index].jadwal.hari),
                          SizedBox(height: 10),
                          Text("Ruang: ${allKrs[index].jadwal.ruang}"),
                          SizedBox(height: 10),
                          // Text(allData["nama"].nama),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                  "${allKrs[index].jadwal.jamMulai} - ${allKrs[index].jadwal.jamSelesai}"),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          }),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: pageC.pageIndex.value,
        onTap: (int i) => pageC.gantiPage(i),
      ),
    );
  }
}
