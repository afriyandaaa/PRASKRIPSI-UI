import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:praskripsi/app/controllers/page_index_controller.dart';

import 'app/routes/app_pages.dart';

void main() {
  final pageC = Get.put(PageIndexController(), permanent: true);
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: Routes.LOGIN,
      getPages: AppPages.routes,
    ),
  );
}
