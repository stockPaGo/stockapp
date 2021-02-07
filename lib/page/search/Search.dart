import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/drawer/MyDrawer.dart';
import 'package:flutter_app/obj/DAY.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // 검색창 입력 내용
  TextEditingController controller = TextEditingController();

  Stream<QuerySnapshot> stream;

  // x 아이콘 클릭시 검색어 삭제
  emptyTheTextFormField() => controller.clear();

  // 데이터 가져오기
  controlSearching(str) {
    setState(() {
      stream = FirebaseFirestore.instance
          .collection("stock")
          .where('isu_nm', whereIn: [str])
          .snapshots();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: '종목명 검색...',
            hintStyle: TextStyle(color: Colors.white70),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            filled: true,
            prefixIcon: Icon(Icons.search, color: Colors.white70, size: 30),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: Colors.white70),
              onPressed: emptyTheTextFormField)
          ),
          style: TextStyle(fontSize: 18, color: Colors.white70),
          onFieldSubmitted: controlSearching,
        ),
      ),
      drawer: new MyDrawer(),
      body: StreamBuilder<QuerySnapshot> (
          stream: stream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return snapshot.hasError ? Text('Something went wrong') :
            snapshot.connectionState == ConnectionState.waiting ? Text("Loading") :
            snapshot.data == null ? Text('Empty') :
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