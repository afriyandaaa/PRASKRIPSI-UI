import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:praskripsi/app/controllers/page_index_controller.dart';

class ProfileController extends GetxController {
  final pageC = Get.find<PageIndexController>();
  String nim = "205410002";
  String nama = "";

  Future<void> getData() async {
    var response = await http.get(Uri.parse(
        "https://krs-firebase-default-rtdb.firebaseio.com/krsmhs/-NTxKhA9cY2_h3NcV269/mahasiswa/$nim.json"));
    Map<String, dynamic> data = jsonDecode(response.body);
    nama = data["nama"];
  }
  
}
