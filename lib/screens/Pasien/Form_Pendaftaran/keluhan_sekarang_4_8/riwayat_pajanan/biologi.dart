// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/biologi_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/riwayat_pajanan/psikologis.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak, none }

class Biologi extends StatefulWidget {
  const Biologi({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<Biologi> createState() => _BiologiState();
}

class _BiologiState extends State<Biologi> {
  Question _quest1 = Question.tidak;
  Question _quest2 = Question.tidak;
  Question _quest3 = Question.tidak;
  Question _quest4 = Question.tidak;

  String bakteri = "Tidak";
  String darah = "Tidak";
  String nyamuk = "Tidak";
  String limbah = "Tidak";
  final lainlain = TextEditingController();

  TextEditingController bakteriController = TextEditingController();
  TextEditingController darahController = TextEditingController();
  TextEditingController nyamukController = TextEditingController();
  TextEditingController limbahController = TextEditingController();

  FirebaseFirestoreService firestore = FirebaseFirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blueDefault,
          title: textDefault(
              "Riwayat Pajanan - Biologi", Colors.white, 16, FontWeight.bold)),
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
                  textDefault("Bakteri/Virus/Jamur/Parasit", Colors.black, 14,
                      FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest1,
                        onChanged: (value) {
                          setState(() {
                            _quest1 = value!;
                            bakteri = "Ya";
                            bakteriController.text = "";
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
                            bakteri = "Tidak";
                            bakteriController.text = "";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
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
                            controller: bakteriController,
                            maxLength: 10,
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
                  textDefault("Darah/Cairan Tubuh Lain", Colors.black, 14,
                      FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest2,
                        onChanged: (value) {
                          setState(() {
                            _quest2 = value!;
                            darah = "Ya";
                            darahController.text = "";
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
                            darah = "Tidak";
                            darahController.text = "";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
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
                            controller: darahController,
                            maxLength: 10,
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
                  textDefault("Nyamuk/Serangga/Lain-Lain", Colors.black, 14,
                      FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest3,
                        onChanged: (value) {
                          setState(() {
                            _quest3 = value!;
                            nyamuk = "Ya";
                            nyamukController.text = "";
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
                            nyamuk = "Tidak";
                            nyamukController.text = "";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
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
                            controller: nyamukController,
                            maxLength: 10,
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
                  textDefault("Limbah (Kotoran Manusia/Hewan)", Colors.black,
                      14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest4,
                        onChanged: (value) {
                          setState(() {
                            _quest4 = value!;
                            limbah = "Ya";
                            limbahController.text = "";
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
                            limbah = "Tidak";
                            limbahController.text = "";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
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
                            controller: limbahController,
                            maxLength: 10,
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
                  //   return Psikologis();
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
    BiologiModel data = BiologiModel(
      bakteri: bakteriController.text != "" ? bakteriController.text : bakteri,
      darah: darahController.text != "" ? darahController.text : darah,
      nyamuk: nyamukController.text != "" ? nyamukController.text : nyamuk,
      limbah: limbahController.text != "" ? limbahController.text : limbah,
      lainLain: lainlain.text,
    );

    firestore.setBiologi(biologi: data, idPasien: widget.idPasien!);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Psikologis(
        idPasien: widget.idPasien,
      );
    }));
  }
}
