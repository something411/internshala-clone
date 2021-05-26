import 'package:flutter/material.dart';

class ComplaintScreen extends StatefulWidget {
  @override
  _ComplaintScreenState createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  String noc = "Nature Of Complain";
  String complaint = "";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report a complaint',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Hello Mike, we are here to help you!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 22),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1)),
                width: double.infinity,
                child: DropdownButtonFormField(
                  decoration: InputDecoration.collapsed(hintText: ''),
                  isExpanded: true,
                  onTap: () {},
                  items: <String>[
                    'Account/Profile',
                    'Find Internships & Jobs',
                    'My Applications',
                    'Report a complaint',
                    'Technical Issue',
                    'Others'
                  ].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  // value: noc,
                  onChanged: (value) {
                    setState(() {
                      noc = value;
                    });
                  },
                  hint: Text('Nature of complaint'),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1)),
                width: double.infinity,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      complaint = value;
                    });
                  },
                  decoration: InputDecoration.collapsed(
                      hintText: 'Type your complaint here'),
                  maxLines: 10,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.attach_file,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 3),
                  Text(
                    'Attachment',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {},
                  child: Text('Send', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 15),
              Text(
                  'We will get back to you within 48 to 72 hours. Thank you for your patience.'),
              SizedBox(height: 20),
              Text(
                  'If you still need any further assistance:\n Call us: +91-1234567890\n Working hours: Monday to Friday (totally not gonna ignore when you need us the most)'),
            ],
          ),
        ),
      ),
    );
  }
}
