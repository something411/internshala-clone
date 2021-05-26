import 'package:flutter/material.dart';

import '../screens/company_description_screen.dart';
import '../widget/internship_card.dart';
import '../widget/drawer.dart';
import '../data/dummy_data.dart';

class WfhInternshipScreen extends StatelessWidget {
  final DummyData dummyObj = DummyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Interships',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      drawer: MyDrawer(),
      body: ListView.separated(
        itemBuilder: (ctx, int i) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CompanyDescriptionScreen(dummyObj.DUMMY_LIST[i]),
                  ),
                );
              },
              child: dummyObj.DUMMY_LIST[i].isfromHome == true
                  ? InternshipCard(dummyObj.DUMMY_LIST[i])
                  : SizedBox(height: 0));
        },
        itemCount: dummyObj.DUMMY_LIST.length,
        separatorBuilder: (context, index) => SizedBox(height: 5),
      ),
    );
  }
}
