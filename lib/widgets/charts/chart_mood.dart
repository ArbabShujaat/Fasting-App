import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/images.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.15,
          child: Container(
            decoration: const BoxDecoration(
              // color: Colors.amber,
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 40.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 300,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageIcon(
                  AssetImage(
                    Images.laugh,
                  ),
                ),
                ImageIcon(
                  AssetImage(
                    Images.appy,
                  ),
                ),
                ImageIcon(
                  AssetImage(
                    Images.mean,
                  ),
                ),
                ImageIcon(
                  AssetImage(
                    Images.sad,
                  ),
                ),
                ImageIcon(
                  AssetImage(
                    Images.cry,
                  ),
                ),
                ImageIcon(
                  AssetImage(
                    Images.dead,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 12,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '4 am';
              case 3:
                return '7am';
              case 5:
                return '10 am';
              case 7:
                return '2 pm';
              case 9:
                return '5 pm';
              case 11:
                return '8 pm';
            }
            return '';
          },
          margin: 3,
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
              left: BorderSide(color: AppColors.greyBack, width: 2),
              bottom: BorderSide(color: AppColors.greyBack, width: 2))),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(1, 10),
          ],
          //isCurved: true,
          colors: AppColors.barGradient.colors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
        ),
      ],
    );
  }
}
