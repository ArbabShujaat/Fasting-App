import 'package:fastingApp/models/models.dart';
import 'package:fastingApp/screens/Introduction-screens/goals.dart';
import 'package:fastingApp/screens/Introduction-screens/plan_selection.dart';
import 'package:fastingApp/widgets/picker_widget.dart';
import 'package:fastingApp/widgets/summary_row.dart';
import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Align(alignment: Alignment.topLeft, child: Text('Goals')),
        ),
        Container(
          height: 100,
          child: ListView.builder(
            itemCount: selectGoals.length,
            itemBuilder: (context, i) {
              return Card(
                shadowColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SummaryRow(
                    text: 'I' 'm fasting for ' + selectGoals[i],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Fasting & Nutrition',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SummaryRow(
                    text:
                        'I eat my last meal at ${formattedTimeEnd.toString()}',
                  ),
                  SummaryRow(
                    text: 'I' 'm starting with a ${fastType.toString()}.',
                  ),
                ]),
          ),
        )
      ],
    );
  }
}
