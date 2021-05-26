import 'package:flutter/material.dart';

import '../widget/drawer.dart';
import '../widget/address.dart';
import '../widget/help_center.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Contact Us',
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HelpCenter(),
          Address(),
          Container(
            height: height * 0.17,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.grey[100],
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  'Due to COVID-19, we are working from home and hence ourt office would remain closed. You can continue to reach us via Help Center(above), emails, and calls as usual.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
          )
        ],
      ),

      //3 widgets,
    );
  }
}
