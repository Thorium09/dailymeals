import 'package:dailymeals/Models/meal.dart';
import 'package:dailymeals/widgets/meal_screen.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> _favList;
  FavouriteScreen(this._favList);

  @override
  Widget build(BuildContext context) {
    return _favList.isEmpty
        ? Center(
            child: Text(
              "Looks Like You are Not A Foodie",
            ),
          )
        : Container(
            child: ListView.builder(
            itemBuilder: (context, index) {
              return MealScreen(
                  _favList[index].id,
                  _favList[index].title,
                  _favList[index].imageUrl,
                  _favList[index].duration,
                  _favList[index].complexity,
                  _favList[index].affordability);
            },
            itemCount: _favList.length,
          ));
  }
}
