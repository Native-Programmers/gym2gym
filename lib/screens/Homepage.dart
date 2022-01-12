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
import '../main.dart';

var screenHeight;
var screenWidth;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const HomepageDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
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
          children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: screenHeight / 3.5,
                decoration: BoxDecoration(
                  color: bgColorTwo,
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
              Container(
                width: 20,
              ),
              const Positioned(
                top: 5,
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.blueGrey,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2018/09/12/12/14/man-3672010__340.jpg'),
                ),
              ),
              Positioned(
                top: 110,
                left: 0,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'User ID: ',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'User Name: ',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Package ID: ',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Expiry Date: ',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 110,
                left: 110,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'LHR-001 ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blueGrey),
                        ),
                        Text(
                          'Uzair Inshallah ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blueGrey),
                        ),
                        Text(
                          'Lahore-001 ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blueGrey),
                        ),
                        Text(
                          '28-6-2022 ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
            getSizedBox(40),
            Stack(
                // alignment: Alignment.center,
                children: [
                  Container(
                    width: screenWidth,
                    height: screenHeight / 2.2,
                    decoration: BoxDecoration(
                      color: bgColorThree,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Our Services',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        NewPackageButton(),
                        SizedBox(
                          width: 8,
                        ),
                        HistoryButton(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        FindGymButton(),
                        SizedBox(
                          width: 8,
                        ),
                        DietPlanButton(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 190,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AlarmButton(),
                        SizedBox(
                          width: 8,
                        ),
                        BMIButton(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 265,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        EventsButton(),
                        SizedBox(
                          width: 8,
                        ),
                        WorkOutButton(),
                      ],
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
