import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:gymtogym/main.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final fName = TextEditingController();
  final dob = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  // final city = TextEditingController();
  final province = TextEditingController();
  // final gender = TextEditingController();
  final phoneNo = TextEditingController();
  final district = TextEditingController();
  final area = TextEditingController();
  String dropdownValue = 'Male';
  String _dropdownValue = 'LHR';
  var reg_date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    // gender.text = 'Male';
    void dispose() {
      super.dispose();
    }

    void initState() {}
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/logos/f_logo.png",
                height: screenHeight / 3,
                width: screenWidth / 2,
              ),
              getTextField('Enter your name', name),
              getTextField('Enter your father name', fName),
              // getTextField('Enter your D-O-B', dob),
              getTextField('Enter your email', email),
              getTextField('Enter your password', password),
              //for searchable city picker
              SizedBox(
                width: screenWidth / 1.2,
                child: StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection('city').snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text(
                          'Loading...',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: (kIsWeb ? 16 : 12),
                          ),
                        ),
                      );
                    }
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25,
                      ),
                      padding: const EdgeInsets.all(10.0),
                      width: screenWidth / 1.2,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isDense: true,
                          isExpanded: false,
                          hint: const Text("Select"),
                          value: _dropdownValue,
                          icon: const Icon(
                            Icons.arrow_drop_down_circle,
                            color: Colors.blue,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _dropdownValue = newValue.toString();
                            });
                          },
                          items: snapshot.data!.docs.map((map) {
                            return DropdownMenuItem<String>(
                              value: map["value"].toString(),
                              child: Text(
                                map["name"],
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Divider(
                height: 25,
                color: Colors.transparent,
              ),
              getTextField('Enter your province', province),
              //date of birth picker
              SizedBox(
                width: screenWidth / 1.2,
                height: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white10,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  child: Center(
                    child: Text(
                        // ignore: unnecessary_null_comparison
                        reg_date != null
                            ? DateFormat('dd-MM-yyyy')
                                .format(reg_date)
                                .toString()
                            : DateFormat('dd-MM-yyyy')
                                .format(DateTime.now())
                                .toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        )),
                  ),
                  onPressed: () {
                    //show date picker and stores in reg_date
                    showDatePicker(
                      context: context,
                      lastDate: DateTime.now(),
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                    ).then((date) {
                      setState(() {
                        reg_date = date!;
                      });
                    });
                  },
                ),
              ),
              const Divider(
                height: 25,
                color: Colors.transparent,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white38,
                  border: Border.all(
                    color: Colors.blueAccent,
                    width: 2.0,
                  ),
                ),
                width: screenWidth / 1.2,
                height: 100,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_circle_down_sharp),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue.toString();
                      });
                    },
                    items: <String>['Male', 'Female', 'Homo', 'Rather not say']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const Divider(
                height: 50,
                color: Colors.transparent,
              ),
              getTextField('Enter your phone no', phoneNo),
              getTextField('Enter your district', district),
              getTextField('Enter your area', area),
              const Divider(
                height: 5,
                color: Colors.transparent,
              ),
              SizedBox(
                width: screenWidth / 2,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      if (mounted) {
                        registerUser(
                            name: name.text,
                            fname: fName.text,
                            email: email.text,
                            mobile: phoneNo.text,
                            city: _dropdownValue);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please fill all the fields')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient:
                            LinearGradient(colors: [buttonOne, buttonTwo]),
                        borderRadius: BorderRadius.circular(40)),
                    child: Container(
                      width: screenWidth,
                      height: 100,
                      alignment: Alignment.center,
                      child: const Text(
                        'SignUp',
                        style: TextStyle(
                            fontSize: 24, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 50,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> registerUser(
      {required String name,
      required String fname,
      required String email,
      required String mobile,
      required String city}) async {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("userinfo")
                      .where('city', isEqualTo: city)
                      .orderBy('uid', descending: true)
                      .limit(1)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text("Unable to load data"),
                      );
                    }
                    if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.done) {
                      var _password = TextEditingController();
                      var _cpassword = TextEditingController();
                      int? uid;
                      String id;
                      if (snapshot.data!.docs.isEmpty) {
                        uid = 1;
                        id = '$city-0001';
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Text(
                                ('$city-0001'),
                              ),
                            ),
                            const Divider(
                              height: 25,
                              color: Colors.transparent,
                            ),
                            Center(
                              child: SizedBox(
                                width: screenWidth / 1.2,
                                height: screenHeight * 0.093,
                                child: TextFormField(
                                  controller: _password,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                      labelText: 'Please Enter Password',
                                      labelStyle:
                                          const TextStyle(color: Colors.black),
                                      fillColor: Colors.white38,
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        borderSide: const BorderSide(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: const BorderSide(
                                            color: Colors.blueAccent,
                                            width: 2.0,
                                          ))),
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                            const Divider(
                              height: 10,
                              color: Colors.transparent,
                            ),
                            Center(
                              child: SizedBox(
                                width: screenWidth / 1.2,
                                height: screenHeight * 0.093,
                                child: TextFormField(
                                  controller: _cpassword,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                      labelText: 'Confirm Password',
                                      labelStyle:
                                          const TextStyle(color: Colors.black),
                                      fillColor: Colors.white38,
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        borderSide: const BorderSide(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: const BorderSide(
                                            color: Colors.blueAccent,
                                            width: 2.0,
                                          ))),
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                // await FirebaseAuth.instance
                                //     .createUserWithEmailAndPassword(
                                //         email: email, password: password.text)
                                //     .then((value) => FirebaseFirestore.instance
                                //             .collection('userinfo')
                                //             .doc(id)
                                //             .set({
                                //           'id': id,
                                //           'uid': uid,
                                //           'city': city,
                                //           'name': name,
                                //           'phone': phoneNo,
                                //           'reg_date': Timestamp.fromDate(
                                //               DateTime.now()),
                                //         }));
                                await FirebaseFirestore.instance
                                    .collection('userinfo')
                                    .doc(id)
                                    .set({
                                  'id': id,
                                  'uid': uid,
                                  'city': city,
                                  'name': 'name',
                                  'phone': 'phoneNo',
                                  'reg_date':
                                      Timestamp.fromDate(DateTime.now()),
                                }).then((value) {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                });
                                setState() {
                                  id = '';
                                  uid = null;
                                }
                              },
                              child: const Text('Submit Details'),
                            ),
                          ],
                        );
                      } else {
                        uid = snapshot.data!.docs[0]['uid'] + 1;
                        if (snapshot.data!.docs[0]['uid'] + 1 < 10) {
                          id = '$city-000${snapshot.data!.docs[0]['uid'] + 1}';
                        } else if (snapshot.data!.docs[0]['uid'] + 1 < 100) {
                          id = '$city-00${snapshot.data!.docs[0]['uid'] + 1}';
                        } else if (snapshot.data!.docs[0]['uid'] + 1 < 1000) {
                          id = '$city-0${snapshot.data!.docs[0]['uid'] + 1}';
                        } else {
                          id = '$city-${snapshot.data!.docs[0]['uid'] + 1}';
                        }

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              ('Your Id is : $id'),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Divider(
                              height: 25,
                              color: Colors.transparent,
                            ),
                            Center(
                              child: SizedBox(
                                width: screenWidth / 1.2,
                                height: screenHeight * 0.093,
                                child: TextFormField(
                                  controller: _password,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                      labelText: 'Please Enter Password',
                                      labelStyle:
                                          const TextStyle(color: Colors.black),
                                      fillColor: Colors.white38,
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        borderSide: const BorderSide(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: const BorderSide(
                                            color: Colors.blueAccent,
                                            width: 2.0,
                                          ))),
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                            const Divider(
                              height: 25,
                              color: Colors.transparent,
                            ),
                            Center(
                              child: SizedBox(
                                width: screenWidth / 1.2,
                                height: screenHeight * 0.093,
                                child: TextFormField(
                                  controller: _cpassword,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                      labelText: 'Confirm Password',
                                      labelStyle:
                                          const TextStyle(color: Colors.black),
                                      fillColor: Colors.white38,
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        borderSide: const BorderSide(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: const BorderSide(
                                            color: Colors.blueAccent,
                                            width: 2.0,
                                          ))),
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                // await FirebaseAuth.instance
                                //     .createUserWithEmailAndPassword(
                                //         email: 'noumanfaiz.369@gmail.com',
                                //         password: 'abcd1234')
                                //     .then((value) => FirebaseFirestore.instance
                                //             .collection('userinfo')
                                //             .doc(id.toString())
                                //             .set({
                                //           'id': id,
                                //           'uid': uid,
                                //           'city': city,
                                //           'name': name,
                                //           'phone': phoneNo,
                                //           'reg_date': Timestamp.fromDate(
                                //               DateTime.now()),
                                //         }));
                                await FirebaseFirestore.instance
                                    .collection('userinfo')
                                    .doc(id)
                                    .set({
                                  'id': id,
                                  'uid': uid,
                                  'city': 'city',
                                  'name': 'name',
                                  'phone': 'phoneNo',
                                  'reg_date':
                                      Timestamp.fromDate(DateTime.now()),
                                });
                                setState() {
                                  id = '';
                                  uid = null;
                                }
                              },
                              child: const Text('Submit Details'),
                            ),
                          ],
                        );
                      }
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              title: const Text("Data Confirmation"),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

Widget getTextField(String hintText, TextEditingController _controller) {
  return Center(
    child: SizedBox(
      width: screenWidth / 1.2,
      height: screenHeight * 0.093,
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(3),
            labelText: '    ' + hintText,
            labelStyle: const TextStyle(color: Colors.black),
            fillColor: Colors.white38,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Colors.blueGrey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  color: Colors.blueAccent,
                  width: 2.0,
                ))),
        style: const TextStyle(fontSize: 15),
      ),
    ),
  );
}
