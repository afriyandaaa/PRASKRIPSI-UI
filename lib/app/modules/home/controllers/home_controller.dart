import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:praskripsi/app/controllers/page_index_controller.dart';
import '../../../models/krs_model.dart';

class HomeController extends GetxController {
   final pageC = Get.find<PageIndexController>();

  String nim = "205410002";
  // API
  List<Kr> allKrs = [];

  Future getData() async {
    var response = await http.get(Uri.parse(
        "https://krs-firebase-default-rtdb.firebaseio.com/krsmhs/-NTxKhA9cY2_h3NcV269/mahasiswa/$nim.json"));
    List<dynamic> data =
        (jsonDecode(response.body) as Map<String, dynamic>)["krs"];
    for (var element in data) {
      allKrs.add(
        Kr.fromJson(element),
      );
    }
  }

  
}