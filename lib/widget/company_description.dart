import 'dart:math';

import 'package:flutter/material.dart';

import '../data/internship_model.dart';

class CompanyDescription extends StatelessWidget {
  InternshipModel dummyAccept = InternshipModel();

  CompanyDescription(this.dummyAccept);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Be an early applicant',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic),
              ),
              Icon(Icons.share),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'About ${dummyAccept.companyName}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          //share link
          SizedBox(height: 14),
          Text(
              '${dummyAccept.companyName} was founded to probably do good shit but oh well.. The world is unfair and people are jerks so yeah. To the board of directors, you probably dont matter dont think too much about not getting the job or lets say... getting fired? Say it one more time! The world is unfair and people are jerks so yeah. To the board of directors, you probably dont matter dont think too much about not getting the job or lets say... getting fired?'),
          SizedBox(height: 16),
          Text(
            'About the Internship',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 14),
          Text(
              'The world is unfair and people are jerks so yeah. To the board of directors, you probably dont matter dont think too much about not getting the job or lets say... getting fired? Say it one more time! The world is unfair and people are jerks so yeah. To the board of directors, you probably dont matter dont think too much about not getting the job or lets say... getting fired'),
          SizedBox(height: 16),
          Text(
              'The world is unfair and people are jerks so yeah. To the board of directors, you probably dont matter dont think too much about not getting the job or lets say... getting fired? Say it one more time! The world is unfair and people are jerks so yeah. To the board of directors, you probably dont matter dont think too much about not getting the job or lets say... getting fired'),
          SizedBox(height: 14),
          Text(
            'Skills required',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
              'Being a prick, Office politics(probably), Chai-coffee, Procrastination'),
          SizedBox(height: 14),
          Text(
            'No. of openings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(Random.secure().nextInt(10).toString()),
          Text('Perks',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 14),
          Text(
              'Certificate(to make others feel miserable and feel like shit), Letter of Recommendation(which shows youve done something), Flexible working hours(my ass)'),
          SizedBox(height: 16),
          RaisedButton(
            onPressed: () {},
            child: Center(
              child: Text('Apply Now!'),
            ),
            color: Colors.blue[700],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              color: Colors.yellow[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Save yourself from farud!',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'If an employer asks you to pay any security deposit, registration fee, laptop fee, etc. Do not pay and notify us immediately. Remember Internshala doesnt charge a fee from the students to apply to a job or an internship and we dont allow companies to do so either.(lol)',
                      style: TextStyle(color: Colors.brown),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
