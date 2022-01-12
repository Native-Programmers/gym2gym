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
                    children: const [
                      Text(
                        'User ID:',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'User Name:',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              )),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.edit_outlined),
            title: Text("Edit Info"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Setting"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.quick_contacts_dialer_rounded),
            title: const Text("Contact Us"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text("Help"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.more_sharp),
            title: const Text("About"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("LogOut"),
            onTap: () {
              AuthController.authInstance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
