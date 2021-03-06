import 'dart:ui';
import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/widgets/picker_widget.dart';
import 'package:flutter/material.dart';

String fastType;

class PlanSelection extends StatefulWidget {
  @override
  _PlanSelectionState createState() => _PlanSelectionState();
}

class _PlanSelectionState extends State<PlanSelection> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            'You are already fasting for\n ${fastLength.toString()} hours a day!',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                height: 2,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 20,
        ),
        Text(
            'Shifting your schedule just a little bit will have\nyou on your way to first fast. We suggest\nstarting with a 16:8 Time Restricted Feeding\nfast.',
            textAlign: TextAlign.center,
            style:
                TextStyle(color: AppColors.darkBlue, fontSize: 18, height: 2)),
        GestureDetector(
          onTap: () {
            setState(() {
              selected = true;

              fastType = "16:8 TRF";
            });
          },
          child: Card(
            margin: EdgeInsets.only(top: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: selected ? AppColors.darkBlue : Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '16:8 TRF\n',
                    style: selected
                        ? TextStyle(color: Colors.white, fontSize: 20)
                        : TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'A 16-hour fast with an 8-hour feeding\nwindow.',
                        style: selected ? TextStyle(color: Colors.white) : null,
                      )),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selected = true;

              fastType = "Circadian Rhythm TR";
            });
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: selected ? Colors.white : AppColors.darkBlue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Circadian Rhythm TRF\n',
                    style: selected
                        ? TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                        : TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          'This fast starts at sunset and lasts\nto morning.',
                          style:
                              selected ? null : TextStyle(color: Colors.white)))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
