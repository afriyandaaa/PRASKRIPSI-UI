import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:praskripsi/app/controllers/page_index_controller.dart';
import '../../../models/krs_model.dart';

class HomeController extends GetxController {
  final pageC = Get.find<PageIndexController>();
  

  String nim = "205410002";
  String nama = "";
  List<Kr> allKrs = [];

  Future<void> getData() async {
    var response = await http.get(Uri.parse(
        "https://krs-firebase-default-rtdb.firebaseio.com/krsmhs/-NTxKhA9cY2_h3NcV269/mahasiswa/$nim.json"));
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
  }
}
