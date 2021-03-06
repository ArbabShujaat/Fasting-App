import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastingApp/Auth/Register.dart';
import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/images.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:fastingApp/models/models.dart';
import 'package:fastingApp/screens/Introduction-screens/plan_selection.dart';
import 'package:fastingApp/screens/tabs_view/tab_views.dart';
import 'package:fastingApp/widgets/appbar.dart';
import 'package:fastingApp/widgets/picker_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'goals.dart';
import 'fasting_time.dart';
import 'summary.dart';

class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  int page = 0;
  bool _isLoading = false;
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset(Images.intro1),
        title: 'The Newest Health and\n Wellness App',
        body:
            "To make your own fasting plan, we'd prefer to become acquainted with you better. your information will stay private.\n\nFast with your friends, share your fast, get motivated and complete challanges along with your buddies\n\nFasting has been shown to have many health benefits, from increased weight loss to better brain function.Promotes Better Health by Fighting Inflammation",
        decoration: const PageDecoration(
            bodyTextStyle:
                TextStyle(fontSize: 18.0, color: AppColors.lightPurple),
            titleTextStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
      PageViewModel(
        title: 'What can we help you \n accomplish?',
        bodyWidget: Container(
          padding: EdgeInsets.all(05),
          // color: Colors.green,

          child: Goals(),
        ),
        decoration: const PageDecoration(
            bodyTextStyle: TextStyle(fontSize: 15.0),
            titleTextStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
      PageViewModel(
        title: 'What, when, and how\nmuch we eat matters',
        bodyWidget: FastingTime(),
        decoration: const PageDecoration(
            bodyTextStyle: TextStyle(fontSize: 16.0, color: Color(0xff3F5261)),
            titleTextStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
      PageViewModel(
        title: "",
        bodyWidget: PlanSelection(),
        decoration: const PageDecoration(
            bodyTextStyle: TextStyle(fontSize: 16.0, color: Color(0xff3F5261)),
            titleTextStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
      PageViewModel(
        title: 'You' 're ready to get\n    started!',
        image: Image.asset(
          'assets/images/summary-image.png',
          scale: 1.5,
        ),
        bodyWidget: Summary(),
        decoration: const PageDecoration(
            bodyTextStyle: TextStyle(fontSize: 16.0, color: Color(0xff3F5261)),
            titleTextStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(text: 'Welcome to fasting'),
        body: IntroductionScreen(
          pages: getPages(),
          dotsDecorator: DotsDecorator(
              color: AppColors.pink, activeColor: AppColors.darkBlue),
          onDone: () {},
          next: const Icon(Icons.navigate_next),
          done: Container(
            child: _isLoading
                ? CircularProgressIndicator()
                : RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(20)),
                    onPressed: () async {
                      print(2);
                      print(2);
                      setState(() {
                        _isLoading = true;
                      });
                      var prefs = await SharedPreferences.getInstance();
                      final userData = json.encode(
                        {
                          'userEmail': user.email,
                          'userUid': user.uid,
                          'password': passwordController.text,
                        },
                      );
                      prefs.setString('userData', userData);

                      List<String> likes = [""];

                      Firebase.initializeApp();
                      await FirebaseFirestore.instance.collection("Users").add({
                        'email': emailController.text,
                        'name': fullnameController.text,
                        'useruid': user.uid,
                        'userimage': imageUrl,
                        'fastEndTime': endTime,
                        'fastStartTime': startTime,
                        'goals': selectGoals,
                        'fastType': fastType,
                        'active': false,
                        'userWeight': "0",
                        "fastingHour": '0',
                        'currentTime': '0',
                        'fastingHoursLeft': "0",
                        'fastStartedAt': DateTime.now().toString()
                      });
                      print(3);
                      try {
                        await FirebaseFirestore.instance
                            .collection("Users")
                            .where("email", isEqualTo: emailController.text)

                            // ignore: deprecated_member_use
                            .getDocuments()
                            .then((value) => {
                                  userDetails = UserDetails(
                                    userEmail: value.documents[0]["email"],
                                    userUid: value.documents[0]["useruid"],
                                    username: value.documents[0]["name"],
                                    active: value.documents[0]['active'],
                                    userpic: value.documents[0]["userimage"],
                                    fastStartedAt: value.documents[0]
                                        ["fastStartedAt"],
                                    fastingHour: value.documents[0]
                                        ["fastingHour"],
                                    fastingHoursLeft: value.documents[0]
                                        ["fastingHoursLeft"],
                                    userWeight: value.documents[0]
                                        ["userWeight"],
                                    fastType: value.documents[0]["fastType"],
                                    docid: value.documents[0].documentID,
                                    fastEndTime: value.documents[0]
                                            ["fastEndTime"]
                                        .toString(),
                                    fastStartTime: value.documents[0]
                                            ["fastStartTime"]
                                        .toString(),
                                    goals: value.documents[0]["goals"],
                                  )
                                });
                      } catch (e) {
                        print(e);
                      }
                      setState(() {
                        _isLoading = false;
                      });
                      AppRoutes.makeFirst(context, TabsScreen());
                    },
                    color: AppColors.darkBlue,
                    textColor: Colors.white,
                    child: Text('Start'),
                  ),
          ),
          showNextButton: true,
        ));
  }
}
