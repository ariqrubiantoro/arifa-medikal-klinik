// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:arifa_medikal_klink_3/model/pemeriksaan_rongga_dada_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_rongga_perut.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/pasien_detail.dart';
import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak }

class PemeriksaanRonggaDada extends StatefulWidget {
  const PemeriksaanRonggaDada({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<PemeriksaanRonggaDada> createState() => _PemeriksaanRonggaDadaState();
}

class _PemeriksaanRonggaDadaState extends State<PemeriksaanRonggaDada> {
  int _questJantung1 = 0;
  int _questJantung2 = 0;
  int _questJantung3 = 0;
  int _questJantung4 = 0;
  int _questJantung5 = 0;
  int _questJantung6 = 0;

  int _questParu1 = 0;
  int _questParu2 = 0;
  int _questParu3 = 0;
  int _questParu4 = 0;
  int _questParu5 = 0;
  int _questParu6 = 0;
  int _questParu7 = 0;
  int _questParu8 = 0;

  String batasJantung = "Normal";
  String auskultasi = "Normal";
  String iktusKordis = "Normal";
  String bunyiJantung = "Normal";
  String bunyiNafas = "Ada";
  String lainlainJantung = "Normal";

  final batasJantungF = TextEditingController();
  final auskultasiF = TextEditingController();
  final iktusKordisF = TextEditingController();
  final bunyiJantungF = TextEditingController();
  final bunyiNafasF = TextEditingController();
  final lainlainJantungF = TextEditingController();

  String inpeksiKanan = "Normal";
  String inpeksiKiri = "Normal";
  String palpasiKanan = "Normal";
  String palpasiKiri = "Normal";
  String perkusiKanan = "Normal";
  String perkusiKiri = "Normal";
  String auskultasiKanan = "Normal";
  String auskultasiKiri = "Normal";

  final inpeksiKananF = TextEditingController();
  final inpeksiKiriF = TextEditingController();
  final palpasiKananF = TextEditingController();
  final palpasiKiriF = TextEditingController();
  final perkusiKananF = TextEditingController();
  final perkusiKiriF = TextEditingController();
  final auskultasiKananF = TextEditingController();
  final auskultasiKiriF = TextEditingController();

  bool tapJantung = false;
  bool tapParu = false;

  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  PemeriksaanRonggaDadaModel? data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    data = await firestore.getPemeriksaanRonggaDada(widget.idPasien!);
    if (data != null) {
      if (data!.jantung!.batasBatasJantung! == 'Normal') {
        setState(() {
          batasJantung = "Normal";
          _questJantung1 = 1;
        });
      } else if (data!.jantung!.batasBatasJantung! == 'Tidak Normal') {
        setState(() {
          batasJantung = "Tidak Normal";
          _questJantung1 = 2;
        });
      } else if (data!.jantung!.batasBatasJantung! == '') {
      } else {
        setState(() {
          batasJantungF.text = data!.jantung!.batasBatasJantung!;
        });
      }

      if (data!.jantung!.auskultasi! == 'Normal') {
        setState(() {
          auskultasi = "Normal";
          _questJantung2 = 1;
        });
      } else if (data!.jantung!.auskultasi! == 'Tidak Normal') {
        setState(() {
          auskultasi = "Tidak Normal";
          _questJantung2 = 2;
        });
      } else if (data!.jantung!.auskultasi! == '') {
      } else {
        setState(() {
          auskultasiF.text = data!.jantung!.auskultasi!;
        });
      }
    }

    if (data!.jantung!.iktusKordis! == 'Normal') {
      setState(() {
        iktusKordis = "Normal";
        _questJantung3 = 1;
      });
    } else if (data!.jantung!.iktusKordis! == 'Tidak Normal') {
      setState(() {
        iktusKordis = "Tidak Normal";
        _questJantung3 = 2;
      });
    } else if (data!.jantung!.iktusKordis! == '') {
    } else {
      setState(() {
        iktusKordisF.text = data!.jantung!.iktusKordis!;
      });
    }

    if (data!.jantung!.bunyiJantung! == 'Normal') {
      setState(() {
        bunyiJantung = "Normal";
        _questJantung4 = 1;
      });
    } else if (data!.jantung!.bunyiJantung! == 'Tidak Normal') {
      setState(() {
        bunyiJantung = "Tidak Normal";
        _questJantung4 = 2;
      });
    } else if (data!.jantung!.bunyiJantung! == '') {
    } else {
      setState(() {
        bunyiJantungF.text = data!.jantung!.bunyiJantung!;
      });
    }

    if (data!.jantung!.bunyuNafas! == 'Ada') {
      setState(() {
        bunyiNafas = "Ada";
        _questJantung5 = 1;
      });
    } else if (data!.jantung!.bunyuNafas! == 'Tidak Ada') {
      setState(() {
        bunyiNafas = "Tidak Ada";
        _questJantung5 = 2;
      });
    } else if (data!.jantung!.bunyuNafas! == '') {
    } else {
      setState(() {
        bunyiNafasF.text = data!.jantung!.bunyuNafas!;
      });
    }

    if (data!.jantung!.lainLain! == 'Normal') {
      setState(() {
        lainlainJantung = "Normal";
        _questJantung6 = 1;
      });
    } else if (data!.jantung!.lainLain! == 'Tidak Normal') {
      setState(() {
        lainlainJantung = "Tidak Normal";
        _questJantung6 = 2;
      });
    } else if (data!.jantung!.lainLain! == '') {
    } else {
      setState(() {
        lainlainJantungF.text = data!.jantung!.lainLain!;
      });
    }

    if (data!.paru!.inspeksiKanan! == 'Normal') {
      setState(() {
        inpeksiKanan = "Normal";
        _questParu1 = 1;
      });
    } else if (data!.paru!.inspeksiKanan! == 'Tidak Normal') {
      setState(() {
        inpeksiKanan = "Tidak Normal";
        _questParu1 = 2;
      });
    } else if (data!.paru!.inspeksiKanan! == '') {
    } else {
      setState(() {
        inpeksiKananF.text = data!.paru!.inspeksiKanan!;
      });
    }

    if (data!.paru!.inspeksiKiri! == 'Normal') {
      setState(() {
        inpeksiKiri = "Normal";
        _questParu2 = 1;
      });
    } else if (data!.paru!.inspeksiKiri! == 'Tidak Normal') {
      setState(() {
        inpeksiKiri = "Tidak Normal";
        _questParu2 = 2;
      });
    } else if (data!.paru!.inspeksiKiri! == '') {
    } else {
      setState(() {
        inpeksiKiriF.text = data!.paru!.inspeksiKiri!;
      });
    }

    if (data!.paru!.palpasiKanan! == 'Normal') {
      setState(() {
        palpasiKanan = "Normal";
        _questParu3 = 1;
      });
    } else if (data!.paru!.palpasiKanan! == 'Tidak Normal') {
      setState(() {
        palpasiKanan = "Tidak Normal";
        _questParu3 = 2;
      });
    } else if (data!.paru!.palpasiKanan! == '') {
    } else {
      setState(() {
        palpasiKananF.text = data!.paru!.palpasiKanan!;
      });
    }

    if (data!.paru!.palpasiKiri! == 'Normal') {
      setState(() {
        palpasiKiri = "Normal";
        _questParu4 = 1;
      });
    } else if (data!.paru!.palpasiKiri! == 'Tidak Normal') {
      setState(() {
        palpasiKiri = "Tidak Normal";
        _questParu4 = 2;
      });
    } else if (data!.paru!.palpasiKiri! == '') {
    } else {
      setState(() {
        palpasiKiriF.text = data!.paru!.palpasiKiri!;
      });
    }

    if (data!.paru!.perkusiKanan! == 'Normal') {
      setState(() {
        perkusiKanan = "Normal";
        _questParu5 = 1;
      });
    } else if (data!.paru!.perkusiKanan! == 'Tidak Normal') {
      setState(() {
        perkusiKanan = "Tidak Normal";
        _questParu5 = 2;
      });
    } else if (data!.paru!.perkusiKanan! == '') {
    } else {
      setState(() {
        perkusiKananF.text = data!.paru!.perkusiKanan!;
      });
    }

    if (data!.paru!.perkusiKiri! == 'Normal') {
      setState(() {
        perkusiKiri = "Normal";
        _questParu6 = 1;
      });
    } else if (data!.paru!.perkusiKiri! == 'Tidak Normal') {
      setState(() {
        perkusiKiri = "Tidak Normal";
        _questParu6 = 2;
      });
    } else if (data!.paru!.perkusiKiri! == '') {
    } else {
      setState(() {
        perkusiKiriF.text = data!.paru!.perkusiKiri!;
      });
    }

    if (data!.paru!.auskultasiKanan! == 'Normal') {
      setState(() {
        auskultasi = "Normal";
        _questParu7 = 1;
      });
    } else if (data!.paru!.auskultasiKanan! == 'Tidak Normal') {
      setState(() {
        auskultasi = "Tidak Normal";
        _questParu7 = 2;
      });
    } else if (data!.paru!.auskultasiKanan! == '') {
    } else {
      setState(() {
        auskultasiF.text = data!.paru!.auskultasiKanan!;
      });
    }

    if (data!.paru!.auskultasiKiri! == 'Normal') {
      setState(() {
        auskultasiKiri = "Normal";
        _questParu8 = 1;
      });
    } else if (data!.paru!.auskultasiKiri! == 'Tidak Normal') {
      setState(() {
        auskultasiKiri = "Tidak Normal";
        _questParu8 = 2;
      });
    } else if (data!.paru!.auskultasiKiri! == '') {
    } else {
      setState(() {
        auskultasiKiriF.text = data!.paru!.auskultasiKiri!;
      });
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
        backgroundColor: Colors.white,
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
            textDefault("Keadaan Umum - Pemeriksaan Rongga Dada", Colors.white,
                16, FontWeight.bold),
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
                            tapJantung = !tapJantung;
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
                                  "Jantung", Colors.black, 14, FontWeight.bold),
                              Icon(tapJantung
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                      ),
                      tapJantung ? jantung() : Container(),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            tapParu = !tapParu;
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
                                  "Paru", Colors.black, 14, FontWeight.bold),
                              Icon(tapParu
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                      ),
                      tapParu ? paru() : Container()
                    ],
                  ),
                ),
              )),
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

  Widget jantung() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          textDefault("Batas-Batas Jantung", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questJantung1,
                onChanged: (value) {
                  setState(() {
                    batasJantungF.text = "";
                    _questJantung1 = value!;
                    batasJantung = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questJantung1,
                onChanged: (value) {
                  setState(() {
                    batasJantungF.text = "";
                    _questJantung1 = value!;
                    batasJantung = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questJantung1 = 0;
                    });
                  },
                  controller: batasJantungF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Auskultasi", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questJantung2,
                onChanged: (value) {
                  setState(() {
                    auskultasiF.text = "";
                    _questJantung2 = value!;
                    auskultasi = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questJantung2,
                onChanged: (value) {
                  setState(() {
                    auskultasiF.text = "";
                    _questJantung2 = value!;
                    auskultasi = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questJantung2 = 0;
                    });
                  },
                  controller: auskultasiF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Iktus Kordis", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questJantung3,
                onChanged: (value) {
                  setState(() {
                    iktusKordisF.text = "";
                    _questJantung3 = value!;
                    iktusKordis = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questJantung3,
                onChanged: (value) {
                  setState(() {
                    iktusKordisF.text = "";
                    _questJantung3 = value!;
                    iktusKordis = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questJantung3 = 0;
                    });
                  },
                  controller: iktusKordisF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Bunyi Jantung", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questJantung4,
                onChanged: (value) {
                  setState(() {
                    bunyiJantungF.text = "";
                    _questJantung4 = value!;
                    bunyiJantung = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questJantung4,
                onChanged: (value) {
                  setState(() {
                    bunyiJantungF.text = "";
                    _questJantung4 = value!;
                    bunyiJantung = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questJantung4 = 0;
                    });
                  },
                  controller: bunyiJantungF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Bunyi Nafas", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questJantung5,
                onChanged: (value) {
                  setState(() {
                    bunyiNafasF.text = "";
                    _questJantung5 = value!;
                    bunyiNafas = "Ada";
                  });
                },
              ),
              textDefault("Ada", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questJantung5,
                onChanged: (value) {
                  setState(() {
                    bunyiNafasF.text = "";
                    _questJantung5 = value!;
                    bunyiNafas = "Tidak Ada";
                  });
                },
              ),
              textDefault("Tidak Ada", Colors.black, 13, FontWeight.normal),
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
                      _questJantung5 = 0;
                    });
                  },
                  controller: bunyiNafasF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Lain-Lain", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questJantung6,
                onChanged: (value) {
                  setState(() {
                    lainlainJantungF.text = "";
                    _questJantung6 = value!;
                    bunyiNafas = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questJantung6,
                onChanged: (value) {
                  setState(() {
                    lainlainJantungF.text = "";
                    _questJantung6 = value!;
                    bunyiNafas = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questJantung6 = 0;
                    });
                  },
                  controller: lainlainJantungF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Widget paru() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          textDefault("Inspeksi Kanan", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questParu1,
                onChanged: (value) {
                  setState(() {
                    inpeksiKananF.text = "";
                    _questParu1 = value!;
                    inpeksiKanan = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questParu1,
                onChanged: (value) {
                  setState(() {
                    inpeksiKananF.text = "";
                    _questParu1 = value!;
                    inpeksiKanan = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questParu1 = 0;
                    });
                  },
                  controller: inpeksiKananF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Inspeksi Kiri", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questParu2,
                onChanged: (value) {
                  setState(() {
                    inpeksiKiriF.text = "";
                    _questParu2 = value!;
                    inpeksiKiri = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questParu2,
                onChanged: (value) {
                  setState(() {
                    inpeksiKiriF.text = "";
                    _questParu2 = value!;
                    inpeksiKiri = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questParu2 = 0;
                    });
                  },
                  controller: inpeksiKiriF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Palpasi Kanan", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questParu3,
                onChanged: (value) {
                  setState(() {
                    palpasiKananF.text = "";
                    _questParu3 = value!;
                    palpasiKanan = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questParu3,
                onChanged: (value) {
                  setState(() {
                    palpasiKananF.text = "";
                    _questParu3 = value!;
                    palpasiKanan = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questParu3 = 0;
                    });
                  },
                  controller: palpasiKananF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Palpasi Kiri", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questParu4,
                onChanged: (value) {
                  setState(() {
                    palpasiKiriF.text = "";
                    _questParu4 = value!;
                    palpasiKiri = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questParu4,
                onChanged: (value) {
                  setState(() {
                    palpasiKiriF.text = "";
                    _questParu4 = value!;
                    palpasiKiri = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questParu4 = 0;
                    });
                  },
                  controller: palpasiKiriF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Perkusi Kanan", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questParu5,
                onChanged: (value) {
                  setState(() {
                    perkusiKananF.text = "";
                    _questParu5 = value!;
                    perkusiKanan = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questParu5,
                onChanged: (value) {
                  setState(() {
                    perkusiKananF.text = "";
                    _questParu5 = value!;
                    perkusiKanan = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questParu5 = 0;
                    });
                  },
                  controller: perkusiKananF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Perkusi Kiri", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questParu6,
                onChanged: (value) {
                  setState(() {
                    perkusiKiriF.text = "";
                    _questParu6 = value!;
                    perkusiKiri = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questParu6,
                onChanged: (value) {
                  setState(() {
                    perkusiKiriF.text = "";
                    _questParu6 = value!;
                    perkusiKiri = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questParu6 = 0;
                    });
                  },
                  controller: perkusiKiriF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Auskultasi Kanan", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questParu7,
                onChanged: (value) {
                  setState(() {
                    auskultasiKananF.text = "";
                    _questParu7 = value!;
                    auskultasiKanan = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questParu7,
                onChanged: (value) {
                  setState(() {
                    auskultasiKananF.text = "";
                    _questParu7 = value!;
                    auskultasiKanan = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questParu7 = 0;
                    });
                  },
                  controller: auskultasiKananF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Auskultasi Kiri", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questParu8,
                onChanged: (value) {
                  setState(() {
                    auskultasiKiriF.text = "";
                    _questParu8 = value!;
                    auskultasiKiri = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questParu8,
                onChanged: (value) {
                  setState(() {
                    auskultasiKiriF.text = "";
                    _questParu8 = value!;
                    auskultasiKiri = "Tidak Normal";
                  });
                },
              ),
              textDefault("Tidak Normal", Colors.black, 13, FontWeight.normal),
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
                      _questParu8 = 0;
                    });
                  },
                  controller: auskultasiKiriF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
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
    batasJantung = batasJantungF.text != "" ? batasJantungF.text : batasJantung;
    auskultasi = auskultasiF.text != "" ? auskultasiF.text : auskultasi;
    iktusKordis = iktusKordisF.text != "" ? iktusKordisF.text : iktusKordis;
    bunyiJantung = bunyiJantungF.text != "" ? bunyiJantungF.text : bunyiJantung;
    bunyiNafas = bunyiNafasF.text != "" ? bunyiNafasF.text : bunyiNafas;
    lainlainJantung =
        lainlainJantungF.text != "" ? lainlainJantungF.text : lainlainJantung;

    inpeksiKanan = inpeksiKananF.text != "" ? inpeksiKananF.text : inpeksiKanan;
    inpeksiKiri = inpeksiKiriF.text != "" ? inpeksiKiriF.text : inpeksiKiri;
    palpasiKanan = palpasiKananF.text != "" ? palpasiKananF.text : palpasiKanan;
    palpasiKiri = palpasiKiriF.text != "" ? palpasiKiriF.text : palpasiKiri;
    perkusiKanan = perkusiKananF.text != "" ? perkusiKananF.text : perkusiKanan;
    perkusiKiri = perkusiKiriF.text != "" ? perkusiKiriF.text : perkusiKiri;
    auskultasiKanan =
        auskultasiKananF.text != "" ? auskultasiKananF.text : auskultasiKanan;
    auskultasiKiri =
        auskultasiKiriF.text != "" ? auskultasiKiriF.text : auskultasiKiri;

    PemeriksaanRonggaDadaModel data = PemeriksaanRonggaDadaModel(
      jantung: JantungModel(
        batasBatasJantung: batasJantung,
        auskultasi: auskultasi,
        iktusKordis: iktusKordis,
        bunyiJantung: bunyiJantung,
        bunyuNafas: bunyiNafas,
        lainLain: lainlainJantung,
      ),
      paru: ParuModel(
        inspeksiKanan: inpeksiKanan,
        inspeksiKiri: inpeksiKiri,
        palpasiKanan: palpasiKanan,
        palpasiKiri: palpasiKiri,
        perkusiKanan: perkusiKanan,
        perkusiKiri: perkusiKiri,
        auskultasiKanan: auskultasiKanan,
        auskultasiKiri: auskultasiKiri,
      ),
    );

    firestore.setPemeriksaanRonggaDada(
        pemeriksaanRonggaDada: data, idPasien: widget.idPasien!);

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
