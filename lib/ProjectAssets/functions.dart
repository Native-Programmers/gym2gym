import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

getSizedBox(double a)
{
  return SizedBox(height: a,);
}

getDivider(double a, double b)
{
  return Padding(
    padding: const EdgeInsets.fromLTRB(15,0,15,0),
    child: Divider(height: a,thickness: b,color: Colors.blueGrey,),
  );
}