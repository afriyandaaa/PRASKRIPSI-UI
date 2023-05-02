import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:praskripsi/app/controllers/page_index_controller.dart';
import 'package:praskripsi/app/modules/profile/controllers/profile_controller.dart';
import '../../../models/krs_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomeController extends GetxController {
  final pageC = Get.find<PageIndexController>();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

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
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    // var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    ); //iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
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
    for (var element in dataKrs) {
      allKrs.add(Kr.fromJson(element));
      var jadwal = element["jadwal"];
      var jadwalHari = jadwal["hari"];
      var jadwalJamMulai = jadwal["jamMulai"];
      var jadwalJamSelesai = jadwal["jamSelesai"];
      var jadwalMatkul = jadwal["namaMatkul"];
      var jadwalRuang = jadwal["ruang"];
      var jadwalSks = jadwal["sks"];
      if (jadwalHari == "Selasa" && jadwalJamMulai == "18:50") {
        await _showNotification("Jadwal Kuliah",
            "Anda memiliki kuliah $jadwalMatkul di ruang $jadwalRuang pada hari $jadwalHari jam $jadwalJamMulai-$jadwalJamSelesai");
      }
    }
    allData.add(jadwalKrs);
  }

  Future<void> _showNotification(String title, String body) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_id', 'channel_name', // 'channel_description',
        importance: Importance.high,
        priority: Priority.high,
        ticker: 'ticker');
    // var iosPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    // iOS: iosPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: 'item x');
  }
}
