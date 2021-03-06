import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:fastingApp/screens/Introduction-screens/fasting_time.dart';
import 'package:fastingApp/widgets/picker_widget.dart';
import 'package:flutter/material.dart';

class IntroTimer extends StatefulWidget {
  const IntroTimer({
    Key key,
  }) : super(key: key);

  @override
  _IntroTimerState createState() => _IntroTimerState();
}

class _IntroTimerState extends State<IntroTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => AppRoutes.pop(context),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height: 20,
                  width: 20,
                  //alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.grey)),
                  child: Icon(
                    Icons.clear,
                    size: 15,
                  ),
                ),
              ),
            ),
            Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: AppColors.greyBack,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TimePickerWidget(),
                )),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: 200,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
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
              ),
            )
          ],
        ));
  }
}
