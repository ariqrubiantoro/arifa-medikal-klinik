class HasilPemeriksaanUSGModel {
  String? judul;
  String? keterangan;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  String? image6;
  String? dokterApa;
  String? namaDokter;

  HasilPemeriksaanUSGModel(
      {this.judul,
      this.keterangan,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.image5,
      this.image6,
      this.dokterApa,
      this.namaDokter});

  factory HasilPemeriksaanUSGModel.fromJson(
      String id, Map<String, dynamic> json) {
    return HasilPemeriksaanUSGModel(
      judul: json['judul'],
      keterangan: json['keterangan'],
      image1: json['image1'],
      image2: json['image2'],
      image3: json['image3'],
      image4: json['image4'],
      image5: json['image5'],
      image6: json['image6'],
      dokterApa: json['dokterApa'],
      namaDokter: json['namaDokter'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'judul': judul,
      'keterangan': keterangan,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'image4': image4,
      'image5': image5,
      'image6': image6,
      'dokterApa': dokterApa,
      'namaDokter': namaDokter
    };
  }
}
