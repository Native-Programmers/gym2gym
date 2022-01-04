import 'package:flutter/material.dart';

import '../main.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: const Text(
          'GYMTOGYM',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: screenHeight / 4.8,
        color: bgColorTwo,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 20,
              // left: screenWidth / 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: const Text('User ID'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: screenWidth / 50,
                  ),
                  ElevatedButton(
                    child: const Text('User Name '),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 90,
              //left: screenWidth / 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: const Text('Month '),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: screenWidth / 50,
                  ),
                  ElevatedButton(
                    child: const Text('Year '),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
