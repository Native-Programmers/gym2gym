import 'package:gymtogym/screens/Homepage.dart';
import 'package:gymtogym/screens/SignupPage.dart';
import 'package:flutter/material.dart';

import '../main.dart';

var screenHeight, screenWidth;

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth / 1.1,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpPage()),
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
              'Create a new account',
              style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }
}
