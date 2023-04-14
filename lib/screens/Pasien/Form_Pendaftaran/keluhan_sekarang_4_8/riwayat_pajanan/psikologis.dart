// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/psikologi_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/riwayat_pajanan/ergonomis.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak }

class Psikologis extends StatefulWidget {
  const Psikologis({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<Psikologis> createState() => _PsikologisState();
}

class _PsikologisState extends State<Psikologis> {
  Question _quest1 = Question.tidak;
  Question _quest2 = Question.tidak;
  Question _quest3 = Question.tidak;
  Question _quest4 = Question.tidak;
  Question _quest5 = Question.tidak;
  Question _quest6 = Question.tidak;
  Question _quest7 = Question.tidak;

  String bebanKerja = "";
  String pekerjaanTidakSesuai = "";
  String ketidakjelasanTugas = "";
  String hambatanJenjang = "";
  String bekerjaGiliran = "";
  String konflikDenganTeman = "";
  String konflikDalamKeluarga = "";

  final lainlain = TextEditingController();

  FirebaseFirestoreService firestore = FirebaseFirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blueDefault,
          title: textDefault("Riwayat Pajanan - Psikologis", Colors.white, 16,
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
                    textDefault(
                        "Beban Kerja Tidak Sesuai dengan Waktu dan Jumlah Pekerjaan",
                        Colors.black,
                        14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest1,
                          onChanged: (value) {
                            setState(() {
                              _quest1 = value!;
                              bebanKerja = "Ya";
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
                              bebanKerja = "Tidak";
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
                        "Pekerjaan Tidak Sesuai dengan Pengetahuan dan Keterampilan",
                        Colors.black,
                        14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              _quest2 = value!;
                              pekerjaanTidakSesuai = "Ya";
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
                              pekerjaanTidakSesuai = "Tidak";
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
                    textDefault("Ketidakjelasan Tugas", Colors.black, 14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              ketidakjelasanTugas = "Ya";
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
                              ketidakjelasanTugas = "Tidak";
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
                    textDefault("Hambatan Jenjang Karir", Colors.black, 14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              _quest4 = value!;
                              hambatanJenjang = "Ya";
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
                              hambatanJenjang = "Tidak";
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
                    textDefault("Bekerja Giliran (Shift)", Colors.black, 14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              _quest5 = value!;
                              bekerjaGiliran = "Ya";
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
                              bekerjaGiliran = "Tidak";
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
                    textDefault("Konflik dengan Teman Sekerja", Colors.black,
                        14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              _quest6 = value!;
                              konflikDenganTeman = "Ya";
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
                              konflikDenganTeman = "Tidak";
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
                    textDefault("Konflik dalam Keluarga", Colors.black, 14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              _quest7 = value!;
                              konflikDalamKeluarga = "Ya";
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
                              konflikDalamKeluarga = "Tidak";
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
                  // onTap: () => Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) {
                  //   return Ergonomis();
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
    PsikologiModel data = PsikologiModel(
      bebanKerja: bebanKerja,
      pekerjaanTidakSesuai: pekerjaanTidakSesuai,
      ketidakjelasanTugas: ketidakjelasanTugas,
      hamabatanJenjangKarir: hambatanJenjang,
      shift: bekerjaGiliran,
      konflikRekanKerja: konflikDenganTeman,
      konflikKeluarga: konflikDalamKeluarga,
      lainLain: lainlain.text,
    );

    firestore.setPsikologi(psikologi: data, idPasien: widget.idPasien!);
  }
}
