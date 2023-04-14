// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';
import '../../../../../model/pemeriksaan_gentalia_model.dart';
import '../../../../../service/firebase_firestore_service.dart';

class PemeriksaanGentalia extends StatefulWidget {
  const PemeriksaanGentalia({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<PemeriksaanGentalia> createState() => _PemeriksaanGentaliaState();
}

class _PemeriksaanGentaliaState extends State<PemeriksaanGentalia> {
  final hernia = TextEditingController();
  final hemorhoid = TextEditingController();
  final sikatriks = TextEditingController();
  final spincter = TextEditingController();
  final efidymis = TextEditingController();
  final ekskresi = TextEditingController();
  FirebaseFirestoreService firestore = FirebaseFirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: blueDefault,
          title: textDefault(
              "Keadaan Umum - Pemeriksaan Gentalia dan Anorektal",
              Colors.white,
              16,
              FontWeight.bold)),
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
                  textDefault("Hernia", Colors.black, 14, FontWeight.bold),
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
                        controller: hernia,
                        decoration: InputDecoration(border: InputBorder.none)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textDefault("Haemorhoid", Colors.black, 14, FontWeight.bold),
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
                        controller: hemorhoid,
                        decoration: InputDecoration(border: InputBorder.none)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textDefault("Sikatriks", Colors.black, 14, FontWeight.bold),
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
                        controller: sikatriks,
                        decoration: InputDecoration(border: InputBorder.none)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textDefault("Spincter", Colors.black, 14, FontWeight.bold),
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
                        controller: spincter,
                        decoration: InputDecoration(border: InputBorder.none)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textDefault(
                      "Untuk Laki-Laki:", Colors.black, 20, FontWeight.bold),
                  SizedBox(
                    height: 10,
                  ),
                  textDefault("Efidymis/Testis/Prostat", Colors.black, 14,
                      FontWeight.bold),
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
                        controller: efidymis,
                        decoration: InputDecoration(border: InputBorder.none)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textDefault("Ekskresi", Colors.black, 14, FontWeight.bold),
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
                        controller: ekskresi,
                        decoration: InputDecoration(border: InputBorder.none)),
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
                  //   return PemeriksaanRonggaDada();
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
      )),
    );
  }

  void saveButton() async {
    PemeriksaanGentaliaModel data = PemeriksaanGentaliaModel(
      hernia: hernia.text,
      hemorhoid: hemorhoid.text,
      sikatriks: sikatriks.text,
      spincter: spincter.text,
      efidymisTestisProstat: efidymis.text,
      ekskresi: ekskresi.text,
    );

    firestore.setPemeriksaanGentalia(
        pemeriksaanGentalia: data, idPasien: widget.idPasien!);
  }
}
