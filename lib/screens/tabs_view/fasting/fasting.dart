import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/images.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:fastingApp/models/models.dart';
import 'package:fastingApp/screens/tabs_view/fasting/reminder.dart';
import 'package:fastingApp/widgets/add_journal.dart';
import 'package:fastingApp/widgets/share.dart';
import 'package:fastingApp/widgets/target_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'choose_plan/choose_plan.dart';
import 'end_fast.dart';

int hour = 1;
bool planSelected = false;
bool fastStarted = false;
DateTime start;
DateTime end;
CountdownTimerController controller;
int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60 * hour;
int endTime2 = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60 * hour;
void onEnd() {
  print('onEnd');
}

class FastingScreen extends StatefulWidget {
  @override
  _FastingScreenState createState() => _FastingScreenState();
}

class _FastingScreenState extends State<FastingScreen> {
  Size size;
  Timer _timer;

  int _start = 0;

  TextEditingController _weightController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _weightController.dispose();
    super.dispose();
  }

  void startTimer() {
    // print("hiii");
    // const oneSec = const Duration(hours: 1);
    // print("hiii2");
    // _timer = new Timer.periodic(
    //   oneSec,
    //   (Timer timer) async {
    //     print("hiii3");
    //     if (_start == hour) {
    //       print("hiii4");
    //       setState(() {
    //         timer.cancel();
    //       });
    //     } else {
    //       print("hiii5");
    //       endTime2--;
    //       await Firestore.instance
    //           .collection("Users")
    //           .document(userDetails.docid)
    //           .update({
    //         "fastingHoursLeft": endTime2,
    //       });
    //       setState(() {
    //         _start++;
    //       });
    //     }
    //   },
    // );
  }

  @override
  Future<void> didChangeDependencies() async {
    if (userDetails.active == true) {
      final date2 = DateTime.now();
      print(userDetails.fastStartedAt);
      hour = int.parse(userDetails.fastingHour) -
          date2.difference(DateTime.parse(userDetails.fastStartedAt)).inHours;
      print(hour);

      endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * hour;
      controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
      setState(() {
        fastStarted = true;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Get Ready to Fast'),
        flexibleSpace: Container(
            decoration: BoxDecoration(gradient: AppColors.barGradient)),
      ),
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => AppRoutes.push(context, ChoosePlan()),
                child: Container(
                  width: 150,
                  margin: EdgeInsets.only(top: 15, bottom: 20),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.green, width: 2)),
                  child: Text(
                    'Choose Plan',
                    style: TextStyle(
                      color: AppColors.green,
                    ),
                  ),
                ),
              ),
              SleekCircularSlider(
                initialValue: _start + 0.0,
                innerWidget: (val) {
                  return Center(
                    child: SizedBox(
                      child: CircleAvatar(
                        radius: size.width / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Time since Last Fast\n',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            fastStarted
                                ? CountdownTimer(
                                    controller: controller,
                                    onEnd: onEnd,
                                    endTime: endTime,
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )
                                : Text(
                                    "00:00:00",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Up coming fast\n',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              userDetails.fastingHour + ' hour\n',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                            // : Text(
                            //     '0 hour\n',
                            //     style: TextStyle(
                            //         fontSize: 18,
                            //         fontWeight: FontWeight.bold),
                            //   ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                        handlerSize: 20, trackWidth: 5, progressBarWidth: 12),
                    size: size.width / 1.2,
                    customColors: CustomSliderColors(
                        gradientStartAngle: 0,
                        dotColor: Color(0xff3E28B6),
                        gradientEndAngle: 270,
                        progressBarColors: AppColors.barGradient.colors)),
                onChange: (val) {},
              ),
              fastStarted ? TargetWidget() : Container(),
              fastStarted
                  ? endFast()
                  : Container(
                      width: 200,
                      margin: EdgeInsets.only(bottom: 20),
                      child: RaisedButton(
                        onPressed: () {
                          if (planSelected)
                            showDialog(
                                context: context,
                                //barrierColor: Colors.transparent,
                                builder: (_) => Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        //height: 150,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text('Log Weight\n ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Card(
                                              margin:
                                                  EdgeInsets.only(bottom: 15),
                                              color: AppColors.greyBack,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                child: Form(
                                                  key: _formKey,
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Add Weight',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: TextFormField(
                                                            validator: (val) {
                                                              if (val.length ==
                                                                  0) {
                                                                return "Weight cannot be empty";
                                                              } else {
                                                                return null;
                                                              }
                                                            },
                                                            controller:
                                                                _weightController,
                                                            //maxLines: 5,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            decoration: InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            7),
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                          ),
                                                        )
                                                      ]),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: _isLoading
                                                  ? Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    )
                                                  : RaisedButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      onPressed: () async {
                                                        if (_formKey
                                                            .currentState
                                                            .validate()) {
                                                          setState(() {
                                                            _isLoading = true;
                                                            controller =
                                                                CountdownTimerController(
                                                                    endTime:
                                                                        endTime,
                                                                    onEnd:
                                                                        onEnd);
                                                            fastStarted = true;
                                                            startTimer();
                                                            start =
                                                                DateTime.now();
                                                            end = Jiffy(DateTime
                                                                    .now())
                                                                .add(
                                                                    hours:
                                                                        hour);
                                                          });

                                                          await Firestore
                                                              .instance
                                                              .collection(
                                                                  "Users")
                                                              .document(
                                                                  userDetails
                                                                      .docid)
                                                              .update({
                                                            "userWeight":
                                                                _weightController
                                                                    .text,
                                                            "active": true,
                                                            "fastStartedAt":
                                                                DateTime.now()
                                                                    .toString(),
                                                          });

                                                          setState(() {
                                                            _isLoading = false;
                                                          });

                                                          AppRoutes.pop(
                                                              context);
                                                        }
                                                      },
                                                      textColor: Colors.white,
                                                      color: AppColors.green,
                                                      child: Text('ok'),
                                                    ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                          else {
                            showDialog(
                                context: context,
                                child: AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                      side: BorderSide(
                                        color: Colors.purple,
                                      )),
                                  title: Text("Kindly first choose your plan"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text(
                                        "OK",
                                        style: TextStyle(color: Colors.purple),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ));
                            setState(() {});
                          }
                          // fastStarted = true;
                        },
                        color: AppColors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        textColor: Colors.white,
                        child: Text('Start Your Fast'),
                      ),
                    ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => AppRoutes.push(context, ChoosePlan()),
                      child: Container(
                        width: 150,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: AppColors.green, width: 2)),
                        child: Text(
                          'Change Fast',
                          style: TextStyle(
                            color: AppColors.green,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => AppRoutes.push(context, Reminders()),
                      child: Container(
                        width: 150,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: AppColors.green, width: 2)),
                        child: Text(
                          'Set Reminder',
                          style: TextStyle(
                            color: AppColors.green,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xffF3F3F3),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fasting Now',
                      style: TextStyle(
                          color: AppColors.lightPurple,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
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
              )
            ],
          ),
        ),
      ),
    );
  }

  endFast() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return JournalAdd(
                    pop: true,
                    button: true,
                  );
                }),
            child: ImageIcon(
              AssetImage(Images.happyFace),
              color: AppColors.darkPink,
              size: 30,
            ),
          ),
          Container(
            width: 200,
            child: RaisedButton(
              onPressed: () => AppRoutes.push(context, EndFast()),
              color: AppColors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              textColor: Colors.white,
              child: Text('End Fast'),
            ),
          ),
          GestureDetector(
              onTap: () => showModalBottomSheet<dynamic>(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (contex) =>
                        ShareWidget(size: size, context: context),
                  ),
              child: Icon(
                Icons.share,
                color: AppColors.darkPink,
                size: 30,
              )),
        ],
      ),
    );
  }

  /* Widget animation(BuildContext context) {
    return MaterialButton(
      minWidth: 300,
      color: Colors.grey[300],
      onPressed: () => 
      child: Text("Show animations Material Dialog"),
    );
  } */
}
