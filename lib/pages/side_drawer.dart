import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        leading: Icon(Icons.menu, color: Colors.white, size: 30),
        title: Text(
          "MY APP",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple[100],
        
      ),
      body: Center(
        child: Text(
          "Welcome to My App",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}