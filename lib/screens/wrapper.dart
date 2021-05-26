import 'package:flutter/material.dart';
import 'package:internshala_make/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

import '../data/user_model.dart';
import 'authenticate/login_screen.dart';
import '../screens/applications_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    print(user);

    //Return either home or log in screen
    if (user == null) {
      return LoginScreen();
    } else {
      return ApplicationScreen(user);
    }
  }
}
