// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/components/colors/color.dart';
import 'package:arifa_medikal_klink_3/components/widget/text.dart';
import 'package:arifa_medikal_klink_3/model/penyakit_terdahulu_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/penyakit_keluarga_2_8.dart';
import 'package:flutter/material.dart';

import '../../../service/firebase_firestore_service.dart';

enum Question { ya, tidak }

class PenyakitTerdahulu1 extends StatefulWidget {
  const PenyakitTerdahulu1({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<PenyakitTerdahulu1> createState() => _PenyakitTerdahulu1State();
}

class _PenyakitTerdahulu1State extends State<PenyakitTerdahulu1> {
  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  int _quest = 0;
  int _quest2 = 0;
  int _quest3 = 0;
  int _quest4 = 0;
  int _quest5 = 0;
  int _quest6 = 0;
  int _quest7 = 0;
  int _quest8 = 0;
  int _quest9 = 0;
  int _quest10 = 0;

  String darahTinggi = "Tidak Ada";
  String paru = "Tidak Ada";
  String asamLambung = "Tidak Ada";
  String alergi = "Tidak Ada";
  String riwayatOperasi = "Tidak Ada";
  String riwayatKecelakaan = "Tidak Ada";
  String riwayatRawatrs = "Tidak Ada";
  String hepatitis = "Tidak Ada";
  String kencingManis = "Tidak Ada";
  String patahTulang = "Tidak Ada";

  final darahTinggiF = TextEditingController();
  final paruF = TextEditingController();
  final asamLambungF = TextEditingController();
  final alergiF = TextEditingController();
  final riwayatOperasiF = TextEditingController();
  final riwayatKecelakaanF = TextEditingController();
  final riwayatRawatrsF = TextEditingController();
  final hepatitisF = TextEditingController();
  final kencingManisF = TextEditingController();
  final patahTulangF = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueDefault,
        automaticallyImplyLeading: false,
        title: Row(children: [
          Icon(Icons.arrow_back),
          SizedBox(
            width: 30,
          ),
          textDefault(
              "Riwayat Penyakit Terdahulu", Colors.white, 16, FontWeight.bold)
        ]),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        textDefault("1/8", Colors.black, 14, FontWeight.bold)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 40,
                          decoration: BoxDecoration(
                              color: blueDefault,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                        ),
                        Expanded(
                            child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.grey[350],
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Darah Tinggi", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest,
                          onChanged: (value) {
                            setState(() {
                              _quest = value!;
                              darahTinggi = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _quest,
                          onChanged: (value) {
                            setState(() {
                              _quest = value!;
                              darahTinggi = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          height: 45,
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _quest = 0;
                              });
                            },
                            controller: darahTinggiF,
                            maxLength: 10,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Penyakit Paru (Asma, TBC, dll)", Colors.black,
                        16, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              _quest2 = value!;
                              paru = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              _quest2 = value!;
                              paru = "Tidak Ada";
                              print(paru);
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          height: 45,
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _quest2 = 0;
                              });
                            },
                            controller: paruF,
                            maxLength: 10,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault(
                        "Asam Lambung", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              asamLambung = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              asamLambung = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          height: 45,
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _quest3 = 0;
                              });
                            },
                            controller: asamLambungF,
                            maxLength: 10,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Alergi", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              _quest4 = value!;
                              alergi = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              _quest4 = value!;
                              alergi = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          height: 45,
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _quest4 = 0;
                              });
                            },
                            controller: alergiF,
                            maxLength: 10,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault(
                        "Riwayat Operasi", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              _quest5 = value!;
                              riwayatOperasi = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              _quest5 = value!;
                              riwayatOperasi = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          height: 45,
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _quest5 = 0;
                              });
                            },
                            controller: riwayatOperasiF,
                            maxLength: 10,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Riwayat Kecelakaan", Colors.black, 14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              _quest6 = value!;
                              riwayatKecelakaan = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              _quest6 = value!;
                              riwayatKecelakaan = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          height: 45,
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _quest6 = 0;
                              });
                            },
                            controller: riwayatKecelakaanF,
                            maxLength: 10,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault(
                        "Riwayat Rawat RS", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              _quest7 = value!;
                              riwayatRawatrs = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              _quest7 = value!;
                              riwayatRawatrs = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          height: 45,
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _quest7 = 0;
                              });
                            },
                            controller: riwayatRawatrsF,
                            maxLength: 10,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Hepatitis", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest8,
                          onChanged: (value) {
                            setState(() {
                              _quest8 = value!;
                              hepatitis = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _quest8,
                          onChanged: (value) {
                            setState(() {
                              _quest8 = value!;
                              hepatitis = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          height: 45,
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _quest8 = 0;
                              });
                            },
                            controller: hepatitisF,
                            maxLength: 10,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault(
                        "Kencing Manis", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest9,
                          onChanged: (value) {
                            setState(() {
                              _quest9 = value!;
                              kencingManis = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _quest9,
                          onChanged: (value) {
                            setState(() {
                              _quest9 = value!;
                              kencingManis = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          height: 45,
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _quest9 = 0;
                              });
                            },
                            controller: kencingManisF,
                            maxLength: 10,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Patah Tulang (terpasang PEN)", Colors.black,
                        16, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest10,
                          onChanged: (value) {
                            setState(() {
                              _quest10 = value!;
                              patahTulang = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _quest10,
                          onChanged: (value) {
                            setState(() {
                              _quest10 = value!;
                              patahTulang = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          height: 45,
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                _quest10 = 0;
                              });
                            },
                            controller: patahTulangF,
                            maxLength: 10,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ))
                      ],
                    ),
                  ],
                )),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: blueDefault),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: textDefault(
                            "Kembali", blueDefault, 16, FontWeight.normal),
                      ),
                    ),
                  ),
                  InkWell(
                    // onTap: () => Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return PenyakitKeluarga();
                    // })),
                    onTap: saveButton,

                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 2)
                          ]),
                      child: Center(
                        child: textDefault(
                            "Selanjutnya", Colors.white, 16, FontWeight.normal),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void saveButton() async {
    darahTinggi = darahTinggiF.text != "" ? darahTinggiF.text : darahTinggi;
    paru = paruF.text != "" ? paruF.text : paru;
    asamLambung = asamLambungF.text != "" ? asamLambungF.text : asamLambung;
    alergi = alergiF.text != "" ? alergiF.text : alergi;
    riwayatOperasi =
        riwayatOperasiF.text != "" ? riwayatOperasiF.text : riwayatOperasi;
    riwayatRawatrs =
        riwayatRawatrsF.text != "" ? riwayatRawatrsF.text : riwayatRawatrs;
    riwayatKecelakaan = riwayatKecelakaanF.text != ""
        ? riwayatKecelakaanF.text
        : riwayatKecelakaan;
    hepatitis = hepatitisF.text != "" ? hepatitisF.text : hepatitis;
    kencingManis = kencingManisF.text != "" ? kencingManisF.text : kencingManis;
    patahTulang = patahTulangF.text != "" ? patahTulangF.text : patahTulang;

    PenyakitTerdahuluModel data = PenyakitTerdahuluModel(
      darahTinggi: darahTinggi,
      paru: paru,
      asamLambung: asamLambung,
      alergi: alergi,
      riwayatOperasi: riwayatOperasi,
      riwayatKecelakaan: riwayatOperasi,
      riwayatRawatRs: riwayatRawatrs,
      hepatitis: hepatitis,
      kencingManis: kencingManis,
      patahTulang: patahTulang,
    );

    firestore.setPenyakitTerdahulu(data, widget.idPasien!);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PenyakitKeluarga(
        idPasien: widget.idPasien,
      );
    }));
  }
}
