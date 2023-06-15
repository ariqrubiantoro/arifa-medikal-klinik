class HasilPemeriksaanLaboratoriumModel {
  String? dokter;
  String? analisa;
  String? hemoglobin;
  String? hematokrit;
  String? eritrosit;
  String? trombosit;
  String? leukosit;
  String? mcv;
  String? mch;
  String? mchc;
  String? rdw;
  String? limfosit;
  String? granulosit;
  String? mid;

  String? bilirubinTotal;
  String? bilirubinDirect;
  String? sgot;
  String? sgpt;
  String? alkalinePhosphatase;
  String? cholinesterase;
  String? ureum;
  String? creatinine;
  String? uricAcid;
  String? glukosaPuasa;
  String? kgd2JamPP;
  String? cholesterolTotal;
  String? hdlCholesterol;
  String? ldlCholesterol;
  String? triglyserida;

  String? leukositUrinalisa;
  String? nitrit;
  String? urobilin;
  String? protein;
  String? ph;
  String? darah;
  String? beratJenis;
  String? keton;
  String? bilirubi;
  String? glukosa;

  String? konsitensi;
  String? warna;
  String? lendir;
  String? darahFeses;
  String? telurCacing;
  String? parasit;
  String? cyste;
  String? leucocyte;
  String? erythrocyte;
  String? lemak;
  String? amylum;
  String? serabut;

  HasilPemeriksaanLaboratoriumModel({
    this.dokter,
    this.analisa,
    this.hemoglobin,
    this.hematokrit,
    this.eritrosit,
    this.trombosit,
    this.leukosit,
    this.mcv,
    this.mch,
    this.mchc,
    this.rdw,
    this.limfosit,
    this.granulosit,
    this.mid,
    this.bilirubinTotal,
    this.bilirubinDirect,
    this.sgot,
    this.sgpt,
    this.alkalinePhosphatase,
    this.cholinesterase,
    this.ureum,
    this.creatinine,
    this.uricAcid,
    this.glukosaPuasa,
    this.kgd2JamPP,
    this.cholesterolTotal,
    this.hdlCholesterol,
    this.ldlCholesterol,
    this.triglyserida,
    this.leukositUrinalisa,
    this.nitrit,
    this.urobilin,
    this.protein,
    this.ph,
    this.darah,
    this.beratJenis,
    this.keton,
    this.bilirubi,
    this.glukosa,
    this.konsitensi,
    this.warna,
    this.lendir,
    this.darahFeses,
    this.telurCacing,
    this.parasit,
    this.cyste,
    this.leucocyte,
    this.erythrocyte,
    this.lemak,
    this.amylum,
    this.serabut,
  });

  factory HasilPemeriksaanLaboratoriumModel.fromJson(
      String id, Map<String, dynamic> json) {
    return HasilPemeriksaanLaboratoriumModel(
      dokter: json['dokter'],
      analisa: json['analisa'],
      hemoglobin: json['hemoglobin'],
      hematokrit: json['hematokrit'],
      eritrosit: json['eritrosit'],
      trombosit: json['trombosit'],
      leukosit: json['leukosit'],
      mcv: json['mcv'],
      mch: json['mch'],
      mchc: json['mchc'],
      rdw: json['rdw'],
      limfosit: json['limfosit'],
      granulosit: json['granulosit'],
      mid: json['mid'],
      bilirubinTotal: json['bilirubinTotal'],
      bilirubinDirect: json['bilirubinDirect'],
      sgot: json['sgot'],
      sgpt: json['sgpt'],
      alkalinePhosphatase: json['alkalinePhosphatase'],
      cholinesterase: json['cholinesterase'],
      ureum: json['ureum'],
      creatinine: json['creatinine'],
      uricAcid: json['uricAcid'],
      glukosaPuasa: json['glukosaPuasa'],
      kgd2JamPP: json['kgd2JamPP'],
      cholesterolTotal: json['cholesterolTotal'],
      hdlCholesterol: json['hdlCholesterol'],
      ldlCholesterol: json['ldlCholesterol'],
      triglyserida: json['triglyserida'],
      leukositUrinalisa: json['leukositUrinalisa'],
      nitrit: json['nitrit'],
      urobilin: json['urobilin'],
      protein: json['protein'],
      ph: json['ph'],
      darah: json['darah'],
      beratJenis: json['beratJenis'],
      keton: json['keton'],
      bilirubi: json['bilirubi'],
      glukosa: json['glukosa'],
      konsitensi: json['konsitensi'],
      warna: json['warna'],
      lendir: json['lendir'],
      darahFeses: json['darahFeses'],
      telurCacing: json['telurCacing'],
      parasit: json['parasit'],
      cyste: json['cyste'],
      leucocyte: json['leucocyte'],
      erythrocyte: json['erythrocyte'],
      lemak: json['lemak'],
      amylum: json['amylum'],
      serabut: json['serabut'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "dokter": dokter,
      "analisa": analisa,
      "hemoglobin": hemoglobin,
      "hematokrit": hematokrit,
      "eritrosit": eritrosit,
      "trombosit": trombosit,
      "leukosit": leukosit,
      "mcv": mcv,
      "mch": mch,
      "mchc": mchc,
      "rdw": rdw,
      "limfosit": limfosit,
      "granulosit": granulosit,
      "mid": mid,
      "bilirubinTotal": bilirubinTotal,
      "bilirubinDirect": bilirubinDirect,
      "sgot": sgot,
      "sgpt": sgpt,
      "alkalinePhosphatase": alkalinePhosphatase,
      "cholinesterase": cholinesterase,
      "ureum": ureum,
      "creatinine": creatinine,
      "uricAcid": uricAcid,
      "glukosaPuasa": glukosaPuasa,
      "kgd2JamPP": kgd2JamPP,
      "cholesterolTotal": cholesterolTotal,
      "hdlCholesterol": hdlCholesterol,
      "ldlCholesterol": ldlCholesterol,
      "triglyserida": triglyserida,
      "leukositUrinalisa": leukositUrinalisa,
      "nitrit": nitrit,
      "urobilin": urobilin,
      "protein": protein,
      "ph": ph,
      "darah": darah,
      "beratJenis": beratJenis,
      "keton": keton,
      "bilirubi": bilirubi,
      "glukosa": glukosa,
      "konsitensi": konsitensi,
      "warna": warna,
      "lendir": lendir,
      "darahFeses": darahFeses,
      "telurCacing": telurCacing,
      "parasit": parasit,
      "cyste": cyste,
      "leucocyte": leucocyte,
      "erythrocyte": erythrocyte,
      "lemak": lemak,
      "amylum": amylum,
      "serabut": serabut,
    };
  }
}
