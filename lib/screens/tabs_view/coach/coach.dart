import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/images.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'coach1.dart';

class Coach extends StatefulWidget {
  @override
  _CoachState createState() => _CoachState();
}

class _CoachState extends State<Coach> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Coach'),
        flexibleSpace: Container(
            decoration: BoxDecoration(gradient: AppColors.barGradient)),
      ),
      body: Center(
        child: Stack(children: [
          Container(
            height: size.height / 1.5,
            width: size.width / 1.2,
            //color: Colors.amberAccent,
            child: Card(
              margin: EdgeInsets.only(top: 80),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: AppColors.greyBack,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text(
                    'Upgrade your health\n with Ring Of Wellness',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, height: 1.5),
                    maxLines: 2,
                  ),
                  Text(
                    'Our inhouse team of nutritionalist,dietitians,personal trainers and motivators are here to help you achieve your fitness and wellness goals.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, height: 2),
                  ),
                  Container(
                    width: 200,
                    margin: EdgeInsets.only(bottom: 10),
                    child: RaisedButton(
                      onPressed: () {
                        AppRoutes.push(context, Coach1());
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: AppColors.green,
                      child: Center(
                        child: Text(
                          'Build Your Plan',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: size.width / 3.3,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF703CA2),
              child: Image.asset(
                Images.think,
                scale: 1.5,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
