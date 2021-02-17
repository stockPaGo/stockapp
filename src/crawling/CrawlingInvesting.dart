import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/ModelStockPrice.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;


void main() {
  // 인기검색
  //getPopularSearch().then((value) => value.forEach((element) {
  //  print(element.isu_abbrv_str);
  //}));

  // 다음조회
  /*getDealPrecedenceDaum().then((value) => value.forEach((element) {
    print(element.isu_abbrv_str);
  }));*/
  getStockKey(43433).then((value) => null);
}

/*
 * 인기검색
 * 네이버 검색상위 종목 30개
 */
Future<List<ModelStockPrice>> getStockKey (pair_id) async {
  http.Response response = await http.post(
    'https://kr.investing.com/instruments/Service/GetTechincalData',
    body: 'pairID=${pair_id}&period=900&viewType=normal',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'X-Requested-With': 'XMLHttpRequest',
    },
        /*'bld=dbms/MDC/STAT/standard/MDCSTAT01701&'
        'tboxisuCd_finder_stkisu0_2=${isu_cd}/&'
        'isuCd=KR7${isu_cd}003&'
        'isuCd2=KR7${isu_cd}003&'
        'codeNmisuCd_finder_stkisu0_2=&'
        'param1isuCd_finder_stkisu0_2=STK&'
        'strtDd=19950502&'
        'endDd=${UtilDate.getDay(day: -1)}&'
        'share=1&'
        'money=1&'
        'csvxls_isNo=false'*/
  );

  if (response.statusCode == 200) {
    Document document = parser.parse(response.body);

    int buy = 0;
    int sell = 0;

    buy += int.parse(document.querySelector('#techStudiesInnerWrap .summaryTableLine #maBuy').text.replaceAll("(", "").replaceAll(")", ""));
    buy += int.parse(document.querySelector('#techStudiesInnerWrap .summaryTableLine #tiBuy').text.replaceAll("(", "").replaceAll(")", ""));

    sell += int.parse(document.querySelector('#techStudiesInnerWrap .summaryTableLine #tiBuy').text.replaceAll("(", "").replaceAll(")", ""));
    sell += int.parse(document.querySelector('#techStudiesInnerWrap .summaryTableLine #tiSell').text.replaceAll("(", "").replaceAll(")", ""));

    print('매수 : '+ buy.toString());
    print('매도 : '+ sell.toString());

    print('요약 : '+ document.querySelector('#techStudiesInnerWrap .uppercaseText').text.replaceAll("(", "").replaceAll(")", ""));

    //List<Map<String, dynamic>> keywords = [];
    /*for (var element in keywordElements) {
        Element title = element.querySelector('.noBold');
        keywords.add({
          'ISU_ABBRV_STR': title.text, //
        });
    }*/

    return null;//keywords.map<ModelStockPrice>((json) => ModelStockPrice.fromJson(json)).toList();
  }

  /*if (response.statusCode == 200) {
    Document document = parser.parse(cp949.decodeString(response.body));
    List<Element> keywordElements = document.querySelectorAll('.type_5 tbody tr');
    List<Map<String, dynamic>> keywords = [];
    for (var element in keywordElements) {
      if (element.querySelector('.no') != null) {
        Element title = element.querySelector('td a');
        keywords.add({
          'ISU_ABBRV_STR': title.text, // 종목명
        });
      }
    }

    return keywords.map<ModelStockPrice>((json) => ModelStockPrice.fromJson(json)).toList();
  }*/
}