import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/drawer/MyDrawer.dart';
import 'package:flutter_app/obj/DAY.dart';

class ByDate extends StatefulWidget {
  @override
  _ByDateState createState() => _ByDateState();
}

class _ByDateState extends State<ByDate> {
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

              return Card(
                child: ListTile(
                  title: new Text(day.isu_nm.toString()),
                  subtitle: new Text(day.tdd_cmpr.toString()),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/detail');
                  },
                ),
              );
            })?.toList() ?? [],
          );
        }
      ),
    );
  }
}