import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/images.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:fastingApp/widgets/dropbox.dart';
import 'package:fastingApp/widgets/input.dart';
import 'package:flutter/material.dart';

import 'coach2.dart';

class Coach1 extends StatefulWidget {
  @override
  _Coach1State createState() => _Coach1State();
}

class _Coach1State extends State<Coach1> {
  List<String> opt = [
    'Motives For Fasting ?',
    'Manage weight',
    'Improve Health',
    'Improve Mental Clarity',
    'Gut rest',
    'Live longer',
  ];
  List<String> longestFast = [
    'Longest Fast',
    'Up to 18 hours',
    '19-23 hours',
    '24-36 hours',
    '36 hours or more',
  ];
  List<String> level = [
    'How might you portray your fasting practice?',
    'Beginner',
    'Intermediate',
    'Advanced',
    'Expert',
  ];
  List<String> routine = [
    'What sort of fasting routine are you generally inspired by ?',
    'Beginner',
    'Intermediate',
    'Advanced',
    'Expert',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fill in the Form'),
        flexibleSpace: Container(
            decoration: BoxDecoration(gradient: AppColors.barGradient)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15.0),
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                Images.exercise,
                scale: 5,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '\nThis data assist us with meeting you where you are, so we can pick that is ideal for you.\n',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.lavander.withOpacity(.7),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              InputField(
                text: "Your Weight",
                wid: size.width * 0.9,
                heig: size.height * 0.06,
              ),
              SizedBox(
                height: 10,
              ),
              InputField(
                text: "Your Height",
                wid: size.width * 0.9,
                heig: size.height * 0.06,
              ),
              Dropbox(
                data: opt,
              ),
              Dropbox(
                data: longestFast,
              ),
              Dropbox(
                data: level,
              ),
              Dropbox(
                data: routine,
              ),
              Container(
                height: 35,
                width: 150,
                margin: EdgeInsets.only(bottom: 20, top: 30),
                decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: RaisedButton(
                  onPressed: () {
                    AppRoutes.push(context, Coach2());
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: AppColors.green,
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
