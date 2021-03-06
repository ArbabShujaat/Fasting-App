import 'package:fastingApp/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Goals extends StatefulWidget {
  const Goals({
    Key key,
  }) : super(key: key);

  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (select.contains(0) &&
                    selectGoals.contains("Manage weight")) {
                  select.remove(0);
                  selectGoals.remove("Manage weight");
                } else {
                  select.add(0);
                  selectGoals.add("Manage weight");
                }
                setState(() {});
              },
              child: Container(
                height: size.height / 5,
                width: size.width / 2.5,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    select == null || !select.contains(0)
                        ? BoxShadow()
                        : BoxShadow(
                            color: Color(0xFF8C85FF).withOpacity(.5),
                            spreadRadius: 5)
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF8C85FF),
                ),
                child: Align(
                    alignment: Alignment.center,
                    child: Text('Manage\n weight',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (select.contains(1) &&
                    selectGoals.contains("Improve Mental Clarity")) {
                  select.remove(1);
                  selectGoals.remove("Improve Mental Clarity");
                } else {
                  select.add(1);
                  selectGoals.add("Improve Mental Clarity");
                }
                setState(() {});
              },
              child: Container(
                height: size.height / 5,
                width: size.width / 2.5,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    select == null || !select.contains(1)
                        ? BoxShadow()
                        : BoxShadow(
                            color: Color(0xFFFF7474).withOpacity(.5),
                            spreadRadius: 5)
                  ],
                  color: Color(0xFFFF7474),
                ),
                child: Align(
                    alignment: Alignment.center,
                    child: Text('Improve\n mental\n  clarity',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (select.contains(2) &&
                    selectGoals.contains("Increase daily energy")) {
                  select.remove(2);
                  selectGoals.remove("Increase daily energy");
                } else {
                  select.add(2);
                  selectGoals.add("Increase daily energy");
                }
                setState(() {});
              },
              child: Container(
                height: size.height / 5,
                width: size.width / 2.5,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    select == null || !select.contains(2)
                        ? BoxShadow()
                        : BoxShadow(
                            color: Color(0xFF2AC4FF).withOpacity(.5),
                            spreadRadius: 5)
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF2AC4FF),
                ),
                child: Align(
                    alignment: Alignment.center,
                    child: Text('Increase\n   daily\n  energy',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (select.contains(3) &&
                    selectGoals.contains("Follow medical advice")) {
                  select.remove(3);
                  selectGoals.remove("Follow medical advice");
                } else {
                  select.add(3);
                  selectGoals.add("Follow medical advice");
                }
                setState(() {});
              },
              child: Container(
                height: size.height / 5,
                width: size.width / 2.5,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFD189CA),
                  boxShadow: [
                    select == null || !select.contains(3)
                        ? BoxShadow()
                        : BoxShadow(
                            color: Color(0xFFD189CA).withOpacity(.5),
                            spreadRadius: 5)
                  ],
                ),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(' Follow\nmedical\n advice',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (select.contains(4) && selectGoals.contains("Live longer")) {
                  select.remove(4);
                  selectGoals.remove("Live longer");
                } else {
                  select.add(4);
                  selectGoals.add("Live longer");
                }
                setState(() {});
              },
              child: Container(
                height: size.height / 5,
                width: size.width / 2.5,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFDD2A7B),
                  boxShadow: [
                    select == null || !select.contains(4)
                        ? BoxShadow()
                        : BoxShadow(
                            color: Color(0xFFDD2A7B).withOpacity(.5),
                            spreadRadius: 5)
                  ],
                ),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(' Live\nlonger',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (select.contains(5) && selectGoals.contains("Gut rest")) {
                  select.remove(5);
                  selectGoals.remove("Gut rest");
                } else {
                  select.add(5);
                  selectGoals.add("Gut rest");
                }
                setState(() {});
              },
              child: Container(
                height: size.height / 5,
                width: size.width / 2.5,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    select == null || !select.contains(5)
                        ? BoxShadow()
                        : BoxShadow(
                            color: Color(0xFF6BCC4F).withOpacity(.5),
                            spreadRadius: 5)
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF6BCC4F),
                ),
                child: Align(
                    alignment: Alignment.center,
                    child: Text('Gut rest',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
              ),
            )
          ],
        )
      ],
    );
  }
}
