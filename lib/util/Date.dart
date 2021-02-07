import 'package:intl/intl.dart';

class Date {
  final DateFormat formatter = DateFormat('yyyyMMdd');

  /* 과거날짜를 뱉음
   * */
  yesterday(days) {
    DateTime now = new DateTime.now();
    DateTime yesterday = now.subtract(new Duration(days: days));
    return formatter.format(yesterday);
  }

  /* 오늘 날짜를 뱉음
   * */
  today() {
    DateTime today = new DateTime.now();
    return formatter.format(today);
  }

  /*
   * 토일월은 금요일 날짜를 뱉고
   * 나머지는 어제 날짜를 뱉음
   **/
  shares() {
    DateTime today = new DateTime.now();
    if(today.weekday == DateTime.monday) {
      return yesterday(3);
    } else if (today.weekday == DateTime.sunday) {
      return yesterday(2);
    } else {
      return yesterday(1);
    }
  }
}