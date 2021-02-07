/* 네이버에서 검색 순위 가져오는 데이터 형태 */
class RANK {
  final String title;

  RANK({
    this.title = '',
  });

  factory RANK.fromJson(Map<String, dynamic> json) {
    return RANK(
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'title' : title.toString(),
  };

  static toColumn(str) =>
      str == 'title' ? '종목명' : str;
}
