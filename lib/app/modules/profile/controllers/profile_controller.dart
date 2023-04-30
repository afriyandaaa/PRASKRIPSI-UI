import 'dart:convert';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:praskripsi/app/controllers/page_index_controller.dart';

class ProfileController extends GetxController {
  final pageC = Get.find<PageIndexController>();
  String nim = "185410198";
  String nama = "";

  Future<void> getData() async {
    final url =
        "https://jadwal-krs-default-rtdb.firebaseio.com/jadwal-krs/-NU7-kXXNygFwsRy68j3/mahasiswa/$nim.json";

    final cachedResponse = await DefaultCacheManager().getSingleFile(url);
    if (cachedResponse != null && cachedResponse.existsSync()) {
      // If cached response exists, use it instead of making new request
      final cachedData = jsonDecode(await cachedResponse.readAsString());
      nama = cachedData["nama"];
      return;
    }

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // If response is successful, save it to cache and use it
      final jsonData = jsonDecode(response.body);
      nama = jsonData["nama"];
      await DefaultCacheManager().putFile(url, response.bodyBytes);
    }
  }
}
