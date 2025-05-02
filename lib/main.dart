import 'package:flutter/material.dart';
import 'package:test_app/pages/home_pages.dart';
import 'package:test_app/pages/login_page.dart';
import 'package:test_app/pages/profile_page.dart';
import 'package:test_app/pages/settings_page.dart';
import 'package:test_app/pages/side_drawer.dart';
import 'package:test_app/pages/stop_watch.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
const  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _navigationThrough(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    // HomePages(),
    HomePages(),
    // SettingsPage(),
    SettingsPage(),
    // ProfilePage(),
    ProfilePage(),
    // LoginPage(),
    LoginPage(),
    //StpWatch(),
    StopWatch(),
    //sideBar(),
    SideBar(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          backgroundColor: Colors.purple,
          onTap: _navigationThrough,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Login"),
            BottomNavigationBarItem(icon: Icon(Icons.access_time), label: "StopWatch"),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "SideBar"),
          ],
        ),
      ),
    );
  }
}
