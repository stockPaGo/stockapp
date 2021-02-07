import 'package:flutter/material.dart';
import 'package:flutter_app/drawer/MyDrawer.dart';
import 'package:flutter_app/http/CrawlingPER.dart';
import 'package:flutter_app/obj/PER.dart';

class ByMonth extends StatefulWidget {
  @override
  _ByMonthState createState() => _ByMonthState();
}

class _ByMonthState extends State<ByMonth> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('월별 예측'),
      ),
      drawer: new MyDrawer(),
      body: Center(
        child: FutureBuilder<List<PER>> (
            future: CrawlingPER().fetch(),
            builder: (context, snapshot) {
              return snapshot.hasError ? Text('Something went wrong') :
              snapshot.connectionState == ConnectionState.waiting ? Text("Loading") :
              ListView(
                children: snapshot.data.map((per) {
                  return Card(
                    child: ListTile(
                      title: Text(per.isu_cd),
                      subtitle: Text(per.isu_nm),
                      leading: Text(per.end_pr),
                    ),
                  );
                }).toList(),
              );
            }
        )
      ),
    );
  }
}