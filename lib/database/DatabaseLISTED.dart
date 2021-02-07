import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/obj/LISTED.dart';

class DatabaseLISTED {
  insert(LISTED listed) async {
    print('insert(LISTED listed) async {');
    await FirebaseFirestore.instance.collection('stock').doc(listed.isu_cd).set(listed.toJson());
  }
}