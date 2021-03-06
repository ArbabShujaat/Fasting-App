import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:fastingApp/models/models.dart';
import 'package:fastingApp/screens/tabs_view/fasting/fasting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';

class CustomCard extends StatefulWidget {
  final Color color;
  final String title;
  final String hours;

  const CustomCard({@required this.color, this.title, this.hours});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          _isLoading = true;
        });

        await Firestore.instance
            .collection("Users")
            .document(userDetails.docid)
            .update({
          "fastingHour": widget.hours,
        });

        setState(() {
          hour = int.parse(widget.hours);
          planSelected = true;
          _isLoading = false;
        });

        hour = int.parse(widget.hours);
        AppRoutes.pop(context);
      },
      child: Container(
        width: 185,
        height: 185,
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                color: widget.color,
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        widget.hours,
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("hours",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          Icon(
                            Icons.error_outline,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
