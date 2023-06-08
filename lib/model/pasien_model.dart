class PasienModel {
  String? id;
  String? nama;
  String? jenisKelamin;
  String? nik;
  String? alamat;
  String? tanggalPemeriksaan;
  String? tempatLahir;
  String? tanggalLahir;
  String? umur;
  String? umurTahun;
  String? perusahaan;
  String? bagian;
  String? noHp;
  String? noMcu;
  String? waktu;

  PasienModel({
    this.id,
    this.nama,
    this.jenisKelamin,
    this.nik,
    this.alamat,
    this.tanggalPemeriksaan,
    this.tempatLahir,
    this.tanggalLahir,
    this.umur,
    this.umurTahun,
    this.perusahaan,
    this.bagian,
    this.noHp,
    this.noMcu,
    this.waktu,
  });

  factory PasienModel.fromJson(String id, Map<String, dynamic> json) {
    return PasienModel(
      nama: json['namaPasien'],
      jenisKelamin: json['jenis_kelamin'],
      nik: json['NIK'],
      alamat: json['alamat'],
      tanggalPemeriksaan: json['tanggal_pemeriksaan'],
      tempatLahir: json['tempat_lahir'],
      tanggalLahir: json['tanggal_lahir'],
      umur: json['umur'],
      umurTahun: json['umurTahun'],
      perusahaan: json['perusahaan'],
      bagian: json['bagian'],
      noHp: json['no_hp'],
      noMcu: json['no_mcu'],
      waktu: json['waktu'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'namaPasien': nama,
      'jenis_kelamin': jenisKelamin,
      'NIK': nik,
      'alamat': alamat,
      'tanggal_pemeriksaan': tanggalPemeriksaan,
      'tempat_lahir': tempatLahir,
      'tanggal_lahir': tanggalLahir,
      'umur': umur,
      'umurTahun': umurTahun,
      'perusahaan': perusahaan,
      'bagian': bagian,
      'no_hp': noHp,
      'no_mcu': noMcu,
      'waktu': waktu,
    };
  }
}
