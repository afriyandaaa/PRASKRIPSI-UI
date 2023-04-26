import 'package:get/get.dart';
import 'package:praskripsi/app/routes/app_pages.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;

  void gantiPage(int i) async {
    switch (i) {
      case 1:
        print("home");
        break;
      case 2:
        Get.offAllNamed(Routes.PROFILE);
        break;
      default:
        Get.offAllNamed(Routes.HOME);
    }
  }
}
