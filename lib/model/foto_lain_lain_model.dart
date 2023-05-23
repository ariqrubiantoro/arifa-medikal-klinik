class FotoLainLain {
  String? foto1;
  String? foto2;
  String? foto3;
  String? foto4;
  String? foto5;
  String? foto6;
  String? foto7;
  String? foto8;
  String? foto9;

  FotoLainLain({
    this.foto1,
    this.foto2,
    this.foto3,
    this.foto4,
    this.foto5,
    this.foto6,
    this.foto7,
    this.foto8,
    this.foto9,
  });

  factory FotoLainLain.fromJson(String id, Map<String, dynamic> json) {
    return FotoLainLain(
      foto1: json['foto1'],
      foto2: json['foto2'],
      foto3: json['foto3'],
      foto4: json['foto4'],
      foto5: json['foto5'],
      foto6: json['foto6'],
      foto7: json['foto7'],
      foto8: json['foto8'],
      foto9: json['foto9'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foto1': foto1,
      'foto2': foto2,
      'foto3': foto3,
      'foto4': foto4,
      'foto5': foto5,
      'foto6': foto6,
      'foto7': foto7,
      'foto8': foto8,
      'foto9': foto9,
    };
  }
}
