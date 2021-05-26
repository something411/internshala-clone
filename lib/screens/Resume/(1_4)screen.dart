import 'package:flutter/material.dart';
import 'package:internshala_make/screens/Resume/diploma_screen.dart';

import 'package:internshala_make/screens/Resume/graduation_screen.dart';
import 'package:internshala_make/screens/Resume/(2_4)screen.dart';
import 'package:internshala_make/screens/Resume/phd_screen.dart';
import 'package:internshala_make/screens/Resume/secondary_screen.dart';
import 'package:internshala_make/screens/Resume/senior_secondary_screen.dart';

class ResumeDetailsFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<String> educationLevel = [
      'Graduation',
      'XII(senior secondary) ',
      'X(secondary)',
      'Post Graduation',
      'Diploma',
      'PhD '
    ];

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
                SizedBox(width: width * 0.4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResumeDetailsSecondScreen(),
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
            height: height * 0.7,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          switch (index) {
                            case 0:
                              return GraduationScreen();
                              break;
                            case 1:
                              return SeniorSecondaryScreen();
                              break;
                            case 2:
                              return SecondaryScreen();
                              break;
                            case 3:
                              return GraduationScreen();
                              break;
                            case 4:
                              return DiplomaScreen();
                              break;
                            case 5:
                              return PhDScreen();
                              break;
                          }
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
                    padding: const EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${educationLevel[index]} details'),
                          Icon(Icons.add),
                        ]),
                  ),
                );
              },
              itemCount: educationLevel.length,
              separatorBuilder: (context, index) => SizedBox(height: 5),
            ),
          )
        ],
      ),
    );
  }
}
