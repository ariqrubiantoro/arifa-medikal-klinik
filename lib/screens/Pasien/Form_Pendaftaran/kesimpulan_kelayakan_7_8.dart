// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:arifa_medikal_klink_3/model/kelayakan_kerja_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/kesimpulan_derajat_8_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/pasien_detail.dart';
import '../../../components/colors/color.dart';
import '../../../components/widget/text.dart';

enum Question { ya, tidak, none }

class KesimpulanKelayakan7 extends StatefulWidget {
  const KesimpulanKelayakan7({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<KesimpulanKelayakan7> createState() => _KesimpulanKelayakan7State();
}

class _KesimpulanKelayakan7State extends State<KesimpulanKelayakan7> {
  Question _quest1 = Question.tidak;
  Question _quest2 = Question.tidak;
  Question _quest3 = Question.tidak;
  Question _quest4 = Question.tidak;

  String layakBekerjaTanpaCatatan = "Tidak";
  String layakBekerjaDenganCatatan = "Tidak";
  String layakBekerjaDenganPenyesuaian = "Tidak";
  String layakUntukBekerja = "Tidak";
  TextEditingController layakBekerjaTanpaCatatanController =
      TextEditingController();
  TextEditingController layakBekerjaDenganCatatanController =
      TextEditingController();
  TextEditingController layakBekerjaDenganPenyesuaianController =
      TextEditingController();
  TextEditingController layakUntukBekerjaController = TextEditingController();

  final cardiovaskuler = TextEditingController();

  final FirebaseFirestoreService firestore = FirebaseFirestoreService();
  KelayakanKerjaModel? data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    data = await firestore.getKelayakanKerja(widget.idPasien!);
    if (data != null) {
      setState(() {
        cardiovaskuler.text = data!.resikoCardioVascular!;
      });
      if (data!.layakBekerjaSesuaiPosisi! == "Ya") {
        setState(() {
          layakBekerjaTanpaCatatan = data!.layakBekerjaSesuaiPosisi!;
          _quest1 = Question.ya;
        });
      } else if (data!.layakBekerjaSesuaiPosisi! == "Tidak") {
        setState(() {
          layakBekerjaTanpaCatatan = data!.layakBekerjaSesuaiPosisi!;
          _quest1 = Question.tidak;
        });
      }
      if (data!.layakBekerjaSesuaiPosisi! == "") {
      } else {
        setState(() {
          layakBekerjaTanpaCatatanController.text =
              data!.layakBekerjaSesuaiPosisi!;
        });
      }

      if (data!.layakBekerjaDenganCatatan! == "Ya") {
        setState(() {
          layakBekerjaDenganCatatan = data!.layakBekerjaDenganCatatan!;
          _quest2 = Question.ya;
        });
      } else if (data!.layakBekerjaDenganCatatan! == "Tidak") {
        setState(() {
          layakBekerjaDenganCatatan = data!.layakBekerjaDenganCatatan!;
          _quest2 = Question.tidak;
        });
      }
      if (data!.layakBekerjaDenganCatatan! == "") {
      } else {
        setState(() {
          layakBekerjaTanpaCatatanController.text =
              data!.layakBekerjaDenganCatatan!;
        });
      }

      if (data!.layakBekerjaDenganPenyesuaian! == "Ya") {
        setState(() {
          layakBekerjaDenganPenyesuaian = data!.layakBekerjaDenganPenyesuaian!;
          _quest3 = Question.ya;
        });
      } else if (data!.layakBekerjaDenganPenyesuaian! == "Tidak") {
        setState(() {
          layakBekerjaDenganPenyesuaian = data!.layakBekerjaDenganPenyesuaian!;
          _quest3 = Question.tidak;
        });
      }
      if (data!.layakBekerjaDenganPenyesuaian! == "") {
      } else {
        setState(() {
          layakBekerjaDenganPenyesuaianController.text =
              data!.layakBekerjaDenganPenyesuaian!;
        });
      }

      if (data!.layakuntukBekerja! == "Ya") {
        setState(() {
          layakUntukBekerja = data!.layakuntukBekerja!;
          _quest4 = Question.ya;
        });
      } else if (data!.layakuntukBekerja! == "Tidak") {
        setState(() {
          layakUntukBekerja = data!.layakuntukBekerja!;
          _quest4 = Question.tidak;
        });
      }
      if (data!.layakuntukBekerja! == "") {
      } else {
        setState(() {
          layakUntukBekerjaController.text = data!.layakuntukBekerja!;
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
            textDefault("Kesimpulan Kelayakan Kerja", Colors.white, 16,
                FontWeight.bold),
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
                        textDefault("7/8", Colors.black, 14, FontWeight.bold)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 300,
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
                        "Layak Bekerja Sesuai Posisi dan Lokasi Saat Ini",
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
                              layakBekerjaTanpaCatatan = "Ya";
                              layakBekerjaTanpaCatatanController.text = "";
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
                              layakBekerjaTanpaCatatan = "Tidak";
                              layakBekerjaTanpaCatatanController.text = "";
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
                                  _quest1 = Question.none;
                                });
                              },
                              controller: layakBekerjaTanpaCatatanController,
                              maxLength: 12,
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
                    textDefault(
                        "Layak Bekerja Sesuai Posisi dan Lokasi Saat Ini, dengan Catatan",
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
                              layakBekerjaDenganCatatan = "Ya";
                              layakBekerjaDenganCatatanController.text = "";
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
                              layakBekerjaDenganCatatan = "Tidak";
                              layakBekerjaDenganCatatanController.text = "";
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
                                  _quest2 = Question.none;
                                });
                              },
                              controller: layakBekerjaDenganCatatanController,
                              maxLength: 12,
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
                    textDefault(
                        "Layak Bekerja dengan Penyesuaian dan atau Pembatasan Kerja",
                        Colors.black,
                        14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              layakBekerjaDenganPenyesuaian = "Ya";
                              layakBekerjaDenganPenyesuaianController.text = "";
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
                              layakBekerjaDenganPenyesuaian = "Tidak";
                              layakBekerjaDenganPenyesuaianController.text = "";
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
                                  _quest3 = Question.none;
                                });
                              },
                              controller:
                                  layakBekerjaDenganPenyesuaianController,
                              maxLength: 12,
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
                    textDefault("Layak untuk Bekerja", Colors.black, 14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              _quest4 = value!;
                              layakUntukBekerja = "Ya";
                              layakUntukBekerjaController.text = "";
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
                              layakUntukBekerja = "Tidak";
                              layakUntukBekerjaController.text = "";
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
                                  _quest4 = Question.none;
                                });
                              },
                              controller: layakUntukBekerjaController,
                              maxLength: 12,
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
                    textDefault("Resiko Cardiovaskuler", Colors.black, 14,
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
                        controller: cardiovaskuler,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
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
    KelayakanKerjaModel data = KelayakanKerjaModel(
      layakBekerjaSesuaiPosisi: layakBekerjaTanpaCatatanController.text != ""
          ? layakBekerjaTanpaCatatanController.text
          : layakBekerjaTanpaCatatan,
      layakBekerjaDenganCatatan: layakBekerjaDenganCatatanController.text != ""
          ? layakBekerjaDenganCatatanController.text
          : layakBekerjaDenganCatatan,
      layakBekerjaDenganPenyesuaian:
          layakBekerjaDenganPenyesuaianController.text != ""
              ? layakBekerjaDenganPenyesuaianController.text
              : layakBekerjaDenganPenyesuaian,
      layakuntukBekerja: layakUntukBekerjaController.text != ""
          ? layakUntukBekerjaController.text
          : layakUntukBekerja,
      resikoCardioVascular: cardiovaskuler.text,
    );

    firestore.setKelayakanKerja(
        kelayakanKerja: data, idPasien: widget.idPasien!);

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
