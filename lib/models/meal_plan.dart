import 'package:fastingApp/constants/images.dart';
import 'package:flutter/material.dart';

class MealPlan {
  String title;
  String weekDay;
  String brunch;
  String snack;
  String dinner;
  String image;
  Color color;

  MealPlan(
      {this.title,
      this.brunch,
      this.color,
      this.dinner,
      this.image,
      this.snack,
      this.weekDay});
}

List<MealPlan> mealPlan = [
  MealPlan(
      title: '16:8',
      weekDay: 'Monday',
      brunch: '200ml.plain. Yoghurt',
      snack: 'Lentils salad with apricots',
      dinner: '2 baked potatoes + palm size salmon + 1 cup swiss chard',
      color: Colors.purple.withOpacity(.6),
      image: Images.monday),
  MealPlan(
      title: '24.4',
      weekDay: 'Tuesday',
      brunch: '250ml 100% plain fruit juice ',
      snack: 'Chick peas hummus salad',
      dinner: '1/2 cup lentils + 1 cup spinach + 1/2 cup pasta',
      color: Colors.orange.withOpacity(.6),
      image: Images.tuesday),
  MealPlan(
      title: '20:4',
      weekDay: 'Wednesday',
      brunch: '2 boiled eggs + black coffee',
      snack: 'Watermelon and mixed berries salad add lettuce',
      dinner:
          '1/3 cup. Mashed potatoes + 1/3 cup Turkey breast stew + 1 cup broccli',
      color: Colors.green.withOpacity(.6),
      image: Images.wednesday),
  MealPlan(
      title: '18:6',
      weekDay: 'Thursday',
      brunch: '200ml plain yoghurt',
      snack: 'Lentils salad add apricots',
      dinner: '1/2 cup  brown rice + 1 cup mixed veggies + 1/2 cup beef',
      color: Colors.blue.withOpacity(.6),
      image: Images.thursday),
  MealPlan(
      title: '5:2 / Fast Diet',
      weekDay: 'Friday',
      brunch: 'White coffee use 120ml milk + 1 big baked potatoe',
      snack: 'Cucumber, mixed berries salad',
      dinner:
          '1/2 cup  Kidney beans + 1 cup cauliflower, carrots + 1/2 cup brown rice',
      color: Colors.orange.withOpacity(.6),
      image: Images.friday),
  MealPlan(
      title: '24 hour fast',
      weekDay: 'Saturday',
      brunch: '1 banana + white coffee use 125ml milk + 1/2 apple',
      snack: 'Chick peas hummus salad',
      dinner: '2 potatoe wedges baked + 1 cup swiss chard + palm size salmon',
      color: Colors.purple.withOpacity(.6),
      image: Images.saturday),
  MealPlan(
      title: '36 hour fast',
      weekDay: 'Sunday',
      brunch: '200ml 100% fruit juice',
      snack: 'Garden Salad, use 2 boiled eggs',
      dinner:
          '1 cup stir fry veggies + 1/2 cup whole grain pasta + 1/2 cup beef',
      color: Colors.green.withOpacity(.6),
      image: Images.sunday),
];
