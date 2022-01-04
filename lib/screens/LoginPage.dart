import 'package:gymtogym/Buttons/CreateAccountButton.dart';
import 'package:gymtogym/Buttons/LoginButton.dart';
import 'package:gymtogym/ProjectAssets/functions.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/logos/f_logo.png",
              height: screenHeight / 3,
              width: screenWidth / 2,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(3),
                    labelText: '    User ID',
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white38,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 2.0,
                        ))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            getSizedBox(3),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(3),
                    labelText: '    Password',
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white38,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 2.0,
                        ))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            getSizedBox(20),
            const LoginButton(),
            getSizedBox(4),
            InkWell(
              onTap: () {},
              child: const Text('Forgotten Password ?'),
            ),
            getDivider(50, 1.5),
            const CreateAccountButton(),
          ],
        ),
      ),
    );
  }
}
