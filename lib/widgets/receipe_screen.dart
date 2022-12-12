import 'package:dailymeals/dummy_data.dart';
import 'package:flutter/material.dart';

class Receipe extends StatefulWidget {
  final Function isfav;
  final Function toogle;
  Receipe(this.isfav,this.toogle);

  @override
  State<Receipe> createState() => _ReceipeState();
}

class _ReceipeState extends State<Receipe> {
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as String;
    final Selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == args);
    return Scaffold(
        appBar: AppBar(
          title: Text(Selectedmeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  Selectedmeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingediants'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                        color: Theme.of(context).accentColor,
                        child: Text(
                          Selectedmeal.ingredients[index],
                          style: TextStyle(fontSize: 17),
                        ));
                  },
                  itemCount: Selectedmeal.ingredients.length,
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(child: Text('${(index + 1)}')),
                          title: Text(
                            Selectedmeal.steps[index],
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Divider()
                      ],
                    );
                  },
                  itemCount: Selectedmeal.steps.length,
                ),
              )
            ],
          ),
        
        ),
        floatingActionButton: FloatingActionButton(child: Icon(
          widget.isfav(args) ? Icons.star : Icons.star_border
        ),
        onPressed: () => widget.toogle(args),
        ),
        );
  }
}
