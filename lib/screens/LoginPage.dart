// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gymtogym/Buttons/CreateAccountButton.dart';
// import 'package:gymtogym/Buttons/LoginButton.dart';
import 'package:gymtogym/ProjectAssets/functions.dart';
import 'package:flutter/material.dart';
import '../main.dart';

bool hide = true;
var _id = TextEditingController();
var _password = TextEditingController();
var isPasswordActive = false;
var isIdActive = true;
var user_email;
var auth, fdata;

class signInPage extends StatefulWidget {
  const signInPage({Key? key}) : super(key: key);

  @override
  _signInPageState createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    auth = FirebaseAuth.instance;
    fdata = FirebaseFirestore.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                  textAlign: TextAlign.center,
                  controller: _id,
                  enabled: isIdActive,
                  onEditingComplete: () {
                    try {
                      EasyLoading.show();
                      fdata
                          .collection('userinfo')
                          .doc(_id.text)
                          .get()
                          .then((value) {
                        setState(() {
                          user_email = value['email'];
                          isPasswordActive = true;
                          isIdActive = false;
                        });
                        print(user_email);
                        EasyLoading.showSuccess('User found');
                        return;
                      }).onError((error, stackTrace) {
                        EasyLoading.showError('Unable to locate user');
                      });
                    } catch (e) {
                      EasyLoading.showError(e.toString());
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 10),
                      labelText: '    User ID',
                      labelStyle: const TextStyle(color: Colors.black),
                      fillColor: Colors.white38,
                      filled: true,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          )),
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
                  obscureText: hide,
                  enabled: isPasswordActive,
                  controller: _password,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.black),
                      fillColor: Colors.white38,
                      filled: true,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hide = !hide;
                          });
                        },
                        icon: Icon(hide
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.blueAccent,
                            width: 2.0,
                          ))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
              ),
              getSizedBox(20),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      if (_formKey.currentState!.validate()) {
                        EasyLoading.show();
                        try {
                          auth
                              .signInWithEmailAndPassword(
                                email: user_email.toString().trim(),
                                password: _password.text,
                              )
                              .then(
                                (value) =>
                                    EasyLoading.showSuccess('Login Successful')
                                        .onError(
                                  (error, stackTrace) => EasyLoading.showError(
                                    error.toString(),
                                  ),
                                ),
                              );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text('SIGN IN')),
              // const LoginButton(),
              const Divider(
                height: 15,
                color: Colors.transparent,
              ),
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
      ),
    );
  }
}
