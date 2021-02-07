import 'dart:convert';

import 'package:flutter_app/obj/DAY2.dart';
import 'package:http/http.dart' as http;

Map<String, String> headers = {};

void updateCookie(http.Response response) {
  String rawCookie = response.headers['set-cookie'];

  print("cookie" + rawCookie);

  if (rawCookie != null) {
    int index = rawCookie.indexOf(';');
    headers['cookie'] =
    (index == -1) ? rawCookie : rawCookie.substring(0, index);
  }
}

List<DAY2> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody)['output'].cast<Map<String, dynamic>>();
  return parsed.map<DAY2>((json) => DAY2.fromJson(json)).toList();
}

void main() async {
  http.Response response = await http.post(
    'http://data.krx.co.kr/comm/bldAttendant/getJsonData.cmd?'
    'bld=dbms/MDC/STAT/standard/MDCSTAT01701&'
    'tboxisuCd_finder_stkisu0_2=005930/삼성전자&'
    'isuCd=KR7005930003&'
    'isuCd2=KR7005930003&'
    'codeNmisuCd_finder_stkisu0_2=삼성전자&'
    'param1isuCd_finder_stkisu0_2=STK&'
    'strtDd=20210125&'
    'endDd=20210202&'
    'share=1&'
    'money=1&'
    'csvxls_isNo=false'
  );

  final parsed = json.decode(utf8.decode(response.bodyBytes))['output'].cast<Map<String, dynamic>>();
  List<DAY2> days = parsed.map<DAY2>((json) => DAY2.fromJson(json)).toList();

  print('tdd_clsprc : '+days[0].tdd_clsprc);

  days.map((e) => print('aaaa'));

  days.map((e) {
    print('acc_trdval : '+e.acc_trdval);
    print('acc_trdval : '+e.acc_trdval);
    print('cmpprevdd_prc : '+e.cmpprevdd_prc);
    print('fluc_rt : '+e.fluc_rt);
    print('fluc_tp_cd : '+e.fluc_tp_cd);
    print('list_shrs : '+e.list_shrs);
    print('mktcap : '+e.mktcap);
    print('tdd_clsprc : '+e.tdd_clsprc);

  });

  //final parsed = json.decode(response.body)['block1'].cast<Map<String, dynamic>>();
  //return parsed.map<DAY>((json) => DAY.fromJson(json)).toList();




  /*Document document = parser.parse(response.body);
  print(document);
  List<Element> keywordElements = document.querySelectorAll('.cdr_list_wrap .cdr_list .cdr_item');
  List<Map<String, dynamic>> keywords = [];
  for (var element in keywordElements) {
    Element link = element.querySelector('a');
    Element rank = element.querySelector('.cdr_num');
    Element title = element.querySelector('.cdr_tt');
    keywords.add({
      'rank': rank.text,
      'title': title.text,
      'url': link.attributes['href']
    });
  }

  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(keywords);
  print(prettyprint);*/
}
