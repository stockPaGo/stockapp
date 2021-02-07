import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/covid-19/widgets/my_header.dart';
import 'package:flutter_app/drawer/MyDrawer.dart';
import 'package:flutter_app/http/CrawlingRank.dart';
import 'package:flutter_app/obj/DAY.dart';
import 'package:flutter_app/obj/RANK.dart';

class Rank extends StatefulWidget {
  @override
  _RankState createState() => _RankState();
}

class _RankState extends State<Rank> {
  var strings = [];
  Future<QuerySnapshot> future;
  List<DAY> days = [];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Future<void> initState() {
    super.initState();

    crawlingRank();
  }

  mergedStream() {
    setState(() {
      FirebaseFirestore.instance
        .collection("stock")
        .where('isu_nm', whereIn: strings)
        .get().then((QuerySnapshot values) {
          for(QueryDocumentSnapshot doc in values.docs) {
            setState(() {
              days.add(DAY.fromJson(doc.data()));
            });
          }
      });

      strings.clear();
    });
  }

  crawlingRank() {
    setState(() {
      days.clear();
    });
    CrawlingRank().fetch().then((List<RANK> ranks) {

      for(RANK rank in ranks) {
        if(strings.length == 10) {
          mergedStream();
        }
        setState(() {
          strings.add(rank.title);
        });
      }
      if(strings.length > 0) {
        mergedStream();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: new MyDrawer(),
      backgroundColor: Color(0xfff7f7f7),
      bottomNavigationBar: navigationBar,
      body: Column(
        children: <Widget>[
          MyHeader(
            textTop: "All you need",
            textBottom: "is stay at home.",
            offset: 0,
            scaffoldKey: _scaffoldKey,
          ),
          Container(
            height: 127,
            child: ListView(
              children: [
                SingleItems(),
                SingleItems(),
                SingleItems(),
                SingleItems(),
              ],
            ),
          ),
        ]
      ),
    );
  }

  Container top(_scaffoldKey) => Container(
    child: Stack(
      children: <Widget>[
        Positioned(
          bottom: 53,
          top: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(30, 30),
                bottomRight: Radius.elliptical(30, 30),
              ),
              gradient: LinearGradient(
                  colors: [
                    Colors.orangeAccent,
                    Colors.orange,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
                Spacer(),
                RichText(
                  text: TextSpan(
                    style: TextStyle(letterSpacing: 1.3),
                    children: [
                      TextSpan(
                        text: "Furniture",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: " that fits",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Text(
                  "your Style",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                    letterSpacing: 1.3,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 20,
          right: 20,
          child: Container(
            height: 57,
            alignment: Alignment.center,
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none
                  ),
                  hintText: "Search Furniture",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );

  BottomNavigationBar navigationBar = BottomNavigationBar(
    selectedItemColor: Colors.grey[500],
    unselectedItemColor: Colors.grey[400],
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.home), title: Text("Home")),
      BottomNavigationBarItem(
          icon: Icon(Icons.star), title: Text("Favorite")),
      BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket), title: Text("Basket")),
      BottomNavigationBarItem(
          icon: Icon(Icons.person_outline), title: Text("Profile")),
    ],
  );

  Widget rankList () {
    return days == null ? Text("Loading") :
    days.length == 0 ? Text("Empty") :
    ListView(
        children: days.map((DAY day) =>
        Card(
          child: ListTile(
            title: Text(day.isu_nm),
            subtitle: Text(day.isu_nm),
          ),
        )
    ).toList());
  }
}

class SingleItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 15,
                ),
                Text(
                  "검색순위",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19, color: Colors.indigo[600]),
                ),
                Spacer(),
                FlatButton(
                  child: Text(
                    "See All",
                    style: TextStyle(fontSize: 15, color: Colors.redAccent[100]),
                  ),
                  onPressed: () {},
                )
              ],
            ),
            Container(
              height: 127,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, id) {
                  return SingleItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(color: Colors.grey[300], blurRadius: 3.0),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "삼성전자",
                  style: TextStyle(fontWeight: FontWeight.bold,),
                ),
                Text(
                  "89,400",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.indigo[400]),
                ),
                Text(
                  "전일 대비 2,600 + 3.00%",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo[300]),
                ),
                Text(
                  "거래량 26,769,297",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent[100]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}