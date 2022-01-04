import 'package:gymtogym/screens/Homepage.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class BMIButton extends StatelessWidget {
  const BMIButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth / 2.1,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [buttonTwo, buttonOne]),
              borderRadius: BorderRadius.circular(40)),
          child: Container(
            width: screenWidth,
            height: 100,
            alignment: Alignment.center,
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.calculate_rounded  ,
                    color: Colors.deepOrange,
                    size: 40.0,
                  ),
                ),
                Text(
                  'BMI ',
                  style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
