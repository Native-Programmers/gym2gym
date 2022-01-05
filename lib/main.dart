import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gymtogym/screens/LoginPage.dart';
import 'package:flutter/material.dart';

late double screenWidth;
late double screenHeight;
final Color bgColor = Color(0xffFFA07A);
final Color buttonOne = Color(0xffE9967A);
final Color buttonTwo = Color(0xffDDA0DD);
final Color dHeader = Color(0xffFF7F50);
final Color bgColorTwo = Color(0xffffb3b3);
final Color bgColorThree = Color(0xffff7f4d);
final Color IconColor = Color(0xffff471a);

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return MaterialApp(
      builder: EasyLoading.init(),
      home: const signInPage(),
    );
  }
}
