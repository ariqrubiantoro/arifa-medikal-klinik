// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/pemeriksaan_5_8.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak }

class Ergonomis extends StatefulWidget {
  const Ergonomis({super.key});

  @override
  State<Ergonomis> createState() => _ErgonomisState();
}

class _ErgonomisState extends State<Ergonomis> {
  Question _quest1 = Question.tidak;
  Question _quest2 = Question.tidak;
  Question _quest3 = Question.tidak;
  Question _quest4 = Question.tidak;
  Question _quest5 = Question.tidak;
  Question _quest6 = Question.tidak;
  Question _quest7 = Question.tidak;

  String gerakanBerulang = "";
  String angkatAngkutBerat = "";
  String dudukLama = "";
  String berdiriLama = "";
  String posisiTubuh = "";
  String pencahayaan = "";
  String bekerjaDenganLayar = "";

  final lainlain = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blueDefault,
          title: textDefault("Riwayat Pajanan - Ergonomis", Colors.white, 16,
              FontWeight.bold)),
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
                    textDefault("Gerakan Berulang dengan Tangan", Colors.black,
                        14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest1,
                          onChanged: (value) {
                            setState(() {
                              _quest1 = value!;
                              gerakanBerulang = "Ya";
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
                              gerakanBerulang = "Tidak";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak", Colors.black, 14, FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Angkat/Angkut Berat", Colors.black, 14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              _quest2 = value!;
                              angkatAngkutBerat = "Ya";
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
                              angkatAngkutBerat = "Tidak";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak", Colors.black, 14, FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Duduk Lama > 4 Jam Terus Menerus",
                        Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              dudukLama = "Ya";
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
                              dudukLama = "Tidak";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak", Colors.black, 14, FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Berdiri Lama > 4 Jam Terus Menerus",
                        Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              _quest4 = value!;
                              berdiriLama = "Ya";
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
                              berdiriLama = "Tidak";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak", Colors.black, 14, FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Posisi Tubuh Tidak Ergonomis", Colors.black,
                        14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              _quest5 = value!;
                              posisiTubuh = "Ya";
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
                              posisiTubuh = "Tidak";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak", Colors.black, 14, FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Pencahayaan Tidak Sesuai", Colors.black, 14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              _quest6 = value!;
                              pencahayaan = "Ya";
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
                              pencahayaan = "Tidak";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak", Colors.black, 14, FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault(
                        "Bekerja dengan Layar/Monitor 4 Jam/Lebih dalam Sehari",
                        Colors.black,
                        14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              _quest7 = value!;
                              bekerjaDenganLayar = "Ya";
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
                              bekerjaDenganLayar = "Tidak";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak", Colors.black, 14, FontWeight.normal),
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
                )),
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
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return Pemeriksaan5();
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
