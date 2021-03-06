import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/models/bar_chart.dart';
import 'package:flutter/material.dart';

class WeightChart extends StatefulWidget {
  final List<BarChartData> data;

  WeightChart({@required this.data});

  @override
  _WeightChartState createState() => _WeightChartState();
}

class _WeightChartState extends State<WeightChart> {
  int select = 0;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartData, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: widget.data,
          domainFn: (BarChartData series, _) => series.year,
          measureFn: (BarChartData series, _) => series.subscribers,
          colorFn: (BarChartData series, _) => series.barColor)
    ];

    return Container(
      height: 500,
      // padding: EdgeInsets.all(20),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(40)),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              Container(
                width: 300,
                height: 40,
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.greyBack),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          select = 0;
                        });
                      },
                      child: Text(
                        'Week',
                        style: TextStyle(
                            fontSize: select == 0 ? 18 : 16,
                            fontWeight: select == 0 ? FontWeight.bold : null,
                            color: select == 0
                                ? AppColors.primaryColor
                                : Colors.grey),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            select = 1;
                          });
                        },
                        child: Text(
                          'Month',
                          style: TextStyle(
                              fontSize: select == 1 ? 18 : 16,
                              fontWeight: select == 1 ? FontWeight.bold : null,
                              color: select == 1
                                  ? AppColors.primaryColor
                                  : Colors.grey),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            select = 2;
                          });
                        },
                        child: Text(
                          'Year',
                          style: TextStyle(
                              fontSize: select == 2 ? 18 : 16,
                              fontWeight: select == 2 ? FontWeight.bold : null,
                              color: select == 2
                                  ? AppColors.primaryColor
                                  : Colors.grey),
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Text(
                    "0 Kg ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Jan 12 - Jan 13 ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: charts.BarChart(
                  series,
                  animate: true,
                  defaultRenderer: new charts.BarRendererConfig(
                      cornerStrategy: const charts.ConstCornerStrategy(20)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
