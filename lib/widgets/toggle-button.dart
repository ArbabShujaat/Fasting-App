import 'package:fastingApp/constants/colors.dart';
import 'package:flutter/material.dart';

class TogButton extends StatefulWidget {
  @override
  _TogButtonState createState() => _TogButtonState();
}

class _TogButtonState extends State<TogButton> {
  bool toggleValue = false;

  void toggleSwitch(bool value) {
    if (toggleValue == false) {
      setState(() {
        toggleValue = true;
      });
    } else {
      setState(() {
        toggleValue = false;
      });
      // Put your code here which you want to execute on Switch OFF event.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: 1.5,
        child: Switch(
          onChanged: toggleSwitch,
          value: toggleValue,
          activeColor: AppColors.darkBlue,
          activeTrackColor: AppColors.lightPurple,
          inactiveThumbColor: AppColors.greyBack,
          inactiveTrackColor: Colors.grey[300],
        ));
  }
}
