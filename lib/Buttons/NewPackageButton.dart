import 'package:gymtogym/screens/Homepage.dart';
import 'package:gymtogym/screens/NewPackage.dart';
import 'package:flutter/material.dart';

import '../main.dart';

var screenWidth, screenHeight;

class NewPackageButton extends StatelessWidget {
  const NewPackageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth *.45,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewPackage()),
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
                    Icons.create_new_folder_rounded,
                    color: Colors.deepOrange,
                    size: 40.0,
                  ),
                ),
                Text(
                  'New Package',
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
