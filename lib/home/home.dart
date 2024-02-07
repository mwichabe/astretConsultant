import 'package:astret/colors/colors.dart';
import 'package:astret/home/drawer/drawer.dart';
import 'package:astret/home/homeTabs/home.dart';
import 'package:astret/home/homeTabs/pastPapers/pastPapers.dart';
import 'package:astret/home/homeTabs/services.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            scrollDirection: Axis.horizontal, child: Text('ASTRET APP')),
      ),
      drawer: const NavigationDrawer_(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.transparent,
            width: 2.0,
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          selectedItemColor: AppColor.secondaryColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Academic \n Research',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'PaspPapers',
            ),
          ],
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
