import 'package:flutter/material.dart';
import 'package:internshala_make/screens/authenticate/login_screen.dart';
import 'package:internshala_make/screens/authenticate/regsiter_screen.dart';

class AuthenticateScreen extends StatefulWidget {
  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  bool showSignIn = false;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
