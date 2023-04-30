import 'dart:convert';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
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

  final cacheManager = DefaultCacheManager();

  @override
  void onInit() {
    super.onInit();
    Get.put(ProfileController()); // tambahkan ini
    nim = Get.find<ProfileController>().nim;
  }

  Future<void> getData() async {
    String url =
        "https://jadwal-krs-default-rtdb.firebaseio.com/jadwal-krs/-NU7-kXXNygFwsRy68j3/mahasiswa/$nim.json";

    // Cek apakah data sudah ada di cache
    FileInfo? fileInfo = await cacheManager.getFileFromCache(url);
    if (fileInfo != null && fileInfo.file.existsSync()) {
      // Jika data sudah ada di cache, ambil data dari cache
      String data = await fileInfo.file.readAsString();
      Map<String, dynamic> decodedData = jsonDecode(data);
      List<dynamic> dataKrs = decodedData["krs"];
      JadwalKrs jadwalKrs = JadwalKrs.fromJson(decodedData);
      for (var element in dataKrs) {
        allKrs.add(Kr.fromJson(element));
      }
      allData.add(jadwalKrs);
    } else {
      // Jika data belum ada di cache, ambil data dari API dan simpan ke cache
      var response = await http.get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> dataKrs = data["krs"];
      JadwalKrs jadwalKrs = JadwalKrs.fromJson(data);
      for (var element in dataKrs) {
        allKrs.add(Kr.fromJson(element));
      }
      allData.add(jadwalKrs);

      // Simpan data ke cache
      await cacheManager.putFile(url, response.bodyBytes);
    }
  }
}
