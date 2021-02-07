import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/obj/DAY.dart';

class Td extends StatelessWidget {
  Td(this.day);
  final DAY day;

  List colors = [
    Colors.red,
    Colors.redAccent,
    Colors.deepOrange,
    Colors.deepOrangeAccent,
    Colors.pink,
    Colors.pinkAccent,
    Colors.purple,
    Colors.purpleAccent,
    Colors.orangeAccent,
    Colors.orange,
    Colors.amber,
    Colors.amberAccent,
    Colors.lightGreen,
    Colors.lightGreenAccent,
    Colors.lime,
    Colors.limeAccent,
    Colors.yellow,
    Colors.yellowAccent,
    Colors.green,
    Colors.greenAccent,
    Colors.teal,
    Colors.tealAccent,
    Colors.cyanAccent,
    Colors.cyan,
    Colors.blue,
    Colors.blueAccent,
    Colors.blueGrey,
    Colors.brown,
    Colors.deepPurple,
    Colors.deepPurpleAccent,

    Colors.grey,


    Colors.indigo,
    Colors.indigoAccent,

    Colors.lightBlue,
    Colors.lightBlueAccent,







  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // if you need this
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      color: colors[Random().nextInt(colors.length)],
      child: ListTile(
        title: new Text(day.isu_nm.toString()),
        subtitle: new Text(day.tdd_cmpr.toString()),
        onTap: (){
          Navigator.pop(context);
          Navigator.pushNamed(context, '/detail');
        },
      ),

    );
  }
}