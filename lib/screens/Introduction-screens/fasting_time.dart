import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/widgets/intro_timer.dart';
import 'package:fastingApp/widgets/picker_widget.dart';
import 'package:flutter/material.dart';

String fastTime;

class FastingTime extends StatefulWidget {
  const FastingTime({
    Key key,
  }) : super(key: key);

  @override
  _FastingTimeState createState() => _FastingTimeState();
}

class _FastingTimeState extends State<FastingTime> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
              ' Understanding your eating schedule will\nhelp us to recommend your first fast. If your\nschedule shifts regularly, go with when you eat\nmost often.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.darkBlue, fontSize: 18, height: 2)),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            padding: EdgeInsets.all(15),
            height: 80,
            // width: ,
            decoration: BoxDecoration(
              color: AppColors.greyBack,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I usually start\neating at...',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.darkBlue, fontSize: 16),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('And finish my last\nmeal by...',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: AppColors.darkBlue, fontSize: 16))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      fastTime = "Start";
                    });
                    showModalBottomSheet<dynamic>(
                        context: context,
                        // isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        builder: (_) => IntroTimer());
                  },
                  child: Container(
                      height: 61,
                      width: 121,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: AppColors.greyBack,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Start",
                          style: TextStyle(
                              color: AppColors.lightPurple, fontSize: 18),
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      fastTime = "End";
                    });
                    showModalBottomSheet<dynamic>(
                        context: context,
                        // isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        builder: (_) => IntroTimer());
                  },
                  child: Container(
                      height: 61,
                      width: 121,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: AppColors.greyBack,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "End",
                          style: TextStyle(
                              color: AppColors.lightPurple, fontSize: 18),
                        ),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
