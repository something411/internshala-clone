import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class Address extends StatelessWidget {
  static Future<void> openBakerMap(address) async {
    String query = Uri.encodeComponent(address);
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${query}';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.3,
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
                'Address',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('221B Baker Street England	Greater London-NW1'),
              Text(
                'Our working hours: Monday to Friday',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'PS. We wont be there when you actually need us',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RaisedButton(
                onPressed: () => openBakerMap('The Sherlock Holmes Museum'),
                color: Colors.blue,
                child: Text(
                  'View in Google Maps',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
