class PemeriksaanModel {
  String? pemeriksaanFisik;
  String? pemeriksaanGigiMulut;
  String? pemeriksaanAudioMetri;
  String? pemeriksaanSpirometri;
  String? pemeriksaanTreadmill;
  String? pemeriksaanLaboratorium;
  String? pemeriksaanXrayJantung;
  String? paru;

  PemeriksaanModel({
    this.pemeriksaanFisik,
    this.pemeriksaanGigiMulut,
    this.pemeriksaanAudioMetri,
    this.pemeriksaanSpirometri,
    this.pemeriksaanTreadmill,
    this.pemeriksaanLaboratorium,
    this.pemeriksaanXrayJantung,
    this.paru,
  });

  PemeriksaanModel.fromJson(Map<String, dynamic> json) {
    pemeriksaanFisik = json['pemeriksaan_fisik'];
    pemeriksaanGigiMulut = json['pemeriksaan_gigi_mulut'];
    pemeriksaanAudioMetri = json['pemeriksaan_audio_metri'];
    pemeriksaanSpirometri = json['pemeriksaan_spirometri'];
    pemeriksaanTreadmill = json['pemeriksaan_treadmill'];
    pemeriksaanLaboratorium = json['pemeriksaan_laboratorium'];
    pemeriksaanXrayJantung = json['pemeriksaan_xray_jantung'];
    paru = json['paru'];
  }

  Map<String, dynamic> toJson() {
    return {
      'pemeriksaan_fisik': pemeriksaanFisik,
      'pemeriksaan_gigi_mulut': pemeriksaanGigiMulut,
      'pemeriksaan_audio_metri': pemeriksaanAudioMetri,
      'pemeriksaan_spirometri': pemeriksaanSpirometri,
      'pemeriksaan_treadmill': pemeriksaanTreadmill,
      'peemriksaan_laboratorium': pemeriksaanLaboratorium,
      'pemeriksaan_xray_jantung': pemeriksaanXrayJantung,
      'paru': paru,
    };
  }
}
