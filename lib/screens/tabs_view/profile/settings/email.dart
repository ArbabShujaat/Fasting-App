import 'package:fastingApp/widgets/appbar.dart';
import 'package:fastingApp/widgets/toggle-button.dart';
import 'package:flutter/material.dart';

class Email extends StatefulWidget {
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Emails'),
      body: ListView(
        padding: EdgeInsets.only(top: 15, bottom: 15),
        children: [
          ListTile(
              title: Text('Fasting Reminders'),
              subtitle: Text('Stay on top of logging your fasts'),
              trailing: TogButton()),
          div(),
          ListTile(
            title: Text('Stats & Milestones'),
            subtitle: Text('Keep track of your progress'),
            trailing: TogButton(),
          ),
          div()
        ],
      ),
    );
  }

  div() {
    return Divider(
      thickness: 1,
    );
  }
}
