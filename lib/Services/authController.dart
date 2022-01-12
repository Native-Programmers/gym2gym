import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gymtogym/screens/Homepage.dart';
import 'package:gymtogym/screens/LoginPage.dart';

class AuthController extends GetxController {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      //user is logged in
      Get.offAll(() => const HomePage());
    } else {
      //user is not logged in
      Get.offAll(() => const signInPage());
    }
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
      Get.snackbar('Error', 'Please check internet connection.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() {
    try {
      _auth.signOut().then((value) => Get.snackbar(
          'Sign Out', 'User logged out successfully',
          snackPosition: SnackPosition.BOTTOM));
    } catch (e) {
      Get.snackbar('Error', 'Unable to logout',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
