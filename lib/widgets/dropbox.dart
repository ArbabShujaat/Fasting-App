import 'package:fastingApp/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropbox extends StatefulWidget {
  final List<String> data;

  const Dropbox({Key key, @required this.data}) : super(key: key);
  @override
  DropboxState createState() => DropboxState();
}

class DropboxState extends State<Dropbox> {
  String dropdownValue = 'One';

  List<DropdownMenuItem<String>> _dropdownMenuItems;
  String _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(widget.data);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<String>> buildDropDownMenuItems(List opt) {
    List<DropdownMenuItem<String>> items = List();
    for (int i = 0; i < opt.length; i++) {
      items.add(
        DropdownMenuItem(
          child: Text(
            widget.data[i],
            style: TextStyle(color: AppColors.secondaryColor),
            textAlign: TextAlign.left,
          ),
          value: opt[i],
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 30),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(width: 2, color: Colors.grey[200])),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          iconSize: 50,
          iconEnabledColor: AppColors.secondaryColor,
          isExpanded: true,
          //hint: new Text("Test", textAlign: TextAlign.center),
          value: _selectedItem,
          items: _dropdownMenuItems,
          onChanged: (value) {
            setState(() {
              _selectedItem = value;
            });
          },
        ),
      ),
    );
  }
}
