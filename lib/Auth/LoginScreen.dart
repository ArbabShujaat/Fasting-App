import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/images.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:fastingApp/models/models.dart';
import 'package:fastingApp/screens/tabs_view/tab_views.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'Register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  double _height;
  double _width;
  double _pixelRatio;
  String adminEmail = '';
  String adminPassword = '';
  bool loginLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
            key: _key,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 80.0,
                  ),
                  Image.asset(
                    "assets/images/icon.png",
                    height: 200,
                    width: 200,
                  ),
                  Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: new Theme(
                            data: new ThemeData(
                              primaryColor: Colors.black,
                              primaryColorDark: Colors.black,
                            ),
                            child: TextFormField(
                              controller: emailController,
                              textAlign: TextAlign.center,
                              decoration: new InputDecoration(
                                hintText: "Enter Your Email",
                                hintStyle: TextStyle(
                                  color: AppColors.darkBlue,
                                ),
                                fillColor: AppColors.darkBlue,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.length == 0) {
                                  return "Email cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: new TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                              ),
                            )),
                      )),
                  Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: new Theme(
                            data: new ThemeData(
                              primaryColor: Colors.black,
                              primaryColorDark: Colors.black,
                            ),
                            child: TextFormField(
                              obscureText: _obscureText,
                              controller: passwordController,
                              textAlign: TextAlign.center,
                              decoration: new InputDecoration(
                                suffixIcon: GestureDetector(
                                    onTap: _toggle,
                                    child: new Icon(_obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility)),
                                hintText: "    Enter Your Password",
                                hintStyle: TextStyle(color: AppColors.darkBlue),
                                fillColor: AppColors.darkBlue,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                              validator: (val) {
                                if (val.length == 0) {
                                  return "Password cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: new TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                              ),
                            )),
                      )),
                  button(),
                  SizedBox(
                    height: 10.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text("Create Your Account Here",
                        style:
                            TextStyle(color: AppColors.darkBlue, fontSize: 18)),
                  )
                ],
              ),
            )));
  }

  Widget button() {
    return loginLoading
        ? CircularProgressIndicator()
        : MaterialButton(
            shape: StadiumBorder(),
            height: 50,
            minWidth: 250,
            onPressed: () async {
              if (_key.currentState.validate()) {
                setState(() {
                  loginLoading = true;
                });

                try {
                  final User user = (await _auth.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  ))
                      .user;

                  if (user != null) {
                    var prefs = await SharedPreferences.getInstance();
                    final userData = json.encode(
                      {
                        'userEmail': user.email,
                        'userUid': user.uid,
                        'password': passwordController.text,
                      },
                    );
                    prefs.setString('userData', userData);

                    await FirebaseFirestore.instance
                        .collection("Users")
                        .where("email", isEqualTo: user.email)

                        // ignore: deprecated_member_use
                        .getDocuments()
                        .then((value) => {
                              userDetails = UserDetails(
                                userEmail: value.documents[0]["email"],
                                userUid: value.documents[0]["useruid"],
                                username: value.documents[0]["name"],
                                userpic: value.documents[0]["userimage"],
                                fastingHour: value.documents[0]["fastingHour"],
                                fastStartedAt: value.documents[0]
                                    ["fastStartedAt"],
                                docid: value.documents[0].documentID,
                                fastEndTime: value.documents[0]["fastEndTime"]
                                    .toString(),
                                fastStartTime: value.documents[0]
                                        ["fastStartTime"]
                                    .toString(),
                                goals: value.documents[0]["goals"],
                                fastType: value.documents[0]["fastType"],
                                userWeight: value.documents[0]["userWeight"],
                                fastingHoursLeft: value.documents[0]
                                    ["fastingHoursLeft"],
                                active: value.documents[0]['active'],
                              )
                            });

                    print("hi");

                    AppRoutes.makeFirst(context, TabsScreen());
                  }
                  setState(() {
                    loginLoading = false;
                  });
                } catch (signUpError) {
                  setState(() {
                    loginLoading = false;
                  });

                  if (true) {
                    if (signUpError.code == 'ERROR_INVALID_EMAIL') {
                      showDialog(
                          context: context,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(
                                  color: Colors.red,
                                )),
                            title: Text("Incorrect Email"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text(
                                  "OK",
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ));
                    } else if (signUpError.code == 'ERROR_WRONG_PASSWORD') {
                      showDialog(
                          context: context,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(
                                  color: Colors.red,
                                )),
                            title: Text("Wrong Password"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text(
                                  "OK",
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ));
                    } else if (signUpError.code == 'ERROR_USER_NOT_FOUND') {
                      showDialog(
                          context: context,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(
                                  color: Colors.red,
                                )),
                            title: Text("No user exists"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text(
                                  "OK",
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ));
                    } else {
                      showDialog(
                          context: context,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(
                                  color: Colors.red,
                                )),
                            title: Text(signUpError.message),
                            actions: <Widget>[
                              FlatButton(
                                child: Text(
                                  "OK",
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ));
                    }
                  }
                }
              }
            },
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontFamily: "Poppins"),
            ),
            color: AppColors.lavander,
          );
  }

  Widget _textInput({controller, hint, icon}) {
    return Container(
      // height: 60,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.red)),
      ),
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: TextFormField(
        controller: controller,
        validator: (String val) {
          if (val.isEmpty) {
            return hint + ' must not be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
