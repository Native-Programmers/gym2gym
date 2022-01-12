import 'package:gymtogym/screens/Homepage.dart';
import 'package:flutter/material.dart';

import '../main.dart';

var screenHeight, screenWidth;

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth / 1.4,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [buttonOne, buttonTwo]),
              borderRadius: BorderRadius.circular(40)),
          child: Container(
            width: screenWidth,
            height: 100,
            alignment: Alignment.center,
            child: const Text(
              'SignIn',
              style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }
}
