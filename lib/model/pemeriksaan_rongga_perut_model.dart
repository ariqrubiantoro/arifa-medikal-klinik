class PemeriksaanRonggaPerutModel {
  String? inspeksi;
  String? perkusi;
  String? auskultasi;
  String? hati;
  String? limpa;
  String? ginjalKiri;
  String? ballotementKiri;
  String? ginjalKanan;
  String? ballotementKanan;
  String? hernia;
  String? tumor;
  String? lainLain;

  PemeriksaanRonggaPerutModel({
    this.inspeksi,
    this.perkusi,
    this.auskultasi,
    this.hati,
    this.limpa,
    this.ginjalKiri,
    this.ballotementKiri,
    this.ginjalKanan,
    this.ballotementKanan,
    this.hernia,
    this.tumor,
    this.lainLain,
  });

  PemeriksaanRonggaPerutModel.fromJson(Map<String, dynamic> json) {
    inspeksi = json['inspeksi'];
    perkusi = json['perkusi'];
    auskultasi = json['auskultasi'];
    hati = json['hati'];
    limpa = json['limpa'];
    ginjalKiri = json['ginjalKiri'];
    ballotementKiri = json['ballotementKiri'];
    ginjalKanan = json['ginjalKanan'];
    ballotementKanan = json['ballotementKanan'];
    hernia = json['hernia'];
    tumor = json['tumor'];
    lainLain = json['lainLain'];
  }

  Map<String, dynamic> toJson() {
    return {
      'inspeksi': inspeksi,
      'perkusi': perkusi,
      'auskultasi': auskultasi,
      'hati': hati,
      'limpa': limpa,
      'ginjalKiri': ginjalKiri,
      'ballotementKiri': ballotementKiri,
      'ginjalKanan': ginjalKanan,
      'ballotementKanan': ballotementKanan,
      'hernia': hernia,
      'tumor': tumor,
      'lainLain': lainLain,
    };
  }
}
