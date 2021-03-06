import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ShareWidget extends StatelessWidget {
  const ShareWidget({
    Key key,
    @required this.size,
    @required this.context,
  }) : super(key: key);

  final Size size;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      height: size.height / 1.5,
      padding: EdgeInsets.all(15),
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
          SleekCircularSlider(
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
                        Text(
                          '15:53:53\n',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Up coming fast\n',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '20 hours\n',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
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
          Container(
            width: 150,
            margin: EdgeInsets.only(top: 15, bottom: 20),
            alignment: Alignment.center,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.green, width: 2)),
            child: Text(
              '20 : 4 TRF',
              style: TextStyle(
                color: AppColors.green,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Share.share('Share me'),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.darkPink),
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
