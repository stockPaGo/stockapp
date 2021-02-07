import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/drawer/MyDrawer.dart';
import 'package:flutter_app/obj/DAY.dart';

class Interest extends StatefulWidget {
  @override
  _InterestState createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('관심종목'),
      ),
      drawer: new MyDrawer(),
      body: StreamBuilder<QuerySnapshot> (
          stream: FirebaseFirestore.instance
              .collection("stock")
              .where('isu_cd', whereIn: ['000020', '005930'])
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return snapshot.hasError ? Text('Something went wrong') :
            snapshot.connectionState == ConnectionState.waiting ? Text("Loading") :
            ListView(
              children: snapshot.data.docs?.map((document) {
                DAY day = DAY.fromJson(document.data());
                if(day.isu_nm != null)
                  return Card(
                    child: ListTile(
                      title: new Text(day.isu_nm.toString()),
                      subtitle: new Text(day.tdd_cmpr.toString()),
                    ),
                  );
              })?.toList() ?? [],
            );
          }
      ),
    );
  }
}