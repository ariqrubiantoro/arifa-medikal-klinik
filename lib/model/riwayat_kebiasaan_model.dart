class RiwayatKebiasaanModel {
  String? id;
  MerokokModel? merokok;
  MirasModel? miras;
  String? olahraga;

  RiwayatKebiasaanModel({this.id, this.merokok, this.miras, this.olahraga});

  RiwayatKebiasaanModel.fromJson(Map<String, dynamic> json) {
    merokok =
        json['merokok'] != null ? MerokokModel.fromJson(json['merokok']) : null;
    miras = json['miras'] != null ? MirasModel.fromJson(json['miras']) : null;
    olahraga = json['olahraga'];
  }

  Map<String, dynamic> toJson() {
    return {
      'merokok': merokok != null ? merokok?.toJson() : "Tidak",
      'miras': miras != null ? miras?.toJson() : "Tidak",
      'olahraga': olahraga,
    };
  }
}

class MerokokModel extends RiwayatKebiasaanModel {
  String? lama;
  String? batang;
  String? bungkus;

  MerokokModel({this.lama, this.batang, this.bungkus});

  MerokokModel.fromJson(Map<String, dynamic> json) {
    lama = json['lama'];
    batang = json['batang'];
    bungkus = json['bungkus'];
  }

  Map<String, dynamic> toJson() {
    return {
      'lama': lama,
      'batang': batang,
      'bungkus': bungkus,
    };
  }
}

class MirasModel extends RiwayatKebiasaanModel {
  String? lama;
  String? gelas;
  String? botol;

  MirasModel({this.lama, this.gelas, this.botol});

  MirasModel.fromJson(Map<String, dynamic> json) {
    lama = json['lama'];
    gelas = json['gelas'];
    botol = json['botol'];
  }

  Map<String, dynamic> toJson() {
    return {
      'lama': lama,
      'gelas': gelas,
      'botol': botol,
    };
  }
}
