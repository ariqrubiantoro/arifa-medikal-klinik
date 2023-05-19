// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:arifa_medikal_klink_3/model/pemeriksaan_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_fisik.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/anjuran_6_8.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_audiometri.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_gigi_mulut.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_jantung.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_laboratorium.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_mata.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_paru.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_spirometri.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_treadmill.dart';
import '../../../components/colors/color.dart';
import '../../../components/widget/text.dart';

class Pemeriksaan5 extends StatefulWidget {
  const Pemeriksaan5({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<Pemeriksaan5> createState() => _Pemeriksaan5State();
}

class _Pemeriksaan5State extends State<Pemeriksaan5> {
  final fisik = TextEditingController();
  final mata = TextEditingController();

  final gigiMulut = TextEditingController();
  final audiometri = TextEditingController();
  final spirometri = TextEditingController();
  final treadmill = TextEditingController();
  final laboratorium = TextEditingController();
  final jantung = TextEditingController();
  final paru = TextEditingController();
  final FirebaseFirestoreService firestore = FirebaseFirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blueDefault,
          title: textDefault("Pemeriksaan", Colors.white, 16, FontWeight.bold)),
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
                      textDefault("5/8", Colors.black, 14, FontWeight.bold)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 220,
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
                      "Pemeriksaan Fisik", Colors.black, 14, FontWeight.bold),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: fisik,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textDefault(
                      "Pemeriksaan Mata", Colors.black, 14, FontWeight.bold),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: mata,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textDefault("Pemeriksaan Gigi dan Mulut", Colors.black, 14,
                      FontWeight.bold),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: gigiMulut,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textDefault("Pemeriksaan Audiometri", Colors.black, 14,
                      FontWeight.bold),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: audiometri,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textDefault("Pemeriksaan Spirometri", Colors.black, 14,
                      FontWeight.bold),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: spirometri,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textDefault("Pemeriksaan Treadmill", Colors.black, 14,
                      FontWeight.bold),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: treadmill,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textDefault("Pemeriksaan Laboratorium", Colors.black, 14,
                      FontWeight.bold),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: laboratorium,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textDefault(
                      "Pemeriksaan X-Ray:", Colors.black, 16, FontWeight.bold),
                  SizedBox(
                    height: 10,
                  ),
                  textDefault("Jantung", Colors.black, 14, FontWeight.bold),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: jantung,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textDefault("Paru", Colors.black, 14, FontWeight.bold),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: paru,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
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
                  //   return Anjuran6();
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
    PemeriksaanModel data = PemeriksaanModel(
      pemeriksaanFisik: fisik.text,
      pemeriksaanMata: mata.text,
      pemeriksaanGigiMulut: gigiMulut.text,
      pemeriksaanAudioMetri: audiometri.text,
      pemeriksaanSpirometri: spirometri.text,
      pemeriksaanTreadmill: treadmill.text,
      pemeriksaanLaboratorium: laboratorium.text,
      pemeriksaanXrayJantung: jantung.text,
      paru: paru.text,
    );

    firestore.setPemeriksaan(pemeriksaan: data, idPasien: widget.idPasien!);

    if (fisik.text != "") {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HasilPemeriksaanFisik(
          idPasien: widget.idPasien!,
        );
      }));
    } else if (mata.text != "") {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HasilPemeriksaanMata(idPasien: widget.idPasien!);
      }));
    } else if (gigiMulut.text != "") {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HasilPemeriksaanGigiMulut(idPasien: widget.idPasien!);
      }));
    } else if (audiometri.text != "") {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HasilPemeriksaanAudiometri(idPasien: widget.idPasien!);
      }));
    } else if (spirometri.text != "") {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HasilPemeriksaanSpirometri(idPasien: widget.idPasien!);
      }));
    } else if (treadmill.text != "") {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HasilPemeriksaanTreadmill(idPasien: widget.idPasien!);
      }));
    } else if (laboratorium.text != "") {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HasilPemeriksaanLaboratorium(idPasien: widget.idPasien!);
      }));
    } else if (jantung.text != "") {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HasilPemeriksaanJantung(idPasien: widget.idPasien!);
      }));
    } else if (paru.text != "") {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HasilPemeriksaanParu(idPasien: widget.idPasien!);
      }));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Anjuran6(idPasien: widget.idPasien);
      }));
    }
  }
}
