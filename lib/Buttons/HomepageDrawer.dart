import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gymtogym/Services/authController.dart';
import 'package:gymtogym/main.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class HomepageDrawer extends StatefulWidget {
  HomepageDrawer({Key? key}) : super(key: key);

  @override
  State<HomepageDrawer> createState() => _HomepageDrawerState();
}

class _HomepageDrawerState extends State<HomepageDrawer> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  String? email = FirebaseAuth.instance.currentUser!.email;
  var ref;

  // late UserModel model;
  late BuildContext context;
  late double width, height;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    ref = FirebaseFirestore.instance
        .collection("userinfo")
        .where('email', isEqualTo: email);

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return FutureBuilder(
      future: ref.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          FirebaseException e = snapshot.error as FirebaseException;
          return Center(
            child: Text(
              e.message.toString(),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: Text("No data found"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Drawer(
            backgroundColor: bgColor,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                      color: dHeader,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2018/09/12/12/14/man-3672010__340.jpg'),
                          backgroundColor: Colors.blueGrey,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'User ID:  ' + snapshot.data!.docs[0]['uid'].toString(),
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '\nUser Name: ' + snapshot.data!.docs[0]['name'],
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    )),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.deepOrange,
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.edit_outlined, color: Colors.deepOrange),
                  title: Text(
                    "Edit Info",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.quick_contacts_dialer_rounded,
                      color: Colors.deepOrange),
                  title: const Text(
                    "Contact Us,",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading:
                      const Icon(Icons.help_outline, color: Colors.deepOrange),
                  title: const Text(
                    "Help",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading:
                      const Icon(Icons.more_sharp, color: Colors.deepOrange),
                  title: const Text(
                    "About",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.deepOrange),
                  title: const Text(
                    "LogOut",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    AuthController.authInstance.signOut();
                  },
                ),
              ],
            ),
          );
        } else {
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
