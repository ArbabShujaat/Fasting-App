import 'package:custom_switch/custom_switch.dart';
import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:fastingApp/widgets/appbar.dart';
import 'package:fastingApp/widgets/picker_widget.dart';
import 'package:fastingApp/widgets/picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';

class Reminders extends StatefulWidget {
  @override
  _RemindersState createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  bool status = false;
  DateTime dateTime = DateTime.now();
  final values = <bool>[false, false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Set your reminders'),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return StatefulBuilder(builder: (context, setState) {
              return Container(
                height: MediaQuery.of(context).size.height / 1.5,
                padding: EdgeInsets.all(15),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                    Text(
                      'Choose Time',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Card(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: AppColors.greyBack,
                        child: TimePickerWidget()),
                    Text(
                      'Choose days',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Card(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      color: AppColors.greyBack,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: WeekdaySelector(
                            selectedFillColor: AppColors.primaryColor,
                            onChanged: (v) {
                              setState(() {
                                values[v % 7] = !values[v % 7];
                              });
                            },
                            values: values),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: 200,
                        child: RaisedButton(
                          onPressed: () {},
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
                ),
              );
            });
          },
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              shape: BoxShape.circle, gradient: AppColors.barGradient),
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, val) {
              return Card(
                shadowColor: AppColors.secondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        '12:45',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Text('Mondays'),
                      trailing: CustomSwitch(
                        activeColor: AppColors.primaryColor,
                        value: status,
                        onChanged: (value) {
                          print("VALUE : $value");
                          setState(() {
                            status = value;
                          });
                        },
                      ),
                    )),
              );
            }),
      ),
    );
  }
}
