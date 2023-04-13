// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_refleks.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak }

class PemeriksaanAnggotaGerak extends StatefulWidget {
  const PemeriksaanAnggotaGerak({super.key});

  @override
  State<PemeriksaanAnggotaGerak> createState() =>
      _PemeriksaanAnggotaGerakState();
}

class _PemeriksaanAnggotaGerakState extends State<PemeriksaanAnggotaGerak> {
  Question _quest1 = Question.ya;
  Question _quest2 = Question.ya;
  Question _quest3 = Question.ya;
  Question _quest4 = Question.ya;
  Question _quest5 = Question.ya;
  Question _quest6 = Question.ya;
  Question _quest7 = Question.ya;
  Question _quest8 = Question.ya;

  String atasKanan = "";
  String atasKiri = "";
  String bawahKanan = "";
  String bawahKiri = "";
  String sembabKanan = "";
  String sembabKiri = "";
  String cacatKanan = "";
  String cacatKiri = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: blueDefault,
          title: textDefault("Keadaan Umum - Pemeriksaan Anggota Gerak",
              Colors.white, 16, FontWeight.bold)),
      body: Column(
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
                  textDefault("Atas Kanan", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest1,
                        onChanged: (value) {
                          setState(() {
                            _quest1 = value!;
                            atasKanan = "Normal";
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
                            atasKanan = "Tidak Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Tidak Normal", Colors.black, 14, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Atas Kiri", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest2,
                        onChanged: (value) {
                          setState(() {
                            _quest2 = value!;
                            atasKiri = "Normal";
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
                            atasKiri = "Tidak Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Tidak Normal", Colors.black, 14, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Bawah Kanan", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest3,
                        onChanged: (value) {
                          setState(() {
                            _quest3 = value!;
                            bawahKanan = "Normal";
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
                            bawahKanan = "Tidak Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Tidak Normal", Colors.black, 14, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Bawah Kiri", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest4,
                        onChanged: (value) {
                          setState(() {
                            _quest4 = value!;
                            bawahKiri = "Normal";
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
                            bawahKiri = "Tidak Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Tidak Normal", Colors.black, 14, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault(
                      "Sembab/Oedem Kanan", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest5,
                        onChanged: (value) {
                          setState(() {
                            _quest5 = value!;
                            sembabKanan = "Normal";
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
                            sembabKanan = "Tidak Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Tidak Normal", Colors.black, 14, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault(
                      "Sembab/Oedem Kiri", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest6,
                        onChanged: (value) {
                          setState(() {
                            _quest6 = value!;
                            sembabKiri = "Normal";
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
                            sembabKiri = "Tidak Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Tidak Normal", Colors.black, 14, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Cacat Kanan", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest7,
                        onChanged: (value) {
                          setState(() {
                            _quest7 = value!;
                            cacatKanan = "Normal";
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
                            cacatKanan = "Tidak Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Tidak Normal", Colors.black, 14, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Cacat Kiri", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest8,
                        onChanged: (value) {
                          setState(() {
                            _quest8 = value!;
                            cacatKiri = "Normal";
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
                            cacatKiri = "Tidak Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Tidak Normal", Colors.black, 14, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
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
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return PemeriksaanRefleks();
                  })),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
    );
  }
}
