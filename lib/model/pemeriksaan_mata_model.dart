class PemeriksaanMataModel {
  String? id;
  String? kacaMata;
  String? kondisi;
  String? visusKiri;
  String? visusKanan;
  String? koreksiKiri;
  String? koreksiKanan;
  String? olahraga;
  String? butaWarna;
  String? penyakitMata;
  String? konjungtiva;
  String? sklera;

  PemeriksaanMataModel({
    this.id,
    this.kacaMata,
    this.kondisi,
    this.visusKiri,
    this.visusKanan,
    this.koreksiKiri,
    this.koreksiKanan,
    this.olahraga,
    this.butaWarna,
    this.penyakitMata,
    this.konjungtiva,
    this.sklera,
  });

  factory PemeriksaanMataModel.fromJson(String? id, Map<String, dynamic> json) {
    return PemeriksaanMataModel(
      id: json['id'],
      kacaMata: json['kacaMata'],
      kondisi: json['kondisi'],
      visusKiri: json['visusKiri'],
      visusKanan: json['visusKanan'],
      koreksiKiri: json['koreksiKiri'],
      koreksiKanan: json['koreksiKanan'],
      olahraga: json['olahraga'],
      butaWarna: json['butaWarna'],
      penyakitMata: json['penyakitMata'],
      konjungtiva: json['konjungtiva'],
      sklera: json['sklera'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kacaMata': kacaMata,
      'kondisi': kondisi,
      'visusKiri': visusKiri,
      'visusKanan': visusKanan,
      'koreksiKiri': koreksiKiri,
      'koreksiKanan': koreksiKanan,
      'olahraga': olahraga,
      'butaWarna': butaWarna,
      'penyakitMata': penyakitMata,
      'konjungtiva': konjungtiva,
      'sklera': sklera,
    };
  }
}
