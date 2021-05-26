import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internshala_make/data/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/applications_screen.dart';
import '../screens/wfh_internship_screen.dart';
import '../screens/complaint_screen.dart';
import '../screens/contact_us_screen.dart';
import '../screens/freshers_jobs_screen.dart';
import '../screens/Resume/(1_4)screen.dart';
import '../screens/internship_screen.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  UserModel userObject = UserModel();

  launchURL() async {
    const url =
        'https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstleyVEVO';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;

  @override
  void initState() {
    super.initState();
    initUser();
    print(user.photoURL);
  }

  initUser() async {
    user = _auth.currentUser;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return Drawer(
      child: Container(
          child: Column(
        children: [
          Container(
            color: Colors.blue,
            height: height * 0.25,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    IconButton(icon: Icon(Icons.arrow_back), onPressed: () {})
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.photoURL),
                        radius: 30,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          user.displayName == null ? 'Name' : user.displayName,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(user.email == null ? 'Email' : user.email),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rating'),
                      Text('Know more...'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.62,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => InternshipScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.mode_edit),
                      SizedBox(width: 15),
                      Text('Internships')
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print(userObject.name);
                    print(userObject.email);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => FreshersJobsScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.assignment),
                      SizedBox(width: 15),
                      Text('Fresher Jobs')
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            WfhInternshipScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.assignment),
                      SizedBox(width: 15),
                      Text('WFH Interships')
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ApplicationScreen(userObject),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.event_note),
                      SizedBox(width: 15),
                      Text('My Applications')
                    ],
                  ),
                ),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.mail),
                      SizedBox(width: 15),
                      Text('My Chats')
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ResumeDetailsFirstScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.assignment),
                      SizedBox(width: 15),
                      Text('Edit Resume')
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => launchURL(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.live_tv),
                      SizedBox(width: 15),
                      Text('Online Training')
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ContactUsScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 15),
                      Text('Contact Us')
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ComplaintScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.report),
                      SizedBox(width: 15),
                      Text('Report a complaint')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
