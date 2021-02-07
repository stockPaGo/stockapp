import 'dart:convert';

import 'package:flutter_app/obj/PER.dart';
import 'package:http/http.dart' as http;

Map<String, String> headers = {};

/*
 * 종목별 주식  조회
 * */
class CrawlingEachPER {
  getPer () => fetchPhotos();

  Future<List<PER>> fetchPhotos() async {
    http.Response response = await http.get('http://marketdata.krx.co.kr/contents/COM/GenerateOTP.jspx?'
        'bld=MKD/13/1302/13020401/mkd13020401&'
        'name=form&'
        '_=1610346366505',
        headers: {
          'Host': 'marketdata.krx.co.kr',
          'Connection': 'keep-alive',
          'Accept': '*/*',
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',
          'X-Requested-With': 'XMLHttpRequest',
          'Referer': 'http://marketdata.krx.co.kr/mdi',
          'Accept-Encoding': 'gzip, deflate',
          'Accept-Language': 'ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7',
          'Cookie': '__utmz=139639017.1607770859.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); SCOUTER=xqgpb28c5ilnc; __utma=139639017.714927171.1607770859.1609575105.1609996069.3; __utmc=139639017; __utmb=139639017.1.10.1609996069; JSESSIONID=CF39708F0252B610364EA0268AEA41B0.103tomcat1; __utma=70557324.249917592.1607770867.1609763251.1609996079.8; __utmc=70557324; __utmz=70557324.1609996079.8.2.utmcsr=krx.co.kr|utmccn=(referral)|utmcmd=referral|utmcct=/; __utmb=70557324.4.10.1609996079'
        }
    );

    http.Response response2 = await http.post('http://marketdata.krx.co.kr/contents/MKD/99/MKD99000001.jspx',
      headers: {
        'Host': 'marketdata.krx.co.kr',
        'Connection': 'keep-alive',
        'Cache-Control': 'max-age=0',
        'Upgrade-Insecure-Requests': '1',
        'Origin': 'http://marketdata.krx.co.kr',
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',
        'Accept': 'application/json, text/javascript, */*; q=0.01',
        'Referer': 'http://marketdata.krx.co.kr/',
        'Accept-Encoding': 'gzip, deflate',
        'Accept-Language': 'ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7',
        'Cookie': '__utmz=139639017.1607770859.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utma=139639017.714927171.1607770859.1609575105.1609996069.3; __utmc=139639017; __utmb=139639017.1.10.1609996069; SCOUTER=x84h8k38nm73; JSESSIONID=7CB6F9B914419E9632203D645DC5E1A4.102tomcat4',
        'X-Requested-With': 'XMLHttpRequest'
      },
      body: {
        'market_gubun': 'ALL',
        'gubun': '2',
        'schdate': '20210112',
        'fromdate': '20200111',
        'todate': '20210111',

        'isu_cdnm': 'A005930/삼성전자',
        'isu_cd': 'KR7005930003',
        'isu_nm': '삼성전자',
        'isu_srt_cd': 'A005930',

        'pagePath': '/contents/MKD/13/1302/13020401/MKD13020401.jsp',
        'code': response.body,
      },
    );

    // compute 함수를 사용하여 parsePhotos를 별도 isolate에서 수행합니다.
    return parsePhotos(utf8.decode(response2.bodyBytes));
  }

  List<PER> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody)['result'].cast<Map<String, dynamic>>();
    return parsed.map<PER>((json) => PER.fromJson(json)).toList();
  }
}