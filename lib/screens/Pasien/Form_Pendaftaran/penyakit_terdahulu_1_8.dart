// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/components/colors/color.dart';
import 'package:arifa_medikal_klink_3/components/widget/text.dart';
import 'package:arifa_medikal_klink_3/model/penyakit_terdahulu_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/penyakit_keluarga_2_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/pasien_detail.dart';
import '../../../service/firebase_firestore_service.dart';

enum Question { ya, tidak }

class PenyakitTerdahulu1 extends StatefulWidget {
  const PenyakitTerdahulu1({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<PenyakitTerdahulu1> createState() => _PenyakitTerdahulu1State();
}

class _PenyakitTerdahulu1State extends State<PenyakitTerdahulu1> {
  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  int _quest = 2;
  int _quest2 = 2;
  int _quest3 = 2;
  int _quest4 = 2;
  int _quest5 = 2;
  int _quest6 = 2;
  int _quest7 = 2;
  int _quest8 = 2;
  int _quest9 = 2;
  int _quest10 = 2;
  int _quest11 = 2;

  String darahTinggi = "Tidak Ada";
  String paru = "Tidak Ada";
  String asamLambung = "Tidak Ada";
  String alergi = "Tidak Ada";
  String riwayatOperasi = "Tidak Ada";
  String riwayatKecelakaan = "Tidak Ada";
  String riwayatRawatrs = "Tidak Ada";
  String hepatitis = "Tidak Ada";
  String kencingManis = "Tidak Ada";
  String patahTulang = "Tidak Ada";
  String diabetes = "Tidak";

  final darahTinggiF = TextEditingController();
  final paruF = TextEditingController();
  final asamLambungF = TextEditingController();
  final alergiF = TextEditingController();
  final riwayatOperasiF = TextEditingController();
  final riwayatKecelakaanF = TextEditingController();
  final riwayatRawatrsF = TextEditingController();
  final hepatitisF = TextEditingController();
  final kencingManisF = TextEditingController();
  final patahTulangF = TextEditingController();
  PenyakitTerdahuluModel? _data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    _data = await firestore.getPenyakitTerdahulu(widget.idPasien!);
    if (_data != null) {
      if (_data!.darahTinggi! == "Ya") {
        setState(() {
          darahTinggi = _data!.darahTinggi!;
          _quest = 1;
        });
      } else if (_data!.darahTinggi! == "Tidak Ada") {
        setState(() {
          darahTinggi = _data!.darahTinggi!;
          _quest = 2;
        });
      } else if (_data!.darahTinggi! == "") {
        setState(() {
          darahTinggi = "";
          darahTinggiF.text = "";
          _quest = 0;
        });
      } else {
        setState(() {
          darahTinggiF.text = _data!.darahTinggi!;
        });
      }

      if (_data!.paru! == "Ya") {
        setState(() {
          paru = _data!.paru!;
          _quest2 = 1;
        });
      } else if (_data!.paru! == "Tidak Ada") {
        setState(() {
          paru = _data!.paru!;
          _quest2 = 2;
        });
      } else if (_data!.paru! == "") {
        setState(() {
          paru = "";
          paruF.text = "";
          _quest2 = 0;
        });
      } else {
        setState(() {
          paruF.text = _data!.paru!;
        });
      }

      if (_data!.asamLambung! == "Ya") {
        setState(() {
          asamLambung = _data!.asamLambung!;
          _quest3 = 1;
        });
      } else if (_data!.asamLambung! == "Tidak Ada") {
        setState(() {
          asamLambung = _data!.asamLambung!;
          _quest3 = 2;
        });
      } else if (_data!.asamLambung! == "") {
        setState(() {
          asamLambung = "";
          asamLambungF.text = "";
          _quest3 = 0;
        });
      } else {
        setState(() {
          asamLambungF.text = _data!.asamLambung!;
        });
      }

      if (_data!.alergi! == "Ya") {
        setState(() {
          alergi = _data!.alergi!;
          _quest4 = 1;
        });
      } else if (_data!.alergi! == "Tidak Ada") {
        setState(() {
          alergi = _data!.alergi!;
          _quest4 = 2;
        });
      } else if (_data!.alergi! == "") {
        setState(() {
          alergi = "";
          alergiF.text = "";
          _quest4 = 0;
        });
      } else {
        setState(() {
          alergiF.text = _data!.alergi!;
        });
      }

      if (_data!.riwayatOperasi! == "Ya") {
        setState(() {
          riwayatOperasi = _data!.riwayatOperasi!;
          _quest5 = 1;
        });
      } else if (_data!.riwayatOperasi! == "Tidak Ada") {
        setState(() {
          riwayatOperasi = _data!.riwayatOperasi!;
          _quest5 = 2;
        });
      } else if (_data!.riwayatOperasi! == "") {
        setState(() {
          riwayatOperasi = "";
          riwayatOperasiF.text = "";
          _quest5 = 0;
        });
      } else {
        setState(() {
          riwayatOperasiF.text = _data!.riwayatOperasi!;
        });
      }

      if (_data!.riwayatKecelakaan! == "Ya") {
        setState(() {
          riwayatKecelakaan = _data!.riwayatKecelakaan!;
          _quest6 = 1;
        });
      } else if (_data!.riwayatKecelakaan! == "Tidak Ada") {
        setState(() {
          riwayatKecelakaan = _data!.riwayatKecelakaan!;
          _quest6 = 2;
        });
      } else if (_data!.riwayatKecelakaan! == "") {
        setState(() {
          riwayatKecelakaan = "";
          riwayatKecelakaanF.text = "";
          _quest6 = 0;
        });
      } else {
        setState(() {
          riwayatKecelakaanF.text = _data!.riwayatKecelakaan!;
        });
      }

      if (_data!.riwayatRawatRs! == "Ya") {
        setState(() {
          riwayatRawatrs = _data!.riwayatRawatRs!;
          _quest7 = 1;
        });
      } else if (_data!.riwayatRawatRs! == "Tidak Ada") {
        setState(() {
          riwayatRawatrs = _data!.riwayatRawatRs!;
          _quest7 = 2;
        });
      } else if (_data!.riwayatRawatRs! == "") {
        setState(() {
          riwayatRawatrs = "";
          riwayatRawatrsF.text = "";
          _quest7 = 0;
        });
      } else {
        setState(() {
          riwayatRawatrsF.text = _data!.riwayatRawatRs!;
        });
      }

      if (_data!.hepatitis! == "Ya") {
        setState(() {
          hepatitis = _data!.hepatitis!;
          _quest8 = 1;
        });
      } else if (_data!.hepatitis! == "Tidak Ada") {
        setState(() {
          hepatitis = _data!.hepatitis!;
          _quest8 = 2;
        });
      } else if (_data!.hepatitis! == "") {
        setState(() {
          hepatitis = "";
          hepatitisF.text = "";
          _quest8 = 0;
        });
      } else {
        setState(() {
          hepatitisF.text = _data!.hepatitis!;
        });
      }

      if (_data!.kencingManis! == "Ya") {
        setState(() {
          kencingManis = _data!.kencingManis!;
          _quest9 = 1;
        });
      } else if (_data!.kencingManis! == "Tidak Ada") {
        setState(() {
          kencingManis = _data!.kencingManis!;
          _quest9 = 2;
        });
      } else if (_data!.kencingManis! == "") {
        setState(() {
          kencingManis = "";
          kencingManisF.text = "";
          _quest9 = 0;
        });
      } else {
        setState(() {
          kencingManisF.text = _data!.kencingManis!;
        });
      }

      if (_data!.patahTulang! == "Ya") {
        setState(() {
          patahTulang = _data!.patahTulang!;
          _quest10 = 1;
        });
      } else if (_data!.patahTulang! == "Tidak Ada") {
        setState(() {
          patahTulang = _data!.patahTulang!;
          _quest10 = 2;
        });
      } else if (_data!.patahTulang! == "") {
        setState(() {
          patahTulang = "";
          patahTulangF.text = "";
          _quest10 = 0;
        });
      } else {
        setState(() {
          patahTulangF.text = _data!.patahTulang!;
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
            textDefault("Riwayat Penyakit Terdahulu", Colors.white, 16,
                FontWeight.bold),
            SizedBox(
              width: 5,
            ),
          ]),
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          textDefault("1/8", Colors.black, 14, FontWeight.bold)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 10,
                            width: 40,
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
                        height: 10,
                      ),
                      textDefault(
                          "Darah Tinggi", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _quest,
                            onChanged: (value) {
                              setState(() {
                                _quest = value!;
                                darahTinggi = "Ya";
                                darahTinggiF.text = "";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: 2,
                            groupValue: _quest,
                            onChanged: (value) {
                              setState(() {
                                _quest = value!;
                                darahTinggi = "Tidak Ada";
                                darahTinggiF.text = "";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
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
                                  _quest = 0;
                                });
                              },
                              controller: darahTinggiF,
                              maxLength: 12,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textDefault("Penyakit Paru (Asma, TBC, dll)",
                          Colors.black, 16, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _quest2,
                            onChanged: (value) {
                              setState(() {
                                _quest2 = value!;
                                paruF.text = "";
                                paru = "Ya";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: 2,
                            groupValue: _quest2,
                            onChanged: (value) {
                              setState(() {
                                paruF.text = "";
                                _quest2 = value!;
                                paru = "Tidak Ada";
                                print(paru);
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
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
                                  _quest2 = 0;
                                });
                              },
                              controller: paruF,
                              maxLength: 12,
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
                          "Asam Lambung", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _quest3,
                            onChanged: (value) {
                              setState(() {
                                asamLambungF.text = "";
                                _quest3 = value!;
                                asamLambung = "Ya";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: 2,
                            groupValue: _quest3,
                            onChanged: (value) {
                              setState(() {
                                _quest3 = value!;
                                asamLambungF.text = "";
                                asamLambung = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
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
                                  _quest3 = 0;
                                });
                              },
                              controller: asamLambungF,
                              maxLength: 12,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textDefault("Alergi", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _quest4,
                            onChanged: (value) {
                              setState(() {
                                _quest4 = value!;
                                alergiF.text = "";
                                alergi = "Ya";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: 2,
                            groupValue: _quest4,
                            onChanged: (value) {
                              setState(() {
                                alergiF.text = "";
                                _quest4 = value!;
                                alergi = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
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
                                  _quest4 = 0;
                                });
                              },
                              controller: alergiF,
                              maxLength: 12,
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
                          "Riwayat Operasi", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _quest5,
                            onChanged: (value) {
                              setState(() {
                                riwayatOperasiF.text = "";
                                _quest5 = value!;
                                riwayatOperasi = "Ya";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: 2,
                            groupValue: _quest5,
                            onChanged: (value) {
                              setState(() {
                                riwayatOperasiF.text = "";
                                _quest5 = value!;
                                riwayatOperasi = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
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
                                  _quest5 = 0;
                                });
                              },
                              controller: riwayatOperasiF,
                              maxLength: 12,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textDefault("Riwayat Kecelakaan", Colors.black, 14,
                          FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _quest6,
                            onChanged: (value) {
                              setState(() {
                                riwayatKecelakaanF.text = "";
                                _quest6 = value!;
                                riwayatKecelakaan = "Ya";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: 2,
                            groupValue: _quest6,
                            onChanged: (value) {
                              setState(() {
                                riwayatKecelakaanF.text = "";
                                _quest6 = value!;
                                riwayatKecelakaan = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
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
                                  _quest6 = 0;
                                });
                              },
                              controller: riwayatKecelakaanF,
                              maxLength: 12,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textDefault("Riwayat Rawat RS", Colors.black, 14,
                          FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _quest7,
                            onChanged: (value) {
                              setState(() {
                                riwayatRawatrsF.text = "";
                                _quest7 = value!;
                                riwayatRawatrs = "Ya";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: 2,
                            groupValue: _quest7,
                            onChanged: (value) {
                              setState(() {
                                riwayatRawatrsF.text = "";
                                _quest7 = value!;
                                riwayatRawatrs = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
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
                                  _quest7 = 0;
                                });
                              },
                              controller: riwayatRawatrsF,
                              maxLength: 12,
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
                          "Hepatitis", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _quest8,
                            onChanged: (value) {
                              setState(() {
                                hepatitisF.text = "";
                                _quest8 = value!;
                                hepatitis = "Ya";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: 2,
                            groupValue: _quest8,
                            onChanged: (value) {
                              setState(() {
                                hepatitisF.text = "";
                                _quest8 = value!;
                                hepatitis = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
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
                                  _quest8 = 0;
                                });
                              },
                              controller: hepatitisF,
                              maxLength: 12,
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
                          "Kencing Manis", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _quest9,
                            onChanged: (value) {
                              setState(() {
                                kencingManisF.text = "";
                                _quest9 = value!;
                                kencingManis = "Ya";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: 2,
                            groupValue: _quest9,
                            onChanged: (value) {
                              setState(() {
                                kencingManisF.text = "";
                                _quest9 = value!;
                                kencingManis = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
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
                                  _quest9 = 0;
                                });
                              },
                              controller: kencingManisF,
                              maxLength: 12,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textDefault("Patah Tulang (terpasang PEN)", Colors.black,
                          16, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _quest10,
                            onChanged: (value) {
                              setState(() {
                                patahTulangF.text = "";
                                _quest10 = value!;
                                patahTulang = "Ya";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: 2,
                            groupValue: _quest10,
                            onChanged: (value) {
                              setState(() {
                                patahTulangF.text = "";
                                _quest10 = value!;
                                patahTulang = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
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
                                  _quest10 = 0;
                                });
                              },
                              controller: patahTulangF,
                              maxLength: 12,
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
                          "Diabetes", Colors.black, 16, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _quest11,
                            onChanged: (value) {
                              setState(() {
                                _quest11 = value!;
                                diabetes = "Ya";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: 2,
                            groupValue: _quest11,
                            onChanged: (value) {
                              setState(() {
                                _quest11 = value!;
                                diabetes = "Tidak";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak", Colors.black, 13, FontWeight.normal),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  )),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(color: Colors.grey, blurRadius: 2)
                  ]),
                  child: InkWell(
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
                            "Simpan", Colors.white, 16, FontWeight.normal),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void saveButton() async {
    darahTinggi = darahTinggiF.text != "" ? darahTinggiF.text : darahTinggi;
    paru = paruF.text != "" ? paruF.text : paru;
    asamLambung = asamLambungF.text != "" ? asamLambungF.text : asamLambung;
    alergi = alergiF.text != "" ? alergiF.text : alergi;
    riwayatOperasi =
        riwayatOperasiF.text != "" ? riwayatOperasiF.text : riwayatOperasi;
    riwayatRawatrs =
        riwayatRawatrsF.text != "" ? riwayatRawatrsF.text : riwayatRawatrs;
    riwayatKecelakaan = riwayatKecelakaanF.text != ""
        ? riwayatKecelakaanF.text
        : riwayatKecelakaan;
    hepatitis = hepatitisF.text != "" ? hepatitisF.text : hepatitis;
    kencingManis = kencingManisF.text != "" ? kencingManisF.text : kencingManis;
    patahTulang = patahTulangF.text != "" ? patahTulangF.text : patahTulang;

    PenyakitTerdahuluModel data = PenyakitTerdahuluModel(
      darahTinggi: darahTinggi,
      paru: paru,
      asamLambung: asamLambung,
      alergi: alergi,
      riwayatOperasi: riwayatOperasi,
      riwayatKecelakaan: riwayatOperasi,
      riwayatRawatRs: riwayatRawatrs,
      hepatitis: hepatitis,
      kencingManis: kencingManis,
      patahTulang: patahTulang,
      diabetes: diabetes,
    );

    firestore.setPenyakitTerdahulu(data, widget.idPasien!);

    SharedPreferences prefs = await SharedPreferences.getInstance();
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
