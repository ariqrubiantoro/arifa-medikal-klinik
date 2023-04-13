// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/pemeriksaan_tht_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_rongga_dada.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak }

class PemeriksaanTHT extends StatefulWidget {
  const PemeriksaanTHT({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<PemeriksaanTHT> createState() => _PemeriksaanTHTState();
}

class _PemeriksaanTHTState extends State<PemeriksaanTHT> {
  Question _questTelinga1 = Question.ya;
  Question _questTelinga2 = Question.ya;
  Question _questTelinga3 = Question.ya;
  Question _questTelinga4 = Question.ya;
  Question _questTelinga5 = Question.ya;
  Question _questTelinga6 = Question.ya;

  Question _questHidung1 = Question.tidak;
  Question _questHidung2 = Question.ya;
  Question _questHidung3 = Question.ya;

  Question _questKerongkongan1 = Question.tidak;
  Question _questKerongkongan2 = Question.tidak;
  Question _questKerongkongan3 = Question.tidak;
  Question _questKerongkongan4 = Question.tidak;
  Question _questKerongkongan5 = Question.tidak;

  bool tapTelinga = false;
  bool tapHidung = false;
  bool tapKerongkongan = false;

  String tympKiri = "";
  String tympKanan = "";
  String telingaKiri = "";
  String serumenKiri = "";
  String telingaKanan = "";
  String serumenKanan = "";

  String pilek = "";
  String lidah = "";
  String lainlainHidung = "";

  String tonsilKanan = "";
  String tonsilKiri = "";
  String pharing = "";
  String tiroid = "";
  String lainlainKerongkongan = "";

  FirebaseFirestoreService firestore = FirebaseFirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: blueDefault,
          title: textDefault("Keadaan Umum - Pemeriksaan THT", Colors.white, 16,
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
                    InkWell(
                      onTap: () {
                        setState(() {
                          tapTelinga = !tapTelinga;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 4)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textDefault(
                                "Telinga", Colors.black, 14, FontWeight.bold),
                            Icon(tapTelinga
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    ),
                    tapTelinga ? telinga() : Container(),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          tapHidung = !tapHidung;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 4)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textDefault(
                                "Hidung", Colors.black, 14, FontWeight.bold),
                            Icon(tapHidung
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    ),
                    tapHidung ? hidung() : Container(),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          tapKerongkongan = !tapKerongkongan;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 4)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textDefault("Kerongkongan", Colors.black, 14,
                                FontWeight.bold),
                            Icon(tapKerongkongan
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    ),
                    tapKerongkongan ? kerongkongan() : Container(),
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
                    // onTap: () => Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return PemeriksaanRonggaDada();
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

  Widget telinga() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          textDefault("Membran Tymp Kiri", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: Question.ya,
                groupValue: _questTelinga1,
                onChanged: (value) {
                  setState(() {
                    _questTelinga1 = value!;
                    tympKiri = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 14, FontWeight.normal),
              Radio(
                value: Question.tidak,
                groupValue: _questTelinga1,
                onChanged: (value) {
                  setState(() {
                    _questTelinga1 = value!;
                    tympKiri = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 14, FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Membran Tymp Kanan", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: Question.ya,
                groupValue: _questTelinga2,
                onChanged: (value) {
                  setState(() {
                    _questTelinga2 = value!;
                    tympKanan = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 14, FontWeight.normal),
              Radio(
                value: Question.tidak,
                groupValue: _questTelinga2,
                onChanged: (value) {
                  setState(() {
                    _questTelinga2 = value!;
                    tympKanan = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 14, FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault(
              "Penyakit Telinga Kiri", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: Question.ya,
                groupValue: _questTelinga3,
                onChanged: (value) {
                  setState(() {
                    _questTelinga3 = value!;
                    telingaKiri = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 14, FontWeight.normal),
              Radio(
                value: Question.tidak,
                groupValue: _questTelinga3,
                onChanged: (value) {
                  setState(() {
                    _questTelinga3 = value!;
                    telingaKiri = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 14, FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Serumen", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: Question.ya,
                groupValue: _questTelinga4,
                onChanged: (value) {
                  setState(() {
                    _questTelinga4 = value!;
                    serumenKiri = "Ada";
                    print(_questTelinga4.name);
                  });
                },
              ),
              textDefault("Ada", Colors.black, 14, FontWeight.normal),
              Radio(
                value: Question.tidak,
                groupValue: _questTelinga4,
                onChanged: (value) {
                  setState(() {
                    _questTelinga4 = value!;
                    serumenKiri = "Tidak Ada";
                  });
                },
              ),
              textDefault("Tidak Ada", Colors.black, 14, FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault(
              "Penyakit Telinga Kanan", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: Question.ya,
                groupValue: _questTelinga5,
                onChanged: (value) {
                  setState(() {
                    _questTelinga5 = value!;
                    telingaKanan = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 14, FontWeight.normal),
              Radio(
                value: Question.tidak,
                groupValue: _questTelinga5,
                onChanged: (value) {
                  setState(() {
                    _questTelinga5 = value!;
                    telingaKanan = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 14, FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Serumen", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: Question.ya,
                groupValue: _questTelinga6,
                onChanged: (value) {
                  setState(() {
                    _questTelinga6 = value!;
                    serumenKanan = "Ada";
                  });
                },
              ),
              textDefault("Ada", Colors.black, 14, FontWeight.normal),
              Radio(
                value: Question.tidak,
                groupValue: _questTelinga6,
                onChanged: (value) {
                  setState(() {
                    _questTelinga6 = value!;
                    serumenKanan = "Tidak Ada";
                  });
                },
              ),
              textDefault("Tidak Ada", Colors.black, 14, FontWeight.normal),
            ],
          ),
        ],
      ),
    );
  }

  Widget hidung() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          textDefault("Pilek/Tersumbat", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: Question.ya,
                groupValue: _questHidung1,
                onChanged: (value) {
                  setState(() {
                    _questHidung1 = value!;
                    pilek = "Ya";
                  });
                },
              ),
              textDefault("Ya", Colors.black, 14, FontWeight.normal),
              Radio(
                value: Question.tidak,
                groupValue: _questHidung1,
                onChanged: (value) {
                  setState(() {
                    _questHidung1 = value!;
                    pilek = "Tidak Ada";
                  });
                },
              ),
              textDefault("Tidak Ada", Colors.black, 14, FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Lidah", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: Question.ya,
                groupValue: _questHidung2,
                onChanged: (value) {
                  setState(() {
                    _questHidung2 = value!;
                    lidah = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 14, FontWeight.normal),
              Radio(
                value: Question.tidak,
                groupValue: _questHidung2,
                onChanged: (value) {
                  setState(() {
                    _questHidung2 = value!;
                    lidah = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 14, FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Lain-Lain", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: Question.ya,
                groupValue: _questHidung3,
                onChanged: (value) {
                  setState(() {
                    _questHidung3 = value!;
                    lainlainHidung = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 14, FontWeight.normal),
              Radio(
                value: Question.tidak,
                groupValue: _questHidung3,
                onChanged: (value) {
                  setState(() {
                    _questHidung3 = value!;
                    lainlainHidung = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 14, FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Widget kerongkongan() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          textDefault("Tonsil Kanan", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: Question.ya,
                groupValue: _questKerongkongan1,
                onChanged: (value) {
                  setState(() {
                    _questKerongkongan1 = value!;
                    tonsilKanan = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 14, FontWeight.normal),
              Radio(
                value: Question.tidak,
                groupValue: _questKerongkongan1,
                onChanged: (value) {
                  setState(() {
                    _questKerongkongan1 = value!;
                    tonsilKanan = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 14, FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Tonsil Kiri", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: Question.ya,
                groupValue: _questKerongkongan2,
                onChanged: (value) {
                  setState(() {
                    _questKerongkongan2 = value!;
                    tonsilKiri = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 14, FontWeight.normal),
              Radio(
                value: Question.tidak,
                groupValue: _questKerongkongan2,
                onChanged: (value) {
                  setState(() {
                    _questKerongkongan2 = value!;
                    tonsilKiri = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 14, FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Pharing", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: Question.ya,
                groupValue: _questKerongkongan3,
                onChanged: (value) {
                  setState(() {
                    _questKerongkongan3 = value!;
                    pharing = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 14, FontWeight.normal),
              Radio(
                value: Question.tidak,
                groupValue: _questKerongkongan3,
                onChanged: (value) {
                  setState(() {
                    _questKerongkongan3 = value!;
                    pharing = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 14, FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Tiroid", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: Question.ya,
                groupValue: _questKerongkongan4,
                onChanged: (value) {
                  setState(() {
                    _questKerongkongan4 = value!;
                    tiroid = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 14, FontWeight.normal),
              Radio(
                value: Question.tidak,
                groupValue: _questKerongkongan4,
                onChanged: (value) {
                  setState(() {
                    _questKerongkongan4 = value!;
                    tiroid = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 14, FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Lain-Lain", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: Question.ya,
                groupValue: _questKerongkongan5,
                onChanged: (value) {
                  setState(() {
                    _questKerongkongan5 = value!;
                    lainlainKerongkongan = "Ada";
                  });
                },
              ),
              textDefault("Ada", Colors.black, 14, FontWeight.normal),
              Radio(
                value: Question.tidak,
                groupValue: _questKerongkongan5,
                onChanged: (value) {
                  setState(() {
                    _questKerongkongan5 = value!;
                    lainlainKerongkongan = "Tidak Ada";
                  });
                },
              ),
              textDefault("Tidak Ada", Colors.black, 14, FontWeight.normal),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  void saveButton() async {
    PemeriksaanTHTModel data = PemeriksaanTHTModel(
      telinga: Telinga(
        membranTympKiri:
            _questTelinga1.name == "ya" ? "Normal" : "Tidak Normal",
        membranTympKanan:
            _questTelinga2.name == "ya" ? "Normal" : "Tidak Normal",
        penyakitTelingaKiri:
            _questTelinga3.name == "ya" ? "Normal" : "Tidak Normal",
        serumenKiri: _questTelinga4.name == "ya" ? "Ada" : "Tidak Ada",
        penyakitTelingaKanan:
            _questTelinga5.name == "ya" ? "Normal" : "Tidak Normal",
        serumenKanan: _questTelinga6.name == "ya" ? "Ada" : "Tidak Ada",
      ),
      hidung: Hidung(
        pilekTersumbat: _questHidung1.name == "ya" ? "Normal" : "Tidak Ada",
        lidah: _questHidung2.name == "ya" ? "Normal" : "Tidak Normal",
        lainLain: _questHidung3.name == "ya" ? "Normal" : "Tidak Normal",
      ),
      kerongkongan: Kerongkongan(
        tonsilKanan:
            _questKerongkongan1.name == "ya" ? "Normal" : "Tidak Normal",
        tonsilKiri:
            _questKerongkongan2.name == "ya" ? "Normal" : "Tidak Normal",
        pharing: _questKerongkongan3.name == "ya" ? "Normal" : "Tidak Normal",
        tiroid: _questKerongkongan4.name == "ya" ? "Normal" : "Tidak Normal",
        lainLain: _questKerongkongan5.name == "ya" ? "Ada" : "Tidak Ada",
      ),
    );

    firestore.setPemeriksaanTHT(
        pemeriksaanTHT: data, idPasien: widget.idPasien!);
  }
}
