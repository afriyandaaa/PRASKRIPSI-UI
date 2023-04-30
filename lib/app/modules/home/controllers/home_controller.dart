import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:praskripsi/app/controllers/page_index_controller.dart';
import 'package:praskripsi/app/modules/profile/controllers/profile_controller.dart';
import '../../../models/krs_model.dart';

class HomeController extends GetxController {
  final pageC = Get.find<PageIndexController>();

  // API
  List<Kr> allKrs = [];
  final List<JadwalKrs> allData = [];
  String nim = "";
  // String sks = "";

  @override
  void onInit() {
    super.onInit();
    Get.put(ProfileController()); // tambahkan ini
    nim = Get.find<ProfileController>().nim;
  }

  Future<void> getData() async {
    var response = await http.get(Uri.parse(
        "https://jadwal-krs-default-rtdb.firebaseio.com/jadwal-krs/-NU7-kXXNygFwsRy68j3/mahasiswa/$nim.json"));

    Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> dataKrs = data["krs"];
    JadwalKrs jadwalKrs = JadwalKrs.fromJson(data);
    for (var element in dataKrs) {
      allKrs.add(Kr.fromJson(element));
    }
    // sks = data["sks"];
    allData.add(jadwalKrs);
  }
}
