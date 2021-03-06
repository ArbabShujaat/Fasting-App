import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:fastingApp/widgets/FlatCard.dart';
import 'package:fastingApp/widgets/appbar.dart';
import 'package:flutter/material.dart';

import 'add_custom_plan.dart';

class ChoosePlan extends StatelessWidget {
  static const routeName = '/Fast';

  @override
  Widget build(BuildContext context) {
    List plans = [
      'Circadian \nRhythm TRF',
      '15:9 TRF ',
      '16:8 TRF ',
      '18:6 TRF ',
      '20:4 TRF ',
      '36 Hour Fast ',
    ];
    List hours = [
      '13',
      '15',
      '16',
      '18',
      '20',
      '36',
    ];
    return new Scaffold(
      appBar: CustomAppBar(
        text: 'Choose a Plan',
      ),
      body: Container(
        // padding: EdgeInsets.al(top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.2),
                  itemBuilder: (context, val) {
                    return CustomCard(
                        title: plans[val],
                        hours: hours[val],
                        color: val == 0
                            ? Color(0xffDE5050)
                            : val == 1
                                ? Color(0xff00ACEE)
                                : val == 2
                                    ? Color(0xffD189CA)
                                    : val == 3
                                        ? AppColors.lavander
                                        : val == 4
                                            ? AppColors.plum
                                            : AppColors.green);
                  }),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text("Create a custom Plan",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  Container(
                    width: 185,
                    height: 185,
                    child: GestureDetector(
                      onTap: () => AppRoutes.push(context, AddCustomPlan()),
                      child: Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.add,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
