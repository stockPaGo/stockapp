import 'dart:convert';

import 'package:cp949/cp949.dart' as cp949;
import 'package:flutter_app/obj/RANK.dart';

import 'package:http/http.dart' as http;
import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;

/* 네이버에서 검색 순위 데이터 가져옴 */
class CrawlingRank {
  Future<List<RANK>> fetch() async {
    http.Response response = await http.get(
        'https://finance.naver.com/sise/field_submit.nhn?menu=lastsearch2&returnUrl=http%3A%2F%2Ffinance.naver.com%2Fsise%2Flastsearch2.nhn&fieldIds=open_val&fieldIds=buy_total&fieldIds=frgn_rate&fieldIds=sell_total&fieldIds=listed_stock_cnt');

    if (response.statusCode == 200) {
      Document document = parser.parse(cp949.decodeString(response.body));
      List<Element> keywordElements = document.querySelectorAll(
          '.type_5 tbody tr');

      List<Map<String, dynamic>> keywords = [];
      for (var element in keywordElements) {

        if (element.querySelector('.no') != null) {
          Element no = element.querySelector('.no');
          Element title = element.querySelector('td a');
          List<Element> number = element.querySelectorAll('.number');
          keywords.add({
            'title': title.text,
            '전일비': number[2].text.replaceAll(RegExp('\n'), '').replaceAll(
                RegExp('\t'), ''),
            '등락률': number[3].text.replaceAll(RegExp('\n'), '').replaceAll(
                RegExp('\t'), ''),
            '시가': number[4].text,
            '매수총잔량': number[5].text,
            '매도총잔량': number[6].text,
            '상장주식수': number[7].text,
            '외국인비율': number[8].text,
          });
        }
      }

      return keywords.map<RANK>((json) => RANK.fromJson(json)).toList();
    }
  }
}