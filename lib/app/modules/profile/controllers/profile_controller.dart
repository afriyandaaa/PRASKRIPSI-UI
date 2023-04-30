import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:praskripsi/app/controllers/page_index_controller.dart';

class ProfileController extends GetxController {
  final pageC = Get.find<PageIndexController>();
  String nim = "205410002";
  String nama = "";
  String dosen_pa = "";
  String program_studi = "";

  Future<void> getData() async {
    var response = await http.get(Uri.parse(
        "https://jadwal-krs-default-rtdb.firebaseio.com/jadwal-krs/-NU7-kXXNygFwsRy68j3/mahasiswa/$nim.json"));
    Map<String, dynamic> data = jsonDecode(response.body);
    nama = data["nama"];
    dosen_pa = data["dosen_pa"];
    program_studi = data["program_studi"];
  }
}
