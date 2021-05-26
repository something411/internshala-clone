import 'package:flutter/material.dart';

import '../screens/company_description_screen.dart';
import '../widget/app_bar.dart';
import '../widget/internship_card.dart';
import '../widget/drawer.dart';
import '../data/dummy_data.dart';

class InternshipScreen extends StatefulWidget {
  @override
  _InternshipScreenState createState() => _InternshipScreenState();
}

class _InternshipScreenState extends State<InternshipScreen> {
  DummyData dummyObj = DummyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: ListView.separated(
        itemBuilder: (ctx, int i) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        CompanyDescriptionScreen(dummyObj.DUMMY_LIST[i]),
                  ),
                );
              },
              child: InternshipCard(dummyObj.DUMMY_LIST[i]));
        },
        itemCount: dummyObj.DUMMY_LIST.length,
        separatorBuilder: (context, index) => SizedBox(height: 5),
      ),
    );
  }
}
