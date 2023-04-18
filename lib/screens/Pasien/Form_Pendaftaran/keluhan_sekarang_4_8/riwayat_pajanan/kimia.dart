// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/kimia_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/riwayat_pajanan/biologi.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak }

class Kimia extends StatefulWidget {
  const Kimia({this.pasienId, super.key});
  final String? pasienId;

  @override
  State<Kimia> createState() => _KimiaState();
}

class _KimiaState extends State<Kimia> {
  Question _quest1 = Question.tidak;
  Question _quest2 = Question.tidak;
  Question _quest3 = Question.tidak;
  Question _quest4 = Question.tidak;
  Question _quest5 = Question.tidak;
  Question _quest6 = Question.tidak;
  Question _quest7 = Question.tidak;
  Question _quest8 = Question.tidak;
  Question _quest9 = Question.tidak;
  Question _quest10 = Question.tidak;

  String debuAnorganik = "Tidak";
  String debuOrganik = "Tidak";
  String asap = "Tidak";
  String logamBerat = "Tidak";
  String pelarutOrganik = "Tidak";
  String iritanAsam = "Tidak";
  String iritanBasa = "Tidak";
  String cairanPembersih = "Tidak";
  String pestisida = "Tidak";
  String uapLogam = "Tidak";

  final lainlain = TextEditingController();
  FirebaseFirestoreService firestore = FirebaseFirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blueDefault,
          title: textDefault(
              "Riwayat Pajanan - Kimia", Colors.white, 16, FontWeight.bold)),
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
                  textDefault("Debu Anorganik (Silika, Semen, dll)",
                      Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest1,
                        onChanged: (value) {
                          setState(() {
                            _quest1 = value!;
                            debuAnorganik = "Ya";
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
                            debuAnorganik = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Debu Organik (Kapas, Tekstil, Gandum)",
                      Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest2,
                        onChanged: (value) {
                          setState(() {
                            _quest2 = value!;
                            debuOrganik = "Ya";
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
                            debuOrganik = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Asap", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest3,
                        onChanged: (value) {
                          setState(() {
                            _quest3 = value!;
                            asap = "Ya";
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
                            asap = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Logam Berat (Timah Hitam, Air Raksa)",
                      Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest4,
                        onChanged: (value) {
                          setState(() {
                            _quest4 = value!;
                            logamBerat = "Ya";
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
                            logamBerat = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Pelarut Organik (Benzene, Alkil, Toluen)",
                      Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest5,
                        onChanged: (value) {
                          setState(() {
                            _quest5 = value!;
                            pelarutOrganik = "Ya";
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
                            pelarutOrganik = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Iritan Asam (Air Keras, Asam Sulfat)",
                      Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest6,
                        onChanged: (value) {
                          setState(() {
                            _quest6 = value!;
                            iritanAsam = "Ya";
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
                            iritanAsam = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Iritan Basa (Amoniak, Soda Api)", Colors.black,
                      14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest7,
                        onChanged: (value) {
                          setState(() {
                            _quest7 = value!;
                            iritanBasa = "Ya";
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
                            iritanBasa = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Cairan Pembersih (Amonia, Klor, Kaporit)",
                      Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest8,
                        onChanged: (value) {
                          setState(() {
                            _quest8 = value!;
                            cairanPembersih = "Ya";
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
                            cairanPembersih = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Pestisida", Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest9,
                        onChanged: (value) {
                          setState(() {
                            _quest9 = value!;
                            pestisida = "Ya";
                          });
                        },
                      ),
                      textDefault("Ya", Colors.black, 13, FontWeight.normal),
                      Radio(
                        value: Question.tidak,
                        groupValue: _quest9,
                        onChanged: (value) {
                          setState(() {
                            _quest9 = value!;
                            pestisida = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault("Uap Logam (Mangan, Seng)", Colors.black, 14,
                      FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest10,
                        onChanged: (value) {
                          setState(() {
                            _quest10 = value!;
                            uapLogam = "Ya";
                          });
                        },
                      ),
                      textDefault("Ya", Colors.black, 13, FontWeight.normal),
                      Radio(
                        value: Question.tidak,
                        groupValue: _quest10,
                        onChanged: (value) {
                          setState(() {
                            _quest10 = value!;
                            uapLogam = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
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
                  //   return Biologi();
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
    KimiaModel data = KimiaModel(
      debuAnorganik: debuAnorganik,
      debuOrganik: debuOrganik,
      asap: asap,
      logamBerat: logamBerat,
      pelarutOrganik: pelarutOrganik,
      iritanAsam: iritanAsam,
      iritanBasa: iritanBasa,
      cairanPembersih: cairanPembersih,
      pestisida: pestisida,
      uapLogam: uapLogam,
      lainLain: lainlain.text,
    );

    firestore.setKimia(kimia: data, idPasien: widget.pasienId!);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Biologi(
        idPasien: widget.pasienId,
      );
    }));
  }
}
