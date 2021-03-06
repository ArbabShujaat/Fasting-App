import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/routes.dart';
import 'package:fastingApp/screens/tabs_view/profile/settings/email.dart';
import 'package:fastingApp/screens/tabs_view/profile/settings/notifications.dart';
import 'package:fastingApp/widgets/appbar.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool selected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Settings'),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: ListView(
          children: [
            ListTile(
              title: Text('Weight Units'),
              trailing: Container(
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadiusDirectional.circular(20)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = false;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                            color: selected
                                ? AppColors.greyBack
                                : AppColors.darkBlue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            )),
                        child: Center(
                          child: Text(
                            'KG',
                            style: TextStyle(
                                fontSize: 16,
                                color: selected ? null : Colors.white,
                                fontWeight: selected ? null : FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = true;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                            color: selected
                                ? AppColors.darkBlue
                                : AppColors.greyBack,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                        child: Center(
                            child: Text(
                          'LB',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: selected ? FontWeight.bold : null,
                              color: selected ? Colors.white : null),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              onTap: () => AppRoutes.push(context, Notifications()),
              title: Text('Notifications'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              onTap: () => AppRoutes.push(context, Email()),
              title: Text('Emails'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              title: Text('Logout'),
            ),
            Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
