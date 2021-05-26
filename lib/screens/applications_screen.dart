import 'package:flutter/material.dart';
import 'package:internshala_make/data/user_model.dart';
import 'package:internshala_make/services/auth.dart';

import 'package:internshala_make/widget/drawer.dart';
import '../services/auth.dart';

class ApplicationScreen extends StatefulWidget {
  @override
  _ApplicationScreenState createState() => _ApplicationScreenState();

  ApplicationScreen(UserModel result);
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.person),
            label: Text('Logout'),
          ),
        ],
        title: Text(
          'My Applications',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text(
          'LMAO loser!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
