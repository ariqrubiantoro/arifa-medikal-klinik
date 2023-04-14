class AjuranModel {
  String? konsumsiAir;
  String? olahragaTeratur;

  AjuranModel({this.konsumsiAir, this.olahragaTeratur});

  AjuranModel.fromJson(Map<String, dynamic> json) {
    konsumsiAir = json['konsumsiAir'];
    olahragaTeratur = json['olahragaTeratur'];
  }

  Map<String, dynamic> toJson() {
    return {
      'konsumsiAir': konsumsiAir,
      'olahragaTeratur': olahragaTeratur,
    };
  }
}
