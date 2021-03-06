import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/images.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:fastingApp/widgets/challenge-successful.dart';
import 'package:flutter/material.dart';

class ChallangeScreen extends StatefulWidget {
  @override
  _ChallangeScreenState createState() => _ChallangeScreenState();
}

class _ChallangeScreenState extends State<ChallangeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              height: size.height / 2.35,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => AppRoutes.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 40.0,
                    child: Image.asset(
                      Images.weight,
                      scale: 1.2,
                      color: AppColors.primaryColor,
                      fit: BoxFit.cover,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Text(
                    'Healthy Results with \nRing of Wellness',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Fasting',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, right: 10, left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 20.0,
                          child: Image.asset(
                            Images.phone,
                            fit: BoxFit.cover,
                            scale: 2.5,
                          ),
                          backgroundColor: Colors.white,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => ChallengeSuccess());
                          },
                          child: Container(
                            height: 35,
                            width: 150,
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                color: AppColors.green,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                'Join Challange',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 20.0,
                          child: Image.asset(
                            Images.heart,
                            fit: BoxFit.cover,
                            height: 23,
                            width: 23,
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        Images.contact,
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.07,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Text(
                          'Jan 3 - Jan 30',
                          style: TextStyle(
                            height: 1.0,
                            fontSize: 14,
                            color: AppColors.greyText,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        Images.alarm,
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.07,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Text(
                          'Log 20 fasts of at least 12 hours',
                          style: TextStyle(
                              height: 1.0,
                              fontSize: 14,
                              color: AppColors.greyText),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Be Part Of the Ring of Wellness challenge, See how focus you are on reaching your health goals for 2021 and beyond',
                    style: TextStyle(
                      color: Colors.black,
                      height: 2,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Challenge Numbers\n',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.green, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Participants',
                          style: TextStyle(
                              color: AppColors.green,
                              height: 2,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                              color: AppColors.green,
                              height: 2,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.green, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Friends ',
                          style: TextStyle(
                              color: AppColors.green,
                              height: 2,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Join to Invite Friends',
                          style: TextStyle(
                              color: AppColors.green,
                              height: 2,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '\nFriends Joined',
                    style: TextStyle(
                        color: AppColors.lightPurple,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.secondaryColor,
                                width: 2,
                              ),
                              shape: BoxShape.circle),
                          child: Image.asset(
                            Images.boy,
                            scale: 1.5,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
