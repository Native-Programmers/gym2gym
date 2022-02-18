// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gymtogym/ProjectAssets/functions.dart';
import 'package:flutter/material.dart';
import 'package:gymtogym/Services/authController.dart';
import 'package:gymtogym/screens/SignupPage.dart';
import 'package:lottie/lottie.dart';
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
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 800,
                  ),
                  child: TextFormField(
                    
                    textAlign: TextAlign.center,
                    controller: _id,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 10),
                        labelText: 'User ID',
                        labelStyle: const TextStyle(color: Colors.white, fontFamily: 'pp'),
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
              ),
              getSizedBox(3),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 800,
                  ),
                  child: TextFormField(
                    obscureText: hide,
                    textAlign: TextAlign.center,
                    controller: _password,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.white, fontFamily: 'pp'),
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
              ),
              getSizedBox(20),
              SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          content: SpinKitFadingCircle(
                              itemBuilder: (BuildContext context, int index) {
                            return Container(
                              color: Colors.black.withAlpha(25),
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color:
                                      index.isEven ? Colors.red : Colors.green,
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                      AuthController.authInstance
                          .login(id: _id.text.trim(), password: _password.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [buttonOne, buttonTwo]),
                        borderRadius: BorderRadius.circular(40)),
                    child: Container(
                      width: (kIsWeb)?screenWidth*.3:screenWidth*.6,
                      height: 100,
                      alignment: Alignment.center,
                      child: const Text(
                        'SignIn',
                        style: TextStyle(
                            fontSize: 24, fontStyle: FontStyle.italic, fontFamily: 'pp'),
                      ),
                    ),
                  ),
                ),
              ),
              // const LoginButton(),
              const Divider(
                height: 15,
                color: Colors.transparent,
              ),
              getSizedBox(4),
              InkWell(
                onTap: () {},
                child: const Text('Forgotten Password ?', style: TextStyle(fontFamily: 'pp', color: Colors.white),),
              ),
              getDivider(50, 1.5),
              SizedBox(
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
                        gradient:
                            LinearGradient(colors: [buttonOne, buttonTwo]),
                        borderRadius: BorderRadius.circular(40)),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 350,
                      ),

                      child: Container(
                        width: (kIsWeb)?screenWidth*.3:screenWidth*.8,
                        height: 100,
                        alignment: Alignment.center,
                        child: const Text(
                          'Create a new account',
                          style: TextStyle(
                              fontSize: 24, fontStyle: FontStyle.italic, fontFamily: 'pp'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signInUser(
      {required String id, required String password}) async {
    try {
      await fdata.collection('userinfo').doc(id).get().then((data) {
        try {
          auth
              .signInWithEmailAndPassword(
            email: data['email'].toString().trim(),
            password: password,
          )
              .then((value) {
            // Navigator.pop(context);
            EasyLoading.showSuccess('Login Successful');

            Future.delayed(const Duration(seconds: 3), () {
              EasyLoading.dismiss();
              (kIsWeb ? null : Navigator.pop(context));
            });
          }).onError((error, stackTrace) {
            EasyLoading.showError(
              error.toString(),
            );
            EasyLoading.dismiss();
            (kIsWeb ? null : Navigator.pop(context));
          });
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          }
        }
        return;
      }).onError((error, stackTrace) {
        EasyLoading.showError('Unable to locate user');
        Future.delayed(const Duration(seconds: 2), () {
          EasyLoading.dismiss();
          (kIsWeb ? null : Navigator.pop(context));
        });
      });
    } catch (e) {
      Future.delayed(const Duration(seconds: 2), () {
        EasyLoading.showError('Something went wrong');
        EasyLoading.dismiss();
        (kIsWeb ? null : Navigator.pop(context));
      });
    }
  }
}
