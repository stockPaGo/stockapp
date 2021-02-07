import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/obj/DAY.dart';


/*
db.collection('groups')
  .where('participants', 'array-contains', 'user123')
  .where('lastUpdated', '>', lastFetchTimestamp)
  .orderBy('lastUpdated', 'desc')
  .limit(25)
* */
class DatabaseDAY {
  insert(DAY day, String isu_cd) async {
    print('insert(PER per) {');
    await FirebaseFirestore.instance.collection('stock').doc(isu_cd).collection(isu_cd).doc(day.trd_dd.replaceAll('/', '')).set(day.toJson());
  }


  update(DAY day) async {
    await FirebaseFirestore.instance.collection('stock').doc(day.isu_cd).update(day.toJson());
  }

  insert2(DAY day) async {
    await FirebaseFirestore.instance.collection('stock').doc(day.isu_cd).set(day.toJson());
  }
}