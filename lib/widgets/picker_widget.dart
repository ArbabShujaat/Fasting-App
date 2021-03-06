import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/screens/Introduction-screens/fasting_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import 'package:intl/intl.dart';

DateTime startTime;
DateTime endTime;
dynamic fastLength;
String formattedTimeStart = "08:00";
String formattedTimeEnd = "08:00";

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({
    Key key,
  }) : super(key: key);

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(fontSize: 24, color: AppColors.primaryColor),
      highlightedTextStyle:
          TextStyle(fontSize: 24, color: AppColors.secondaryColor),
      spacing: 50,
      itemHeight: 40,
      isForce2Digits: true,
      minutesInterval: 5,
      onTimeChange: (time) {
        if (fastTime == "Start") {
          setState(() {
            startTime = time;
            formattedTimeStart = DateFormat.Hms().format(startTime);
            print(formattedTimeStart);
          });
          print(startTime);
        }
        if (fastTime == "End") {
          setState(() {
            endTime = time;
            formattedTimeEnd = DateFormat.Hms().format(endTime);
            print(formattedTimeEnd);
            fastLength = endTime.difference(startTime).inHours;
          });
          print(endTime);

          print(fastLength);
        }
      },
    );
  }
}
