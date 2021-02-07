/* 거래소에서 가져오는 PER */
class PER {
  final String work_dt;
  final String isu_cd;
  final String isu_nm;
  final String iisu_code;
  final String end_pr;
  final String prv_eps;
  final String per;
  final String bps;
  final String pbr;
  final String stk_dvd;
  final String dvd_yld;
  final String rn;
  final String isu_nm2;
  final String totCnt;

  PER({
    this.work_dt = '',
    this.isu_cd = '',
    this.isu_nm = '',
    this.iisu_code = '',
    this.end_pr = '',
    this.prv_eps = '',
    this.per = '',
    this.bps = '',
    this.pbr = '',
    this.stk_dvd = '',
    this.dvd_yld = '',
    this.rn = '',
    this.isu_nm2 = '',
    this.totCnt = '',
  });

  factory PER.fromJson(Map<String, dynamic> json) {
    return PER(
      work_dt: json['work_dt'] as String,
      isu_cd: json['isu_cd'] as String,
      isu_nm: json['isu_nm'] as String,
      iisu_code: json['iisu_code'] as String,
      end_pr: json['end_pr'] as String,
      prv_eps: json['prv_eps'] as String,
      per: json['per'] as String,
      bps: json['bps'] as String,
      pbr: json['pbr'] as String,
      stk_dvd: json['stk_dvd'] as String,
      dvd_yld: json['dvd_yld'] as String,
      rn: json['rn'] as String,
      isu_nm2: json['isu_nm2'] as String,
      totCnt: json['totCnt'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'work_dt' : work_dt.toString(),
    'isu_cd' : isu_cd.toString(),
    'isu_nm' : isu_nm.toString(),
    'iisu_code' : iisu_code.toString(),
    'end_pr' : end_pr.toString(),
    'prv_eps' : prv_eps.toString(),
    'per' : per.toString(),
    'bps' : bps.toString(),
    'pbr' : pbr.toString(),
    'stk_dvd' : stk_dvd.toString(),
    'dvd_yld' : dvd_yld.toString(),
    'rn' : rn.toString(),
    'isu_nm2' : isu_nm2.toString(),
    'totCnt' : totCnt.toString(),
  };

  static toColumn(str) =>
      str == 'work_dt' ? '날짜' :
      str == 'isu_cd' ? '종목코드' :
      str == 'isu_nm' ? '종목명' :
      str == 'iisu_code' ? '' :
      str == 'end_pr' ? '종가' :
      str == 'prv_eps' ? 'eps' :
      str == 'per' ? 'per' :
      str == 'bps' ? 'bps' :
      str == 'pbr' ? 'pbr' :
      str == 'stk_dvd' ? '주당배당금' :
      str == 'dvd_yld' ? '주당수익율' :
      str == 'rn' ? '' :
      str == 'isu_nm2' ? '' :
      str == 'totCnt' ? '' : str;
}
