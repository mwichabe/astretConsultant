import 'package:astret/home/home.dart';
import 'package:astret/login/logIn.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NavigationDrawer_ extends StatefulWidget {
  const NavigationDrawer_({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer_> createState() => _NavigationDrawer_State();
}

class _NavigationDrawer_State extends State<NavigationDrawer_> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              accountName: Text('your name will be here',
                  //'${loggedInUser.yourName}',
                  style: const TextStyle(color: Colors.white)),
              accountEmail: Text('your email',
                  //'${loggedInUser.email}',
                  style: const TextStyle(color: Colors.white)),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70,
                child: ClipOval(
                  child: GestureDetector(
                    child: CachedNetworkImage(
                      imageUrl: //loggedInUser.profilePictureUrl ??
                          '',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.person,
                        color: Colors.indigo,
                        size: 20,
                      ),
                      fit: BoxFit.cover,
                      width: 140,
                      height: 140,
                    ),
                  ),
                ),
              )),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home())),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: const Text('Profile', style: TextStyle(color: Colors.white)),
            /*onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Profile())
                ),*/
          ),
          ListTile(
            leading: const Icon(Icons.people, color: Colors.white),
            title: const Text('Friends', style: TextStyle(color: Colors.white)),
            /*onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Friends())
                ),*/
          ),
          ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title:
                  const Text('Log out', style: TextStyle(color: Colors.white)),
              onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirm Logging Out'),
                        content:
                            const Text('Are you sure you want to proceed?'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LogIn()));

                              // Navigate to the login screen
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )),
          const Divider(
            height: 10,
            color: Colors.grey,
          ),
          ListTile(
              leading: Icon(Icons.delete, color: Colors.red[400]),
              title: const Text('Delete Account',
                  style: TextStyle(color: Colors.white)),
              onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirm Deleting Account'),
                        content:
                            const Text('Are you sure you want to proceed?'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              //TO DO
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )),
        ],
      ),
    );
  }
}