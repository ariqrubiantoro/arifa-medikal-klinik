// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:arifa_medikal_klink_3/model/pemeriksaan_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_fisik.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_napfa.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_napza.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_usg.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/anjuran_6_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/pasien_detail.dart';
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
import 'Hasil_Pemeriksaan/hasil_pemeriksaan_laboratorium1.dart';

enum Question { tidakada, ringan, sedang, berat, none }

class Pemeriksaan5 extends StatefulWidget {
  const Pemeriksaan5({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<Pemeriksaan5> createState() => _Pemeriksaan5State();
}

class _Pemeriksaan5State extends State<Pemeriksaan5> {
  Question _quest1 = Question.none;

  final aktivfisik = TextEditingController();
  final fisik = TextEditingController();
  final mata = TextEditingController();
  final gigiMulut = TextEditingController();
  final audiometri = TextEditingController();
  final spirometri = TextEditingController();
  final treadmill = TextEditingController();
  final laboratorium = TextEditingController();
  final jantung = TextEditingController();
  final paru = TextEditingController();
  final usg = TextEditingController();
  final napfa = TextEditingController();
  final napza = TextEditingController();

  final FirebaseFirestoreService firestore = FirebaseFirestoreService();
  PemeriksaanModel? data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    data = await firestore.getPemeriksaan(widget.idPasien!);
    if (data != null) {
      setState(() {
        aktivfisik.text = data!.aktivitasFisik!;
        fisik.text = data!.pemeriksaanFisik!;
        mata.text = data!.pemeriksaanMata!;
        gigiMulut.text = data!.pemeriksaanGigiMulut!;
        audiometri.text = data!.pemeriksaanAudioMetri!;
        spirometri.text = data!.pemeriksaanSpirometri!;
        treadmill.text = data!.pemeriksaanTreadmill!;
        laboratorium.text = data!.pemeriksaanLaboratorium!;
        jantung.text = data!.pemeriksaanXrayJantung!;
        paru.text = data!.paru!;
        usg.text = data!.pemeriksaanUsg!;
        napfa.text = data!.pemeriksaanNapfa!;
        napza.text = data!.pemeriksaanNapza!;
      });
      if (aktivfisik.text == "Tidak Ada") {
        setState(() {
          _quest1 = Question.tidakada;
        });
      } else if (aktivfisik.text == "Ringan") {
        setState(() {
          _quest1 = Question.ringan;
        });
      } else if (aktivfisik.text == "Sedang") {
        setState(() {
          _quest1 = Question.sedang;
        });
      } else if (aktivfisik.text == "Berat") {
        setState(() {
          _quest1 = Question.berat;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.getString("detail1") == null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return MenuForm(idPasien: widget.idPasien!);
          }));
        } else {
          prefs.remove("detail1");
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return PasienDetail(idPasien: widget.idPasien!);
          }));
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: blueDefault,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                if (prefs.getString("detail1") == null) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MenuForm(idPasien: widget.idPasien!);
                  }));
                } else {
                  prefs.remove("detail1");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return PasienDetail(idPasien: widget.idPasien!);
                  }));
                }
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                ],
              ),
            ),
            textDefault("Pemeriksaan", Colors.white, 16, FontWeight.bold),
            SizedBox(
              width: 5,
            ),
          ]),
        ),
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
                    Row(
                      children: [
                        textDefault("*", Colors.red, 14, FontWeight.bold),
                        textDefault(
                            "Isi kesimpulan dari hasil pemeriksaan tersebut",
                            Colors.black,
                            14,
                            FontWeight.bold),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Aktivitas Fisik", Colors.black, 14,
                            FontWeight.bold),
                      ],
                    ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 10),
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.grey),
                    //       borderRadius: BorderRadius.circular(10)),
                    //   child: TextFormField(
                    //     enabled: false,
                    //     controller: aktivfisik,
                    //     decoration: InputDecoration(border: InputBorder.none),
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Radio(
                              value: Question.tidakada,
                              groupValue: _quest1,
                              onChanged: (value) {
                                setState(() {
                                  _quest1 = value!;
                                  aktivfisik.text = "Tidak Ada";
                                });
                              },
                            ),
                            textDefault("Tidak Ada", Colors.black, 13,
                                FontWeight.normal),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: Question.ringan,
                              groupValue: _quest1,
                              onChanged: (value) {
                                setState(() {
                                  _quest1 = value!;
                                  aktivfisik.text = "Ringan";
                                });
                              },
                            ),
                            textDefault(
                                "Ringan", Colors.black, 13, FontWeight.normal),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: Question.sedang,
                              groupValue: _quest1,
                              onChanged: (value) {
                                setState(() {
                                  _quest1 = value!;
                                  aktivfisik.text = "Sedang";
                                });
                              },
                            ),
                            textDefault(
                                "Sedang", Colors.black, 13, FontWeight.normal),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: Question.berat,
                              groupValue: _quest1,
                              onChanged: (value) {
                                setState(() {
                                  _quest1 = value!;

                                  aktivfisik.text = "Berat";
                                });
                              },
                            ),
                            textDefault(
                                "Berat", Colors.black, 13, FontWeight.normal),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Pemeriksaan Fisik", Colors.black, 14,
                            FontWeight.bold),
                        InkWell(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('iconHasil', 'iconHasil');
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HasilPemeriksaanFisik(
                                    idPasien: widget.idPasien!);
                              }));
                            },
                            child: Icon(Icons.upload_file))
                      ],
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Pemeriksaan Mata", Colors.black, 14,
                            FontWeight.bold),
                        InkWell(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('iconHasil', 'iconHasil');
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HasilPemeriksaanMata(
                                    idPasien: widget.idPasien!);
                              }));
                            },
                            child: Icon(Icons.upload_file))
                      ],
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Pemeriksaan Gigi dan Mulut", Colors.black,
                            14, FontWeight.bold),
                        InkWell(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('iconHasil', 'iconHasil');
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HasilPemeriksaanGigiMulut(
                                    idPasien: widget.idPasien!);
                              }));
                            },
                            child: Icon(Icons.upload_file))
                      ],
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Pemeriksaan Audiometri", Colors.black, 14,
                            FontWeight.bold),
                        InkWell(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('iconHasil', 'iconHasil');
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HasilPemeriksaanAudiometri(
                                    idPasien: widget.idPasien!);
                              }));
                            },
                            child: Icon(Icons.upload_file))
                      ],
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Pemeriksaan Spirometri", Colors.black, 14,
                            FontWeight.bold),
                        InkWell(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('iconHasil', 'iconHasil');
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HasilPemeriksaanSpirometri(
                                    idPasien: widget.idPasien!);
                              }));
                            },
                            child: Icon(Icons.upload_file))
                      ],
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Pemeriksaan Treadmill", Colors.black, 14,
                            FontWeight.bold),
                        InkWell(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('iconHasil', 'iconHasil');
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HasilPemeriksaanTreadmill(
                                    idPasien: widget.idPasien!);
                              }));
                            },
                            child: Icon(Icons.upload_file))
                      ],
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Pemeriksaan Laboratorium", Colors.black,
                            14, FontWeight.bold),
                        InkWell(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('iconHasil', 'iconHasil');
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HasilPemeriksaanLaboratorium1(
                                    idPasien: widget.idPasien!);
                              }));
                            },
                            child: Icon(Icons.upload_file))
                      ],
                    ),
                    Text(
                      "(note: lengkapi detail Hasil Pemeriksaan Laboratorium di halaman berikutnya)",
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 12,
                          fontStyle: FontStyle.italic),
                    ),
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
                    textDefault("Pemeriksaan X-Ray:", Colors.black, 16,
                        FontWeight.bold),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Pemeriksaan Jantung", Colors.black, 14,
                            FontWeight.bold),
                        InkWell(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('iconHasil', 'iconHasil');
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HasilPemeriksaanJantung(
                                    idPasien: widget.idPasien!);
                              }));
                            },
                            child: Icon(Icons.upload_file))
                      ],
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Pemeriksaan Paru", Colors.black, 14,
                            FontWeight.bold),
                        InkWell(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('iconHasil', 'iconHasil');
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HasilPemeriksaanParu(
                                    idPasien: widget.idPasien!);
                              }));
                            },
                            child: Icon(Icons.upload_file))
                      ],
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Pemeriksaan USG", Colors.black, 14,
                            FontWeight.bold),
                        InkWell(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('iconHasil', 'iconHasil');
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HasilPemeriksaanUsg(
                                    idPasien: widget.idPasien!);
                              }));
                            },
                            child: Icon(Icons.upload_file))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: usg,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Pemeriksaan NAPFA", Colors.black, 14,
                            FontWeight.bold),
                        InkWell(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('iconHasil', 'iconHasil');
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HasilPemeriksaanNapfa(
                                    idPasien: widget.idPasien!);
                              }));
                            },
                            child: Icon(Icons.upload_file))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: napfa,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Pemeriksaan NAPZA", Colors.black, 14,
                            FontWeight.bold),
                        InkWell(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('iconHasil', 'iconHasil');
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HasilPemeriksaanNapza(
                                    idPasien: widget.idPasien!);
                              }));
                            },
                            child: Icon(Icons.upload_file))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: napza,
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
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
                child: InkWell(
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
                          "Simpan", Colors.white, 16, FontWeight.normal),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  saveButton() async {
    PemeriksaanModel data = PemeriksaanModel(
      aktivitasFisik: aktivfisik.text,
      pemeriksaanFisik: fisik.text,
      pemeriksaanMata: mata.text,
      pemeriksaanGigiMulut: gigiMulut.text,
      pemeriksaanAudioMetri: audiometri.text,
      pemeriksaanSpirometri: spirometri.text,
      pemeriksaanTreadmill: treadmill.text,
      pemeriksaanLaboratorium: laboratorium.text,
      pemeriksaanXrayJantung: jantung.text,
      pemeriksaanUsg: usg.text,
      pemeriksaanNapfa: napfa.text,
      pemeriksaanNapza: napza.text,
      paru: paru.text,
    );

    firestore.setPemeriksaan(pemeriksaan: data, idPasien: widget.idPasien!);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("fisik", fisik.text);
    if (prefs.getString("detail1") == null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MenuForm(idPasien: widget.idPasien!);
      }));
    } else {
      prefs.remove("detail1");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return PasienDetail(idPasien: widget.idPasien!);
      }));
    }
  }
}
