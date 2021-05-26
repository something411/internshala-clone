import 'package:flutter/material.dart';

class ResumeDetailsFourthScreen extends StatefulWidget {
  @override
  _ResumeDetailsFourthScreenState createState() =>
      _ResumeDetailsFourthScreenState();
}

class _ResumeDetailsFourthScreenState extends State<ResumeDetailsFourthScreen> {
  @override
  Widget build(BuildContext context) {
    String blogLink;
    String githubProfile;
    String devLink;
    String portfolioLink;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
              height: height * 0.125,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Icon(Icons.play_circle_outline, size: 45),
                  SizedBox(width: width * 0.025),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Work Sample',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: height * 0.005),
                      Text(
                        'Next: Start Applying',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(width: width * 0.4),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    onSaved: (newValue) {
                      setState(() {
                        blogLink = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1)),
                      labelText: 'Blog Link',
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    onSaved: (newValue) {
                      setState(() {
                        githubProfile = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1)),
                      labelText: 'GitHub Profile',
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    onSaved: (newValue) {
                      setState(() {
                        devLink = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1)),
                      labelText: 'Play Store A/C (Public Link)',
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    onSaved: (newValue) {
                      setState(() {
                        portfolioLink = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1)),
                      labelText: 'Behance Portfolio Link',
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 25),
                  Text('Accomplishments/ additional details',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 20),
                  Text(
                      'This text is supposed to tell you to add your stuff(rewards,recognitions) but Im too lazy so lol'),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.blue,
                      child: Text(
                        'Skip',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
