import 'package:flutter/material.dart';
import 'package:navigation/models/meal.dart';
import 'package:navigation/components/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? const Center(
            child: Text('No meal has been flagged as favorite'),
          )
        : ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (ct, index) {
              return MealItem(favoriteMeals[index]);
            });
  }
}
