import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fastingApp/constants/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BarChartData {
  final String year;
  final int subscribers;
  final charts.Color barColor;

  BarChartData(
      {@required this.year,
      @required this.subscribers,
      @required this.barColor});
}

final List<BarChartData> data = [
  BarChartData(
    year: "jan 12",
    subscribers: 0,
    barColor: charts.ColorUtil.fromDartColor(AppColors.darkBlue),
  ),
  BarChartData(
    year: "jan 13",
    subscribers: 13,
    barColor: charts.ColorUtil.fromDartColor(AppColors.darkBlue),
  ),
  BarChartData(
    year: "jan 14",
    subscribers: 7,
    barColor: charts.ColorUtil.fromDartColor(AppColors.darkBlue),
  ),
  BarChartData(
    year: "jan 15",
    subscribers: 15,
    barColor: charts.ColorUtil.fromDartColor(AppColors.darkBlue),
  ),
  BarChartData(
    year: "jan 16",
    subscribers: 2,
    barColor: charts.ColorUtil.fromDartColor(AppColors.darkBlue),
  ),
];
