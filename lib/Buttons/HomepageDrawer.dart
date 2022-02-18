import 'package:gymtogym/Services/authController.dart';
import 'package:gymtogym/main.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class HomepageDrawer extends StatelessWidget {
  const HomepageDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: dHeader,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2018/09/12/12/14/man-3672010__340.jpg'),
                    backgroundColor: Colors.blueGrey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'User ID:  LHR-0006',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white),
                      ),

                      Text(
                        '\nUser Name: Usama Iqbal',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white),
                      ),

                    ],
                  ),
                ],
              )),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.deepOrange,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.edit_outlined, color: Colors.deepOrange),
            title: Text(
              "Edit Info",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.quick_contacts_dialer_rounded,
                color: Colors.deepOrange),
            title: const Text(
              "Contact Us,",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline, color: Colors.deepOrange),
            title: const Text(
              "Help",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.more_sharp, color: Colors.deepOrange),
            title: const Text(
              "About",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.deepOrange),
            title: const Text(
              "LogOut",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            onTap: () {
              AuthController.authInstance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
