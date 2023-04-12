// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/pemeriksaan_umum_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_mata.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blueDefault,
          title: textDefault("Keadaan Umum - Pemeriksaan Umum", Colors.white,
              16, FontWeight.bold)),
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
                        textDefault(":  ", Colors.black, 14, FontWeight.normal),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                              controller: tinggiBadan,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none)),
                        ),
                        textDefault(" cm", Colors.black, 14, FontWeight.normal),
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
                        textDefault(":  ", Colors.black, 14, FontWeight.normal),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                              controller: beratBadan,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none)),
                        ),
                        textDefault(" kg", Colors.black, 14, FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 150,
                          child: textDefault("Berat Badan Ideal", Colors.black,
                              16, FontWeight.normal),
                        ),
                        textDefault(":  ", Colors.black, 14, FontWeight.normal),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                              controller: beratBadanIdeal,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none)),
                        ),
                        textDefault(" kg", Colors.black, 14, FontWeight.normal),
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
                        textDefault(":  ", Colors.black, 14, FontWeight.normal),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                              controller: imt,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none)),
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
                              16, FontWeight.normal),
                        ),
                        textDefault(":  ", Colors.black, 14, FontWeight.normal),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                              controller: lingkaranPerut,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none)),
                        ),
                        textDefault(" cm", Colors.black, 14, FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 150,
                          child: textDefault("Tekanan Darah", Colors.black, 14,
                              FontWeight.normal),
                        ),
                        textDefault(":  ", Colors.black, 14, FontWeight.normal),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                              controller: tekananDarah,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none)),
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
                        textDefault(":  ", Colors.black, 14, FontWeight.normal),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                              controller: denyutNadi,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none)),
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
                              16, FontWeight.normal),
                        ),
                        textDefault(":  ", Colors.black, 14, FontWeight.normal),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                              controller: pernapasan,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none)),
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
                        textDefault(":  ", Colors.black, 14, FontWeight.normal),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                              controller: suhu,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none)),
                        ),
                        textDefault(" °C", Colors.black, 14, FontWeight.normal),
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
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    // onTap: () => showDialogProfil(),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                      return PemeriksaanMata();
                    })),
                    // onTap: saveButton,
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
                            "Selanjutnya", Colors.white, 16, FontWeight.normal),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void saveButton() async {
    print("data ${widget.idPasien}");
    PemeriksaanUmumModel data = PemeriksaanUmumModel(
      tinggiBadan: int.parse(tinggiBadan.text),
      beratBadan: int.parse(beratBadan.text),
      beratBadanIdeal: int.parse(beratBadanIdeal.text),
      imt: int.parse(imt.text),
      lingkarPerut: int.parse(lingkaranPerut.text),
      tekananDarah: int.parse(tekananDarah.text),
      denyutNadi: int.parse(denyutNadi.text),
      pernapasan: int.parse(pernapasan.text),
      suhu: int.parse(suhu.text),
    );

    await firestore.setPemeriksaanUmum(
        pemeriksaanUmum: data, idPasien: widget.idPasien!);
  }
}
