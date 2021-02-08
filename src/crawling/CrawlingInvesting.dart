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
Future<List<ModelStockPrice>> getStockKey () async {
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