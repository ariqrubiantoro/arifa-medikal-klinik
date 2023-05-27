// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:arifa_medikal_klink_3/model/pemeriksaan_refleks_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_kelenjar_getah.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/pasien_detail.dart';
import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak }

class PemeriksaanRefleks extends StatefulWidget {
  const PemeriksaanRefleks({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<PemeriksaanRefleks> createState() => _PemeriksaanRefleksState();
}

class _PemeriksaanRefleksState extends State<PemeriksaanRefleks> {
  int _quest1 = 0;
  int _quest2 = 0;
  int _quest3 = 0;

  String strPupil = "Normal";
  String strPatella = "Normal";
  String strAchilles = "Normal";

  final strPupilF = TextEditingController();
  final strPatellaF = TextEditingController();
  final strAchillesF = TextEditingController();

  final bicepsKanan = TextEditingController();
  final bicepsKiri = TextEditingController();
  final tricepsKanan = TextEditingController();
  final tricepsKiri = TextEditingController();
  final babinskyKanan = TextEditingController();
  final babinskyKiri = TextEditingController();

  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  PemeriksaanRefleksModel? data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    data = await firestore.getPemeriksaanRefleks(widget.idPasien!);
    if (data != null) {
      setState(() {
        bicepsKanan.text = data!.pupil!.bicepsKanan!;
        bicepsKiri.text = data!.pupil!.bicepsKiri!;
        tricepsKanan.text = data!.patella!.tricepsKanan!;
        tricepsKiri.text = data!.patella!.tricepsKiri!;
        babinskyKanan.text = data!.achilles!.babinskiKanan!;
        babinskyKiri.text = data!.achilles!.babinskiKiri!;
      });
      if (data!.pupil!.pupil! == "Normal") {
        setState(() {
          strPupil = data!.pupil!.pupil!;
          _quest1 = 1;
        });
      } else if (data!.pupil!.pupil! == "Tidak Normal") {
        setState(() {
          strPupil = data!.pupil!.pupil!;
          _quest1 = 2;
        });
      } else if (data!.pupil!.pupil! == "") {
      } else {
        setState(() {
          strPupilF.text = data!.pupil!.pupil!;
        });
      }

      if (data!.patella!.patella! == "Normal") {
        setState(() {
          strPatella = data!.patella!.patella!;
          _quest2 = 1;
        });
      } else if (data!.patella!.patella! == "Tidak Normal") {
        setState(() {
          strPatella = data!.patella!.patella!;
          _quest2 = 2;
        });
      } else if (data!.patella!.patella! == "") {
      } else {
        setState(() {
          strPatellaF.text = data!.patella!.patella!;
        });
      }

      if (data!.achilles!.acciles! == "Normal") {
        setState(() {
          strAchilles = data!.achilles!.acciles!;
          _quest3 = 1;
        });
      } else if (data!.achilles!.acciles! == "Tidak Normal") {
        setState(() {
          strAchilles = data!.achilles!.acciles!;
          _quest3 = 2;
        });
      } else if (data!.achilles!.acciles! == "") {
      } else {
        setState(() {
          strAchillesF.text = data!.achilles!.acciles!;
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
            textDefault("Keadaan Umum - Pemeriksaan Refleks", Colors.white, 16,
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
                    pupil(),
                    Divider(
                      thickness: 1,
                    ),
                    patella(),
                    Divider(
                      thickness: 1,
                    ),
                    achilles()
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

  Widget pupil() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textDefault("Pupil", Colors.black, 14, FontWeight.bold),
        Row(
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: _quest1,
              onChanged: (value) {
                setState(() {
                  strPupilF.text = "";
                  _quest1 = value!;
                  strPupil = "Normal";
                });
              },
            ),
            textDefault("Normal", Colors.black, 13, FontWeight.normal),
            Radio(
              value: 2,
              groupValue: _quest1,
              onChanged: (value) {
                setState(() {
                  strPupilF.text = "";
                  _quest1 = value!;
                  strPupil = "Tidak Normal";
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
                    _quest1 = 0;
                  });
                },
                controller: strPupilF,
                maxLength: 12,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ))
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              width: 120,
              child: textDefault(
                  "Biceps kanan", Colors.black, 14, FontWeight.normal),
            ),
            textDefault(":  ", Colors.black, 14, FontWeight.normal),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                    controller: bicepsKanan,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              width: 120,
              child: textDefault(
                  "Biceps Kiri", Colors.black, 14, FontWeight.normal),
            ),
            textDefault(":  ", Colors.black, 14, FontWeight.normal),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                    controller: bicepsKiri,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget patella() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textDefault("Patella", Colors.black, 14, FontWeight.bold),
        Row(
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: _quest2,
              onChanged: (value) {
                setState(() {
                  strPatellaF.text = "";
                  _quest2 = value!;
                  strPatella = "Normal";
                });
              },
            ),
            textDefault("Normal", Colors.black, 13, FontWeight.normal),
            Radio(
              value: 2,
              groupValue: _quest2,
              onChanged: (value) {
                setState(() {
                  strPatellaF.text = "";
                  _quest2 = value!;
                  strPatella = "Tidak Normal";
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
                    _quest2 = 0;
                  });
                },
                controller: strPatellaF,
                maxLength: 12,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ))
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              width: 120,
              child: textDefault(
                  "Triceps kanan", Colors.black, 14, FontWeight.normal),
            ),
            textDefault(":  ", Colors.black, 14, FontWeight.normal),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                    controller: tricepsKanan,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              width: 120,
              child: textDefault(
                  "Triceps Kiri", Colors.black, 14, FontWeight.normal),
            ),
            textDefault(":  ", Colors.black, 14, FontWeight.normal),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                    controller: tricepsKiri,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget achilles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textDefault("Achilles", Colors.black, 14, FontWeight.bold),
        Row(
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: _quest3,
              onChanged: (value) {
                setState(() {
                  strAchillesF.text = "";
                  _quest3 = value!;
                  strAchilles = "Normal";
                });
              },
            ),
            textDefault("Normal", Colors.black, 13, FontWeight.normal),
            Radio(
              value: 2,
              groupValue: _quest3,
              onChanged: (value) {
                setState(() {
                  strAchillesF.text = "";
                  _quest3 = value!;
                  strAchilles = "Tidak Normal";
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
                    _quest3 = 0;
                  });
                },
                controller: strAchillesF,
                maxLength: 12,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ))
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              width: 120,
              child: textDefault(
                  "Babinsky kanan", Colors.black, 14, FontWeight.normal),
            ),
            textDefault(":  ", Colors.black, 14, FontWeight.normal),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                    controller: babinskyKanan,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              width: 120,
              child: textDefault(
                  "Babinsky Kiri", Colors.black, 14, FontWeight.normal),
            ),
            textDefault(":  ", Colors.black, 14, FontWeight.normal),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                    controller: babinskyKiri,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  saveButton() async {
    strPupil = strPupilF.text != "" ? strPupilF.text : strPupil;
    strPatella = strPatellaF.text != "" ? strPatellaF.text : strPatella;
    strAchilles = strAchillesF.text != "" ? strAchillesF.text : strAchilles;

    PemeriksaanRefleksModel data = PemeriksaanRefleksModel(
      pupil: PupilModel(
        pupil: strPupil,
        bicepsKanan: bicepsKanan.text,
        bicepsKiri: bicepsKiri.text,
      ),
      patella: PatellaModel(
        patella: strPatella,
        tricepsKanan: tricepsKanan.text,
        tricepsKiri: tricepsKiri.text,
      ),
      achilles: AchillesModel(
        acciles: strAchilles,
        babinskiKanan: babinskyKanan.text,
        babinskiKiri: babinskyKiri.text,
      ),
    );

    firestore.setPemeriksaanRefleks(
        pemeriksaanRefleks: data, idPasien: widget.idPasien!);

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
