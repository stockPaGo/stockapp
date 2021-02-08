/**
 * CrawlingKrx
 * 한국거래소 (http://data.krx.co.kr/)
 * 의 데이터 크롤링하여 리턴
 *
 * version 1.0
 *
 * 2021.02.04
 *
 * author young kyun
 */

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/ModelForeignerStock.dart';
import '../model/ModelStockPrice.dart';
import '../util/UtilDate.dart';

void main() {
  /*Future<List<ModelStockPrice>> a = CrawlingKrx.getIndividualStockPriceProgress('005930', '');
  //Future<List<ModelStockPrice>> b = CrawlingKrx.getAllStockPriceProgress(UtilDate.getDay(day: -1));

  //a.then((value) => print(value[0].tdd_clsprc));
  a.then((value) => value.forEach((element) { print(
      '일자 : ${element.trd_dd}, 종가 : ${element.tdd_clsprc}, 시가 : ${element.tdd_opnprc}, 고가 : ${element.tdd_hgprc}, 저가 : ${element.tdd_lwprc}, 거래량 : ${element.acc_trdvol}'
  ); }));*/

  /*getAllForeignerStock(UtilDate.getDay(day: -1)).then((value) => value.forEach((element) {
    print('종목코드 : ${element.isu_srt_cd}, 종목명 : ${element.isu_abbrv}, 등락률 : ${element.fluc_rt} ');
  }));*/

  getIndividualStockPer('005930').then((value) => value.forEach((element) {
    print('일자 : ${element.trd_dd}, bps : ${element.bps}, eps : ${element.eps}, pbr : ${element.pbr}, per : ${element.per}');
  }));

  /*getAllStockPer(UtilDate.getDay(day: -1)).then((value) => value.forEach((element) {
    print('종목코드 : ${element.isu_srt_cd}, 종목명 : ${element.isu_abbrv}, bps : ${element.bps}, eps : ${element.eps}, pbr : ${element.pbr}, per : ${element.per}');
  }));*/
}

// 개별종목 시세 추이
// 005930, 삼성전자
Future<List<ModelStockPrice>> getIndividualStockPriceProgress (isu_cd) async {
  http.Response response = await http.post(
      'http://data.krx.co.kr/comm/bldAttendant/getJsonData.cmd?'
          'bld=dbms/MDC/STAT/standard/MDCSTAT01701&'
          'tboxisuCd_finder_stkisu0_2=${isu_cd}/&'
          'isuCd=KR7${isu_cd}003&'
          'isuCd2=KR7${isu_cd}003&'
          'codeNmisuCd_finder_stkisu0_2=&'
          'param1isuCd_finder_stkisu0_2=STK&'
          'strtDd=19950502&'
          'endDd=${UtilDate.getDay(day: -1)}&'
          'share=1&'
          'money=1&'
          'csvxls_isNo=false'
  );

  final parsed = json.decode(utf8.decode(response.bodyBytes))['output'].cast<Map<String, dynamic>>();
  return parsed.map<ModelStockPrice>((json) => ModelStockPrice.fromJson(json)).toList();
}

// 전종목 시세 추이
Future<List<ModelStockPrice>> getAllStockPriceProgress (trdDd) async {
  http.Response response = await http.post(
    'http://data.krx.co.kr/comm/bldAttendant/getJsonData.cmd?'
    'bld=dbms/MDC/STAT/standard/MDCSTAT01501&'
    'mktId=ALL&'
    'trdDd=${trdDd}&'
    'share=1&'
    'money=1&'
    'csvxls_isNo=false'
  );

  final parsed = json.decode(utf8.decode(response.bodyBytes))['OutBlock_1'].cast<Map<String, dynamic>>();
  return parsed.map<ModelStockPrice>((json) => ModelStockPrice.fromJson(json)).toList();
}

// 개별종목 외국인 보유량
Future<List<ModelForeignerStock>> getIndividualForeignerStock (isu_cd) async {
  http.Response response = await http.post(
    'http://data.krx.co.kr/comm/bldAttendant/getJsonData.cmd?'
    'bld=dbms/MDC/STAT/standard/MDCSTAT03702&'
    'searchType=2&'
    'mktId=ALL&'
    'trdDd=${UtilDate.getDay(day: -1)}&'
    'tboxisuCd_finder_stkisu0_1=${isu_cd}/&'
    'isuCd=KR7${isu_cd}003&'
    'isuCd2=KR7${isu_cd}003&'
    'codeNmisuCd_finder_stkisu0_1=&'
    'param1isuCd_finder_stkisu0_1=STK&'
    'strtDd=20051003&'
    'endDd=${UtilDate.getDay(day: -1)}&'
    'share=1&'
    'csvxls_isNo=false',
  );

  final parsed = json.decode(utf8.decode(response.bodyBytes))['output'].cast<Map<String, dynamic>>();
  return parsed.map<ModelForeignerStock>((json) => ModelForeignerStock.fromJson(json)).toList();
}

// 전종목 외국인 보유량
Future<List<ModelForeignerStock>> getAllForeignerStock (trdDd) async {
  http.Response response = await http.post(
    'http://data.krx.co.kr/comm/bldAttendant/getJsonData.cmd?'
    'bld=dbms/MDC/STAT/standard/MDCSTAT03701&'
    'searchType=1&'
    'mktId=ALL&'
    'trdDd=${trdDd}&'
    'param1isuCd_finder_stkisu0_1=STK&'
    'share=1&'
    'csvxls_isNo=false',
  );

  final parsed = json.decode(utf8.decode(response.bodyBytes))['output'].cast<Map<String, dynamic>>();
  return parsed.map<ModelForeignerStock>((json) => ModelForeignerStock.fromJson(json)).toList();
}

// 개별종목 PER
Future<List<ModelStockPrice>> getIndividualStockPer (isu_cd) async {
  http.Response response = await http.post(
    'http://data.krx.co.kr/comm/bldAttendant/getJsonData.cmd?'
    'bld=dbms/MDC/STAT/standard/MDCSTAT03502&'
    'searchType=2&'
    'mktId=ALL&'
    'trdDd=${UtilDate.getDay(day: -1)}&'
    'tboxisuCd_finder_stkisu0_2=${isu_cd}/&'
    'isuCd=KR7${isu_cd}003&'
    'isuCd2=KR7${isu_cd}003&'
    'codeNmisuCd_finder_stkisu0_2=&'
    'param1isuCd_finder_stkisu0_2=STK&'
    'strtDd=20051003&'
    'endDd=${UtilDate.getDay(day: -1)}&'
    'csvxls_isNo=false',
  );

  final parsed = json.decode(utf8.decode(response.bodyBytes))['output'].cast<Map<String, dynamic>>();
  return parsed.map<ModelStockPrice>((json) => ModelStockPrice.fromJson(json)).toList();
}

// 전종목 PER
// getAllStockPer
Future<List<ModelStockPrice>> getAllStockPer (trdDd) async {
  http.Response response = await http.post(
    'http://data.krx.co.kr/comm/bldAttendant/getJsonData.cmd?'
        'bld=dbms/MDC/STAT/standard/MDCSTAT03501&'
        'searchType=1&'
        'mktId=ALL&'
        'trdDd=${trdDd}&'
        'codeNmisuCd_finder_stkisu0_2=&'
        'param1isuCd_finder_stkisu0_2=STK&'
        'csvxls_isNo=false',
  );

  final parsed = json.decode(utf8.decode(response.bodyBytes))['output'].cast<Map<String, dynamic>>();
  return parsed.map<ModelStockPrice>((json) => ModelStockPrice.fromJson(json)).toList();
}