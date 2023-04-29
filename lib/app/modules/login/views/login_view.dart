import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final LoginController loginController = Get.put(LoginController());

  final TextEditingController nimController = TextEditingController();

  void onSubmit() {
    var nim = nimController.text;
    loginController.login(nim);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nimController,
              decoration: InputDecoration(
                labelText: 'NIM',
              ),
            ),
            ElevatedButton(
              onPressed: onSubmit,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
