import 'package:flutter/material.dart';

class PorScreen extends StatefulWidget {
  @override
  _PorScreenState createState() => _PorScreenState();
}

class _PorScreenState extends State<PorScreen> {
  String por;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'POR details',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
                'If you have been/ are an active part of socities, conducted any events or lef a team, add details here'),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1)),
              width: double.infinity,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    por = value;
                  });
                },
                decoration: InputDecoration.collapsed(hintText: 'Description'),
                maxLines: 4,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
