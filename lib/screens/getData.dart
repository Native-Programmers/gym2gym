import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class getData extends StatefulWidget {
  const getData({Key? key}) : super(key: key);

  @override
  _getDataState createState() => _getDataState();
}

class _getDataState extends State<getData> {

  String uid = FirebaseAuth.instance.currentUser!.uid;
  String? email = FirebaseAuth.instance.currentUser!.email;
  var ref;
  // late UserModel model;
  late BuildContext context;
  late double width,height;

  @override
  Widget build(BuildContext context) {

    this.context = context;
    ref = FirebaseFirestore.instance.collection("userinfo").where('email',isEqualTo: email);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: ref.get(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
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
          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
            return Column(
              children: [

                Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(width * 0.1),
                          bottomLeft: Radius.circular(width * 0.1))),
                  padding: MediaQuery.of(context).padding,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05, vertical: height * 0.035),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          snapshot.data!.docs[0]['name'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: "jr"),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          else{
            return Container(
              color: Colors.white,
              child: const Center(child: CircularProgressIndicator(),),);
          }
        }
    );
  }
}
