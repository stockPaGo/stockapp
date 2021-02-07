import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/database/DatabaseDAY.dart';
import 'package:flutter_app/database/DatabaseLISTED.dart';
import 'package:flutter_app/http/CrawlingEachDAY.dart';
import 'package:flutter_app/http/CrawlingEachPER.dart';
import 'package:flutter_app/http/CrawlingRank.dart';
import 'package:flutter_app/http/CsvLISTED.dart';
import 'package:flutter_app/obj/DAY.dart';
import 'package:flutter_app/obj/INTEREST.dart';
import 'package:flutter_app/obj/LISTED.dart';
import 'package:flutter_app/sqLite/DbINTEREST.dart';
import 'package:flutter_app/util/Date.dart';

import 'MyApp.dart';
import 'database/DatabasePER.dart';
import 'http/CrawlingPER.dart';
import 'http/CsvSTOCK.dart';
import 'obj/PER.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // 특정일 per 크롤링 하여 데이터 베이스에 저장
  //Future<List<PER>> PERs = CrawlingPER().fetch();

  //PERs.then((List<PER> pers) async {
  //  for(var per in pers) {
  //    await DatabasePER().insert(per);
  //  }
  //});

  // 현재 주식 업데이트
  //CsvSTOCK().fetch().then((List<DAY> DAYs) async {
  //  for(var day in DAYs) {
  //    await DatabaseDAY().insert2(day);
  //  }
  //});

  //Future<List<LISTED>> LISTEDs = CsvLISTED().fetch();

  // 요건 개별임
  //Future<List<PER>> PERs = CrawlingEachPER().fetchPhotos();

  // 업데이트 구문
  //LISTEDs.then((List<LISTED> listeds) async {
  //  for(var list in listeds) {
  //    await DatabaseLISTED().insert(list);
  //  }
  //});

  // 날짜별 시세
  //Future<List<DAY>> PERs = CrawlingEachDAY().fetchPhotos();

  //PERs.then((List<DAY> pers) async {
  //  for(var per in pers) {
  //    await DatabaseDAY().insert(per, '005930');
  //  }
  //});

  //DbINTEREST().createData(INTEREST(isu_cd:'005930'));
  //DbINTEREST().selectData().then(((List<INTEREST> interests) {
  //  for(INTEREST interest in interests) {
  //    print(interest.isu_cd);
  //  }
  //}));

  runApp(MyApp());
}






