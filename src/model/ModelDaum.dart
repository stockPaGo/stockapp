/* 일자별 데이터인듯 */
class ModelDaum {

  final String isu_abbrv_str;

  ModelDaum({
    this.isu_abbrv_str = '',
  });

  factory ModelDaum.fromJson(Map<String, dynamic> json) {
    return ModelDaum(
      isu_abbrv_str: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'isu_abbrv_str' : isu_abbrv_str.toString(),
  };
}
