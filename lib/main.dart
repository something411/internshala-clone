import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:internshala_make/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:internshala_make/data/user_model.dart';
import 'package:internshala_make/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Internshala(),
    debugShowCheckedModeBanner: false,
  ));
}

class Internshala extends StatefulWidget {
  @override
  _InternshalaState createState() => _InternshalaState();
}

class _InternshalaState extends State<Internshala> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
