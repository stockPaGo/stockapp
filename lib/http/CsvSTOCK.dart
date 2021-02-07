import 'dart:convert';

import 'package:flutter_app/obj/DAY.dart';
import 'package:flutter_app/util/Date.dart';
import 'package:http/http.dart' as http;

/* 업종코드 */
class CsvSTOCK {
  get () => fetch();

  Future<List<DAY>> fetch() async {
    http.Response response = await http.get('http://marketdata.krx.co.kr/contents/COM/GenerateOTP.jspx?'+
        'name=fileDown&'+
        'filetype=csv&'+
        'url=MKD/13/1302/13020101/mkd13020101&'+
        'market_gubun=ALL&'+
        'sect_tp_cd=ALL&'+
        'schdate=' + Date().yesterday(1) + '&' +
        'pagePath=/contents/MKD/13/1302/13020101/MKD13020101.jsp',
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
    http.Response response2 = await http.post('http://file.krx.co.kr/download.jspx',
      headers: {
        'Host': 'file.krx.co.kr',
        'Connection': 'keep-alive',
        'Cache-Control': 'max-age=0',
        'Upgrade-Insecure-Requests': '1',
        'Origin': 'http://marketdata.krx.co.kr',
        'Content-Type': 'application/x-www-form-urlencoded',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
        'Referer': 'http://marketdata.krx.co.kr/',
        'Accept-Encoding': 'gzip, deflate',
        'Accept-Language': 'ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7',
        'Cookie': '__utmz=139639017.1607770859.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utma=139639017.714927171.1607770859.1609575105.1609996069.3; __utmc=139639017; __utmb=139639017.1.10.1609996069; SCOUTER=x84h8k38nm73; JSESSIONID=7CB6F9B914419E9632203D645DC5E1A4.102tomcat4'
      },
      body: {
        'code': response.body,
      },
    );

    List<String> csvRows = utf8.decode(response2.bodyBytes).split('\n');
    print(csvRows);

    csvRows.removeAt(0);

    List<DAY> list = [];
    for(var i=0; i<csvRows.length-1; i++) {
      String row = csvRows[i].
        replaceAll(",\"", "|").
        replaceAll("\",", "|").
        replaceFirst(",", "").
        replaceFirst(",", "|").
        replaceAll("\"", "").
        replaceAll(",", "").
        replaceAll(".", "");
      var csvDataCells = row.split('|');

      Map<String, dynamic> json = {};
      for(var j=0; j < csvDataCells.length; j++) {
        if(j == 9) {
          json["acc_trdval"] = csvDataCells[j];
        } else if(j == 8) {
          json["acc_trdvol"] = csvDataCells[j];
        } else if(j == 12) {
          json["list_shrs"] = csvDataCells[j];
        } else if(j == 10) {
          json["mktcap"] = csvDataCells[j];
        } else if(j == 12) {
          json["list_shrs"] = csvDataCells[j];
        } else if(j == 3) {
          json["tdd_cmpr"] = csvDataCells[j];
        } else if(j == 6) {
          json["tdd_hgprc"] = csvDataCells[j];
        } else if(j == 7) {
          json["tdd_lwprc"] = csvDataCells[j];
        } else if(j == 2) {
          json["tdd_opnprc"] = csvDataCells[j];
        } else if(j == 0) {
          json["isu_cd"] = csvDataCells[j];
        } else if(j == 1) {
          json["isu_nm"] = csvDataCells[j];
        }
      }

      list.add(DAY.fromJson(json));
    }

    return list;
  }
}