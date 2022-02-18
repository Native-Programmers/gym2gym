import 'package:gymtogym/Buttons/FilterButton.dart';
import 'package:gymtogym/Buttons/RecommendedButton.dart';

import 'package:gymtogym/main.dart';
import 'package:flutter/material.dart';

var screenHeight, screenWidth;

class NewPackage extends StatelessWidget {
  const NewPackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColorTwo,
          centerTitle: true,
          title: const Text(
            'GYMTOGYM',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 20,
              left: screenWidth / 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecommendedButton(),
                  SizedBox(
                    width: screenWidth / 50,
                  ),
                  FilterButton(),
                ],
              ),
            ),
            Positioned(
                top: screenHeight / 7,
                left: screenWidth / 20,
                right: screenWidth / 20,
                child: Container(
                  height: screenHeight / 1.5,
                  color: Colors.white38,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: 500,
                          height: 200,
                          color: bgColorThree,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                child: const Text('Package Type'),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blueGrey,
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Package Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                ),
                              ),
                              const Text(
                                'Package Duration',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Allow Attendance',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: ElevatedButton(
                                  child: const Text('Activate Package '),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      primary: bgColor,
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 500,
                          height: 200,
                          color: bgColorTwo,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                child: const Text('Package Type'),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blueGrey,
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Package Name',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Package Duration',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Allow Attendance',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: ElevatedButton(
                                  child: const Text('Activate Package '),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      primary: bgColor,
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
