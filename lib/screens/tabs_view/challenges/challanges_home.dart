import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/images.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:fastingApp/widgets/ChallengeCard.dart';
import 'package:flutter/material.dart';

import 'challange_screen.dart';

class ChallangeHome extends StatefulWidget {
  @override
  _ChallangeHomeState createState() => _ChallangeHomeState();
}

class _ChallangeHomeState extends State<ChallangeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Challenges'),
        flexibleSpace: Container(
            decoration: BoxDecoration(gradient: AppColors.barGradient)),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Join a Challenge',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, val) {
                    return ChallengeCard(
                      image: val == 0
                          ? Images.weight
                          : val == 1
                              ? Images.walk
                              : val == 2
                                  ? Images.moon
                                  : val == 3
                                      ? Images.spoon
                                      : Images.smile,
                      color: val == 0
                          ? AppColors.orange
                          : val == 1
                              ? AppColors.primaryColor
                              : val == 2
                                  ? AppColors.pink
                                  : val == 3
                                      ? AppColors.lightBlue
                                      : AppColors.green,
                      onTap: () => AppRoutes.push(context, ChallangeScreen()),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
