class PenyakitKeluargaModel {
  String? id;
  String? kencingManis;
  String? darahTinggi;
  String? asamLambung;
  String? alergi;
  String? paru;
  String? stroke;
  String? ginjal;
  String? hemorhoid;
  String? kanker;
  String? jantung;

  PenyakitKeluargaModel({
    this.id,
    this.kencingManis,
    this.darahTinggi,
    this.asamLambung,
    this.alergi,
    this.paru,
    this.stroke,
    this.ginjal,
    this.hemorhoid,
    this.kanker,
    this.jantung,
  });

  PenyakitKeluargaModel.fromJson(Map<String, dynamic> json) {
    kencingManis = json['kencing_manis'];
    darahTinggi = json['darah_tinggi'];
    asamLambung = json['asam_lambung'];
    alergi = json['alergi'];
    paru = json['paru'];
    stroke = json['stroke'];
    ginjal = json['ginjal'];
    hemorhoid = json['hemorhoid'];
    kanker = json['kanker'];
    jantung = json['jantung'];
  }

  Map<String, dynamic> toJson() {
    return {
      'kencingManis': kencingManis,
      'darahTinggi': darahTinggi,
      'asamLambung': asamLambung,
      'alergi': alergi,
      'paru': paru,
      'stroke': stroke,
      'ginjal': ginjal,
      'hemorhoid': hemorhoid,
      'kanker': kanker,
      'jantung': jantung,
    };
  }
}
