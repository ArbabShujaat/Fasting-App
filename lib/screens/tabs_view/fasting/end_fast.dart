import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/images.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:fastingApp/widgets/add_journal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class EndFast extends StatefulWidget {
  @override
  _EndFastState createState() => _EndFastState();
}

class _EndFastState extends State<EndFast> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Container(
          decoration: BoxDecoration(gradient: AppColors.barGradient),
          child: SafeArea(
              child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nice Effort !',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'You completed a fast fot a total of 1 hour and 24 minutes.',
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Share Fast',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                )
              ],
            ),
          )),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                height: 70,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Started Fasting',
                      style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Today, 04:09 Am',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Dash(
                      length: size.width - 30,
                      dashGap: 8,
                      dashLength: 10,
                    )
                  ],
                ),
              ),
              Container(
                height: 70,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Goal Reached',
                      style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Today, 04:09 Am',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Dash(
                      length: size.width - 30,
                      dashGap: 8,
                      dashLength: 10,
                    )
                  ],
                ),
              ),
              JournalAdd(
                pop: false,
                button: false,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => AppRoutes.pop(context),
                    child: Container(
                      height: 40,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: AppColors.green, width: 2)),
                      child: RaisedButton(
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () => AppRoutes.pop(context),
                        child: Text(
                          'Delete',
                          style: TextStyle(
                              color: AppColors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    child: RaisedButton(
                      onPressed: () {
                        Dialogs.materialDialog(
                          color: Colors.white,
                          msg: 'Congratulations, you achieved your goal',
                          title: 'Congratulations',
                          animations: 'assets/cong.json',
                          context: context,
                          actions: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.orange,
                                        width: 4,
                                      )),
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow[700],
                                        size: 50,
                                      ),
                                      Image.asset(
                                        Images.one,
                                        scale: 5,
                                      ),
                                    ],
                                  ),
                                ),
                                IconsButton(
                                  onPressed: () => AppRoutes.pop(context),
                                  text: 'Claim',
                                  iconData: Icons.done,
                                  color: AppColors.primaryColor,
                                  textStyle: TextStyle(color: Colors.white),
                                  iconColor: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: AppColors.green,
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
