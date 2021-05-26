import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/internship_model.dart';

class JobCard extends StatelessWidget {
  InternshipModel dummyAccept = InternshipModel();
  JobCard(this.dummyAccept);
  var dateformat = DateFormat('dd MMM');

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: height * 0.22,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          dummyAccept.jobDescription,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          dummyAccept.companyName,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.11,
                    width: width * 0.22,
                    child: Image.asset(dummyAccept.image),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(
                    width: 3,
                  ),
                  Text('Location'),
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.monetization_on),
                      SizedBox(width: 2),
                      Text('₹${dummyAccept.jobSalary.toString()}'),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.grey[200],
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        'Fresher Job',
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.hourglass_empty),
                      Text(
                          'Apply by ${dateformat.format(dummyAccept.deadline)}'),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
