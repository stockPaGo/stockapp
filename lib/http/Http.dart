import 'package:http/http.dart' as http;
import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;

import 'dart:convert';

void main() async {
  http.Response response = await http.get('https://m.naver.com/include/grid/panel_DATA.shtml');
  Document document = parser.parse(response.body);
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
  print(prettyprint);
}
