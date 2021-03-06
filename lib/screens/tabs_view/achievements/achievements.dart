import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/images.dart';
import 'package:fastingApp/widgets/appbar.dart';
import 'package:flutter/material.dart';

class Achievements extends StatefulWidget {
  @override
  _AchievementsState createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  List title = ['Fisrt Fast', 'Fast Fast', 'Streak Star', 'Freind Zone'];
  List subTitle = [
    'Your First Fast',
    '3 days Streak',
    '1 week Streak',
    'Challange a Friend'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Achievements',
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Unlocked',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
                height: 200,
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 10),
                    itemCount: title.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext ctx, int val) {
                      return AspectRatio(
                        aspectRatio: .9,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 5,
                          margin: EdgeInsets.all(10),
                          color: Colors.white,
                          child: Container(
                            height: 200,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title[val],
                                  style: TextStyle(
                                      color: AppColors.darkPink,
                                      fontWeight: FontWeight.bold),
                                ),
                                Center(
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: val == 0
                                          ? AppColors.orange
                                          : val == 1
                                              ? AppColors.primaryColor
                                              : val == 2
                                                  ? AppColors.pink
                                                  : val == 3
                                                      ? AppColors.lightBlue
                                                      : AppColors.green,
                                      child: (Image.asset(
                                        val == 0
                                            ? Images.weight
                                            : val == 1
                                                ? Images.walk
                                                : val == 2
                                                    ? Images.moon
                                                    : val == 3
                                                        ? Images.spoon
                                                        : Images.smile,
                                        scale: 2,
                                      ))),
                                ),
                                Text(
                                  subTitle[val],
                                  style: TextStyle(
                                      color: AppColors.darkPink,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(
                                    Icons.lock_open,
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Locked',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: title.length,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.8),
                  itemBuilder: (BuildContext context, int val) {
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              title[val],
                              style: TextStyle(
                                  color: AppColors.darkPink,
                                  fontWeight: FontWeight.bold),
                            ),
                            CircleAvatar(
                                radius: 30,
                                backgroundColor: val == 0
                                    ? AppColors.orange
                                    : val == 1
                                        ? AppColors.primaryColor
                                        : val == 2
                                            ? AppColors.pink
                                            : val == 3
                                                ? AppColors.lightBlue
                                                : AppColors.green,
                                child: (Image.asset(
                                  val == 0
                                      ? Images.weight
                                      : val == 1
                                          ? Images.walk
                                          : val == 2
                                              ? Images.moon
                                              : val == 3
                                                  ? Images.spoon
                                                  : Images.smile,
                                  scale: 2,
                                ))),
                            Text(
                              subTitle[val],
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: AppColors.darkPink,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                Icons.lock_outlined,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ]),
    );
  }
}
