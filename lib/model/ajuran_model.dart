class AjuranModel {
  String? konsumsiAir;
  String? olahragaTeratur;
  String? anjuran3;
  String? anjuran4;
  String? anjuran5;
  String? anjuran6;
  String? anjuran7;
  String? anjuran8;
  String? anjuran9;

  AjuranModel({
    this.konsumsiAir,
    this.olahragaTeratur,
    this.anjuran3,
    this.anjuran4,
    this.anjuran5,
    this.anjuran6,
    this.anjuran7,
    this.anjuran8,
    this.anjuran9,
  });

  factory AjuranModel.fromJson(String? id, Map<String, dynamic> json) {
    return AjuranModel(
      konsumsiAir: json['konsumsiAir'],
      olahragaTeratur: json['olahragaTeratur'],
      anjuran3 :json['anjuran3'],
      anjuran4 :json['anjuran4'],
      anjuran5 :json['anjuran5'],
      anjuran6 :json['anjuran6'],
      anjuran7 :json['anjuran7'],
      anjuran8 :json['anjuran8'],
      anjuran9 :json['anjuran9'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'konsumsiAir': konsumsiAir,
      'olahragaTeratur': olahragaTeratur,
      'anjuran3' :anjuran3,
      'anjuran4': anjuran4,
      'anjuran5': anjuran5,
      'anjuran6': anjuran6,
      'anjuran7': anjuran7,
      'anjuran8': anjuran8,
      'anjuran9': anjuran9,

    };
  }
}
