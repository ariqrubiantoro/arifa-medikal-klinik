// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/pemeriksaan_mata_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_THT.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum QuestYaNo { ya, tidak }

enum QuestRabun { dekat, jauh }

enum QuestNormal { normal, tidak }

class PemeriksaanMata extends StatefulWidget {
  const PemeriksaanMata({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<PemeriksaanMata> createState() => _PemeriksaanMataState();
}

class _PemeriksaanMataState extends State<PemeriksaanMata> {
  FirebaseFirestoreService firstore = FirebaseFirestoreService();
  int _questKacamata = 0;
  QuestRabun _questKondisi = QuestRabun.jauh;
  int _questOlahraga = 0;
  int _questButa = 0;
  int _questPenMata = 0;
  int _questKonjungtiva = 0;
  int _questSklera = 0;

  final osKiri = TextEditingController();
  final osKanan = TextEditingController();

  bool boolKondisi = false;

  String kacamata = "Tidak";
  String kondisi = "Rabun Jauh";
  String olahraga = "Tidak";
  String buta = "Tidak";
  String penMata = "Tidak";
  String konjungtiva = "Tidak Normal";
  String sklera = "Tidak Normal";

  final kacamataF = TextEditingController();
  final olahragaF = TextEditingController();
  final butaF = TextEditingController();
  final penMataF = TextEditingController();
  final konjungtivaF = TextEditingController();
  final skleraF = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blueDefault,
          title: textDefault("Keadaan Umum - Pemeriksaan Mata", Colors.white,
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
                        "Berkaca Mata", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _questKacamata,
                          onChanged: (value) {
                            setState(() {
                              _questKacamata = value!;
                              kacamata = "Ya";
                              boolKondisi = true;
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _questKacamata,
                          onChanged: (value) {
                            setState(() {
                              _questKacamata = value!;
                              kacamata = "Tidak";
                              boolKondisi = false;
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
                                _questKacamata = 0;
                                boolKondisi = false;
                              });
                            },
                            controller: kacamataF,
                            maxLength: 15,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    boolKondisi
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textDefault(
                                  "Kondisi", Colors.black, 14, FontWeight.bold),
                              Row(
                                children: <Widget>[
                                  Radio(
                                    value: QuestRabun.dekat,
                                    groupValue: _questKondisi,
                                    onChanged: (value) {
                                      setState(() {
                                        _questKondisi = value!;
                                        kondisi = "Rabun Dekat";
                                      });
                                    },
                                  ),
                                  textDefault("Rabun Dekat", Colors.black, 14,
                                      FontWeight.normal),
                                  Radio(
                                    value: QuestRabun.jauh,
                                    groupValue: _questKondisi,
                                    onChanged: (value) {
                                      setState(() {
                                        _questKondisi = value!;
                                        kondisi = "Rabun Jauh";
                                      });
                                    },
                                  ),
                                  textDefault("Rabun Jauh", Colors.black, 14,
                                      FontWeight.normal),
                                ],
                              ),
                            ],
                          )
                        : Container(),
                    Row(
                      children: [
                        Container(
                          width: 140,
                          child: textDefault("Visus Os (Kiri)", Colors.black,
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
                              controller: osKiri,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(border: InputBorder.none)),
                        ),
                        textDefault(" (Tanpa lensa koreksi)", Colors.black, 14,
                            FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 140,
                          child: textDefault("Visus Os (Kanan)", Colors.black,
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
                              controller: osKanan,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(border: InputBorder.none)),
                        ),
                        textDefault(" (Tanpa lensa koreksi)", Colors.black, 14,
                            FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Olahraga", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _questOlahraga,
                          onChanged: (value) {
                            setState(() {
                              _questOlahraga = value!;
                              olahraga = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _questOlahraga,
                          onChanged: (value) {
                            setState(() {
                              _questOlahraga = value!;
                              olahraga = "Tidak";
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
                                _questOlahraga = 0;
                              });
                            },
                            controller: olahragaF,
                            maxLength: 15,
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
                        "Buta Warna", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _questButa,
                          onChanged: (value) {
                            setState(() {
                              _questButa = value!;
                              buta = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _questButa,
                          onChanged: (value) {
                            setState(() {
                              _questButa = value!;
                              buta = "Tidak";
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
                                _questButa = 0;
                              });
                            },
                            controller: butaF,
                            maxLength: 15,
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
                        "Penyakit Mata", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _questPenMata,
                          onChanged: (value) {
                            setState(() {
                              _questPenMata = value!;
                              penMata = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _questPenMata,
                          onChanged: (value) {
                            setState(() {
                              _questPenMata = value!;
                              penMata = "Tidak";
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
                                _questPenMata = 0;
                              });
                            },
                            controller: penMataF,
                            maxLength: 15,
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
                        "Konjungtiva", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _questKonjungtiva,
                          onChanged: (value) {
                            setState(() {
                              _questKonjungtiva = value!;
                              penMata = "Normal";
                            });
                          },
                        ),
                        textDefault(
                            "Normal", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _questKonjungtiva,
                          onChanged: (value) {
                            setState(() {
                              _questKonjungtiva = value!;
                              penMata = "Tidak Normal";
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
                                _questKonjungtiva = 0;
                              });
                            },
                            controller: konjungtivaF,
                            maxLength: 15,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Sklera", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _questSklera,
                          onChanged: (value) {
                            setState(() {
                              _questSklera = value!;
                              sklera = "Normal";
                            });
                          },
                        ),
                        textDefault(
                            "Normal", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _questSklera,
                          onChanged: (value) {
                            setState(() {
                              _questSklera = value!;
                              sklera = "Tidak Normal";
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
                                _questSklera = 0;
                              });
                            },
                            controller: skleraF,
                            maxLength: 15,
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
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
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
                    // onTap: () => Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return PemeriksaanTHT();
                    // })),
                    onTap: saveButton,
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

  void saveButton() {
    kacamata = kacamataF.text != "" ? kacamataF.text : kacamata;
    olahraga = olahragaF.text != "" ? olahragaF.text : olahraga;
    buta = butaF.text != "" ? butaF.text : buta;
    penMata = penMataF.text != "" ? penMataF.text : penMata;
    konjungtiva = konjungtivaF.text != "" ? konjungtivaF.text : konjungtiva;
    sklera = skleraF.text != "" ? skleraF.text : sklera;

    PemeriksaanMataModel data = PemeriksaanMataModel(
      kacaMata: kacamata,
      kondisi: kondisi,
      visusKiri: int.parse(osKiri.text),
      visusKanan: int.parse(osKanan.text),
      olahraga: olahraga,
      butaWarna: buta,
      penyakitMata: penMata,
      konjungtiva: konjungtiva,
      sklera: sklera,
    );

    firstore.setPemeriksaanMata(
        pemeriksaanMata: data, idPasien: widget.idPasien!);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PemeriksaanTHT(
        idPasien: widget.idPasien,
      );
    }));
  }
}
