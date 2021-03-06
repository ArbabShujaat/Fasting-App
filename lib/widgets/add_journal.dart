import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/images.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:fastingApp/widgets/charts/chart_mood.dart';
import 'package:flutter/material.dart';

class JournalAdd extends StatelessWidget {
  final bool pop;
  final bool button;
  const JournalAdd({
    Key key,
    @required this.pop,
    @required this.button,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )),
        // height: size.height / 1.2,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 30, 15, 0.0),
          child: Column(
            children: [
              pop
                  ? GestureDetector(
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
                    )
                  : Container(),
              Text(
                'Update your Journal',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Card(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                color: AppColors.greyBack,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        'How are you feeling? ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: ImageIcon(
                              AssetImage(
                                Images.laugh,
                              ),
                              color: AppColors.secondaryColor,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: ImageIcon(
                              AssetImage(
                                Images.appy,
                              ),
                              color: AppColors.secondaryColor,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: ImageIcon(
                              AssetImage(
                                Images.mean,
                              ),
                              color: AppColors.secondaryColor,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: ImageIcon(
                              AssetImage(
                                Images.sad,
                              ),
                              color: AppColors.secondaryColor,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: ImageIcon(
                              AssetImage(
                                Images.cry,
                              ),
                              color: AppColors.secondaryColor,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: ImageIcon(
                              AssetImage(
                                Images.dead,
                              ),
                              color: AppColors.secondaryColor,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(bottom: 15),
                color: AppColors.greyBack,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mood Graph',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        LineChartSample2()
                      ]),
                ),
              ),
              Card(
                margin: EdgeInsets.only(bottom: 15),
                color: AppColors.greyBack,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add a Note',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            maxLines: 5,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 7),
                                border: InputBorder.none),
                          ),
                        )
                      ]),
                ),
              ),
              Card(
                margin: EdgeInsets.only(bottom: 15),
                color: AppColors.greyBack,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Weight',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            //maxLines: 5,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 7),
                                border: InputBorder.none),
                          ),
                        )
                      ]),
                ),
              ),
              button
                  ? Container(
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
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
