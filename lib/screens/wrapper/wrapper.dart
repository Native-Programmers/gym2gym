import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:gymtogym/Services/authService.dart';
import 'package:gymtogym/screens/Homepage.dart';
import 'package:gymtogym/screens/LoginPage.dart';

class Wrapper extends GetWidget<AuthService> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthService>().user != null
          ? const HomePage()
          : singInPage();
    });
  }
}
