//Join a Challenge
import 'package:flutter/material.dart';

class ChallengeCard extends StatelessWidget {
  final String image;
  final Color color;
  final Function onTap;
  ChallengeCard(
      {@required this.image, @required this.color, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 101,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              //EEEEEE
              color: Color(0xffEEEEEE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            child: Image.asset(
                              image,
                              scale: 2,
                            ),
                            backgroundColor: color,
                          )
                        ]),
                  ),
                  Flexible(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fasting',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                        Text(''),
                        Text(
                          'Healthy Results with Ring of Wellness',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: Text(
                            'Jan 3 - Jan 30 - 56.8k active',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(child: Icon(Icons.chevron_right)),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
