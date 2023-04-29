import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:praskripsi/app/controllers/page_index_controller.dart';
import '../../../models/krs_model.dart';

class HomeController extends GetxController {
  final pageC = Get.find<PageIndexController>();

  String nim = ""; // initialize nim variable
  String nama = "";
  List<Kr> allKrs = [];

  Future<void> getDataFromApi() async {
    try {
      var response = await http.get(Uri.parse(
          "https://krs-firebase-default-rtdb.firebaseio.com/krsmhs/-NTxKhA9cY2_h3NcV269/mahasiswa/$nim.json"));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        nim = data["nim"];
        await getData();
      } else {
        Get.snackbar("Gagal mengambil data",
            "Terjadi kesalahan saat mengambil data dari server");
      }
    } catch (e) {
      Get.snackbar("Gagal mengambil data",
          "Terjadi kesalahan saat mengambil data dari server");
    }
  }

  Future<void> getData() async {
    try {
      var response = await http.get(Uri.parse(
          "https://krs-firebase-default-rtdb.firebaseio.com/krsmhs/-NTxKhA9cY2_h3NcV269/mahasiswa/205410002.json"));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> krs = data["krs"];
        for (var element in krs) {
          allKrs.add(Kr.fromJson(element));
        }
        nama = data["nama"];
      } else {
        Get.snackbar("Gagal mengambil data",
            "Terjadi kesalahan saat mengambil data dari server");
      }
    } catch (e) {
      Get.snackbar("Gagal mengambil data",
          "Terjadi kesalahan saat mengambil data dari server");
    }
  }
}
