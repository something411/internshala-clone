import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/internship_model.dart';

class InternshipCard extends StatelessWidget {
  InternshipModel dummyAccept = InternshipModel();
  InternshipCard(this.dummyAccept);
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
                        Text(dummyAccept.companyName),
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
                  Icon(dummyAccept.isfromHome ? Icons.home : Icons.work),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                      dummyAccept.isfromHome ? 'Work from Home' : 'Office Job'),
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.monetization_on),
                      SizedBox(width: 2),
                      Text('₹${dummyAccept.internSalary.toString()}'),
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 2),
                      Text('${dummyAccept.duration.toString()} months'),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(dummyAccept.isFullTime ? 'Full-time Job' : 'Internship'),
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
