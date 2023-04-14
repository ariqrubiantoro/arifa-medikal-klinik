// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:arifa_medikal_klink_3/model/pemeriksaan_refleks_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_kelenjar_getah.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak }

class PemeriksaanRefleks extends StatefulWidget {
  const PemeriksaanRefleks({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<PemeriksaanRefleks> createState() => _PemeriksaanRefleksState();
}

class _PemeriksaanRefleksState extends State<PemeriksaanRefleks> {
  Question _quest1 = Question.ya;
  Question _quest2 = Question.ya;
  Question _quest3 = Question.ya;

  String strPupil = "";
  String strPatella = "";
  String strAchilles = "";

  final bicepsKanan = TextEditingController();
  final bicepsKiri = TextEditingController();
  final tricepsKanan = TextEditingController();
  final tricepsKiri = TextEditingController();
  final babinskyKanan = TextEditingController();
  final babinskyKiri = TextEditingController();

  FirebaseFirestoreService firestore = FirebaseFirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blueDefault,
          title: textDefault("Keadaan Umum - Pemeriksaan Refleks", Colors.white,
              16, FontWeight.bold)),
      body: Column(
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
                  pupil(),
                  Divider(
                    thickness: 1,
                  ),
                  patella(),
                  Divider(
                    thickness: 1,
                  ),
                  achilles()
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
                  //   return PemeriksaanKelenjarGetah();
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

  Widget pupil() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textDefault("Pupil", Colors.black, 14, FontWeight.bold),
        Row(
          children: <Widget>[
            Radio(
              value: Question.ya,
              groupValue: _quest1,
              onChanged: (value) {
                setState(() {
                  _quest1 = value!;
                  strPupil = "Normal";
                });
              },
            ),
            textDefault("Normal", Colors.black, 14, FontWeight.normal),
            Radio(
              value: Question.tidak,
              groupValue: _quest1,
              onChanged: (value) {
                setState(() {
                  _quest1 = value!;
                  strPupil = "Tidak Normal";
                });
              },
            ),
            textDefault("Tidak Normal", Colors.black, 14, FontWeight.normal),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              width: 120,
              child: textDefault(
                  "Biceps kanan", Colors.black, 14, FontWeight.normal),
            ),
            textDefault(":  ", Colors.black, 14, FontWeight.normal),
            Expanded(
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                    controller: bicepsKanan,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        border: InputBorder.none)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              width: 120,
              child: textDefault(
                  "Biceps Kiri", Colors.black, 14, FontWeight.normal),
            ),
            textDefault(":  ", Colors.black, 14, FontWeight.normal),
            Expanded(
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                    controller: bicepsKiri,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        border: InputBorder.none)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget patella() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textDefault("Patella", Colors.black, 14, FontWeight.bold),
        Row(
          children: <Widget>[
            Radio(
              value: Question.ya,
              groupValue: _quest2,
              onChanged: (value) {
                setState(() {
                  _quest2 = value!;
                  strPatella = "Normal";
                });
              },
            ),
            textDefault("Normal", Colors.black, 14, FontWeight.normal),
            Radio(
              value: Question.tidak,
              groupValue: _quest2,
              onChanged: (value) {
                setState(() {
                  _quest2 = value!;
                  strPatella = "Tidak Normal";
                });
              },
            ),
            textDefault("Tidak Normal", Colors.black, 14, FontWeight.normal),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              width: 120,
              child: textDefault(
                  "Triceps kanan", Colors.black, 14, FontWeight.normal),
            ),
            textDefault(":  ", Colors.black, 14, FontWeight.normal),
            Expanded(
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                    controller: tricepsKanan,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        border: InputBorder.none)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              width: 120,
              child: textDefault(
                  "Triceps Kiri", Colors.black, 14, FontWeight.normal),
            ),
            textDefault(":  ", Colors.black, 14, FontWeight.normal),
            Expanded(
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                    controller: tricepsKiri,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        border: InputBorder.none)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget achilles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textDefault("Achilles", Colors.black, 14, FontWeight.bold),
        Row(
          children: <Widget>[
            Radio(
              value: Question.ya,
              groupValue: _quest3,
              onChanged: (value) {
                setState(() {
                  _quest3 = value!;
                  strAchilles = "Normal";
                });
              },
            ),
            textDefault("Normal", Colors.black, 14, FontWeight.normal),
            Radio(
              value: Question.tidak,
              groupValue: _quest3,
              onChanged: (value) {
                setState(() {
                  _quest3 = value!;
                  strAchilles = "Tidak Normal";
                });
              },
            ),
            textDefault("Tidak Normal", Colors.black, 14, FontWeight.normal),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              width: 120,
              child: textDefault(
                  "Babinsky kanan", Colors.black, 14, FontWeight.normal),
            ),
            textDefault(":  ", Colors.black, 14, FontWeight.normal),
            Expanded(
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                    controller: babinskyKanan,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        border: InputBorder.none)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              width: 120,
              child: textDefault(
                  "Babinsky Kiri", Colors.black, 14, FontWeight.normal),
            ),
            textDefault(":  ", Colors.black, 14, FontWeight.normal),
            Expanded(
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                    controller: babinskyKiri,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        border: InputBorder.none)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  saveButton() async {
    PemeriksaanRefleksModel data = PemeriksaanRefleksModel(
      pupil: PupilModel(
        pupil: strPupil,
        bicepsKanan: bicepsKanan.text,
        bicepsKiri: bicepsKiri.text,
      ),
      patella: PatellaModel(
        patella: strPatella,
        tricepsKanan: tricepsKanan.text,
        tricepsKiri: tricepsKiri.text,
      ),
      achilles: AchillesModel(
        acciles: strAchilles,
        babinskiKanan: babinskyKanan.text,
        babinskiKiri: babinskyKiri.text,
      ),
    );

    firestore.setPemeriksaanRefleks(
        pemeriksaanRefleks: data, idPasien: widget.idPasien!);
  }
}
