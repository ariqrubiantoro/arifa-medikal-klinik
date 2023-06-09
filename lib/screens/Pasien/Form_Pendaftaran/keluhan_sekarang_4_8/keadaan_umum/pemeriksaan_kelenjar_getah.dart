// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/pemeriksaan_kelenjar_getah_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/riwayat_pajanan/fisik.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/pasien_detail.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';
import '../../../Menu_Form/menu_form.dart';

enum Question { ya, tidak }

class PemeriksaanKelenjarGetah extends StatefulWidget {
  const PemeriksaanKelenjarGetah({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<PemeriksaanKelenjarGetah> createState() =>
      _PemeriksaanKelenjarGetahState();
}

class _PemeriksaanKelenjarGetahState extends State<PemeriksaanKelenjarGetah> {
  int _quest1 = 1;
  int _quest2 = 1;
  int _quest3 = 1;
  int _quest4 = 1;
  int _quest5 = 1;
  int _quest6 = 1;
  int _quest7 = 1;
  int _quest8 = 1;
  int _quest9 = 1;
  int _quest10 = 1;

  String cervicalKiri = "Normal";
  String cervicalKanan = "Normal";
  String axilaKiri = "Normal";
  String axilaKanan = "Normal";
  String supraKiri = "Normal";
  String supraKanan = "Normal";
  String infraKiri = "Normal";
  String infraKanan = "Normal";
  String inguinalKiri = "Normal";
  String inguinalKanan = "Normal";

  final cervicalKiriF = TextEditingController();
  final cervicalKananF = TextEditingController();
  final axilaKiriF = TextEditingController();
  final axilaKananF = TextEditingController();
  final supraKiriF = TextEditingController();
  final supraKananF = TextEditingController();
  final infraKiriF = TextEditingController();
  final infraKananF = TextEditingController();
  final inguinalKiriF = TextEditingController();
  final inguinalKananF = TextEditingController();

  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  PemeriksaanKelenjarGetahModel? data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    data = await firestore.getPemeriksaanKelenjarGetah(widget.idPasien!);
    if (data != null) {
      if (data!.cervicalKiri == "Normal") {
        setState(() {
          cervicalKiri = data!.cervicalKiri!;
          _quest1 = 1;
        });
      } else if (data!.cervicalKiri == "Tidak Normal") {
        setState(() {
          cervicalKiri = data!.cervicalKiri!;
          _quest1 = 2;
        });
      } else if (data!.cervicalKiri == "") {
      } else {
        cervicalKiriF.text = data!.cervicalKiri!;
      }

      if (data!.cervicalKanan == "Normal") {
        setState(() {
          cervicalKanan = data!.cervicalKanan!;
          _quest2 = 1;
        });
      } else if (data!.cervicalKanan == "Tidak Normal") {
        setState(() {
          cervicalKanan = data!.cervicalKanan!;
          _quest2 = 2;
        });
      } else if (data!.cervicalKanan == "") {
      } else {
        cervicalKananF.text = data!.cervicalKanan!;
      }

      if (data!.axilaKiri == "Normal") {
        setState(() {
          axilaKiri = data!.axilaKiri!;
          _quest3 = 1;
        });
      } else if (data!.axilaKiri == "Tidak Normal") {
        setState(() {
          axilaKiri = data!.axilaKiri!;
          _quest3 = 2;
        });
      } else if (data!.axilaKiri == "") {
      } else {
        axilaKiriF.text = data!.axilaKiri!;
      }

      if (data!.axilaKanan == "Normal") {
        setState(() {
          axilaKanan = data!.axilaKanan!;
          _quest4 = 1;
        });
      } else if (data!.axilaKanan == "Tidak Normal") {
        setState(() {
          axilaKanan = data!.axilaKanan!;
          _quest4 = 2;
        });
      } else if (data!.axilaKanan == "") {
      } else {
        axilaKananF.text = data!.axilaKanan!;
      }

      if (data!.supraclaviculaKiri == "Normal") {
        setState(() {
          supraKiri = data!.supraclaviculaKiri!;
          _quest5 = 1;
        });
      } else if (data!.supraclaviculaKiri == "Tidak Normal") {
        setState(() {
          supraKiri = data!.supraclaviculaKiri!;
          _quest5 = 2;
        });
      } else if (data!.supraclaviculaKiri == "") {
      } else {
        supraKiriF.text = data!.supraclaviculaKiri!;
      }

      if (data!.supraclaviculaKanan == "Normal") {
        setState(() {
          supraKanan = data!.supraclaviculaKanan!;
          _quest6 = 1;
        });
      } else if (data!.supraclaviculaKanan == "Tidak Normal") {
        setState(() {
          supraKanan = data!.supraclaviculaKanan!;
          _quest6 = 2;
        });
      } else if (data!.supraclaviculaKanan == "") {
      } else {
        supraKananF.text = data!.supraclaviculaKanan!;
      }

      if (data!.infraclaviculaKiri == "Normal") {
        setState(() {
          infraKiri = data!.infraclaviculaKiri!;
          _quest7 = 1;
        });
      } else if (data!.infraclaviculaKiri == "Tidak Normal") {
        setState(() {
          infraKiri = data!.infraclaviculaKiri!;
          _quest7 = 2;
        });
      } else if (data!.infraclaviculaKiri == "") {
      } else {
        infraKiriF.text = data!.infraclaviculaKiri!;
      }

      if (data!.infraclaviculaKanan == "Normal") {
        setState(() {
          infraKanan = data!.infraclaviculaKanan!;
          _quest8 = 1;
        });
      } else if (data!.infraclaviculaKanan == "Tidak Normal") {
        setState(() {
          infraKanan = data!.infraclaviculaKanan!;
          _quest8 = 2;
        });
      } else if (data!.infraclaviculaKanan == "") {
      } else {
        infraKananF.text = data!.infraclaviculaKanan!;
      }

      if (data!.inguinalKiri == "Normal") {
        setState(() {
          inguinalKiri = data!.inguinalKiri!;
          _quest9 = 1;
        });
      } else if (data!.inguinalKiri == "Tidak Normal") {
        setState(() {
          inguinalKiri = data!.inguinalKiri!;
          _quest9 = 2;
        });
      } else if (data!.inguinalKiri == "") {
      } else {
        inguinalKiriF.text = data!.inguinalKiri!;
      }

      if (data!.inguinalKanan == "Normal") {
        setState(() {
          inguinalKanan = data!.inguinalKanan!;
          _quest10 = 1;
        });
      } else if (data!.inguinalKanan == "Tidak Normal") {
        setState(() {
          inguinalKanan = data!.inguinalKanan!;
          _quest10 = 2;
        });
      } else if (data!.inguinalKanan == "") {
      } else {
        inguinalKananF.text = data!.inguinalKanan!;
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
            textDefault("Keadaan Umum - Pemeriksaan Kelenjar Getah Bening",
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
                        "Cervical Kiri", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest1,
                          onChanged: (value) {
                            setState(() {
                              cervicalKiriF.text = "";
                              _quest1 = value!;
                              cervicalKiri = "Normal";
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
                              cervicalKiriF.text = "";
                              _quest1 = value!;
                              cervicalKiri = "Tidak Normal";
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
                              controller: cervicalKiriF,
                              maxLength: 12,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault(
                        "Cervical Kanan", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              cervicalKananF.text = "";
                              _quest2 = value!;
                              cervicalKanan = "Normal";
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
                              cervicalKananF.text = "";
                              _quest2 = value!;
                              cervicalKanan = "Tidak Normal";
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
                            controller: cervicalKananF,
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
                        "Axila Kiri", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              axilaKiriF.text = "";
                              _quest3 = value!;
                              axilaKiri = "Normal";
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
                              axilaKiriF.text = "";
                              _quest3 = value!;
                              axilaKiri = "Tidak Normal";
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
                            controller: axilaKiriF,
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
                        "Axila Kanan", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              axilaKananF.text = "";
                              _quest4 = value!;
                              axilaKanan = "Normal";
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
                              axilaKananF.text = "";
                              _quest4 = value!;
                              axilaKanan = "Tidak Normal";
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
                            controller: axilaKananF,
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
                    textDefault("Supra Clavicula Kiri", Colors.black, 14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              supraKiriF.text = "";
                              _quest5 = value!;
                              supraKiri = "Normal";
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
                              supraKiriF.text = "";
                              _quest5 = value!;
                              supraKiri = "Tidak Normal";
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
                            controller: supraKiriF,
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
                    textDefault("Supra Clavicula Kanan", Colors.black, 14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              supraKananF.text = "";
                              _quest6 = value!;
                              supraKanan = "Normal";
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
                              supraKananF.text = "";
                              _quest6 = value!;
                              supraKanan = "Tidak Normal";
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
                            controller: supraKananF,
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
                    textDefault("Infra Clavicula Kiri", Colors.black, 14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              infraKiriF.text = "";
                              _quest7 = value!;
                              infraKiri = "Normal";
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
                              infraKiriF.text = "";
                              _quest7 = value!;
                              infraKiri = "Tidak Normal";
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
                            controller: infraKiriF,
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
                    textDefault("Infra Clavicula Kanan", Colors.black, 14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest8,
                          onChanged: (value) {
                            setState(() {
                              infraKananF.text = "";
                              _quest8 = value!;
                              infraKanan = "Normal";
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
                              infraKananF.text = "";
                              _quest8 = value!;
                              infraKanan = "Tidak Normal";
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
                            controller: infraKananF,
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
                        "Inguinal Kiri", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest9,
                          onChanged: (value) {
                            setState(() {
                              inguinalKiriF.text = "";
                              _quest9 = value!;
                              inguinalKiri = "Normal";
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
                              inguinalKiriF.text = "";
                              _quest9 = value!;
                              inguinalKiri = "Tidak Normal";
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
                            controller: inguinalKiriF,
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
                        "Inguinal Kanan", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest10,
                          onChanged: (value) {
                            setState(() {
                              inguinalKananF.text = "";
                              _quest10 = value!;
                              inguinalKanan = "Normal";
                            });
                          },
                        ),
                        textDefault(
                            "Normal", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _quest10,
                          onChanged: (value) {
                            setState(() {
                              inguinalKananF.text = "";
                              _quest10 = value!;
                              inguinalKanan = "Tidak Normal";
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
                                _quest10 = 0;
                              });
                            },
                            controller: inguinalKananF,
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
    cervicalKiri = cervicalKiriF.text != "" ? cervicalKiriF.text : cervicalKiri;
    cervicalKanan =
        cervicalKananF.text != "" ? cervicalKananF.text : cervicalKanan;
    axilaKiri = axilaKiriF.text != "" ? axilaKiriF.text : axilaKiri;
    axilaKanan = axilaKananF.text != "" ? axilaKananF.text : axilaKanan;
    supraKiri = supraKiriF.text != "" ? supraKiriF.text : supraKiri;
    supraKanan = supraKananF.text != "" ? supraKananF.text : supraKanan;
    infraKiri = infraKiriF.text != "" ? infraKiriF.text : infraKiri;
    infraKanan = infraKananF.text != "" ? infraKananF.text : infraKanan;
    inguinalKiri = inguinalKiriF.text != "" ? inguinalKiriF.text : inguinalKiri;
    inguinalKanan =
        inguinalKananF.text != "" ? inguinalKananF.text : inguinalKanan;

    PemeriksaanKelenjarGetahModel data = PemeriksaanKelenjarGetahModel(
      cervicalKanan: cervicalKanan,
      cervicalKiri: cervicalKiri,
      axilaKiri: axilaKiri,
      axilaKanan: axilaKanan,
      supraclaviculaKiri: supraKiri,
      supraclaviculaKanan: supraKanan,
      infraclaviculaKiri: infraKiri,
      infraclaviculaKanan: infraKanan,
      inguinalKiri: inguinalKiri,
      inguinalKanan: inguinalKanan,
    );

    firestore.setPemeriksaanKelenjarGetah(
        pemeriksaanKelenjarGetah: data, idPasien: widget.idPasien!);

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
