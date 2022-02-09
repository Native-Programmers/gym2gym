import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gymtogym/Services/authController.dart';
import 'package:flutter/material.dart';
// import 'package:gymtogym/screens/wrapper/wrapper.dart';
import 'package:get/get.dart';

late double screenWidth;
late double screenHeight;
const Color bgColor = Color(0xFF212332);
const Color buttonOne = Color(0xFF2A2D3E);
const Color buttonTwo = Color(0xff0e5480);
const Color dHeader = Color(0xFF2A2D3E);
const Color bgColorTwo = Color(0xFF2A2D3E);
const Color bgColorThree = Color(0xFF212332);
const Color IconColor = Color(0xFFC7C7D4);

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  // setPathUrlStrategy();
  runApp(const MainScreen());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Timer? _timer;
  @override
  void initState() {
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FirebasePhoneAuthProvider(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        home: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
