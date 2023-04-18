// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:arifa_medikal_klink_3/model/pemeriksaan_rongga_dada_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_rongga_perut.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak }

class PemeriksaanRonggaDada extends StatefulWidget {
  const PemeriksaanRonggaDada({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<PemeriksaanRonggaDada> createState() => _PemeriksaanRonggaDadaState();
}

class _PemeriksaanRonggaDadaState extends State<PemeriksaanRonggaDada> {
  int _questJantung1 = 0;
  int _questJantung2 = 0;
  int _questJantung3 = 0;
  int _questJantung4 = 0;
  int _questJantung5 = 0;
  int _questJantung6 = 0;

  int _questParu1 = 0;
  int _questParu2 = 0;
  int _questParu3 = 0;
  int _questParu4 = 0;
  int _questParu5 = 0;
  int _questParu6 = 0;
  int _questParu7 = 0;
  int _questParu8 = 0;

  String batasJantung = "Normal";
  String auskultasi = "Normal";
  String iktusKordis = "Normal";
  String bunyiJantung = "Normal";
  String bunyiNafas = "Ada";
  String lainlainJantung = "Normal";

  final batasJantungF = TextEditingController();
  final auskultasiF = TextEditingController();
  final iktusKordisF = TextEditingController();
  final bunyiJantungF = TextEditingController();
  final bunyiNafasF = TextEditingController();
  final lainlainJantungF = TextEditingController();

  String inpeksiKanan = "Normal";
  String inpeksiKiri = "Normal";
  String palpasiKanan = "Normal";
  String palpasiKiri = "Normal";
  String perkusiKanan = "Normal";
  String perkusiKiri = "Normal";
  String auskultasiKanan = "Normal";
  String auskultasiKiri = "Normal";

  final inpeksiKananF = TextEditingController();
  final inpeksiKiriF = TextEditingController();
  final palpasiKananF = TextEditingController();
  final palpasiKiriF = TextEditingController();
  final perkusiKananF = TextEditingController();
  final perkusiKiriF = TextEditingController();
  final auskultasiKananF = TextEditingController();
  final auskultasiKiriF = TextEditingController();

  bool tapJantung = false;
  bool tapParu = false;

  FirebaseFirestoreService firestore = FirebaseFirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: blueDefault,
          title: textDefault("Keadaan Umum - Pemeriksaan Rongga Dada",
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
                    InkWell(
                      onTap: () {
                        setState(() {
                          tapJantung = !tapJantung;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 4)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textDefault(
                                "Jantung", Colors.black, 14, FontWeight.bold),
                            Icon(tapJantung
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    ),
                    tapJantung ? jantung() : Container(),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          tapParu = !tapParu;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 4)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textDefault(
                                "Paru", Colors.black, 14, FontWeight.bold),
                            Icon(tapParu
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    ),
                    tapParu ? paru() : Container()
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
                    //   return PemeriksaanRonggaPerut();
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

  Widget jantung() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          textDefault("Batas-Batas Jantung", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questJantung1,
                onChanged: (value) {
                  setState(() {
                    _questJantung1 = value!;
                    batasJantung = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questJantung1,
                onChanged: (value) {
                  setState(() {
                    _questJantung1 = value!;
                    batasJantung = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questJantung1 = 0;
                    });
                  },
                  controller: batasJantungF,
                  maxLength: 10,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Auskultasi", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questJantung2,
                onChanged: (value) {
                  setState(() {
                    _questJantung2 = value!;
                    auskultasi = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questJantung2,
                onChanged: (value) {
                  setState(() {
                    _questJantung2 = value!;
                    auskultasi = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questJantung2 = 0;
                    });
                  },
                  controller: auskultasiF,
                  maxLength: 10,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Iktus Kordis", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questJantung3,
                onChanged: (value) {
                  setState(() {
                    _questJantung3 = value!;
                    iktusKordis = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questJantung3,
                onChanged: (value) {
                  setState(() {
                    _questJantung3 = value!;
                    iktusKordis = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questJantung3 = 0;
                    });
                  },
                  controller: iktusKordisF,
                  maxLength: 10,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Bunyi Jantung", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questJantung4,
                onChanged: (value) {
                  setState(() {
                    _questJantung4 = value!;
                    bunyiJantung = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questJantung4,
                onChanged: (value) {
                  setState(() {
                    _questJantung4 = value!;
                    bunyiJantung = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questJantung4 = 0;
                    });
                  },
                  controller: bunyiJantungF,
                  maxLength: 10,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Bunyi Nafas", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questJantung5,
                onChanged: (value) {
                  setState(() {
                    _questJantung5 = value!;
                    bunyiNafas = "Ada";
                  });
                },
              ),
              textDefault("Ada", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questJantung5,
                onChanged: (value) {
                  setState(() {
                    _questJantung5 = value!;
                    bunyiNafas = "Tidak Ada";
                  });
                },
              ),
              textDefault("Tidak Ada", Colors.black, 13, FontWeight.normal),
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
                      _questJantung5 = 0;
                    });
                  },
                  controller: bunyiNafasF,
                  maxLength: 10,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Lain-Lain", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questJantung6,
                onChanged: (value) {
                  setState(() {
                    _questJantung6 = value!;
                    bunyiNafas = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questJantung6,
                onChanged: (value) {
                  setState(() {
                    _questJantung6 = value!;
                    bunyiNafas = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questJantung6 = 0;
                    });
                  },
                  controller: lainlainJantungF,
                  maxLength: 10,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Widget paru() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          textDefault("Inspeksi Kanan", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questParu1,
                onChanged: (value) {
                  setState(() {
                    _questParu1 = value!;
                    inpeksiKanan = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questParu1,
                onChanged: (value) {
                  setState(() {
                    _questParu1 = value!;
                    inpeksiKanan = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questParu1 = 0;
                    });
                  },
                  controller: inpeksiKananF,
                  maxLength: 10,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Inspeksi Kiri", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questParu2,
                onChanged: (value) {
                  setState(() {
                    _questParu2 = value!;
                    inpeksiKiri = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questParu2,
                onChanged: (value) {
                  setState(() {
                    _questParu2 = value!;
                    inpeksiKiri = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questParu2 = 0;
                    });
                  },
                  controller: inpeksiKiriF,
                  maxLength: 10,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Palpasi Kanan", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questParu3,
                onChanged: (value) {
                  setState(() {
                    _questParu3 = value!;
                    palpasiKanan = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questParu3,
                onChanged: (value) {
                  setState(() {
                    _questParu3 = value!;
                    palpasiKanan = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questParu3 = 0;
                    });
                  },
                  controller: palpasiKananF,
                  maxLength: 10,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Palpasi Kiri", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questParu4,
                onChanged: (value) {
                  setState(() {
                    _questParu4 = value!;
                    palpasiKiri = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questParu4,
                onChanged: (value) {
                  setState(() {
                    _questParu4 = value!;
                    palpasiKiri = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questParu4 = 0;
                    });
                  },
                  controller: palpasiKiriF,
                  maxLength: 10,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Perkusi Kanan", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questParu5,
                onChanged: (value) {
                  setState(() {
                    _questParu5 = value!;
                    perkusiKanan = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questParu5,
                onChanged: (value) {
                  setState(() {
                    _questParu5 = value!;
                    perkusiKanan = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questParu5 = 0;
                    });
                  },
                  controller: perkusiKananF,
                  maxLength: 10,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Perkusi Kiri", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questParu6,
                onChanged: (value) {
                  setState(() {
                    _questParu6 = value!;
                    perkusiKiri = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questParu6,
                onChanged: (value) {
                  setState(() {
                    _questParu6 = value!;
                    perkusiKiri = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questParu6 = 0;
                    });
                  },
                  controller: perkusiKiriF,
                  maxLength: 10,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Auskultasi Kanan", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questParu7,
                onChanged: (value) {
                  setState(() {
                    _questParu7 = value!;
                    auskultasiKanan = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questParu7,
                onChanged: (value) {
                  setState(() {
                    _questParu7 = value!;
                    auskultasiKanan = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questParu7 = 0;
                    });
                  },
                  controller: auskultasiKananF,
                  maxLength: 10,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Auskultasi Kiri", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questParu8,
                onChanged: (value) {
                  setState(() {
                    _questParu8 = value!;
                    auskultasiKiri = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questParu8,
                onChanged: (value) {
                  setState(() {
                    _questParu8 = value!;
                    auskultasiKiri = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questParu8 = 0;
                    });
                  },
                  controller: auskultasiKiriF,
                  maxLength: 10,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  void saveButton() async {
    batasJantung = batasJantungF.text != "" ? batasJantungF.text : batasJantung;
    auskultasi = auskultasiF.text != "" ? auskultasiF.text : auskultasi;
    iktusKordis = iktusKordisF.text != "" ? iktusKordisF.text : iktusKordis;
    bunyiJantung = bunyiJantungF.text != "" ? bunyiJantungF.text : bunyiJantung;
    bunyiNafas = bunyiNafasF.text != "" ? bunyiNafasF.text : bunyiNafas;
    lainlainJantung =
        lainlainJantungF.text != "" ? lainlainJantungF.text : lainlainJantung;

    inpeksiKanan = inpeksiKananF.text != "" ? inpeksiKananF.text : inpeksiKanan;
    inpeksiKiri = inpeksiKiriF.text != "" ? inpeksiKiriF.text : inpeksiKiri;
    palpasiKanan = palpasiKananF.text != "" ? palpasiKananF.text : palpasiKanan;
    palpasiKiri = palpasiKiriF.text != "" ? palpasiKiriF.text : palpasiKiri;
    perkusiKanan = perkusiKananF.text != "" ? perkusiKananF.text : perkusiKanan;
    perkusiKiri = perkusiKiriF.text != "" ? perkusiKiriF.text : perkusiKiri;
    auskultasiKanan =
        auskultasiKananF.text != "" ? auskultasiKananF.text : auskultasiKanan;
    auskultasiKiri =
        auskultasiKiriF.text != "" ? auskultasiKiriF.text : auskultasiKiri;

    PemeriksaanRonggaDadaModel data = PemeriksaanRonggaDadaModel(
      jantung: JantungModel(
        batasBatasJantung: batasJantung,
        auskultasi: auskultasi,
        iktusKordis: iktusKordis,
        bunyiJantung: bunyiJantung,
        bunyuNafas: bunyiNafas,
        lainLain: lainlainJantung,
      ),
      paru: ParuModel(
        inspeksiKanan: inpeksiKanan,
        inspeksiKiri: inpeksiKiri,
        palpasiKanan: palpasiKanan,
        palpasiKiri: palpasiKiri,
        perkusiKanan: perkusiKanan,
        perkusiKiri: perkusiKiri,
        auskultasiKanan: auskultasiKanan,
        auskultasiKiri: auskultasiKiri,
      ),
    );

    firestore.setPemeriksaanRonggaDada(
        pemeriksaanRonggaDada: data, idPasien: widget.idPasien!);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PemeriksaanRonggaPerut(
        idPasien: widget.idPasien,
      );
    }));
  }
}
