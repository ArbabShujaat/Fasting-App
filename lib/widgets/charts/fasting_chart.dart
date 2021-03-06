import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fastingApp/models/bar_chart.dart';
import 'package:flutter/material.dart';

class FastingChart extends StatelessWidget {
  final List<BarChartData> data;

  FastingChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartData, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
          domainFn: (BarChartData series, _) => series.year,
          measureFn: (BarChartData series, _) => series.subscribers,
          colorFn: (BarChartData series, _) => series.barColor)
    ];

    return Container(
      height: 450,
      // padding: EdgeInsets.all(20),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(40)),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Average ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Text(
                    "0 h ",
                    style: TextStyle(fontSize: 25),
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
