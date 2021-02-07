import 'package:flutter/material.dart';
import 'package:flutter_app/database/Database.dart';
import 'package:flutter_app/page/all/All.dart';
import 'package:flutter_app/page/byDate/ByDate.dart';
import 'package:flutter_app/page/byMonth/ByMonth.dart';
import 'package:flutter_app/page/detail/Detail.dart';
import 'package:flutter_app/page/interest/Interest.dart';
import 'package:flutter_app/page/rank/Rank.dart';
import 'package:flutter_app/page/search/Search.dart';
import 'package:flutter_app/tensorFlow/TensorFlow.dart';

import 'MyHomePage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Rank(),
      initialRoute: '/',
      routes: {
        '/all': (context) => All(),
        '/byDate': (context) => ByDate(),
        '/byMonth': (context) => ByMonth(),
        '/tensorFlow': (context) => TensorFlow(),
        '/database': (context) => Database(),
        '/interest': (context) => Interest(),
        '/search': (context) => Search(),
        '/detail': (context) => Detail(),
      },
    );
  }
}