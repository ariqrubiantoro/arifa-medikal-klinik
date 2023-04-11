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
  Question _quest = Question.tidak;
  Question _quest2 = Question.tidak;
  Question _quest3 = Question.tidak;
  Question _quest4 = Question.tidak;
  Question _quest5 = Question.tidak;
  Question _quest6 = Question.tidak;
  Question _quest7 = Question.tidak;
  Question _quest8 = Question.tidak;
  Question _quest9 = Question.tidak;
  Question _quest10 = Question.tidak;

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
              "Riwayat Penyakit Terdahulu", Colors.white, 18, FontWeight.bold)
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
                        textDefault("1/8", Colors.black, 16, FontWeight.bold)
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
                        "Darah Tinggi", Colors.black, 16, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest,
                          onChanged: (value) {
                            setState(() {
                              _quest = value!;
                              darahTinggi = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest,
                          onChanged: (value) {
                            setState(() {
                              _quest = value!;
                              darahTinggi = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 14, FontWeight.normal),
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
                          value: Question.ya,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              _quest2 = value!;
                              paru = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
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
                            "Tidak Ada", Colors.black, 14, FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault(
                        "Asam Lambung", Colors.black, 16, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              asamLambung = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              asamLambung = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 14, FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Alergi", Colors.black, 16, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              _quest4 = value!;
                              alergi = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              _quest4 = value!;
                              alergi = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 14, FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault(
                        "Riwayat Operasi", Colors.black, 16, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              _quest5 = value!;
                              riwayatOperasi = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              _quest5 = value!;
                              riwayatOperasi = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 14, FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Riwayat Kecelakaan", Colors.black, 16,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              _quest6 = value!;
                              riwayatKecelakaan = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              _quest6 = value!;
                              riwayatKecelakaan = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 14, FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault(
                        "Riwayat Rawat RS", Colors.black, 16, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              _quest7 = value!;
                              riwayatRawatrs = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              _quest7 = value!;
                              riwayatRawatrs = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 14, FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Hepatitis", Colors.black, 16, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest8,
                          onChanged: (value) {
                            setState(() {
                              _quest8 = value!;
                              hepatitis = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest8,
                          onChanged: (value) {
                            setState(() {
                              _quest8 = value!;
                              hepatitis = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 14, FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault(
                        "Kencing Manis", Colors.black, 16, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest9,
                          onChanged: (value) {
                            setState(() {
                              _quest9 = value!;
                              kencingManis = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest9,
                          onChanged: (value) {
                            setState(() {
                              _quest9 = value!;
                              kencingManis = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 14, FontWeight.normal),
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
                          value: Question.ya,
                          groupValue: _quest10,
                          onChanged: (value) {
                            setState(() {
                              _quest10 = value!;
                              patahTulang = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest10,
                          onChanged: (value) {
                            setState(() {
                              _quest10 = value!;
                              patahTulang = "Tidak Ada";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak Ada", Colors.black, 14, FontWeight.normal),
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
                    // onTap: () => showDialogProfil(),
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
                    // onTap: () => showDialogProfil(),
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
    PenyakitTerdahuluModel data = PenyakitTerdahuluModel(
      darahTinggi: _quest.name,
      paru: _quest2.name,
      asamLambung: _quest3.name,
      alergi: _quest4.name,
      riwayatOperasi: _quest5.name,
      riwayatKecelakaan: _quest6.name,
      riwayatRawatRs: _quest7.name,
      hepatitis: _quest8.name,
      kencingManis: _quest9.name,
      patahTulang: _quest10.name,
    );

    await firestore.setPenyakitTerdahulu(data, widget.idPasien!);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PenyakitKeluarga(
        idPasien: widget.idPasien,
      );
    }));
  }
}
