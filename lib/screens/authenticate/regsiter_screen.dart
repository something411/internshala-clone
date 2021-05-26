import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:internshala_make/data/user_model.dart';
import 'package:internshala_make/screens/applications_screen.dart';

import 'package:internshala_make/services/auth.dart';
import 'package:internshala_make/widget/loading.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  AuthService _auth = AuthService();
  UserModel userObject = UserModel();

  String error = '';
  bool isLoading = false;
  bool isImagePicked = false;

  Future selectImage() async {
    final _image = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      userObject.image = File(_image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text('Sign Up'),
            ),
            drawer: null,
            body: Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(3),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text('Register using Email'),
                    SizedBox(height: 10),
                    userObject.image == null
                        ? SizedBox(height: 0)
                        : Container(
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor: Color(0xffFDCF09),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.file(
                                  userObject.image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 10),
                    TextFormField(
                      validator: (value) => value.isEmpty ? 'ERROR!' : null,
                      onChanged: (newValue) {
                        setState(() {
                          userObject.name = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1)),
                        labelText: 'Name',
                        alignLabelWithHint: true,
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      obscureText: true,
                      validator: (value) => value.isEmpty ? 'ERROR!' : null,
                      onChanged: (newValue) {
                        setState(() {
                          userObject.email = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1)),
                        labelText: 'E-Mail ID',
                        alignLabelWithHint: true,
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      obscureText: true,
                      validator: (value) => value.length < 6
                          ? 'Password is as short as your dick'
                          : null,
                      onChanged: (newValue) {
                        setState(() {
                          userObject.password = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1)),
                        labelText: 'Password',
                        alignLabelWithHint: true,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      child: OutlineButton.icon(
                        onPressed: () async {
                          selectImage();
                        },
                        icon: Icon(Icons.camera),
                        label: Text('Add profile picture'),
                        shape: StadiumBorder(
                          side: BorderSide(width: 10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formkey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            FirebaseStorage fs = FirebaseStorage.instance;
                            Reference rootRefernce = fs.ref();
                            Reference profilePicture = rootRefernce
                                .child('pictures')
                                .child('${userObject.name}');
                            profilePicture.putFile(userObject.image);
                            dynamic result =
                                await _auth.registeredWithEmailAndPassword(
                                    userObject.email, userObject.password);
                            if (result == null) {
                              setState(() {
                                error = 'Supply valid email';
                                isLoading = false;
                              });
                            } else {
                              Navigator.pop(context);
                            }
                          }
                        },
                        child: Text('Sign Up'),
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      error,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
