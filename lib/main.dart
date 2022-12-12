import 'package:dailymeals/Models/meal.dart';
import 'package:dailymeals/dummy_data.dart';
import 'package:dailymeals/widgets/Filter_Screen.dart';
import 'package:dailymeals/widgets/Tab_Screen.dart';
import 'package:dailymeals/widgets/category_screen_meals.dart';
import 'package:dailymeals/widgets/receipe_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availabemeal = DUMMY_MEALS;
  List<Meal> _favMeal = [];

  Map<String, bool> _filter = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactos': false
  };

  void setfilter(Map<String, bool> filterdata) {
    setState(() {
      _filter = filterdata;
      _availabemeal = DUMMY_MEALS.where((meal) {
        if (_filter['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filter['lactos'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filter['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filter['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void Setfavourite(String mealid){
       final index = _favMeal.indexWhere((element) => element.id == mealid);

       if(index>=0){
        setState(() {
          _favMeal.removeAt(index);
        });
       }
       else{
        setState(() {
          _favMeal.add(DUMMY_MEALS.firstWhere((element) => element.id == mealid));
        });
       }
  }
  bool isfav(String mealID){
    return _favMeal.any((element) => element.id == mealID);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(_favMeal),
        '/italian': (context) => CategoryMealsScreen(_availabemeal),
        '/Receipe': (context) => Receipe(isfav,Setfavourite),
        FilterScreen.routeName: (context) => FilterScreen(setfilter, _filter)
      },
    );
  }
}
