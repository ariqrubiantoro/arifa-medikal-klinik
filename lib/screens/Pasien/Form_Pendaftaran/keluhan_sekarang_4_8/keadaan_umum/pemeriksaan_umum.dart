// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:arifa_medikal_klink_3/model/pemeriksaan_umum_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_mata.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';
import '../../../../../service/firebase_firestore_service.dart';

class PemeriksaanUmum extends StatefulWidget {
  const PemeriksaanUmum({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<PemeriksaanUmum> createState() => _PemeriksaanUmumState();
}

class _PemeriksaanUmumState extends State<PemeriksaanUmum> {
  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  final tinggiBadan = TextEditingController();
  final beratBadan = TextEditingController();
  final beratBadanIdeal = TextEditingController();
  final imt = TextEditingController();
  final lingkaranPerut = TextEditingController();
  final tekananDarah = TextEditingController();
  final denyutNadi = TextEditingController();
  final pernapasan = TextEditingController();
  final suhu = TextEditingController();
  String jenisKelamin = "";
  PemeriksaanUmumModel? data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    data = await firestore.getPemeriksaanUmum(widget.idPasien!);

    if (data != null) {
      setState(() {
        tinggiBadan.text = data!.tinggiBadan!;
        beratBadan.text = data!.beratBadan!;
        beratBadanIdeal.text = data!.beratBadanIdeal!;
        imt.text = data!.imt!;
        lingkaranPerut.text = data!.lingkarPerut!;
        tekananDarah.text = data!.tekananDarah!;
        denyutNadi.text = data!.denyutNadi!;
        pernapasan.text = data!.pernapasan!;
        suhu.text = data!.suhu!;
        jenisKelamin = prefs.getString('jenisKelamin')!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return MenuForm(idPasien: widget.idPasien!);
        }));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: blueDefault,
            title: 
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return MenuForm(idPasien: widget.idPasien!);
                      }));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back),
                      ],
                    ),
                  ),
                
            textDefault("Keadaan Umum - Pemeriksaan Umum", Colors.white,
                16, FontWeight.bold),
                  SizedBox(
                    width: 5,
                  ),
                ]),
            
                
                ),
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
                      Row(
                        children: [
                          Container(
                            width: 150,
                            child: textDefault("Tinggi Badan", Colors.black, 14,
                                FontWeight.normal),
                          ),
                          textDefault(
                              ":  ", Colors.black, 14, FontWeight.normal),
                          Container(
                            width: 80,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                                controller: tinggiBadan,
                                onChanged: (value) async {
                                  if (value.isNotEmpty) {
                                    if (beratBadan.text != "") {
                                      if (jenisKelamin == 'Pria') {
                                        setState(() {
                                          int tinggi = int.parse(value);
                                          int berat =
                                              int.parse(beratBadan.text);
                                          double bmi =
                                              berat / pow(tinggi / 100, 2);

                                          double ideal = tinggi -
                                              100 -
                                              ((tinggi - 100) * 10 / 100);

                                          imt.text = bmi.toStringAsFixed(2);
                                          beratBadanIdeal.text =
                                              ideal.toStringAsFixed(1);

                                          print(
                                              'berat badan ideal = ${beratBadanIdeal.text}');
                                        });
                                      } else {
                                        setState(() {
                                          int tinggi = int.parse(value);
                                          int berat =
                                              int.parse(beratBadan.text);
                                          double bmi =
                                              berat / pow(tinggi / 100, 2);

                                          double ideal = tinggi -
                                              100 -
                                              ((tinggi - 100) * 15 / 100);

                                          imt.text = bmi.toStringAsFixed(2);
                                          beratBadanIdeal.text =
                                              ideal.toStringAsFixed(1);
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        imt.text = "";
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      imt.text = "";
                                      beratBadanIdeal.text = "";
                                    });
                                  }
                                },
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(border: InputBorder.none)),
                          ),
                          textDefault(
                              " cm", Colors.black, 14, FontWeight.normal),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            child: textDefault("Berat Badan", Colors.black, 14,
                                FontWeight.normal),
                          ),
                          textDefault(
                              ":  ", Colors.black, 14, FontWeight.normal),
                          Container(
                            width: 80,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                                controller: beratBadan,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    if (tinggiBadan.text != "") {
                                      if (jenisKelamin == 'Pria') {
                                        setState(() {
                                          int tinggi =
                                              int.parse(tinggiBadan.text);
                                          int berat = int.parse(value);
                                          double bmi =
                                              berat / pow(tinggi / 100, 2);
                                          double ideal = tinggi -
                                              100 -
                                              ((tinggi - 100) * 10 / 100);

                                          imt.text = bmi.toStringAsFixed(2);
                                          beratBadanIdeal.text =
                                              ideal.toStringAsFixed(1);
                                        });
                                      } else {
                                        setState(() {
                                          int tinggi =
                                              int.parse(tinggiBadan.text);
                                          int berat = int.parse(value);
                                          double bmi =
                                              berat / pow(tinggi / 100, 2);

                                          double ideal = tinggi -
                                              100 -
                                              ((tinggi - 100) * 15 / 100);

                                          imt.text = bmi.toStringAsFixed(2);
                                          beratBadanIdeal.text =
                                              ideal.toStringAsFixed(1);
                                        });
                                      }
                                    }
                                  } else {
                                    setState(() {
                                      imt.text = "";
                                    });
                                  }
                                },
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(border: InputBorder.none)),
                          ),
                          textDefault(
                              " kg", Colors.black, 14, FontWeight.normal),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            child: textDefault("Berat Badan Ideal",
                                Colors.black, 14, FontWeight.normal),
                          ),
                          textDefault(
                              ":  ", Colors.black, 14, FontWeight.normal),
                          Container(
                            width: 80,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                                readOnly: true,
                                controller: beratBadanIdeal,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(border: InputBorder.none)),
                          ),
                          textDefault(
                              " kg", Colors.black, 14, FontWeight.normal),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            child: textDefault(
                                "IMT", Colors.black, 14, FontWeight.normal),
                          ),
                          textDefault(
                              ":  ", Colors.black, 14, FontWeight.normal),
                          Container(
                            width: 80,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                                readOnly: true,
                                controller: imt,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(border: InputBorder.none)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            child: textDefault("Lingkaran Perut", Colors.black,
                                14, FontWeight.normal),
                          ),
                          textDefault(
                              ":  ", Colors.black, 14, FontWeight.normal),
                          Container(
                            width: 80,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                                controller: lingkaranPerut,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(border: InputBorder.none)),
                          ),
                          textDefault(
                              " cm", Colors.black, 14, FontWeight.normal),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            child: textDefault("Tekanan Darah", Colors.black,
                                14, FontWeight.normal),
                          ),
                          textDefault(
                              ":  ", Colors.black, 14, FontWeight.normal),
                          Container(
                            width: 80,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                                controller: tekananDarah,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(border: InputBorder.none)),
                          ),
                          textDefault(
                              " mmHg", Colors.black, 14, FontWeight.normal),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            child: textDefault("Denyut Nadi", Colors.black, 14,
                                FontWeight.normal),
                          ),
                          textDefault(
                              ":  ", Colors.black, 14, FontWeight.normal),
                          Container(
                            width: 80,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                                controller: denyutNadi,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(border: InputBorder.none)),
                          ),
                          textDefault(
                              " x/menit", Colors.black, 14, FontWeight.normal),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            child: textDefault("Frek. Pernafasan", Colors.black,
                                14, FontWeight.normal),
                          ),
                          textDefault(
                              ":  ", Colors.black, 14, FontWeight.normal),
                          Container(
                            width: 80,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                                controller: pernapasan,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(border: InputBorder.none)),
                          ),
                          textDefault(
                              " x/menit", Colors.black, 14, FontWeight.normal),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            child: textDefault(
                                "Suhu", Colors.black, 14, FontWeight.normal),
                          ),
                          textDefault(
                              ":  ", Colors.black, 14, FontWeight.normal),
                          Container(
                            width: 80,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                                controller: suhu,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(border: InputBorder.none)),
                          ),
                          textDefault(
                              " °C", Colors.black, 14, FontWeight.normal),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(color: Colors.grey, blurRadius: 2)
                  ]),
                  child: InkWell(
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
                            "Simpan", Colors.white, 16, FontWeight.normal),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void saveButton() async {
    PemeriksaanUmumModel data = PemeriksaanUmumModel(
      tinggiBadan: tinggiBadan.text,
      beratBadan: beratBadan.text,
      beratBadanIdeal: beratBadanIdeal.text,
      imt: imt.text,
      lingkarPerut: lingkaranPerut.text,
      tekananDarah: tekananDarah.text,
      denyutNadi: denyutNadi.text,
      pernapasan: pernapasan.text,
      suhu: suhu.text,
    );

    await firestore.setPemeriksaanUmum(
        pemeriksaanUmum: data, idPasien: widget.idPasien!);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MenuForm(idPasien: widget.idPasien!);
    }));
  }
}
