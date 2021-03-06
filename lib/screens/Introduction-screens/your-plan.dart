import 'package:fastingApp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'goals.dart';

class YourPlan extends StatefulWidget {
  @override
  _YourPlanState createState() => _YourPlanState();
}

class _YourPlanState extends State<YourPlan> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        title: 'What can we help you \n accomplish?',
        bodyWidget: Container(
          padding: EdgeInsets.all(05),
          // color: Colors.green,
          height: 421,
          width: 275,
          child: Goals(),
        ),
        footer: Container(
          height: 53,
          width: 186,
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              )),
        ),
        decoration: const PageDecoration(
          bodyTextStyle: TextStyle(fontSize: 15.0),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 20),
      child: IntroductionScreen(
        pages: getPages(),
        onDone: () {},
        done: Text(''),
      ),
    ));
  }
}
