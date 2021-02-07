/* 일자별 데이터인듯 */
class ModelStockPrice {

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

  // per 에서 추가됨
  final String bps;
  final String dps;
  final String dvd_yld;
  final String eps;
  final String isu_abbrv;
  final String isu_abbrv_str;
  final String isu_srt_cd;
  final String pbr;
  final String per;

  ModelStockPrice({
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
    this.bps = '',
    this.dps = '',
    this.dvd_yld = '',
    this.eps = '',
    this.isu_abbrv = '',
    this.isu_abbrv_str = '',
    this.isu_srt_cd = '',
    this.pbr = '',
    this.per = '',
  });

  factory ModelStockPrice.fromJson(Map<String, dynamic> json) {
    return ModelStockPrice(
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
      bps: json['BPS'] as String,
      dps: json['DPS'] as String,
      dvd_yld: json['DVD_YLD'] as String,
      eps: json['EPS'] as String,
      isu_abbrv: json['ISU_ABBRV'] as String,
      isu_abbrv_str: json['ISU_ABBRV_STR'] as String,
      isu_srt_cd: json['ISU_SRT_CD'] as String,
      pbr: json['PBR'] as String,
      per: json['PER'] as String,
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
    'bps' : bps.toString(),
    'dps' : dps.toString(),
    'dvd_yld' : dvd_yld.toString(),
    'eps' : eps.toString(),
    'isu_abbrv' : isu_abbrv.toString(),
    'isu_abbrv_str' : isu_abbrv_str.toString(),
    'isu_srt_cd' : isu_srt_cd.toString(),
    'pbr' : pbr.toString(),
    'per' : per.toString(),
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
