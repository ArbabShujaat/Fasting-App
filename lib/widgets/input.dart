import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String text;
  final double heig, wid;
  InputField({this.text, this.heig, this.wid});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: wid,
      height: heig,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(width: 2, color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
        child: TextField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            border: InputBorder.none,
            hintText: text,
          ),
        ),
      ),
    );
  }
}
