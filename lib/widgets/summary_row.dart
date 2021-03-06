import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  final String text;

  SummaryRow({
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.check,
            color: Colors.green,
          ),
        ),
        Text(text)
      ],
    );
  }
}
