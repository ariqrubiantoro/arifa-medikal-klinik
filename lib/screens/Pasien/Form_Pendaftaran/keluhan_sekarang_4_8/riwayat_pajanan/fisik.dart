// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/fisik_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/riwayat_pajanan/kimia.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak }

class Fisik extends StatefulWidget {
  const Fisik({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<Fisik> createState() => _FisikState();
}

class _FisikState extends State<Fisik> {
  Question _quest1 = Question.tidak;
  Question _quest2 = Question.tidak;
  Question _quest3 = Question.tidak;
  Question _quest4 = Question.tidak;
  Question _quest5 = Question.tidak;
  Question _quest6 = Question.tidak;
  Question _quest7 = Question.tidak;
  Question _quest8 = Question.tidak;

  String kebisingan = "Tidak";
  String suhuPanas = "Tidak";
  String suhuDingin = "Tidak";
  String radiasiBukanPengion = "Tidak";
  String radiasiPengion = "Tidak";
  String getaranLokal = "Tidak";
  String getaranTubuh = "Tidak";
  String ketinggian = "Tidak";

  final lainlain = TextEditingController();

  FirebaseFirestoreService firestore = FirebaseFirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blueDefault,
          title: textDefault(
              "Riwayat Pajanan - Fisik", Colors.white, 16, FontWeight.bold)),
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
                  textDefault("Kebisingan", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest1,
                        onChanged: (value) {
                          setState(() {
                            _quest1 = value!;
                            kebisingan = "Ya";
                          });
                        },
                      ),
                      textDefault("Ya", Colors.black, 14, FontWeight.normal),
                      Radio(
                        value: Question.tidak,
                        groupValue: _quest1,
                        onChanged: (value) {
                          setState(() {
                            _quest1 = value!;
                            kebisingan = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 14, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Suhu Panas", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest2,
                        onChanged: (value) {
                          setState(() {
                            _quest2 = value!;
                            suhuPanas = "Ya";
                          });
                        },
                      ),
                      textDefault("Ya", Colors.black, 14, FontWeight.normal),
                      Radio(
                        value: Question.tidak,
                        groupValue: _quest2,
                        onChanged: (value) {
                          setState(() {
                            _quest2 = value!;
                            suhuPanas = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 14, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Suhu Dingin", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest3,
                        onChanged: (value) {
                          setState(() {
                            _quest3 = value!;
                            suhuDingin = "Ya";
                          });
                        },
                      ),
                      textDefault("Ya", Colors.black, 14, FontWeight.normal),
                      Radio(
                        value: Question.tidak,
                        groupValue: _quest3,
                        onChanged: (value) {
                          setState(() {
                            _quest3 = value!;
                            suhuDingin = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 14, FontWeight.normal),
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
                          });
                        },
                      ),
                      textDefault("Ya", Colors.black, 14, FontWeight.normal),
                      Radio(
                        value: Question.tidak,
                        groupValue: _quest4,
                        onChanged: (value) {
                          setState(() {
                            _quest4 = value!;
                            radiasiBukanPengion = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 14, FontWeight.normal),
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
                          });
                        },
                      ),
                      textDefault("Ya", Colors.black, 14, FontWeight.normal),
                      Radio(
                        value: Question.tidak,
                        groupValue: _quest5,
                        onChanged: (value) {
                          setState(() {
                            _quest5 = value!;
                            radiasiPengion = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 14, FontWeight.normal),
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
                          });
                        },
                      ),
                      textDefault("Ya", Colors.black, 14, FontWeight.normal),
                      Radio(
                        value: Question.tidak,
                        groupValue: _quest6,
                        onChanged: (value) {
                          setState(() {
                            _quest6 = value!;
                            getaranLokal = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 14, FontWeight.normal),
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
                          });
                        },
                      ),
                      textDefault("Ya", Colors.black, 14, FontWeight.normal),
                      Radio(
                        value: Question.tidak,
                        groupValue: _quest7,
                        onChanged: (value) {
                          setState(() {
                            _quest7 = value!;
                            getaranTubuh = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 14, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Ketinggian", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest8,
                        onChanged: (value) {
                          setState(() {
                            _quest8 = value!;
                            ketinggian = "Ya";
                          });
                        },
                      ),
                      textDefault("Ya", Colors.black, 14, FontWeight.normal),
                      Radio(
                        value: Question.tidak,
                        groupValue: _quest8,
                        onChanged: (value) {
                          setState(() {
                            _quest8 = value!;
                            ketinggian = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 14, FontWeight.normal),
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
                        decoration: InputDecoration(border: InputBorder.none)),
                  )
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
                  //   return Kimia();
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
    FisikModel data = FisikModel(
      kebisingan: kebisingan,
      suhuPanas: suhuPanas,
      suhuDingin: suhuDingin,
      radiasiBukanPengion: radiasiBukanPengion,
      radiasiPengion: radiasiPengion,
      getaranLokal: getaranLokal,
      getaranSeluruhTubuh: getaranTubuh,
      ketinggian: ketinggian,
      lainLain: lainlain.text,
    );

    firestore.setFisik(fisik: data, idPasien: widget.idPasien!);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Kimia(
        pasienId: widget.idPasien,
      );
    }));
  }
}
