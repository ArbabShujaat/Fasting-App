import 'package:fastingApp/constants/colors.dart';
import 'package:fastingApp/constants/images.dart';
import 'package:fastingApp/screens/tabs_view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'achievements/achievements.dart';
import 'challenges/challanges_home.dart';
import 'coach/coach.dart';
import 'fasting/fasting.dart';

class TabsScreen extends StatefulWidget {
  @override
  TabsScreenState createState() => TabsScreenState();
}

class TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;
  Widget child1 = FastingScreen();
  Widget child2;
  Widget child3;
  Widget child4;
  Widget child5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: <Widget>[
                child1,
                child2 ?? Coach(),
                child3 ?? ChallangeHome(),
                child4 ?? Achievements(),
                child5 ?? Profile(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Color(0XFF828282),
        elevation: 10,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 0 && child1 == null) {
            child2 = FastingScreen();
          }
          if (index == 1 && child2 == null) {
            child2 = Coach();
          }
          if (index == 2 && child3 == null) {
            child3 = ChallangeHome();
          }
          if (index == 3 && child4 == null) {
            child4 = Achievements();
          }
          if (index == 4 && child5 == null) {
            child5 = Profile();
          }
          _currentIndex = index;
          setState(() {});
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Fast'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(Images.coach),
                size: 21,
              ),
              label: 'Plan'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(Images.challanges),
                size: 21,
              ),
              label: 'Challanges'),
          BottomNavigationBarItem(icon: Icon(Icons.star_outline), label: 'Win'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
