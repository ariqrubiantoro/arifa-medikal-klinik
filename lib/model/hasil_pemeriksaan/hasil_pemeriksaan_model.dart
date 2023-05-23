class HasilPemeriksaanModel {
  String? judul;
  String? keterangan;
  String? image;
  String? dokterApa;
  String? namaDokter;

  HasilPemeriksaanModel(
      {this.judul,
      this.keterangan,
      this.image,
      this.dokterApa,
      this.namaDokter});

  factory HasilPemeriksaanModel.fromJson(String id, Map<String, dynamic> json) {
    return HasilPemeriksaanModel(
      judul: json['judul'],
      keterangan: json['keterangan'],
      image: json['image'],
      dokterApa: json['dokterApa'],
      namaDokter: json['namaDokter'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'judul': judul,
      'keterangan': keterangan,
      'image': image,
      'dokterApa': dokterApa,
      'namaDokter': namaDokter
    };
  }
}
