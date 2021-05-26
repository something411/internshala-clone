import 'package:flutter/material.dart';

class PhDScreen extends StatefulWidget {
  @override
  _PhDScreenState createState() => _PhDScreenState();
}

class _PhDScreenState extends State<PhDScreen> {
  List<int> yearsOne = [];
  List<int> yearsTwo = [];
  int startYear;
  int endYear;
  int groupValue;
  bool isPursuing = false;
  bool isCompleted = false;
  String collegeName;
  String stream;
  String performanceScale;
  String performance;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    groupValue = 0;
    yearIterator();
    yearIteratortwo();
    super.initState();
  }

  setSelectedRadio(int value) {
    setState(() {
      groupValue = value;
    });
  }

  //Iterator for start year
  @override
  yearIterator() {
    for (int i = 0; i < 42; i++) {
      yearsOne.add(i + 1980);
    }
  }

  //Iterator for expected year
  yearIteratortwo() {
    for (int i = 0; i < 47; i++) {
      yearsTwo.add(i + 1980);
    }
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PhD Details',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PhD status'),
                Row(
                  children: [
                    Radio(
                      groupValue: groupValue,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          isPursuing = true;
                          print(isPursuing);
                          setSelectedRadio(value);
                        });
                      },
                    ),
                    Text('Pursuing'),
                    Radio(
                      value: 2,
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          isCompleted = true;
                          setSelectedRadio(value);
                          print(isCompleted);
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                    Text('Completed'),
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'ERROR!';
                    }
                  },
                  onSaved: (newValue) {
                    setState(() {
                      collegeName = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    // border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    labelText: 'College',
                    alignLabelWithHint: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton(
                      items: yearsOne.map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        ); //DropMenuItem
                      }).toList(),
                      value: startYear,
                      onChanged: (newValue) {
                        setState(() {
                          startYear = newValue;
                          print("new$newValue");
                        }); //setState
                      },
                      //OnChange
                      isExpanded: false,
                      hint: Text(
                        'Start year',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    DropdownButton(
                      items: yearsTwo.map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        ); //DropMenuItem
                      }).toList(),
                      value: endYear,
                      onChanged: (newValue) {
                        setState(() {
                          endYear = newValue;
                          print("new$newValue");
                        }); //setState
                      },
                      //OnChange
                      isExpanded: false,
                      hint: Text(
                        isPursuing == true ? 'Expected End Year' : 'End Year',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'ERROR!';
                    }
                  },
                  onSaved: (newValue) {
                    setState(() {
                      stream = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    labelText: 'Stream',
                    alignLabelWithHint: true,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton(
                      items: <String>['CGPA (Out of 10)', 'CGPA (Out of 4)']
                          .map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      value: performanceScale,
                      onChanged: (value) {
                        setState(() {
                          performanceScale = value;
                        });
                      },
                      hint: Text('Perforamce Scale'),
                    ),
                    Container(
                      width: width * 0.4,
                      child: TextFormField(
                        onSaved: (newValue) {
                          setState(() {
                            performance = newValue;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1)),
                          labelText: 'Performance',
                          alignLabelWithHint: true,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        print(collegeName);
                      }
                      //Sending to Database
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
