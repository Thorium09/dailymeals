import 'package:dailymeals/widgets/Drawer_Screen.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = '/filter';
  final Function saveFilters;
  final Map<String, bool> _filters;
  FilterScreen(this.saveFilters, this._filters);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isgluteen = false;
  bool isVeg = false;
  bool isVegan = false;
  bool isLactosFree = false;

  @override
  initState() {
    super.initState();
    isgluteen = widget._filters['gluten'];
    isVeg = widget._filters['vegetarian'];
    isVegan = widget._filters['vegan'];
    isLactosFree = widget._filters['lactos'];
  }

  Widget FilterSwitch(String desc, bool newValue, Function U) {
    return SwitchListTile(
      title: Text(desc),
      value: newValue,
      onChanged: U,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Filter"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': isgluteen,
                  'lactos': isLactosFree,
                  'vegan': isVegan,
                  'vegetarian': isVeg,
                };
                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                FilterSwitch('Gluten Free', isgluteen, ((value) {
                  setState(() {
                    isgluteen = value;
                  });
                })),
                FilterSwitch('Veg', isVeg, ((value) {
                  setState(() {
                    isVeg = value;
                  });
                })),
                FilterSwitch('Vegan', isVegan, ((value) {
                  setState(() {
                    isVegan = value;
                  });
                })),
                FilterSwitch('Lactos Free', isLactosFree, ((value) {
                  setState(() {
                    isLactosFree = value;
                  });
                }))
              ],
            ))
          ],
        ));
  }
}
