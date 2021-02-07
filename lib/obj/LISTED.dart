/* 거래소에서 가져오는 상장 종목 */
class LISTED {
  final String isu_cd;
  final String std_ind_cd;
  final String std_ind_nm;

  LISTED({
    this.isu_cd = '',
    this.std_ind_cd = '',
    this.std_ind_nm = '',
  });

  factory LISTED.fromJson(Map<String, dynamic> json) {
    return LISTED(
      isu_cd: json['isu_cd'] as String,
      std_ind_cd: json['std_ind_cd'] as String,
      std_ind_nm: json['std_ind_nm'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'isu_cd' : isu_cd.toString(),
    'std_ind_cd' : std_ind_cd.toString(),
    'std_ind_nm' : std_ind_nm.toString(),
  };

  static toColumn(str) =>
      str == 'isu_cd' ? '종목코드' :
      str == 'std_ind_cd' ? '업종코드' :
      str == 'std_ind_nm' ? '업종' : str;
}
