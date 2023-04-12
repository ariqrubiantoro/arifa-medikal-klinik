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
  QuestYaNo _questKacamata = QuestYaNo.tidak;
  QuestRabun _questKondisi = QuestRabun.jauh;
  QuestYaNo _questOlahraga = QuestYaNo.tidak;
  QuestYaNo _questButa = QuestYaNo.tidak;
  QuestYaNo _questPenMata = QuestYaNo.tidak;
  QuestNormal _questKonjungtiva = QuestNormal.tidak;
  QuestNormal _questSklera = QuestNormal.tidak;

  final osKiri = TextEditingController();
  final osKanan = TextEditingController();

  String kacamata = "";
  String kondisi = "";
  String olahraga = "";
  String buta = "";
  String penMata = "";
  String konjungtiva = "";
  String sklera = "";

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
                          value: QuestYaNo.ya,
                          groupValue: _questKacamata,
                          onChanged: (value) {
                            setState(() {
                              _questKacamata = value!;
                              kacamata = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: QuestYaNo.tidak,
                          groupValue: _questKacamata,
                          onChanged: (value) {
                            setState(() {
                              _questKacamata = value!;
                              kacamata = "Tidak";
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
                    Column(
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
                    ),
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
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none)),
                        ),
                        textDefault(" (Tanpa lensa koreksi)", Colors.black, 12,
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
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none)),
                        ),
                        textDefault(" (Tanpa lensa koreksi)", Colors.black, 12,
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
                          value: QuestYaNo.ya,
                          groupValue: _questOlahraga,
                          onChanged: (value) {
                            setState(() {
                              _questOlahraga = value!;
                              olahraga = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: QuestYaNo.tidak,
                          groupValue: _questOlahraga,
                          onChanged: (value) {
                            setState(() {
                              _questOlahraga = value!;
                              olahraga = "Tidak";
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
                        "Buta Warna", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: QuestYaNo.ya,
                          groupValue: _questButa,
                          onChanged: (value) {
                            setState(() {
                              _questButa = value!;
                              buta = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: QuestYaNo.tidak,
                          groupValue: _questButa,
                          onChanged: (value) {
                            setState(() {
                              _questButa = value!;
                              buta = "Tidak";
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
                        "Penyakit Mata", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: QuestYaNo.ya,
                          groupValue: _questPenMata,
                          onChanged: (value) {
                            setState(() {
                              _questPenMata = value!;
                              penMata = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: QuestYaNo.tidak,
                          groupValue: _questPenMata,
                          onChanged: (value) {
                            setState(() {
                              _questPenMata = value!;
                              penMata = "Tidak";
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
                        "Konjungtiva", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: QuestNormal.normal,
                          groupValue: _questKonjungtiva,
                          onChanged: (value) {
                            setState(() {
                              _questKonjungtiva = value!;
                              penMata = "Normal";
                            });
                          },
                        ),
                        textDefault(
                            "Normal", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: QuestNormal.tidak,
                          groupValue: _questKonjungtiva,
                          onChanged: (value) {
                            setState(() {
                              _questKonjungtiva = value!;
                              penMata = "Tidak Normal";
                            });
                          },
                        ),
                        textDefault("Tidak Normal", Colors.black, 14,
                            FontWeight.normal),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Sklera", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: QuestNormal.normal,
                          groupValue: _questSklera,
                          onChanged: (value) {
                            setState(() {
                              _questSklera = value!;
                              sklera = "Normal";
                            });
                          },
                        ),
                        textDefault(
                            "Normal", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: QuestNormal.tidak,
                          groupValue: _questSklera,
                          onChanged: (value) {
                            setState(() {
                              _questSklera = value!;
                              sklera = "Tidak Normal";
                            });
                          },
                        ),
                        textDefault("Tidak Normal", Colors.black, 14,
                            FontWeight.normal),
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
                      return PemeriksaanTHT();
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

  void saveButton() {
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
  }
}
