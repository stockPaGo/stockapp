/* 일자별 데이터인듯 */
class DAY {
  final String acc_trdval;
  final String acc_trdvol;
  final String fluc_tp;
  final String list_shrs;
  final String mktcap;
  final String tdd_clsprc;
  final String tdd_cmpr;
  final String tdd_hgprc;
  final String tdd_lwprc;
  final String tdd_opnprc;
  final String trd_dd;

  final String isu_cd;
  final String isu_nm;

  DAY({
    this.acc_trdval = '',
    this.acc_trdvol = '',
    this.fluc_tp = '',
    this.list_shrs = '',
    this.mktcap = '',
    this.tdd_clsprc = '',
    this.tdd_cmpr = '',
    this.tdd_hgprc = '',
    this.tdd_lwprc = '',
    this.tdd_opnprc = '',
    this.trd_dd = '',
    this.isu_cd = '',
    this.isu_nm = '',
  });

  factory DAY.fromJson(Map<String, dynamic> json) {
    return DAY(
      acc_trdval: json['acc_trdval'] as String,
      acc_trdvol: json['acc_trdvol'] as String,
      fluc_tp: json['fluc_tp'] as String,
      list_shrs: json['list_shrs'] as String,
      mktcap: json['mktcap'] as String,
      tdd_clsprc: json['tdd_clsprc'] as String,
      tdd_cmpr: json['tdd_cmpr'] as String,
      tdd_hgprc: json['tdd_hgprc'] as String,
      tdd_lwprc: json['tdd_lwprc'] as String,
      tdd_opnprc: json['tdd_opnprc'] as String,
      trd_dd: json['trd_dd'] as String,
      isu_cd: json['isu_cd'] as String,
      isu_nm: json['isu_nm'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'acc_trdval' : acc_trdval.toString(),
    'acc_trdvol' : acc_trdvol.toString(),
    'fluc_tp' : fluc_tp.toString(),
    'list_shrs' : list_shrs.toString(),
    'mktcap' : mktcap.toString(),
    'tdd_clsprc' : tdd_clsprc.toString(),
    'tdd_cmpr' : tdd_cmpr.toString(),
    'tdd_hgprc' : tdd_hgprc.toString(),
    'tdd_lwprc' : tdd_lwprc.toString(),
    'tdd_opnprc' : tdd_opnprc.toString(),
    'trd_dd' : trd_dd.toString(),
    'isu_cd' : isu_cd.toString(),
    'isu_nm' : isu_nm.toString(),
  };

  static toColumn(str) =>
      str == 'acc_trdval' ? '거래대금' :
      str == 'acc_trdvol' ? '거래량' :
      str == 'fluc_tp' ? '' :
      str == 'list_shrs' ? '상장주식수' :
      str == 'mktcap' ? '시가총액' :
      str == 'tdd_clsprc' ? '종가' :
      str == 'tdd_cmpr' ? '대비' :
      str == 'tdd_hgprc' ? '고가' :
      str == 'tdd_lwprc' ? '저가' :
      str == 'tdd_opnprc' ? '시가' :
      str == 'trd_dd' ? '날짜' :
      str == 'isu_cd' ? '종목코드' :
      str == 'isu_nm' ? '종목명' : str;
}
