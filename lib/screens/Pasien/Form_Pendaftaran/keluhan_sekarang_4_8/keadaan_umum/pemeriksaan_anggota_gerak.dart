// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/pemeriksaan_anggota_gerak_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_refleks.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/pasien_detail.dart';
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
  PemeriksaanAnggotaGerakModel? data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    data = await firestore.getPemeriksaanAnggotaGerak(widget.idPasien!);
    if (data != null) {
      if (data!.atasKanan == "Normal") {
        setState(() {
          atasKanan = data!.atasKanan!;
          _quest1 = 1;
        });
      } else if (data!.atasKanan == "Tidak Normal") {
        setState(() {
          atasKanan = data!.atasKanan!;
          _quest1 = 2;
        });
      } else if (data!.atasKanan == "") {
      } else {
        atasKananF.text = data!.atasKanan!;
      }

      if (data!.atasKiri == "Normal") {
        setState(() {
          atasKiri = data!.atasKiri!;
          _quest2 = 1;
        });
      } else if (data!.atasKiri == "Tidak Normal") {
        setState(() {
          atasKiri = data!.atasKiri!;
          _quest2 = 2;
        });
      } else if (data!.atasKiri == "") {
      } else {
        atasKiriF.text = data!.atasKiri!;
      }

      if (data!.bawahKanan == "Normal") {
        setState(() {
          bawahKanan = data!.bawahKanan!;
          _quest3 = 1;
        });
      } else if (data!.bawahKanan == "Tidak Normal") {
        setState(() {
          bawahKanan = data!.bawahKanan!;
          _quest3 = 2;
        });
      } else if (data!.bawahKanan == "") {
      } else {
        bawahKananF.text = data!.bawahKanan!;
      }

      if (data!.bawahKiri == "Normal") {
        setState(() {
          bawahKiri = data!.bawahKiri!;
          _quest4 = 1;
        });
      } else if (data!.bawahKiri == "Tidak Normal") {
        setState(() {
          bawahKiri = data!.bawahKiri!;
          _quest4 = 2;
        });
      } else if (data!.bawahKiri == "") {
      } else {
        bawahKiriF.text = data!.bawahKiri!;
      }

      if (data!.sembabOedemKanan == "Normal") {
        setState(() {
          sembabKanan = data!.sembabOedemKanan!;
          _quest5 = 1;
        });
      } else if (data!.sembabOedemKanan == "Tidak Normal") {
        setState(() {
          sembabKanan = data!.sembabOedemKanan!;
          _quest5 = 2;
        });
      } else if (data!.sembabOedemKanan == "") {
      } else {
        sembabKananF.text = data!.sembabOedemKanan!;
      }

      if (data!.sembabOedemKiri == "Normal") {
        setState(() {
          sembabKiri = data!.sembabOedemKiri!;
          _quest6 = 1;
        });
      } else if (data!.sembabOedemKiri == "Tidak Normal") {
        setState(() {
          sembabKiri = data!.sembabOedemKiri!;
          _quest6 = 2;
        });
      } else if (data!.sembabOedemKiri == "") {
      } else {
        sembabKiriF.text = data!.sembabOedemKiri!;
      }

      if (data!.cacatKanan == "Normal") {
        setState(() {
          cacatKanan = data!.cacatKanan!;
          _quest7 = 1;
        });
      } else if (data!.cacatKanan == "Tidak Normal") {
        setState(() {
          cacatKanan = data!.cacatKanan!;
          _quest7 = 2;
        });
      } else if (data!.cacatKanan == "") {
      } else {
        cacatKananF.text = data!.cacatKanan!;
      }

      if (data!.cacatKiri == "Normal") {
        setState(() {
          cacatKiri = data!.cacatKiri!;
          _quest8 = 1;
        });
      } else if (data!.cacatKiri == "Tidak Normal") {
        setState(() {
          cacatKiri = data!.cacatKiri!;
          _quest8 = 2;
        });
      } else if (data!.cacatKiri == "") {
      } else {
        cacatKiriF.text = data!.cacatKiri!;
      }
    }
  }

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
            textDefault("Keadaan Umum - Pemeriksaan Anggota Gerak",
                Colors.white, 16, FontWeight.bold),
            SizedBox(
              width: 5,
            ),
          ]),
        ),
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
                    textDefault(
                        "Atas Kanan", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest1,
                          onChanged: (value) {
                            setState(() {
                              atasKananF.text = "";
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
                              atasKananF.text = "";
                              _quest1 = value!;
                              atasKanan = "Tidak Normal";
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
                            controller: atasKananF,
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
                    textDefault("Atas Kiri", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              atasKiriF.text = "";
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
                              atasKiriF.text = "";
                              _quest2 = value!;
                              atasKiri = "Tidak Normal";
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
                            controller: atasKiriF,
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
                        "Bawah Kanan", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              bawahKananF.text = "";
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
                              bawahKananF.text = "";
                              _quest3 = value!;
                              bawahKanan = "Tidak Normal";
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
                            controller: bawahKananF,
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
                        "Bawah Kiri", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              bawahKiriF.text = "";
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
                              bawahKiriF.text = "";
                              _quest4 = value!;
                              bawahKiri = "Tidak Normal";
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
                            controller: bawahKiriF,
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
                    textDefault("Sembab/Oedem Kanan", Colors.black, 14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              sembabKananF.text = "";
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
                              sembabKananF.text = "";
                              _quest5 = value!;
                              sembabKanan = "Tidak Normal";
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
                            controller: sembabKananF,
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
                        "Sembab/Oedem Kiri", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              sembabKiriF.text = "";
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
                              sembabKiriF.text = "";
                              _quest6 = value!;
                              sembabKiri = "Tidak Normal";
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
                            controller: sembabKiriF,
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
                        "Cacat Kanan", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              cacatKananF.text = "";
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
                              cacatKananF.text = "";
                              _quest7 = value!;
                              cacatKanan = "Tidak Normal";
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
                            controller: cacatKananF,
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
                        "Cacat Kiri", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest8,
                          onChanged: (value) {
                            setState(() {
                              cacatKiriF.text = "";
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
                              cacatKiriF.text = "";
                              _quest8 = value!;
                              cacatKiri = "Tidak Normal";
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
                            controller: cacatKiriF,
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
                  ],
                ),
              ),
            )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
                child: InkWell(
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
                          "Simpan", Colors.white, 16, FontWeight.normal),
                    ),
                  ),
                ))
          ],
        ),
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
