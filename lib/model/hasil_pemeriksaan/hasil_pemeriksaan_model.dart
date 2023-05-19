class HasilPemeriksaanModel {
  String? judul;
  String? keterangan;
  String? image;

  HasilPemeriksaanModel({this.judul, this.keterangan, this.image});

  factory HasilPemeriksaanModel.fromJson(String id, Map<String, dynamic> json) {
    return HasilPemeriksaanModel(
        judul: json['judul'],
        keterangan: json['keterangan'],
        image: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {'judul': judul, 'keterangan': keterangan, 'image': image};
  }
}
