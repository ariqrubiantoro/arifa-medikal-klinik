class PenyakitTerdahuluModel {
  String? id;
  String? darahTinggi;
  String? paru;
  String? asamLambung;
  String? alergi;
  String? riwayatOperasi;
  String? riwayatKecelakaan;
  String? riwayatRawatRs;
  String? hepatitis;
  String? kencingManis;
  String? patahTulang;

  PenyakitTerdahuluModel({
    this.id,
    this.darahTinggi,
    this.paru,
    this.asamLambung,
    this.alergi,
    this.riwayatOperasi,
    this.riwayatKecelakaan,
    this.riwayatRawatRs,
    this.hepatitis,
    this.kencingManis,
    this.patahTulang,
  });

  PenyakitTerdahuluModel.fromJson(Map<String, dynamic> json) {
    darahTinggi = json['darah_tinggi'];
    paru = json['paru'];
    asamLambung = json['asam_lambung'];
    alergi = json['alergi'];
    riwayatOperasi = json['riwayat_operasi'];
    riwayatKecelakaan = json['riwayat_kecelakaan'];
    riwayatRawatRs = json['riwayat_rawat_rs'];
    hepatitis = json['hepatitis'];
    kencingManis = json['kencing_manis'];
    patahTulang = json['patah_tulang'];
  }

  Map<String, dynamic> toJson() {
    return {
      'darahTinggi': darahTinggi,
      'paru': paru,
      'asamLambung': asamLambung,
      'alergi': alergi,
      'riwayatOperasi': riwayatOperasi,
      'riwayatKecelakaan': riwayatKecelakaan,
      'riwayatRawatRs': riwayatRawatRs,
      'hepatitis': hepatitis,
      'kencingManis': kencingManis,
      'patahTulang': patahTulang,
    };
  }
}
