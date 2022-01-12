import 'package:gymtogym/screens/Homepage.dart';
import 'package:flutter/material.dart';

import '../main.dart';

var screenHeight, screenWidth;

class WorkOutButton extends StatelessWidget {
  const WorkOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
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
                    Icons.featured_play_list_sharp,
                    color: Colors.deepOrange,
                    size: 40.0,
                  ),
                ),
                Text(
                  'Worout Details',
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
