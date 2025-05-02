import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  String appBarTitle = "Welcome ";
  final TextEditingController _controller = TextEditingController();

  void _updateTitle() {
    setState(() {
      appBarTitle =
          _controller.text.trim().isNotEmpty
              ? "Hello ${_controller.text}"
              : "welcome";
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
        backgroundColor: Colors.purple,
        centerTitle: true,
        
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Enter your name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),

              ),
              SizedBox(height: 20,),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "ANYTHING YOU WANT",

                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton.icon(onPressed: _updateTitle, label: Text("Update the AppBar",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              )
            ],

          ),
        ),
      ),
    );
  }
}
