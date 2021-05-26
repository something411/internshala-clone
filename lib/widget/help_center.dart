import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.23,
      width: double.infinity,
      child: Card(
        color: Colors.grey[100],
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Students - Internships & Jobs',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  'For internships and jobs relted queries, visit Student Help Center'),
              RaisedButton(
                color: Colors.blue,
                onPressed: () => launch('tel://+914098765432'),
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
