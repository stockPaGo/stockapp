/**
 * Date
 * 날짜관련 클래스
 *
 * version 1.0
 *
 * 2021.02.06
 *
 * author young kyun
 */

import 'package:intl/intl.dart';

main() {
  print(UtilDate.getDay(day : -12));
  print(UtilDate.getMonth());
}

class UtilDate {
  static final DateFormat formatter = DateFormat('yyyyMMdd');

  /*
   * yyyyMMdd
   * 날짜를 계산하여 리턴
   **/
  static String getDay ({int day = 0}) {
    final DateTime now = new DateTime.now();
    final compute = DateTime(now.year, now.month, now.day + day);

    return formatter.format(compute);
  }

  /*
   * yyyyMMdd
   * 월을 계산하여 리턴
   **/
  static String getMonth ({int month = 0}) {
    final DateTime now = new DateTime.now();
    final compute = DateTime(now.year, now.month + month, now.day);

    return formatter.format(compute);
  }

  /*
   * yyyyMMdd
   * 월을 계산하여 리턴
   **/
  static String getYear ({int year = 0}) {
    final DateTime now = new DateTime.now();
    final compute = DateTime(now.year + year, now.month, now.day);

    return formatter.format(compute);
  }
}