// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/pemeriksaan_anggota_gerak_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_refleks.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak }

class PemeriksaanAnggotaGerak extends StatefulWidget {
  const PemeriksaanAnggotaGerak({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<PemeriksaanAnggotaGerak> createState() =>
      _PemeriksaanAnggotaGerakState();
}

class _PemeriksaanAnggotaGerakState extends State<PemeriksaanAnggotaGerak> {
  int _quest1 = 0;
  int _quest2 = 0;
  int _quest3 = 0;
  int _quest4 = 0;
  int _quest5 = 0;
  int _quest6 = 0;
  int _quest7 = 0;
  int _quest8 = 0;

  String atasKanan = "Normal";
  String atasKiri = "Normal";
  String bawahKanan = "Normal";
  String bawahKiri = "Normal";
  String sembabKanan = "Normal";
  String sembabKiri = "Normal";
  String cacatKanan = "Normal";
  String cacatKiri = "Normal";

  final atasKananF = TextEditingController();
  final atasKiriF = TextEditingController();
  final bawahKananF = TextEditingController();
  final bawahKiriF = TextEditingController();
  final sembabKananF = TextEditingController();
  final sembabKiriF = TextEditingController();
  final cacatKananF = TextEditingController();
  final cacatKiriF = TextEditingController();

  FirebaseFirestoreService firestore = FirebaseFirestoreService();

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
                        value: 1,
                        groupValue: _quest1,
                        onChanged: (value) {
                          setState(() {
                            _quest1 = value!;
                            atasKanan = "Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Normal", Colors.black, 13, FontWeight.normal),
                      Radio(
                        value: 2,
                        groupValue: _quest1,
                        onChanged: (value) {
                          setState(() {
                            _quest1 = value!;
                            atasKanan = "Tidak Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                              _quest1 = 0;
                            });
                          },
                          controller: atasKananF,
                          maxLength: 15,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Atas Kiri", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: _quest2,
                        onChanged: (value) {
                          setState(() {
                            _quest2 = value!;
                            atasKiri = "Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Normal", Colors.black, 13, FontWeight.normal),
                      Radio(
                        value: 2,
                        groupValue: _quest2,
                        onChanged: (value) {
                          setState(() {
                            _quest2 = value!;
                            atasKiri = "Tidak Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                          controller: atasKiriF,
                          maxLength: 15,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Bawah Kanan", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: _quest3,
                        onChanged: (value) {
                          setState(() {
                            _quest3 = value!;
                            bawahKanan = "Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Normal", Colors.black, 13, FontWeight.normal),
                      Radio(
                        value: 2,
                        groupValue: _quest3,
                        onChanged: (value) {
                          setState(() {
                            _quest3 = value!;
                            bawahKanan = "Tidak Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                          controller: bawahKananF,
                          maxLength: 15,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Bawah Kiri", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: _quest4,
                        onChanged: (value) {
                          setState(() {
                            _quest4 = value!;
                            bawahKiri = "Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Normal", Colors.black, 13, FontWeight.normal),
                      Radio(
                        value: 2,
                        groupValue: _quest4,
                        onChanged: (value) {
                          setState(() {
                            _quest4 = value!;
                            bawahKiri = "Tidak Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                          controller: bawahKiriF,
                          maxLength: 15,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ))
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
                        value: 1,
                        groupValue: _quest5,
                        onChanged: (value) {
                          setState(() {
                            _quest5 = value!;
                            sembabKanan = "Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Normal", Colors.black, 13, FontWeight.normal),
                      Radio(
                        value: 2,
                        groupValue: _quest5,
                        onChanged: (value) {
                          setState(() {
                            _quest5 = value!;
                            sembabKanan = "Tidak Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                          controller: sembabKananF,
                          maxLength: 15,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ))
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
                        value: 1,
                        groupValue: _quest6,
                        onChanged: (value) {
                          setState(() {
                            _quest6 = value!;
                            sembabKiri = "Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Normal", Colors.black, 13, FontWeight.normal),
                      Radio(
                        value: 2,
                        groupValue: _quest6,
                        onChanged: (value) {
                          setState(() {
                            _quest6 = value!;
                            sembabKiri = "Tidak Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                          controller: sembabKiriF,
                          maxLength: 15,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Cacat Kanan", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: _quest7,
                        onChanged: (value) {
                          setState(() {
                            _quest7 = value!;
                            cacatKanan = "Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Normal", Colors.black, 13, FontWeight.normal),
                      Radio(
                        value: 2,
                        groupValue: _quest7,
                        onChanged: (value) {
                          setState(() {
                            _quest7 = value!;
                            cacatKanan = "Tidak Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                          controller: cacatKananF,
                          maxLength: 15,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Cacat Kiri", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: _quest8,
                        onChanged: (value) {
                          setState(() {
                            _quest8 = value!;
                            cacatKiri = "Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Normal", Colors.black, 13, FontWeight.normal),
                      Radio(
                        value: 2,
                        groupValue: _quest8,
                        onChanged: (value) {
                          setState(() {
                            _quest8 = value!;
                            cacatKiri = "Tidak Normal";
                          });
                        },
                      ),
                      textDefault(
                          "Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                          controller: cacatKiriF,
                          maxLength: 15,
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
                  // onTap: () => Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) {
                  //   return PemeriksaanRefleks();
                  // })),
                  onTap: saveButton,
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

  saveButton() async {
    atasKanan = atasKananF.text != "" ? atasKananF.text : atasKanan;
    atasKiri = atasKiriF.text != "" ? atasKiriF.text : atasKiri;
    bawahKanan = bawahKananF.text != "" ? bawahKananF.text : bawahKanan;
    bawahKiri = bawahKiriF.text != "" ? bawahKiriF.text : bawahKiri;
    sembabKanan = sembabKananF.text != "" ? sembabKananF.text : sembabKanan;
    sembabKiri = sembabKiriF.text != "" ? sembabKiriF.text : sembabKiri;
    cacatKanan = cacatKananF.text != "" ? cacatKananF.text : cacatKanan;
    cacatKiri = cacatKiriF.text != "" ? cacatKiriF.text : cacatKiri;

    PemeriksaanAnggotaGerakModel data = PemeriksaanAnggotaGerakModel(
      atasKanan: atasKanan,
      atasKiri: atasKiri,
      bawahKanan: bawahKanan,
      bawahKiri: bawahKiri,
      cacatKanan: cacatKanan,
      cacatKiri: cacatKiri,
      sembabOedemKanan: sembabKanan,
      sembabOedemKiri: sembabKiri,
    );

    firestore.setPemeriksaanAnggotaGerak(
        pemeriksaanAnggotaGerak: data, idPasien: widget.idPasien!);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PemeriksaanRefleks(
        idPasien: widget.idPasien,
      );
    }));
  }
}
