import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController();
  final _passWordController = TextEditingController();

  String? _usernameError;
  String? _passwordError;

  bool isPasswordValidation(String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]',
    ).hasMatch(password);
  }

  void _validation() {
    String username = _userNameController.text.trim();
    String password = _passWordController.text;
setState(() {
   _usernameError =
        username.isEmpty && username.length > 6 ? "Username must be at least 6 charcters" : null;
    _passwordError =
        password.length < 6 && !isPasswordValidation(password)
            ? "Password must be at least 6 characters and contain at least one uppercase letter, one lowercase letter, one number, and one special character"
            : null;
});
    if (_usernameError == null && _passwordError == null) {
      // Proceed with login
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login is Successfull!")));
    }
    else{
      // Show error message
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login is Unsuccessfull!")));
    }
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _userNameController.clear();
        _passWordController.clear();
        _usernameError = null;
        _passwordError = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login page",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                  labelText: "Enter your Name",
                  errorText: _usernameError,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passWordController,
                decoration: InputDecoration(
                  labelText: "Enter your Password",
                  errorText: _passwordError,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
