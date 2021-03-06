import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/screens/tabs_view/fasting/fasting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:jiffy/jiffy.dart';

class TargetWidget extends StatelessWidget {
  const TargetWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Start',
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      Jiffy(start).format("MMMM do yyyy"),
                      style: TextStyle(
                        color: AppColors.darkPink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    Jiffy(start).format("h:mm:ss a"),
                    style: TextStyle(
                      color: AppColors.darkPink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
          Flexible(
            flex: 2,
            child: fastStarted
                ? CountdownTimer(
                    controller: controller,
                    onEnd: onEnd,
                    endTime: endTime,
                    textStyle: TextStyle(
                      color: AppColors.darkPink,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    "00:00:00",
                    style: TextStyle(
                      color: AppColors.darkPink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
          Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'End',
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Jiffy(end).format("MMMM do yyyy"),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkPink,
                      ),
                    ),
                  ),
                  Text(
                    Jiffy(end).format("h:mm:ss a"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkPink,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
