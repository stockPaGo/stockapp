import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/obj/PER.dart';

class DatabasePER {
  insert(PER per) async {
    print('insert(PER per) {');
    await FirebaseFirestore.instance.collection('stock').doc(per.isu_cd).collection(per.isu_cd).doc(per.work_dt.replaceAll('/', '')).set(per.toJson());
  }

  update(PER per) async {
    print('update(PER per) {');
    await FirebaseFirestore.instance.collection("stock").doc(per.isu_cd).collection(per.isu_cd).doc(per.work_dt.replaceAll('/', '')).update(per.toJson());
  }
}