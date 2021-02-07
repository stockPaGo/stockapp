/* 일자별 데이터인듯 */
class DAY2 {

  final String trd_dd;
  final String tdd_clsprc;
  final String fluc_tp_cd;
  final String cmpprevdd_prc;
  final String fluc_rt;
  final String tdd_opnprc;
  final String tdd_hgprc;
  final String tdd_lwprc;
  final String acc_trdvol;
  final String acc_trdval;
  final String mktcap;
  final String list_shrs;

  DAY2({
    this.trd_dd = '',
    this.tdd_clsprc = '',
    this.fluc_tp_cd = '',
    this.cmpprevdd_prc = '',
    this.fluc_rt = '',
    this.tdd_opnprc = '',
    this.tdd_hgprc = '',
    this.tdd_lwprc = '',
    this.acc_trdvol = '',
    this.acc_trdval = '',
    this.mktcap = '',
    this.list_shrs = '',
  });

  factory DAY2.fromJson(Map<String, dynamic> json) {
    return DAY2(
      trd_dd: json['TRD_DD'] as String,
      tdd_clsprc: json['TDD_CLSPRC'] as String,
      fluc_tp_cd: json['FLUC_TP_CD'] as String,
      cmpprevdd_prc: json['CMPPREVDD_PRC'] as String,
      fluc_rt: json['FLUC_RT'] as String,
      tdd_opnprc: json['TDD_OPNPRC'] as String,
      tdd_hgprc: json['TDD_HGPRC'] as String,
      tdd_lwprc: json['TDD_LWPRC'] as String,
      acc_trdvol: json['ACC_TRDVOL'] as String,
      acc_trdval: json['ACC_TRDVAL'] as String,
      mktcap: json['MKTCAP'] as String,
      list_shrs: json['LIST_SHRS'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'trd_dd' : trd_dd.toString(),
    'tdd_clsprc' : tdd_clsprc.toString(),
    'fluc_tp_cd' : fluc_tp_cd.toString(),
    'cmpprevdd_prc' : cmpprevdd_prc.toString(),
    'fluc_rt' : fluc_rt.toString(),
    'tdd_opnprc' : tdd_opnprc.toString(),
    'tdd_hgprc' : tdd_hgprc.toString(),
    'tdd_lwprc' : tdd_lwprc.toString(),
    'acc_trdvol' : acc_trdvol.toString(),
    'acc_trdval' : acc_trdval.toString(),
    'mktcap' : mktcap.toString(),
    'list_shrs' : list_shrs.toString(),
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
