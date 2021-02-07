import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/drawer/MyDrawer.dart';
import 'package:flutter_app/obj/DAY.dart';
import 'package:flutter_app/page/all/td/Td.dart';

class All extends StatefulWidget {
  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('모든 주식'),
      ),
      drawer: new MyDrawer(),
      body: StreamBuilder<QuerySnapshot> (
          stream: FirebaseFirestore.instance.collection("stock").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return snapshot.hasError ? Text('Something went wrong') :
            snapshot.connectionState == ConnectionState.waiting ? Text("Loading") :
            ListView(
              children: snapshot.data.docs?.map((document) {
                DAY day = DAY.fromJson(document.data());
                if(day.isu_nm != null)
                  return Td(day);
              })?.toList() ?? [],
            );
          }
      ),
    );
  }
}