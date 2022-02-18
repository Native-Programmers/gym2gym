import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:gymtogym/Buttons/AlarmButton.dart';
import 'package:gymtogym/Buttons/BMIButton.dart';
import 'package:gymtogym/Buttons/DietPlanButton.dart';
import 'package:gymtogym/Buttons/EventsButton.dart';
import 'package:gymtogym/Buttons/FindGymButton.dart';
import 'package:gymtogym/Buttons/HistoryButton.dart';
import 'package:gymtogym/Buttons/HomepageDrawer.dart';
import 'package:gymtogym/Buttons/NewPackageButton.dart';
import 'package:gymtogym/Buttons/WorkOutButton.dart';
import 'package:gymtogym/ProjectAssets/functions.dart';
import 'package:gymtogym/main.dart';
import 'package:flutter/material.dart';
import 'package:gymtogym/models/user_model.dart';
import '../main.dart';

var screenHeight;
var screenWidth;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String uid = FirebaseAuth.instance.currentUser!.uid;
  late DocumentReference ref;


  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    ref =FirebaseFirestore.instance.collection("userinfo").doc(uid);
    return Scaffold(
      drawer: const HomepageDrawer(),
      appBar: AppBar(
        backgroundColor: dHeader,
        centerTitle: true,
        title: const Text(
          'GYMTOGYM',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.circle_notifications_sharp),
            iconSize: 30,
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
                alignment: Alignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  
                  constraints: BoxConstraints(maxWidth: (kIsWeb)?800:600, minHeight:(kIsWeb)?300:280 ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .93,
                    height: MediaQuery.of(context).size.height * .35,

                    decoration: BoxDecoration(
                      color: containerCol,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.redAccent,
                          blurRadius: 4,
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 20,
              ),
                Positioned(
                top: MediaQuery.of(context).size.height * .02,
                child: const CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.blueGrey,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2018/09/12/12/14/man-3672010__340.jpg'),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * .17,
                  left: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'User ID:            LHR-0006',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15, fontFamily: 'pp'
                            ),
                          ),
                          Text(
                            'User Name:     ali ali',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15, fontFamily: 'pp'
                            ),
                          ),
                          Text(
                            'Package ID:    009929',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15, fontFamily: 'pp'
                            ),
                          ),
                          Text(
                            'Expiry Date:   28 june ',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15, fontFamily: 'pp'
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ),


            ]),
            getSizedBox(40),
            Container(
              decoration: BoxDecoration(
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Services',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold, fontFamily: 'pp'
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                NewPackageButton(),
                HistoryButton(),
              ],
            ),
            SizedBox(
              height: screenHeight * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FindGymButton(),

                DietPlanButton(),
              ],
            ),
            SizedBox(
              height: screenHeight * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AlarmButton(),
                SizedBox(
                  width: 8,
                ),
                BMIButton(),
              ],
            ),
            SizedBox(
              height: screenHeight * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                EventsButton(),
                SizedBox(
                  width: 8,
                ),
                WorkOutButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
