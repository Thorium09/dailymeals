import 'package:dailymeals/widgets/Filter_Screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String title, Function taphandler) {
    return ListTile(
        leading: Icon(
          icon,
          size: 24,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'RobotCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        onTap: taphandler);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 160,
            padding: EdgeInsets.all(10),
            width: double.infinity,
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up!!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          buildListTile(Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          SizedBox(
            height: 5,
          ),
          buildListTile(Icons.star, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          })
        ],
      ),
    );
  }
}
