import 'package:dailymeals/Models/meal.dart';
import 'package:dailymeals/widgets/Drawer_Screen.dart';
import 'package:dailymeals/widgets/Favourite_Screen.dart';
import 'package:dailymeals/widgets/categories_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
 final List<Meal> list;
  TabScreen(this.list);
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
   List<Map<String , Object>> pages ;
   @override
   void initState() {
    pages = [
    {
      'title': 'Category' ,
      'page' : CategoriesScreen()
    },
    {
      'title': 'Favourites' ,
      'page' : FavouriteScreen(widget.list)
    }
  ];
    super.initState();
  }
  int SlectedIndex = 0;
  void slectIndex(int index) {
    setState(() {
      SlectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(pages[SlectedIndex]['title']),
      ),
      body: pages[SlectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: SlectedIndex,
          type: BottomNavigationBarType.shifting,
          onTap: slectIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favourite',
            )
          ]),
    );
  }
}
