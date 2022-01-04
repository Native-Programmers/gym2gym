import 'package:firebase_core/firebase_core.dart';
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
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
    );
  }
}
