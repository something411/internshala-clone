import 'package:flutter/material.dart';

import '../widget/drawer.dart';
import '../widget/company_description.dart';
import '../widget/internship_card.dart';
import '../data/internship_model.dart';

class CompanyDescriptionScreen extends StatelessWidget {
  InternshipModel dummyAccept = InternshipModel();

  CompanyDescriptionScreen(this.dummyAccept);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Job Description",
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          InternshipCard(dummyAccept),
          SizedBox(
            height: 10,
          ),
          CompanyDescription(dummyAccept),
        ],
      ),
    );
  }
}
