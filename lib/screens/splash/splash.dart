import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastingApp/Auth/LoginScreen.dart';
import 'package:fastingApp/constants/images.dart';
import 'package:fastingApp/models/models.dart';
import 'package:fastingApp/screens/Introduction-screens/intro-screen.dart';
import 'package:fastingApp/screens/tabs_view/tab_views.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      var prefs = await SharedPreferences.getInstance();

      if (prefs.containsKey("userData")) {
        final extractedUserData =
            json.decode(prefs.getString('userData')) as Map<String, Object>;

        await FirebaseFirestore.instance
            .collection("Users")
            .where("email", isEqualTo: extractedUserData['userEmail'])

            // ignore: deprecated_member_use
            .getDocuments()
            .then((value) => {
                  userDetails = UserDetails(
                    userEmail: value.documents[0]["email"],
                    userUid: value.documents[0]["useruid"],
                    username: value.documents[0]["name"],
                    fastStartedAt: value.documents[0]["fastStartedAt"],
                    userpic: value.documents[0]["userimage"],
                    fastingHour: value.documents[0]["fastingHour"],
                    fastingHoursLeft: value.documents[0]["fastingHoursLeft"],
                    docid: value.documents[0].documentID,
                    fastEndTime: value.documents[0]["fastEndTime"].toString(),
                    active: value.documents[0]["active"],
                    fastStartTime:
                        value.documents[0]["fastStartTime"].toString(),
                    goals: value.documents[0]["goals"],
                    fastType: value.documents[0]["fastType"],
                    userWeight: value.documents[0]["userWeight"],
                  )
                });

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => TabsScreen()));
      } else
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.background,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            Images.splash,
            fit: BoxFit.cover,
          )),
    );
  }
}
