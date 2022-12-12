import 'package:dailymeals/Models/meal.dart';
import 'package:dailymeals/widgets/meal_screen.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {

final List<Meal> _availabemeal;
CategoryMealsScreen(this._availabemeal);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categorymeal = widget._availabemeal.where((element) {
      return element.categories.contains(args['id']);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(args['_title']),
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return MealScreen(
                categorymeal[index].id,
                categorymeal[index].title,
                categorymeal[index].imageUrl,
                categorymeal[index].duration,
                categorymeal[index].complexity,
                categorymeal[index].affordability);
          }),
          itemCount: categorymeal.length,
        ));
  }
}
