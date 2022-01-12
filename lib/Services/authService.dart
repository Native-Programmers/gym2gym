import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Rx<User?> _firebaseUser = Rx<User?>(FirebaseAuth.instance.currentUser);

  String? get user => _firebaseUser.value!.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void login({required String id, required String password}) async {
    try {
      await _firestore.collection('userinfo').doc(id).get().then((data) {
        try {
          _auth
              .signInWithEmailAndPassword(
            email: data['email'].toString().trim(),
            password: password,
          )
              .then((value) {
            EasyLoading.showSuccess('Login Successful');

            Future.delayed(const Duration(seconds: 3), () {
              EasyLoading.dismiss();
              (kIsWeb ? null : Get.back());
            });
          }).onError((error, stackTrace) {
            EasyLoading.showError(
              error.toString(),
            );
            EasyLoading.dismiss();
            (kIsWeb ? null : Get.back());
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
          (kIsWeb ? null : Get.back());
        });
      });
    } catch (e) {
      Get.snackbar('Error', 'Please check internet connection.');
    }
  }
}
