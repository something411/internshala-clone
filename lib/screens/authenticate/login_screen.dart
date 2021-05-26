import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internshala_make/screens/authenticate/regsiter_screen.dart';
import 'package:internshala_make/services/auth.dart';
import 'package:internshala_make/widget/drawer.dart';
import 'package:internshala_make/widget/loading.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  String error = '';
  bool isLoading = false;

  final _formkey = GlobalKey<FormState>();
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text('Login'),
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
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.grey[100],
                        onPressed: () async {
                          dynamic result = await _auth.signInWithGoogle();
                          if (result == null) {
                            setState(() {
                              error =
                                  'Could not sign in with those credentials';
                              isLoading = false;
                            });
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                child: Image.asset(
                                  'lib/assets/images/google.jpeg',
                                  fit: BoxFit.fill,
                                )),
                            SizedBox(width: 3),
                            Text(
                              'Login with Google',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Or Login using Email'),
                    SizedBox(height: 10),
                    TextFormField(
                      validator: (value) => value.isEmpty ? 'ERROR!' : null,
                      onChanged: (newValue) {
                        setState(() {
                          email = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1)),
                        labelText: 'Email - ID',
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
                          password = newValue;
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
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formkey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            print('valid');
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error =
                                    'Could not sign in with those credentials';
                                isLoading = false;
                              });
                            }
                          }
                        },
                        child: Text('Login'),
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () async {
                          dynamic result = await _auth.signInAnon();
                          if (result == null) {
                            print('ERROR!');
                          } else {
                            print(result.uid);
                          }
                        },
                        child: Text('Sign In Anonymously'),
                        color: Colors.blueGrey,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Not Registered?'),
                        SizedBox(width: 3),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
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
