// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/fisik_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/riwayat_pajanan/kimia.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak, none }

class Fisik extends StatefulWidget {
  const Fisik({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<Fisik> createState() => _FisikState();
}

class _FisikState extends State<Fisik> {
  Question _quest1 = Question.none;
  Question _quest2 = Question.none;
  Question _quest3 = Question.none;
  Question _quest4 = Question.none;
  Question _quest5 = Question.none;
  Question _quest6 = Question.none;
  Question _quest7 = Question.none;
  Question _quest8 = Question.none;

  String kebisingan = "";
  String suhuPanas = "";
  String suhuDingin = "";
  String radiasiBukanPengion = "";
  String radiasiPengion = "";
  String getaranLokal = "";
  String getaranTubuh = "";
  String ketinggian = "";

  TextEditingController kebisinganController = TextEditingController();
  TextEditingController suhuPanasController = TextEditingController();
  TextEditingController suhuDinginController = TextEditingController();
  TextEditingController radiasiBukanPengionController = TextEditingController();
  TextEditingController radiasiPengionController = TextEditingController();
  TextEditingController getaranLokalController = TextEditingController();
  TextEditingController getaranTubuhController = TextEditingController();
  TextEditingController ketinggianController = TextEditingController();

  final lainlain = TextEditingController();

  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  FisikModel? data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    data = await firestore.getFisik(widget.idPasien!);
    if (data != null) {
      setState(() {
        lainlain.text = data!.lainLain!;
      });
      if (data!.kebisingan == "Ya") {
        setState(() {
          kebisingan = data!.kebisingan!;
          _quest1 = Question.ya;
        });
      } else if (data!.kebisingan == "Tidak") {
        setState(() {
          kebisingan = data!.kebisingan!;
          _quest1 = Question.tidak;
        });
      } else if (data!.kebisingan == "") {
      } else {
        kebisinganController.text = data!.kebisingan!;
      }

      if (data!.suhuPanas == "Ya") {
        setState(() {
          suhuPanas = data!.suhuPanas!;
          _quest2 = Question.ya;
        });
      } else if (data!.suhuPanas == "Tidak") {
        setState(() {
          suhuPanas = data!.suhuPanas!;
          _quest2 = Question.tidak;
        });
      } else if (data!.suhuPanas == "") {
      } else {
        suhuPanasController.text = data!.suhuPanas!;
      }

      if (data!.suhuDingin == "Ya") {
        setState(() {
          suhuDingin = data!.suhuDingin!;
          _quest3 = Question.ya;
        });
      } else if (data!.suhuDingin == "Tidak") {
        setState(() {
          suhuDingin = data!.suhuDingin!;
          _quest3 = Question.tidak;
        });
      } else if (data!.suhuDingin == "") {
      } else {
        suhuDinginController.text = data!.suhuDingin!;
      }

      if (data!.radiasiBukanPengion == "Ya") {
        setState(() {
          radiasiBukanPengion = data!.radiasiBukanPengion!;
          _quest4 = Question.ya;
        });
      } else if (data!.radiasiBukanPengion == "Tidak") {
        setState(() {
          radiasiBukanPengion = data!.radiasiBukanPengion!;
          _quest4 = Question.tidak;
        });
      } else if (data!.radiasiBukanPengion == "") {
      } else {
        radiasiBukanPengionController.text = data!.radiasiBukanPengion!;
      }

      if (data!.radiasiPengion == "Ya") {
        setState(() {
          radiasiPengion = data!.radiasiPengion!;
          _quest5 = Question.ya;
        });
      } else if (data!.radiasiPengion == "Tidak") {
        setState(() {
          radiasiPengion = data!.radiasiPengion!;
          _quest5 = Question.tidak;
        });
      } else if (data!.radiasiPengion == "") {
      } else {
        radiasiPengionController.text = data!.radiasiPengion!;
      }

      if (data!.getaranLokal == "Ya") {
        setState(() {
          getaranLokal = data!.getaranLokal!;
          _quest6 = Question.ya;
        });
      } else if (data!.getaranLokal == "Tidak") {
        setState(() {
          getaranLokal = data!.getaranLokal!;
          _quest6 = Question.tidak;
        });
      } else if (data!.getaranLokal == "") {
      } else {
        getaranLokalController.text = data!.getaranLokal!;
      }

      if (data!.getaranSeluruhTubuh == "Ya") {
        setState(() {
          getaranTubuh = data!.getaranSeluruhTubuh!;
          _quest7 = Question.ya;
        });
      } else if (data!.getaranSeluruhTubuh == "Tidak") {
        setState(() {
          getaranTubuh = data!.getaranSeluruhTubuh!;
          _quest7 = Question.tidak;
        });
      } else if (data!.getaranSeluruhTubuh == "") {
      } else {
        getaranTubuhController.text = data!.getaranSeluruhTubuh!;
      }

      if (data!.ketinggian == "Ya") {
        setState(() {
          ketinggian = data!.ketinggian!;
          _quest8 = Question.ya;
        });
      } else if (data!.ketinggian == "Tidak") {
        setState(() {
          ketinggian = data!.ketinggian!;
          _quest8 = Question.tidak;
        });
      } else if (data!.ketinggian == "") {
      } else {
        ketinggianController.text = data!.ketinggian!;
      }
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
                 
            textDefault(
                "Riwayat Pajanan - Fisik", Colors.white, 16, FontWeight.bold),
                  SizedBox(
                    width: 5,
                  ),
                ]),),
            
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
                        "Kebisingan", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest1,
                          onChanged: (value) {
                            setState(() {
                              _quest1 = value!;
                              kebisingan = "Ya";
                              kebisinganController.text = "";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest1,
                          onChanged: (value) {
                            setState(() {
                              _quest1 = value!;
                              kebisingan = "Tidak";
                              kebisinganController.text = "";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak", Colors.black, 13, FontWeight.normal),
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
                                  _quest1 = Question.none;
                                });
                              },
                              controller: kebisinganController,
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
                        "Suhu Panas", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              _quest2 = value!;
                              suhuPanas = "Ya";
                              suhuPanasController.text = "";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              _quest2 = value!;
                              suhuPanas = "Tidak";
                              suhuPanasController.text = "";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak", Colors.black, 13, FontWeight.normal),
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
                                  _quest2 = Question.none;
                                });
                              },
                              controller: suhuPanasController,
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
                        "Suhu Dingin", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              suhuDingin = "Ya";
                              suhuDinginController.text = "";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              suhuDingin = "Tidak";
                              suhuDinginController.text = "";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak", Colors.black, 13, FontWeight.normal),
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
                                  _quest3 = Question.none;
                                });
                              },
                              controller: suhuDinginController,
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
                        "Radiasi Bukan Pengion(Gel Mikro, Infrared,Medan Listrik, dll))",
                        Colors.black,
                        14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              _quest4 = value!;
                              radiasiBukanPengion = "Ya";
                              radiasiBukanPengionController.text = "";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              _quest4 = value!;
                              radiasiBukanPengion = "Tidak";
                              radiasiBukanPengionController.text = "";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak", Colors.black, 13, FontWeight.normal),
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
                                  _quest4 = Question.none;
                                });
                              },
                              controller: radiasiBukanPengionController,
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
                    textDefault("Radiasi Pengion (Sinar X, Gamma, dll)",
                        Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              _quest5 = value!;
                              radiasiPengion = "Ya";
                              radiasiPengionController.text = "";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              _quest5 = value!;
                              radiasiPengion = "Tidak";
                              radiasiPengionController.text = "";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak", Colors.black, 13, FontWeight.normal),
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
                                  _quest5 = Question.none;
                                });
                              },
                              controller: radiasiPengionController,
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
                        "Getaran Lokal", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              _quest6 = value!;
                              getaranLokal = "Ya";
                              getaranLokalController.text = "";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              _quest6 = value!;
                              getaranLokal = "Tidak";
                              getaranLokalController.text = "";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak", Colors.black, 13, FontWeight.normal),
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
                                  _quest6 = Question.none;
                                });
                              },
                              controller: getaranLokalController,
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
                    textDefault("Getaran Seluruh Tubuh", Colors.black, 14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              _quest7 = value!;
                              getaranTubuh = "Ya";
                              getaranTubuhController.text = "";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              _quest7 = value!;
                              getaranTubuh = "Tidak";
                              getaranTubuhController.text = "";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak", Colors.black, 13, FontWeight.normal),
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
                                  _quest7 = Question.none;
                                });
                              },
                              controller: getaranTubuhController,
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
                        "Ketinggian", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest8,
                          onChanged: (value) {
                            setState(() {
                              _quest8 = value!;
                              ketinggian = "Ya";
                              ketinggianController.text = "";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest8,
                          onChanged: (value) {
                            setState(() {
                              _quest8 = value!;
                              ketinggian = "Tidak";
                              ketinggianController.text = "";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak", Colors.black, 13, FontWeight.normal),
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
                                  _quest8 = Question.none;
                                });
                              },
                              controller: ketinggianController,
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
                    textDefault("Lain-Lain", Colors.black, 14, FontWeight.bold),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                          controller: lainlain,
                          decoration:
                              InputDecoration(border: InputBorder.none)),
                    )
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
    FisikModel data = FisikModel(
      kebisingan: kebisinganController.text != ""
          ? kebisinganController.text
          : kebisingan,
      suhuPanas:
          suhuPanasController.text != "" ? suhuPanasController.text : suhuPanas,
      suhuDingin: suhuDinginController.text != ""
          ? suhuDinginController.text
          : suhuDingin,
      radiasiBukanPengion: radiasiBukanPengionController.text != ""
          ? radiasiBukanPengionController.text
          : radiasiBukanPengion,
      radiasiPengion: radiasiPengionController.text != ""
          ? radiasiPengionController.text
          : radiasiPengion,
      getaranLokal: getaranLokalController.text != ""
          ? getaranLokalController.text
          : getaranLokal,
      getaranSeluruhTubuh: getaranTubuhController.text != ""
          ? getaranTubuhController.text
          : getaranTubuh,
      ketinggian: ketinggianController.text != ""
          ? ketinggianController.text
          : ketinggian,
      lainLain: lainlain.text,
    );

    firestore.setFisik(fisik: data, idPasien: widget.idPasien!);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MenuForm(idPasien: widget.idPasien!);
    }));
  }
}
