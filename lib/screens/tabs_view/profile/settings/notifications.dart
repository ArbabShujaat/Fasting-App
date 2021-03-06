import 'package:fastingApp/widgets/appbar.dart';
import 'package:fastingApp/widgets/toggle-button.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Notifications'),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: ListView(
          children: [
            ListTile(title: Text('Goal Reached'), trailing: TogButton()),
            div(),
            ListTile(
                title: Text('Halfway through'),
                subtitle: Text('Only 24 hours or longer fasts'),
                trailing: TogButton()),
            div(),
            ListTile(
                title: Text('Last Hour'),
                subtitle: Text('Only 24 hours or longer fasts'),
                trailing: TogButton()),
            div(),
            ListTile(
                title: Text('Surpassed goal (continuous)'),
                trailing: TogButton()),
            div(),
            ListTile(title: Text('Reached goal weight'), trailing: TogButton()),
            div(),
          ],
        ),
      ),
    );
  }

  div() {
    return Divider(
      thickness: 1,
    );
  }
}
