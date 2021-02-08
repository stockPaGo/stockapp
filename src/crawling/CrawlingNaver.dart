/**
 * CrawlingNaver
 * 네이버 (http://finance.naver.com/)
 * 네이버 (http://finance.daum.net/)
 * 의 데이터 크롤링하여 리턴
 *
 * version 1.0
 *
 * 2021.02.08
 *
 * author young kyun
 */

import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:cp949/cp949.dart' as cp949;

import 'dart:convert';

import '../model/ModelStockPrice.dart';
import '../model/ModelDaum.dart';

void main() {
  // 인기검색
  //getPopularSearch().then((value) => value.forEach((element) {
  //  print(element.isu_abbrv_str);
  //}));

  // 다음조회
  getDealPrecedenceDaum().then((value) => value.forEach((element) {
    print(element.isu_abbrv_str);
  }));
}

/*
 * 인기검색
 * 네이버 검색상위 종목 30개
 */
Future<List<ModelStockPrice>> getPopularSearch () async {
  http.Response response = await http.get(
      'https://finance.naver.com/sise/lastsearch2.nhn'
  );

  if (response.statusCode == 200) {
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
  }
}

/*
 * 인기검색
 * 다음 검색상위 종목
 */
Future<List<ModelDaum>> getPopularSearchDaum () async {
  http.Response response = await http.get(
      'https://finance.daum.net/api/search/ranks?limit=10',
      headers: {
        'referer': 'https://finance.daum.net/',
      }
  );

  final parsed = json.decode(utf8.decode(response.bodyBytes))['data'].cast<Map<String, dynamic>>();
  return parsed.map<ModelDaum>((json) => ModelDaum.fromJson(json)).toList();
}

/*
 * 거래급증
 * 네이버 거래급증 종목 30개
 */
Future<List<ModelStockPrice>> getDealUpsurge () async {
  http.Response response = await http.get(
      'https://finance.naver.com/sise/sise_quant_high.nhn'
  );

  if (response.statusCode == 200) {
    Document document = parser.parse(cp949.decodeString(response.body));
    //List<Element> keywordElements = document.querySelectorAll('.type_l tbody tr');
    List<Element> keywordElements = document.querySelectorAll('.type_2 tbody tr');
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
  }
}

/*
 * 거래급증
 * 다음 검색상위 종목
 */
Future<List<ModelDaum>> getDealUpsurgeDaum () async {
  http.Response response = await http.get(
      'https://finance.daum.net/api/domestic/trend/price_performance/?pagination=true&perPage=30&changeType=RISE',
      headers: {
        'referer': 'https://finance.daum.net/',
      }
  );

  final parsed = json.decode(utf8.decode(response.bodyBytes))['KOSPI'].cast<Map<String, dynamic>>();
  return parsed.map<ModelDaum>((json) => ModelDaum.fromJson(json)).toList();
}

/*
 * 거래 상위
 * 네이버 거래상위 종목 30개
 * */
Future<List<ModelStockPrice>> getDealPrecedence () async {
  http.Response response = await http.get(
      'https://finance.naver.com/sise/sise_quant.nhn'
  );

  if (response.statusCode == 200) {
    Document document = parser.parse(cp949.decodeString(response.body));
    //List<Element> keywordElements = document.querySelectorAll('.type_l tbody tr');
    List<Element> keywordElements = document.querySelectorAll('.type_2 tbody tr');
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
  }
}

/*
 * 거래상위
 * 다음 거래상위 종목
 */
Future<List<ModelDaum>> getDealPrecedenceDaum () async {
  http.Response response = await http.get(
      'https://finance.daum.net/api/trend/trade_volume?page=1&perPage=30&fieldName=accTradeVolume&order=desc&market=KOSPI&pagination=true',
      headers: {
        'referer': 'https://finance.daum.net/',
      }
  );

  final parsed = json.decode(utf8.decode(response.bodyBytes))['data'].cast<Map<String, dynamic>>();
  return parsed.map<ModelDaum>((json) => ModelDaum.fromJson(json)).toList();
}

/*
 * 각종 주가정보
 * 네이버 거래상위 종목 30개
 * */
Future<List<ModelStockPrice>> getVariousStockInformation (isu_code) async {
  http.Response response = await http.get(
      'https://finance.naver.com/item/main.nhn?code=${isu_code}'
  );

  if (response.statusCode == 200) {
    Document document = parser.parse(cp949.decodeString(response.body));
    //List<Element> keywordElements = document.querySelectorAll('.type_l tbody tr');


    List<Map<String, dynamic>> keywords = [];
    // 목표주가 goalPrice
    List<Element> goalPrices = document.querySelectorAll('#tab_con1 .rwidth tbody td em');
    List<Element> pers = document.querySelectorAll('#tab_con1 .gray tbody td em');

    keywords.add({
      'GOAL_PRICE': goalPrices[0].text, // 투자의견
      'SUGGESTION': goalPrices[1].text, // 목표주가
      'SAME_PER': pers[3].text, // 동일업종 PER
      'SAME_PER_FLUCTUATION': pers[4].text.replaceAll('\n', '').replaceAll('\t', ''), // 동일업종 등락률
    });

    return keywords.map<ModelStockPrice>((json) => ModelStockPrice.fromJson(json)).toList();
  }
}