import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('정영균',style: TextStyle(color: Colors.white),),
            accountEmail: Text('wjd0r@naver.com',style: TextStyle(color: Colors.white),),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.amber,
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent
            ),
          ),
          ListTile(
            leading: Icon(Icons.library_music),
            title: Text('검색 상위 종목'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.library_music),
            title: Text('모든 종목'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/all');
            },
          ),
          ListTile(
            leading: Icon(Icons.library_music),
            title: Text('일별 예측'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/byDate');
            },
          ),
          ListTile(
            leading: Icon(Icons.library_music),
            title: Text('월별 예측'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/byMonth');
            },
          ),
          ListTile(
            leading: Icon(Icons.library_music),
            title: Text('TensorFlow'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/tensorFlow');
            },
          ),
          ListTile(
            leading: Icon(Icons.library_music),
            title: Text('Database'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/database');
            },
          ),
          ListTile(
            leading: Icon(Icons.library_music),
            title: Text('관심종목'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/interest');
            },
          ),
          ListTile(
            leading: Icon(Icons.library_music),
            title: Text('종목검색'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/search');
            },
          ),
          ListTile(
            leading: Icon(Icons.movie),
            title: Text('Movies'),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Shopping'),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.apps),
            title: Text('Apps'),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}