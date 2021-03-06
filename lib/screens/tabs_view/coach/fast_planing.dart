import 'package:fastingApp/models/meal_plan.dart';
import 'package:fastingApp/widgets/appbar.dart';
import 'package:fastingApp/widgets/food_card.dart';
import 'package:flutter/material.dart';

class FastPlaning extends StatefulWidget {
  @override
  _FastPlaningState createState() => _FastPlaningState();
}

class _FastPlaningState extends State<FastPlaning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Your Personalised Plan'),
      body: Container(
          margin: EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: mealPlan.length,
              itemBuilder: (context, val) {
                return FoodCard(
                  title: mealPlan[val].title,
                  weekDay: mealPlan[val].weekDay,
                  brunch: mealPlan[val].brunch,
                  snack: mealPlan[val].snack,
                  dinner: mealPlan[val].dinner,
                  color: mealPlan[val].color,
                  image: mealPlan[val].image,
                );
              })),
    );
  }
}
