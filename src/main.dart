import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: All(),
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




