import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:praskripsi/app/routes/app_pages.dart';

class LoginController extends GetxController {
  Future<void> login(String nim) async {
    // Validasi NIM hanya terdiri dari karakter angka
    if (!RegExp(r'^\d+$').hasMatch(nim)) {
      Get.snackbar("Login gagal", "NIM tidak valid");
      return;
    }

    try {
      // Enkripsi NIM sebelum dikirim ke server
      final encryptedNim = encrypt(nim);

      var response = await http.get(Uri.parse(
          "https://krs-firebase-default-rtdb.firebaseio.com/krsmhs/-NTxKhA9cY2_h3NcV269/mahasiswa/$nim.json"));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data != null) {
          Get.offAndToNamed(Routes.HOME, arguments: nim);
        } else {
          Get.snackbar("Login gagal", "NIM tidak ditemukan");
        }
      } else {
        Get.snackbar(
            "Login gagal", "Terjadi kesalahan saat mengambil data dari server");
      }
    } catch (e) {
      Get.snackbar("Login gagal", "NIM yang Anda masukkan Salah");
    }
  }

  // Fungsi enkripsi NIM
  String encrypt(String nim) {
    // Implementasi enkripsi
    return nim;
  }
}
