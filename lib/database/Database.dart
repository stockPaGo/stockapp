import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/drawer/MyDrawer.dart';

class Database extends StatefulWidget {
  @override
  _DatabaseState createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("데이터베이스"),
      ),
      drawer: new MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlatButton(
            color: Colors.blue,
            child: Text("create button",style: TextStyle(color : Colors.white)),
            onPressed: (){
              //클릭시 데이터를 추가해준다.
              String book = "천년의_질문";
              FirebaseFirestore.instance.collection('books').doc(book)
                  .set({ 'page': 433, 'purchase?': false, 'title':'천년의_질문'});
            },
          ),
          FlatButton(
            color: Colors.blue,
            child: Text("read button", style: TextStyle(color : Colors.white)),
            onPressed: (){
              //클릭시 데이터를 읽어준다
              String title = "";
              FirebaseFirestore.instance.collection("books").doc("oaAmtr6qOYlqqzx9M8wZ").get().then((DocumentSnapshot ds){
                title = ds.get('title');
                print(title);
              });
            },
          ),
          FlatButton(
            color: Colors.blue,
            child: Text("update button", style: TextStyle(color : Colors.white)),
            onPressed: (){
              //클릭시 데이터를 갱신해준다.
              FirebaseFirestore.instance.collection("books").doc("oaAmtr6qOYlqqzx9M8wZ").update({"page":543});
            },
          ),
          FlatButton(
            color: Colors.blue,
            child: Text("delete button", style: TextStyle(color : Colors.white)),
            onPressed: (){
              //특정 document 삭제
              FirebaseFirestore.instance.collection("books").doc("천년의_질문").delete();
              //특정 document 의 field 하나를 삭제
              FirebaseFirestore.instance.collection('books').doc('chemistry_between_us').update({'page': FieldValue.delete()});
            },
          ),
        ],
      ),
    );
  }
}