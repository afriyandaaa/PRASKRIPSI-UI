import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:praskripsi/app/controllers/page_index_controller.dart';
import 'package:praskripsi/app/utils/notification_manager.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationManager().initNotification();
  final pageC = Get.put(PageIndexController(), permanent: true);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
