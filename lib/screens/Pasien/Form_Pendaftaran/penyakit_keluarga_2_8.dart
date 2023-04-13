// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/components/colors/color.dart';
import 'package:arifa_medikal_klink_3/components/widget/text.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/penyakit_terdahulu_1_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/riwayat_kebiasaan_3_8.dart';
import 'package:flutter/material.dart';

import '../../../model/penyakit_keluarga_mode.dart';
import '../../../service/firebase_firestore_service.dart';

enum Question { ayah, ibu, tidak }

class PenyakitKeluarga extends StatefulWidget {
  const PenyakitKeluarga({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<PenyakitKeluarga> createState() => _PenyakitKeluargaState();
}

class _PenyakitKeluargaState extends State<PenyakitKeluarga> {
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

  String kencingManis = "Tidak Ada";
  String darahTinggi = "Tidak Ada";
  String asamLambung = "Tidak Ada";
  String alergi = "Tidak Ada";
  String paru = "Tidak Ada";
  String stroke = "Tidak Ada";
  String ginjal = "Tidak Ada";
  String hermorhid = "Tidak Ada";
  String kanker = "Tidak Ada";
  String jantung = "Tidak Ada";

  @override
  Widget build(BuildContext context) {
    // print("id pasien : ${widget.idPasien}");
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blueDefault,
          automaticallyImplyLeading: true,
          title: textDefault("Riwayat Penyakit Keluarga (Orang Tua)",
              Colors.white, 16, FontWeight.bold)),
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
                        textDefault("2/8", Colors.black, 14, FontWeight.bold)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 80,
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
                        "Kencing Manis", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ayah,
                          groupValue: _quest,
                          onChanged: (value) {
                            setState(() {
                              _quest = value!;
                              kencingManis = "Ayah";
                            });
                          },
                        ),
                        textDefault(
                            "Ayah", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.ibu,
                          groupValue: _quest,
                          onChanged: (value) {
                            setState(() {
                              _quest = value!;
                              kencingManis = "Ibu";
                            });
                          },
                        ),
                        textDefault("Ibu", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest,
                          onChanged: (value) {
                            setState(() {
                              _quest = value!;
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
                    textDefault(
                        "Darah Tinggi", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ayah,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              _quest2 = value!;
                              darahTinggi = "Ayah";
                            });
                          },
                        ),
                        textDefault(
                            "Ayah", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.ibu,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              _quest2 = value!;
                              darahTinggi = "Ibu";
                              print(paru);
                            });
                          },
                        ),
                        textDefault("Ibu", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              _quest2 = value!;
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
                    textDefault(
                        "Asam Lambung", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ayah,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              asamLambung = "Ayah";
                            });
                          },
                        ),
                        textDefault(
                            "Ayah", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.ibu,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              asamLambung = "Ibu";
                            });
                          },
                        ),
                        textDefault("Ibu", Colors.black, 14, FontWeight.normal),
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
                    textDefault("Alergi", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ayah,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              _quest4 = value!;
                              alergi = "Ayah";
                            });
                          },
                        ),
                        textDefault(
                            "Ayah", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.ibu,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              _quest4 = value!;
                              alergi = "Ibu";
                            });
                          },
                        ),
                        textDefault("Ibu", Colors.black, 14, FontWeight.normal),
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
                    textDefault("Penyakit Paru (Asma, TBC, dll)", Colors.black,
                        16, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ayah,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              _quest5 = value!;
                              paru = "Ayah";
                            });
                          },
                        ),
                        textDefault(
                            "Ayah", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.ibu,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              _quest5 = value!;
                              paru = "Ibu";
                            });
                          },
                        ),
                        textDefault("Ibu", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              _quest5 = value!;
                              paru = "Tidak Ada";
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
                    textDefault("Stroke", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ayah,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              _quest6 = value!;
                              stroke = "Ayah";
                            });
                          },
                        ),
                        textDefault(
                            "Ayah", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.ibu,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              _quest6 = value!;
                              stroke = "Ibu";
                            });
                          },
                        ),
                        textDefault("Ibu", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              _quest6 = value!;
                              stroke = "Tidak Ada";
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
                    textDefault("Ginjal", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ayah,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              _quest7 = value!;
                              ginjal = "Ayah";
                            });
                          },
                        ),
                        textDefault(
                            "Ayah", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.ibu,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              _quest7 = value!;
                              ginjal = "Ibu";
                            });
                          },
                        ),
                        textDefault("Ibu", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              _quest7 = value!;
                              ginjal = "Tidak Ada";
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
                    textDefault("Hemorhoid", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ayah,
                          groupValue: _quest8,
                          onChanged: (value) {
                            setState(() {
                              _quest8 = value!;
                              hermorhid = "Ayah";
                            });
                          },
                        ),
                        textDefault(
                            "Ayah", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.ibu,
                          groupValue: _quest8,
                          onChanged: (value) {
                            setState(() {
                              _quest8 = value!;
                              hermorhid = "Ibu";
                            });
                          },
                        ),
                        textDefault("Ibu", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest8,
                          onChanged: (value) {
                            setState(() {
                              _quest8 = value!;
                              hermorhid = "Tidak Ada";
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
                    textDefault("Kanker", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ayah,
                          groupValue: _quest9,
                          onChanged: (value) {
                            setState(() {
                              _quest9 = value!;
                              kanker = "Ayah";
                            });
                          },
                        ),
                        textDefault(
                            "Ayah", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.ibu,
                          groupValue: _quest9,
                          onChanged: (value) {
                            setState(() {
                              _quest9 = value!;
                              kanker = "Ibu";
                            });
                          },
                        ),
                        textDefault("Ibu", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest9,
                          onChanged: (value) {
                            setState(() {
                              _quest9 = value!;
                              kanker = "Tidak Ada";
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
                    textDefault("Jantung", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ayah,
                          groupValue: _quest10,
                          onChanged: (value) {
                            setState(() {
                              _quest10 = value!;
                              jantung = "Ayah";
                            });
                          },
                        ),
                        textDefault(
                            "Ayah", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.ibu,
                          groupValue: _quest10,
                          onChanged: (value) {
                            setState(() {
                              _quest10 = value!;
                              jantung = "Ibu";
                            });
                          },
                        ),
                        textDefault("Ibu", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest10,
                          onChanged: (value) {
                            setState(() {
                              _quest10 = value!;
                              jantung = "Tidak Ada";
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
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return RiwwayatKebiasaan3();
                      }),
                    ),

                    // onTap: saveButton,

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
    PenyakitKeluargaModel data = PenyakitKeluargaModel(
      kencingManis: kencingManis,
      darahTinggi: darahTinggi,
      asamLambung: asamLambung,
      alergi: alergi,
      paru: paru,
      stroke: stroke,
      ginjal: ginjal,
      hemorhoid: hermorhid,
      kanker: kanker,
      jantung: jantung,
    );

    firestore.setPenyakitKeluarga(data, widget.idPasien!);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RiwwayatKebiasaan3(idPasien: widget.idPasien),
        ));
  }
}
