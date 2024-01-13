import 'package:astret/colors/colors.dart';
import 'package:astret/home/drawer/drawer.dart';
import 'package:astret/home/homeTabs/home.dart';
import 'package:astret/home/homeTabs/pastPapers/pastPapers.dart';
import 'package:astret/home/homeTabs/services.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int friendRequestCount = 0;
  int unreadMessageCount = 0;

  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    // pages
    const MainHome(),
    const Services(),
    const PastPapers(),
  ];
  // final User? currentUser = FirebaseAuth.instance.currentUser;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('Antonios Sports Lounge')),
      ),
      drawer: const NavigationDrawer_(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        selectedItemColor: AppColor.secondaryColor,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.building_2_fill),
            label: 'Services',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.pause_presentation),
            label: 'PaspPapers',
          ),
        ],
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
