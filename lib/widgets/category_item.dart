
import 'package:flutter/material.dart';

class categoryitem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  categoryitem(this.title, this.color , this.id);
  void Select(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/italian',
        arguments: {'_title': title , 'id':id} );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Select(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(.7), color],
                end: Alignment.topLeft,
                begin: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
