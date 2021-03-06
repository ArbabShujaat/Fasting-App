import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/images.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:fastingApp/widgets/dropbox.dart';
import 'package:flutter/material.dart';

import 'fast_planing.dart';

class Coach2 extends StatefulWidget {
  @override
  _Coach2State createState() => _Coach2State();
}

class _Coach2State extends State<Coach2> {
  List<String> allergies = [
    'Do you have any of the accompanying food sensitivities or hypersensitivities?',
    'Dairy',
    'Eggs',
    'Fish',
    'Gluten/Wheat',
    'Peanuts',
    'Shelfish',
    'Soy',
    'None of the above'
  ];
  List<String> diet = [
    'Any dietary Approaches ?',
    'Calorie Counting',
    'Keto/High fat',
    'Mediterranean',
    'Paleo',
    'Pescatarian',
    'Vegan',
    'Vegetarian',
    'None of these',
  ];
  List<String> fitness = [
    'Do you follow any fistness routine ?',
    'Walking',
    'hiking',
    'Jogging/Running',
    'Stair Climber',
    'Eliptical',
    'Cycling',
    'Resistance Training',
    'Yoga',
    'Bootcamp/fitness Class',
    'Something else',
  ];
  List<String> sleep = [
    'How long do you sleep ?',
    'Fewer than 5 hours',
    '5-6 hours',
    '6-7 hours',
    '7-8 hours',
    '8-9 hours',
    'More than 9 hours',
  ];
  List<String> med = [
    'Any medical conditions you have ?',
    'Type 1 Diabetes',
    'Type 2 Diabetes',
    'PCOS',
    'Non-Alcholic fatty liver disease',
    'Obesity (BMI > 30.0)',
    'Eating Disorder',
    'Other pre-existing Condition',
    'None of the above'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Achievements'),
        flexibleSpace: Container(
            decoration: BoxDecoration(gradient: AppColors.barGradient)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                Images.question,
                scale: 5,
              ),
              Text(
                '\nAssist us with understanding prior conditions that you may have so we can suggest the best fasting way ahead.\n',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.lavander.withOpacity(.7),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Dropbox(
                data: allergies,
              ),
              Dropbox(
                data: diet,
              ),
              Dropbox(
                data: fitness,
              ),
              Dropbox(
                data: sleep,
              ),
              Dropbox(
                data: med,
              ),
              GestureDetector(
                onTap: () => AppRoutes.push(context, FastPlaning()),
                child: Container(
                  height: 35,
                  width: 150,
                  margin: EdgeInsets.only(bottom: 20, top: 20),
                  decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Finish',
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
