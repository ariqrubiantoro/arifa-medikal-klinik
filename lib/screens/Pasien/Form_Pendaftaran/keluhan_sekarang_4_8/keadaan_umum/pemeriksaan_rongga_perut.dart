// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:arifa_medikal_klink_3/model/pemeriksaan_rongga_perut_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_gentalia.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak }

class PemeriksaanRonggaPerut extends StatefulWidget {
  const PemeriksaanRonggaPerut({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<PemeriksaanRonggaPerut> createState() => _PemeriksaanRonggaPerutState();
}

class _PemeriksaanRonggaPerutState extends State<PemeriksaanRonggaPerut> {
  Question _quest1 = Question.ya;
  Question _quest2 = Question.ya;
  Question _quest3 = Question.ya;
  Question _quest4 = Question.ya;
  Question _quest5 = Question.ya;
  Question _quest6 = Question.ya;
  Question _quest7 = Question.ya;
  Question _quest8 = Question.ya;
  Question _quest9 = Question.ya;

  String inpeksi = "Normal";
  String auskultasi = "Normal";
  String hati = "Normal";
  String limpa = "Normal";
  String ginjalKiri = "Normal";
  String ginjalKanan = "Normal";
  String hernia = "Normal";
  String tumor = "Normal";
  String lainlain = "Normal";

  final perkusi = TextEditingController();
  final ballotementKiri = TextEditingController();
  final ballotementKanan = TextEditingController();

  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: blueDefault,
          title: textDefault("Keadaan Umum - Pemeriksaan Rongga Perut",
              Colors.white, 16, FontWeight.bold)),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        textDefault("4/8", Colors.black, 14, FontWeight.bold)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 180,
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
                      height: 20,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Inpeksi", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest1,
                          onChanged: (value) {
                            setState(() {
                              _quest1 = value!;
                              inpeksi = "Normal";
                              print("inpeksi = $inpeksi");
                            });
                          },
                        ),
                        textDefault(
                            "Normal", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest1,
                          onChanged: (value) {
                            setState(() {
                              _quest1 = value!;
                              inpeksi = "Tidak Normal";
                              print("inpeksi = $inpeksi");
                            });
                          },
                        ),
                        textDefault("Tidak Normal", Colors.black, 14,
                            FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Perkusi", Colors.black, 14, FontWeight.bold),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: TextFormField(
                          controller: perkusi,
                          decoration:
                              InputDecoration(border: InputBorder.none)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault(
                        "Auskultasi", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              _quest2 = value!;
                              auskultasi = "Normal";
                            });
                          },
                        ),
                        textDefault(
                            "Normal", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              _quest2 = value!;
                              auskultasi = "Tidak Normal";
                            });
                          },
                        ),
                        textDefault("Tidak Normal", Colors.black, 14,
                            FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Hati", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              hati = "Normal";
                            });
                          },
                        ),
                        textDefault(
                            "Normal", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              hati = "Tidak Normal";
                            });
                          },
                        ),
                        textDefault("Tidak Normal", Colors.black, 14,
                            FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Limpa", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              _quest4 = value!;
                              limpa = "Normal";
                            });
                          },
                        ),
                        textDefault(
                            "Normal", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              _quest4 = value!;
                              limpa = "Tidak Normal";
                            });
                          },
                        ),
                        textDefault("Tidak Normal", Colors.black, 14,
                            FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault(
                        "Ginjal Kiri", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              _quest5 = value!;
                              ginjalKiri = "Normal";
                            });
                          },
                        ),
                        textDefault(
                            "Normal", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              _quest5 = value!;
                              ginjalKiri = "Tidak Normal";
                            });
                          },
                        ),
                        textDefault("Tidak Normal", Colors.black, 14,
                            FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault(
                        "Ballotement", Colors.black, 14, FontWeight.bold),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: TextFormField(
                          controller: ballotementKiri,
                          decoration:
                              InputDecoration(border: InputBorder.none)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault(
                        "Ginjal Kanan", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              _quest6 = value!;
                              ginjalKanan = "Normal";
                            });
                          },
                        ),
                        textDefault(
                            "Normal", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              _quest6 = value!;
                              ginjalKanan = "Tidak Normal";
                            });
                          },
                        ),
                        textDefault("Tidak Normal", Colors.black, 14,
                            FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault(
                        "Ballotement", Colors.black, 14, FontWeight.bold),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: TextFormField(
                          controller: ballotementKanan,
                          decoration:
                              InputDecoration(border: InputBorder.none)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Hernia", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              _quest7 = value!;
                              hernia = "Normal";
                            });
                          },
                        ),
                        textDefault(
                            "Normal", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              _quest7 = value!;
                              hernia = "Tidak Normal";
                            });
                          },
                        ),
                        textDefault("Tidak Normal", Colors.black, 14,
                            FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Tumor", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest8,
                          onChanged: (value) {
                            setState(() {
                              _quest8 = value!;
                              tumor = "Normal";
                            });
                          },
                        ),
                        textDefault(
                            "Normal", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest8,
                          onChanged: (value) {
                            setState(() {
                              _quest8 = value!;
                              tumor = "Tidak Normal";
                            });
                          },
                        ),
                        textDefault("Tidak Normal", Colors.black, 14,
                            FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Lain-Lain", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest9,
                          onChanged: (value) {
                            setState(() {
                              _quest9 = value!;
                              lainlain = "Normal";
                            });
                          },
                        ),
                        textDefault(
                            "Normal", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest9,
                          onChanged: (value) {
                            setState(() {
                              _quest9 = value!;
                              lainlain = "Tidak Normal";
                            });
                          },
                        ),
                        textDefault("Tidak Normal", Colors.black, 14,
                            FontWeight.normal),
                      ],
                    ),
                  ],
                ),
              ),
            )),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)]),
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
                    //   return PemeriksaanGentalia();
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
            ),
          ],
        ),
      ),
    );
  }

  void saveButton() async {
    PemeriksaanRonggaPerutModel data = PemeriksaanRonggaPerutModel(
      inspeksi: _quest1.name == "ya" ? "Normal" : "Tidak Normal",
      perkusi: perkusi.text,
      auskultasi: _quest2.name == "ya" ? "Normal" : "Tidak Normal",
      hati: _quest3.name == "ya" ? "Normal" : "Tidak Normal",
      limpa: _quest4.name == "ya" ? "Normal" : "Tidak Normal",
      ginjalKiri: _quest5.name == "ya" ? "Normal" : "Tidak Normal",
      ballotementKiri: ballotementKiri.text,
      ginjalKanan: _quest6.name == "ya" ? "Normal" : "Tidak Normal",
      ballotementKanan: ballotementKanan.text,
      hernia: _quest7.name == "ya" ? "Normal" : "Tidak Normal",
      tumor: _quest8.name == "ya" ? "Normal" : "Tidak Normal",
      lainLain: _quest9.name == "ya" ? "Normal" : "Tidak Normal",
    );

    firestore.setPemeriksaanRonggaPerut(
        pemeriksaanRonggaPerut: data, idPasien: widget.idPasien!);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PemeriksaanGentalia(
        idPasien: widget.idPasien,
      );
    }));
  }
}
