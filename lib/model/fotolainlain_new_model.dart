class FotoLainLainNew {
  String? foto1;
  String? foto2;

  FotoLainLainNew({
    this.foto1,
    this.foto2,
  });

  factory FotoLainLainNew.fromJson(String id, Map<String, dynamic> json) {
    return FotoLainLainNew(
      foto1: json['foto1'],
      foto2: json['foto2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foto1': foto1,
      'foto2': foto2,
    };
  }
}
