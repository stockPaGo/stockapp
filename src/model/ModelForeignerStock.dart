/* 일자별 데이터인듯 */
class ModelForeignerStock {

  final String cmpprevdd_prc;
  final String fluc_rt;
  final String fluc_tp_cd;
  final String forn_hd_qty;
  final String forn_lmt_exhst_rt;
  final String forn_ord_lmt_qty;
  final String forn_shr_rt;
  final String list_shrs;
  final String tdd_clsprc;
  final String trd_dd;
  final String isu_abbrv;
  final String isu_srt_cd;

  ModelForeignerStock({
    this.cmpprevdd_prc = '',
    this.fluc_rt = '',
    this.fluc_tp_cd = '',
    this.forn_hd_qty = '',
    this.forn_lmt_exhst_rt = '',
    this.forn_ord_lmt_qty = '',
    this.forn_shr_rt = '',
    this.list_shrs = '',
    this.tdd_clsprc = '',
    this.trd_dd = '',
    this.isu_abbrv = '',
    this.isu_srt_cd = '',
  });

  factory ModelForeignerStock.fromJson(Map<String, dynamic> json) {
    return ModelForeignerStock(
      cmpprevdd_prc: json['CMPPREVDD_PRC'] as String,
      fluc_rt: json['FLUC_RT'] as String,
      fluc_tp_cd: json['FLUC_TP_CD'] as String,
      forn_hd_qty: json['FORN_HD_QTY'] as String,
      forn_lmt_exhst_rt: json['FORN_LMT_EXHST_RT'] as String,
      forn_ord_lmt_qty: json['FORN_ORD_LMT_QTY'] as String,
      forn_shr_rt: json['FORN_SHR_RT'] as String,
      list_shrs: json['LIST_SHRS'] as String,
      tdd_clsprc: json['TDD_CLSPRC'] as String,
      trd_dd: json['TRD_DD'] as String,
      isu_abbrv: json['ISU_ABBRV'] as String,
      isu_srt_cd: json['ISU_SRT_CD'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'cmpprevdd_prc' : cmpprevdd_prc.toString(),
    'fluc_rt' : fluc_rt.toString(),
    'fluc_tp_cd' : fluc_tp_cd.toString(),
    'forn_hd_qty' : forn_hd_qty.toString(),
    'forn_lmt_exhst_rt' : forn_lmt_exhst_rt.toString(),
    'forn_ord_lmt_qty' : forn_ord_lmt_qty.toString(),
    'forn_shr_rt' : forn_shr_rt.toString(),
    'list_shrs' : list_shrs.toString(),
    'tdd_clsprc' : tdd_clsprc.toString(),
    'trd_dd' : trd_dd.toString(),
    'isu_abbrv' : isu_abbrv.toString(),
    'isu_srt_cd' : isu_srt_cd.toString(),
  };
}
