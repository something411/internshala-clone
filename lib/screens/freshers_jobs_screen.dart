import 'package:flutter/material.dart';

import '../widget/job_card.dart';
import '../widget/drawer.dart';
import '../data/dummy_data.dart';

class FreshersJobsScreen extends StatelessWidget {
  final DummyData dummyObj = DummyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Freshers Jobs',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      drawer: MyDrawer(),
      body: ListView.separated(
        itemBuilder: (ctx, int i) {
          return GestureDetector(
            onTap: () {},
            child: JobCard(dummyObj.DUMMY_LIST[i]),
          );
        },
        itemCount: dummyObj.DUMMY_LIST.length,
        separatorBuilder: (context, index) => SizedBox(height: 5),
      ),
    );
  }
}
