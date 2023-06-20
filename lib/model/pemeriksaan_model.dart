class PemeriksaanModel {
  String? aktivitasFisik;
  String? pemeriksaanFisik;
  String? pemeriksaanMata;
  String? pemeriksaanGigiMulut;
  String? pemeriksaanAudioMetri;
  String? pemeriksaanSpirometri;
  String? pemeriksaanTreadmill;
  String? pemeriksaanLaboratorium;
  String? pemeriksaanXrayJantung;
  String? paru;
  String? pemeriksaanUsg;
  String? pemeriksaanNapfa;
  String? pemeriksaanNapza;

  PemeriksaanModel({
    this.aktivitasFisik,
    this.pemeriksaanFisik,
    this.pemeriksaanMata,
    this.pemeriksaanGigiMulut,
    this.pemeriksaanAudioMetri,
    this.pemeriksaanSpirometri,
    this.pemeriksaanTreadmill,
    this.pemeriksaanLaboratorium,
    this.pemeriksaanXrayJantung,
    this.paru,
    this.pemeriksaanUsg,
    this.pemeriksaanNapfa,
    this.pemeriksaanNapza,
  });

  factory PemeriksaanModel.fromJson(String? id, Map<String, dynamic> json) {
    return PemeriksaanModel(
      aktivitasFisik: json['aktivitas_fisik'],
      pemeriksaanFisik: json['pemeriksaan_fisik'],
      pemeriksaanMata: json['pemeriksaan_mata'],
      pemeriksaanGigiMulut: json['pemeriksaan_gigi_mulut'],
      pemeriksaanAudioMetri: json['pemeriksaan_audio_metri'],
      pemeriksaanSpirometri: json['pemeriksaan_spirometri'],
      pemeriksaanTreadmill: json['pemeriksaan_treadmill'],
      pemeriksaanLaboratorium: json['peemriksaan_laboratorium'],
      pemeriksaanXrayJantung: json['pemeriksaan_xray_jantung'],
      paru: json['paru'],
      pemeriksaanUsg: json['pemeriksaan_usg'],
      pemeriksaanNapfa: json['pemeriksaan_napfa'],
      pemeriksaanNapza: json['pemeriksaan_napza'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'aktivitas_fisik': aktivitasFisik,
      'pemeriksaan_fisik': pemeriksaanFisik,
      'pemeriksaan_mata': pemeriksaanMata,
      'pemeriksaan_gigi_mulut': pemeriksaanGigiMulut,
      'pemeriksaan_audio_metri': pemeriksaanAudioMetri,
      'pemeriksaan_spirometri': pemeriksaanSpirometri,
      'pemeriksaan_treadmill': pemeriksaanTreadmill,
      'peemriksaan_laboratorium': pemeriksaanLaboratorium,
      'pemeriksaan_xray_jantung': pemeriksaanXrayJantung,
      'paru': paru,
      'pemeriksaan_usg': pemeriksaanUsg,
      'pemeriksaan_napfa': pemeriksaanNapfa,
      'pemeriksaan_napza': pemeriksaanNapza,
    };
  }
}
