// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:arifa_medikal_klink_3/model/pemeriksaan_rongga_perut_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_gentalia.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/pasien_detail.dart';

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
  int _quest1 = 1;
  int _quest2 = 1;
  int _quest3 = 1;
  int _quest4 = 1;
  int _quest5 = 1;
  int _quest6 = 1;
  int _quest7 = 1;
  int _quest8 = 1;
  int _quest9 = 1;

  String inpeksi = "Normal";
  String auskultasi = "Normal";
  String hati = "Normal";
  String limpa = "Normal";
  String ginjalKiri = "Normal";
  String ginjalKanan = "Normal";
  String hernia = "Normal";
  String tumor = "Normal";
  String lainlain = "Normal";

  final inpeksiF = TextEditingController();
  final auskultasiF = TextEditingController();
  final hatiF = TextEditingController();
  final limpaF = TextEditingController();
  final ginjalKiriF = TextEditingController();
  final ginjalKananF = TextEditingController();
  final herniaF = TextEditingController();
  final tumorF = TextEditingController();
  final lainlainF = TextEditingController();

  final perkusi = TextEditingController();
  final ballotementKiri = TextEditingController();
  final ballotementKanan = TextEditingController();
  PemeriksaanRonggaPerutModel? data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    data = await firestore.getPemeriksaanRonggaPerut(widget.idPasien!);
    if (data != null) {
      perkusi.text = data!.perkusi!;

      ballotementKanan.text = data!.ballotementKanan!;
      ballotementKiri.text = data!.ballotementKiri!;
      setState(() {});

      if (data!.inspeksi == "Normal") {
        setState(() {
          inpeksi = data!.inspeksi!;
          _quest1 = 1;
        });
      } else if (data!.inspeksi == "Tidak Normal") {
        setState(() {
          inpeksi = data!.inspeksi!;
          _quest1 = 2;
        });
      } else if (data!.inspeksi == "") {
      } else {
        inpeksiF.text = data!.inspeksi!;
      }

      if (data!.auskultasi == "Normal") {
        setState(() {
          auskultasi = data!.auskultasi!;
          _quest2 = 1;
        });
      } else if (data!.auskultasi == "Tidak Normal") {
        setState(() {
          auskultasi = data!.auskultasi!;
          _quest2 = 2;
        });
      } else if (data!.auskultasi == "") {
      } else {
        auskultasiF.text = data!.auskultasi!;
      }

      if (data!.hati == "Normal") {
        setState(() {
          hati = data!.hati!;
          _quest3 = 1;
        });
      } else if (data!.hati == "Tidak Normal") {
        setState(() {
          hati = data!.hati!;
          _quest3 = 2;
        });
      } else if (data!.hati == "") {
      } else {
        hatiF.text = data!.hati!;
      }

      if (data!.limpa == "Normal") {
        setState(() {
          limpa = data!.limpa!;
          _quest4 = 1;
        });
      } else if (data!.limpa == "Tidak Normal") {
        setState(() {
          limpa = data!.limpa!;
          _quest4 = 2;
        });
      } else if (data!.limpa == "") {
      } else {
        limpaF.text = data!.limpa!;
      }

      if (data!.ginjalKiri == "Normal") {
        setState(() {
          ginjalKiri = data!.ginjalKiri!;
          _quest5 = 1;
        });
      } else if (data!.ginjalKiri == "Tidak Normal") {
        setState(() {
          ginjalKiri = data!.ginjalKiri!;
          _quest5 = 2;
        });
      } else if (data!.ginjalKiri == "") {
      } else {
        ginjalKiriF.text = data!.ginjalKiri!;
      }

      if (data!.ginjalKanan == "Normal") {
        setState(() {
          ginjalKanan = data!.ginjalKanan!;
          _quest6 = 1;
        });
      } else if (data!.ginjalKanan == "Tidak Normal") {
        setState(() {
          ginjalKanan = data!.ginjalKanan!;
          _quest6 = 2;
        });
      } else if (data!.ginjalKanan == "") {
      } else {
        ginjalKananF.text = data!.ginjalKanan!;
      }

      if (data!.hernia == "Normal") {
        setState(() {
          hernia = data!.hernia!;
          _quest7 = 1;
        });
      } else if (data!.hernia == "Tidak Normal") {
        setState(() {
          hernia = data!.hernia!;
          _quest7 = 2;
        });
      } else if (data!.hernia == "") {
      } else {
        herniaF.text = data!.hernia!;
      }

      if (data!.tumor == "Normal") {
        setState(() {
          tumor = data!.tumor!;
          _quest8 = 1;
        });
      } else if (data!.tumor == "Tidak Normal") {
        setState(() {
          tumor = data!.tumor!;
          _quest8 = 2;
        });
      } else if (data!.tumor == "") {
      } else {
        tumorF.text = data!.tumor!;
      }

      if (data!.lainLain == "Normal") {
        setState(() {
          lainlain = data!.lainLain!;
          _quest9 = 1;
        });
      } else if (data!.lainLain == "Tidak Normal") {
        setState(() {
          lainlain = data!.lainLain!;
          _quest9 = 2;
        });
      } else if (data!.lainLain == "") {
      } else {
        lainlainF.text = data!.lainLain!;
      }
    }
  }

  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.getString("detail1") == null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return MenuForm(idPasien: widget.idPasien!);
          }));
        } else {
          prefs.remove("detail1");
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return PasienDetail(idPasien: widget.idPasien!);
          }));
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: blueDefault,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                if (prefs.getString("detail1") == null) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MenuForm(idPasien: widget.idPasien!);
                  }));
                } else {
                  prefs.remove("detail1");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return PasienDetail(idPasien: widget.idPasien!);
                  }));
                }
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                ],
              ),
            ),
            textDefault("Keadaan Umum - Pemeriksaan Rongga Perut", Colors.white,
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
                            value: 1,
                            groupValue: _quest1,
                            onChanged: (value) {
                              setState(() {
                                _quest1 = value!;
                                inpeksiF.text = "";
                                inpeksi = "Normal";
                                print("inpeksi = $inpeksi");
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
                                inpeksiF.text = "";
                                _quest1 = value!;
                                inpeksi = "Tidak Normal";
                                print("inpeksi = $inpeksi");
                              });
                            },
                          ),
                          textDefault("Tidak Normal", Colors.black, 13,
                              FontWeight.normal),
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
                              controller: inpeksiF,
                              maxLength: 12,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ))
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
                            value: 1,
                            groupValue: _quest2,
                            onChanged: (value) {
                              setState(() {
                                auskultasiF.text = "";
                                _quest2 = value!;
                                auskultasi = "Normal";
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
                                auskultasiF.text = "";
                                _quest2 = value!;
                                auskultasi = "Tidak Normal";
                              });
                            },
                          ),
                          textDefault("Tidak Normal", Colors.black, 13,
                              FontWeight.normal),
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
                              controller: auskultasiF,
                              maxLength: 12,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textDefault("Hati", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _quest3,
                            onChanged: (value) {
                              setState(() {
                                hatiF.text = "";
                                _quest3 = value!;
                                hati = "Normal";
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
                                hatiF.text = "";
                                _quest3 = value!;
                                hati = "Tidak Normal";
                              });
                            },
                          ),
                          textDefault("Tidak Normal", Colors.black, 13,
                              FontWeight.normal),
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
                              controller: hatiF,
                              maxLength: 12,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textDefault("Limpa", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _quest4,
                            onChanged: (value) {
                              setState(() {
                                limpaF.text = "";
                                _quest4 = value!;
                                limpa = "Normal";
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
                                limpaF.text = "";
                                _quest4 = value!;
                                limpa = "Tidak Normal";
                              });
                            },
                          ),
                          textDefault("Tidak Normal", Colors.black, 13,
                              FontWeight.normal),
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
                              controller: limpaF,
                              maxLength: 12,
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
                          "Ginjal Kiri", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _quest5,
                            onChanged: (value) {
                              setState(() {
                                ginjalKiriF.text = "";
                                _quest5 = value!;
                                ginjalKiri = "Normal";
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
                                ginjalKiriF.text = "";
                                _quest5 = value!;
                                ginjalKiri = "Tidak Normal";
                              });
                            },
                          ),
                          textDefault("Tidak Normal", Colors.black, 13,
                              FontWeight.normal),
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
                              controller: ginjalKiriF,
                              maxLength: 12,
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
                            value: 1,
                            groupValue: _quest6,
                            onChanged: (value) {
                              setState(() {
                                ginjalKananF.text = "";
                                _quest6 = value!;
                                ginjalKanan = "Normal";
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
                                ginjalKananF.text = "";
                                _quest6 = value!;
                                ginjalKanan = "Tidak Normal";
                              });
                            },
                          ),
                          textDefault("Tidak Normal", Colors.black, 13,
                              FontWeight.normal),
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
                              controller: ginjalKananF,
                              maxLength: 12,
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
                            value: 1,
                            groupValue: _quest7,
                            onChanged: (value) {
                              setState(() {
                                herniaF.text = "";
                                _quest7 = value!;
                                hernia = "Normal";
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
                                herniaF.text = "";
                                _quest7 = value!;
                                hernia = "Tidak Normal";
                              });
                            },
                          ),
                          textDefault("Tidak Normal", Colors.black, 13,
                              FontWeight.normal),
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
                              controller: herniaF,
                              maxLength: 12,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textDefault("Tumor", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _quest8,
                            onChanged: (value) {
                              setState(() {
                                tumorF.text = "";
                                _quest8 = value!;
                                tumor = "Normal";
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
                                tumorF.text = "";
                                _quest8 = value!;
                                tumor = "Tidak Normal";
                              });
                            },
                          ),
                          textDefault("Tidak Normal", Colors.black, 13,
                              FontWeight.normal),
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
                              controller: tumorF,
                              maxLength: 12,
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
                          "Lain-Lain", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _quest9,
                            onChanged: (value) {
                              setState(() {
                                lainlainF.text = "";
                                _quest9 = value!;
                                lainlain = "Normal";
                              });
                            },
                          ),
                          textDefault(
                              "Normal", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: 2,
                            groupValue: _quest9,
                            onChanged: (value) {
                              setState(() {
                                lainlainF.text = "";
                                _quest9 = value!;
                                lainlain = "Tidak Normal";
                              });
                            },
                          ),
                          textDefault("Tidak Normal", Colors.black, 13,
                              FontWeight.normal),
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
                              controller: lainlainF,
                              maxLength: 12,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ))
                        ],
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
    inpeksi = inpeksiF.text != "" ? inpeksiF.text : inpeksi;
    auskultasi = auskultasiF.text != "" ? auskultasiF.text : auskultasi;
    hati = hatiF.text != "" ? hatiF.text : hati;
    limpa = limpaF.text != "" ? limpaF.text : limpa;
    ginjalKiri = ginjalKiriF.text != "" ? ginjalKiriF.text : ginjalKiri;
    ginjalKanan = ginjalKananF.text != "" ? ginjalKananF.text : ginjalKanan;
    hernia = herniaF.text != "" ? herniaF.text : hernia;
    tumor = tumorF.text != "" ? tumorF.text : tumor;
    lainlain = lainlainF.text != "" ? lainlainF.text : lainlain;

    PemeriksaanRonggaPerutModel data = PemeriksaanRonggaPerutModel(
      inspeksi: inpeksi,
      perkusi: perkusi.text,
      auskultasi: auskultasi,
      hati: hati,
      limpa: limpa,
      ginjalKiri: ginjalKiri,
      ballotementKiri: ballotementKiri.text,
      ginjalKanan: ginjalKanan,
      ballotementKanan: ballotementKanan.text,
      hernia: hernia,
      tumor: tumor,
      lainLain: lainlain,
    );

    firestore.setPemeriksaanRonggaPerut(
        pemeriksaanRonggaPerut: data, idPasien: widget.idPasien!);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("detail1") == null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MenuForm(idPasien: widget.idPasien!);
      }));
    } else {
      prefs.remove("detail1");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return PasienDetail(idPasien: widget.idPasien!);
      }));
    }
  }
}
