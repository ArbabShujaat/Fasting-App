import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/images.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:flutter/material.dart';

class ChallengeSuccess extends StatefulWidget {
  @override
  _FastPlaningState createState() => _FastPlaningState();
}

class _FastPlaningState extends State<ChallengeSuccess> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: size.width / 1.1,
          height: size.height / 2,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 40,
                      
                    ),
                    Image.asset(
                      Images.tick,
                      scale: 2,
                    ),
                    GestureDetector(
                      onTap: () => AppRoutes.pop(context),
                      child: Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Challange\nCompleted',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  height: 1.5,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(Images.happy),
            ],
          ),
        ),
      ),
    );
  }
}
