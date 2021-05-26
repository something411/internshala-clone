import 'package:flutter/material.dart';

import './(4_4)screen.dart';

class ResumeDetailsThirdScreen extends StatefulWidget {
  @override
  _ResumeDetailsThirdScreenState createState() =>
      _ResumeDetailsThirdScreenState();
}

class _ResumeDetailsThirdScreenState extends State<ResumeDetailsThirdScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List skills = [];

    return Scaffold(
      body: Column(
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
                      'Education',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: height * 0.005),
                    Text(
                      'Next: Experience',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                SizedBox(width: width * 0.48),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResumeDetailsFourthScreen(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(3),
            child: Column(
              children: [
                Text(
                    'Include atleast 3-5 of your top skills to help your application stand out'),
                SizedBox(height: 20),
                DropdownButtonFormField(
                  decoration: InputDecoration.collapsed(hintText: ''),
                  isExpanded: true,
                  onTap: () {},
                  items: <String>[
                    'Chaatna',
                    'Gossiping',
                    'Microsoft Office',
                    'Chugal khori',
                    'Video Editing',
                    'Others'
                  ].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      skills.add(value);
                    });
                  },
                  hint: Text('Choose skill'),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.blue,
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
