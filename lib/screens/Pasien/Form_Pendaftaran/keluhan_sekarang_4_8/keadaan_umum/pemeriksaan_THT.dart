// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/pemeriksaan_tht_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_rongga_dada.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';
import '../../../Menu_Form/menu_form.dart';

enum Question { ya, tidak }

class PemeriksaanTHT extends StatefulWidget {
  const PemeriksaanTHT({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<PemeriksaanTHT> createState() => _PemeriksaanTHTState();
}

class _PemeriksaanTHTState extends State<PemeriksaanTHT> {
  int _questTelinga1 = 0;
  int _questTelinga2 = 0;
  int _questTelinga3 = 0;
  int _questTelinga4 = 0;
  int _questTelinga5 = 0;
  int _questTelinga6 = 0;

  int _questHidung1 = 0;
  int _questHidung2 = 0;
  int _questHidung3 = 0;

  int _questKerongkongan1 = 0;
  int _questKerongkongan2 = 0;
  int _questKerongkongan3 = 0;
  int _questKerongkongan4 = 0;
  int _questKerongkongan5 = 0;

  bool tapTelinga = false;
  bool tapHidung = false;
  bool tapKerongkongan = false;

  String tympKiri = "Normal";
  String tympKanan = "Normal";
  String telingaKiri = "Normal";
  String serumenKiri = "Tidak Ada";
  String telingaKanan = "Normal";
  String serumenKanan = "Tidak Ada";

  final tympKiriF = TextEditingController();
  final tympKananF = TextEditingController();
  final telingaKiriF = TextEditingController();
  final serumenKiriF = TextEditingController();
  final telingaKananF = TextEditingController();
  final serumenKananF = TextEditingController();

  String pilek = "Tidak Ada";
  String lidah = "Normal";
  String lainlainHidung = "Normal";

  final pilekF = TextEditingController();
  final lidahF = TextEditingController();
  final lainlainHidungF = TextEditingController();

  String tonsilKanan = "Normal";
  String tonsilKiri = "Normal";
  String pharing = "Normal";
  String tiroid = "Normal";
  String lainlainKerongkongan = "Tidak Ada";

  final tonsilKanaF = TextEditingController();
  final tonsilKiriF = TextEditingController();
  final pharingF = TextEditingController();
  final tiroidF = TextEditingController();
  final lainlainKerongkonganF = TextEditingController();

  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  PemeriksaanTHTModel? data;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    data = await firestore.getPemeriksaanTHT(widget.idPasien!);
    if (data != null) {
      if (data!.telinga!.membranTympKiri == "Normal") {
        setState(() {
          tympKiri = "Normal";
          _questTelinga1 = 1;
        });
      } else if (data!.telinga!.membranTympKiri == "Tidak Normal") {
        setState(() {
          tympKiri = "Tidak Normal";
          _questTelinga1 = 2;
        });
      } else if (data!.telinga!.membranTympKiri == "") {
      } else {
        setState(() {
          tympKiriF.text = data!.telinga!.membranTympKiri!;
        });
      }

      if (data!.telinga!.membranTympKanan == "Normal") {
        setState(() {
          tympKanan = "Normal";
          _questTelinga2 = 1;
        });
      } else if (data!.telinga!.membranTympKanan == "Tidak Normal") {
        setState(() {
          tympKanan = "Tidak Normal";
          _questTelinga2 = 2;
        });
      } else if (data!.telinga!.membranTympKanan == "") {
      } else {
        setState(() {
          tympKananF.text = data!.telinga!.membranTympKanan!;
        });
      }

      if (data!.telinga!.penyakitTelingaKiri == "Normal") {
        setState(() {
          telingaKiri = "Normal";
          _questTelinga3 = 1;
        });
      } else if (data!.telinga!.penyakitTelingaKiri == "Tidak Normal") {
        setState(() {
          telingaKiri = "Tidak Normal";
          _questTelinga3 = 2;
        });
      } else if (data!.telinga!.penyakitTelingaKiri == "") {
      } else {
        setState(() {
          telingaKiriF.text = data!.telinga!.penyakitTelingaKiri!;
        });
      }

      if (data!.telinga!.serumenKiri == "Ada") {
        setState(() {
          serumenKiri = "Ada";
          _questTelinga4 = 1;
        });
      } else if (data!.telinga!.serumenKiri == "Tidak Ada") {
        setState(() {
          serumenKiri = "Tidak Ada";
          _questTelinga4 = 2;
        });
      } else if (data!.telinga!.serumenKiri == "") {
      } else {
        setState(() {
          serumenKiriF.text = data!.telinga!.serumenKiri!;
        });
      }

      if (data!.telinga!.penyakitTelingaKanan == "Normal") {
        setState(() {
          telingaKanan = "Normal";
          _questTelinga5 = 1;
        });
      } else if (data!.telinga!.penyakitTelingaKanan == "Tidak Normal") {
        setState(() {
          telingaKanan = "Tidak Normal";
          _questTelinga5 = 2;
        });
      } else if (data!.telinga!.penyakitTelingaKanan == "") {
      } else {
        setState(() {
          telingaKananF.text = data!.telinga!.penyakitTelingaKanan!;
        });
      }

      if (data!.telinga!.serumenKanan == "Ada") {
        setState(() {
          serumenKanan = "Ada";
          _questTelinga6 = 1;
        });
      } else if (data!.telinga!.serumenKanan == "Tidak Ada") {
        setState(() {
          serumenKanan = "Tidak Ada";
          _questTelinga6 = 2;
        });
      } else if (data!.telinga!.serumenKanan == "") {
      } else {
        setState(() {
          serumenKananF.text = data!.telinga!.serumenKanan!;
        });
      }

      if (data!.hidung!.pilekTersumbat == "Ya") {
        setState(() {
          pilek = "Ya";
          _questHidung1 = 1;
        });
      } else if (data!.hidung!.pilekTersumbat == "Tidak Ada") {
        setState(() {
          pilek = "Tidak Ada";
          _questHidung1 = 2;
        });
      } else if (data!.hidung!.pilekTersumbat == "") {
      } else {
        setState(() {
          pilekF.text = data!.hidung!.pilekTersumbat!;
        });
      }

      if (data!.hidung!.lidah == "Normal") {
        setState(() {
          lidah = "Normal";
          _questHidung2 = 1;
        });
      } else if (data!.hidung!.lidah == "Tidak Normal") {
        setState(() {
          lidah = "Tidak Normal";
          _questHidung2 = 2;
        });
      } else if (data!.hidung!.lidah == "") {
      } else {
        setState(() {
          lidahF.text = data!.hidung!.lidah!;
        });
      }

      if (data!.hidung!.lainLain == "Normal") {
        setState(() {
          lainlainHidung = "Normal";
          _questHidung3 = 1;
        });
      } else if (data!.hidung!.lainLain == "Tidak Normal") {
        setState(() {
          lainlainHidung = "Tidak Normal";
          _questHidung3 = 2;
        });
      } else if (data!.hidung!.lainLain == "") {
      } else {
        setState(() {
          lainlainHidungF.text = data!.hidung!.lainLain!;
        });
      }

      if (data!.kerongkongan!.tonsilKanan == "Normal") {
        setState(() {
          tonsilKanan = "Normal";
          _questKerongkongan1 = 1;
        });
      } else if (data!.kerongkongan!.tonsilKanan == "Tidak Normal") {
        setState(() {
          tonsilKanan = "Tidak Normal";
          _questKerongkongan1 = 2;
        });
      } else if (data!.kerongkongan!.tonsilKanan == "") {
      } else {
        setState(() {
          tonsilKanaF.text = data!.kerongkongan!.tonsilKanan!;
        });
      }

      if (data!.kerongkongan!.tonsilKiri == "Normal") {
        setState(() {
          tonsilKiri = "Normal";
          _questKerongkongan2 = 1;
        });
      } else if (data!.kerongkongan!.tonsilKiri == "Tidak Normal") {
        setState(() {
          tonsilKiri = "Tidak Normal";
          _questKerongkongan2 = 2;
        });
      } else if (data!.kerongkongan!.tonsilKiri == "") {
      } else {
        setState(() {
          tonsilKiriF.text = data!.kerongkongan!.tonsilKiri!;
        });
      }

      if (data!.kerongkongan!.pharing == "Normal") {
        setState(() {
          pharing = "Normal";
          _questKerongkongan3 = 1;
        });
      } else if (data!.kerongkongan!.pharing == "Tidak Normal") {
        setState(() {
          pharing = "Tidak Normal";
          _questKerongkongan3 = 2;
        });
      } else if (data!.kerongkongan!.pharing == "") {
      } else {
        setState(() {
          pharingF.text = data!.kerongkongan!.pharing!;
        });
      }

      if (data!.kerongkongan!.tiroid == "Normal") {
        setState(() {
          tiroid = "Normal";
          _questKerongkongan4 = 1;
        });
      } else if (data!.kerongkongan!.tiroid == "Tidak Normal") {
        setState(() {
          tiroid = "Tidak Normal";
          _questKerongkongan4 = 2;
        });
      } else if (data!.kerongkongan!.tiroid == "") {
      } else {
        setState(() {
          tiroidF.text = data!.kerongkongan!.tiroid!;
        });
      }

      if (data!.kerongkongan!.lainLain == "Ada") {
        setState(() {
          lainlainKerongkongan = "Ada";
          _questKerongkongan5 = 1;
        });
      } else if (data!.kerongkongan!.lainLain == "Tidak Ada") {
        setState(() {
          lainlainKerongkongan = "Tidak Ada";
          _questKerongkongan5 = 2;
        });
      } else if (data!.kerongkongan!.lainLain == "") {
      } else {
        setState(() {
          lainlainKerongkonganF.text = data!.kerongkongan!.lainLain!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return MenuForm(idPasien: widget.idPasien!);
        }));
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: blueDefault,
            title: 
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return MenuForm(idPasien: widget.idPasien!);
                      }));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back),
                      ],
                    ),
                  ),
                

            textDefault("Keadaan Umum - Pemeriksaan THT", Colors.white,
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
                value: 1,
                groupValue: _questTelinga1,
                onChanged: (value) {
                  setState(() {
                    tympKiriF.text = "";
                    _questTelinga1 = value!;
                    tympKiri = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questTelinga1,
                onChanged: (value) {
                  setState(() {
                    tympKiriF.text = "";
                    _questTelinga1 = value!;
                    tympKiri = "Tidak Normal";
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
                      _questTelinga1 = 0;
                    });
                  },
                  controller: tympKiriF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Membran Tymp Kanan", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questTelinga2,
                onChanged: (value) {
                  setState(() {
                    tympKananF.text = "";
                    _questTelinga2 = value!;
                    tympKanan = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questTelinga2,
                onChanged: (value) {
                  setState(() {
                    tympKananF.text = "";
                    _questTelinga2 = value!;
                    tympKanan = "Tidak Normal";
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
                      _questTelinga2 = 0;
                    });
                  },
                  controller: tympKananF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
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
                value: 1,
                groupValue: _questTelinga3,
                onChanged: (value) {
                  setState(() {
                    telingaKiriF.text = "";
                    _questTelinga3 = value!;
                    telingaKiri = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questTelinga3,
                onChanged: (value) {
                  setState(() {
                    telingaKiriF.text = "";
                    _questTelinga3 = value!;
                    telingaKiri = "Tidak Normal";
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
                      _questTelinga3 = 0;
                    });
                  },
                  controller: telingaKiriF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Serumen", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questTelinga4,
                onChanged: (value) {
                  setState(() {
                    serumenKiriF.text = "";
                    _questTelinga4 = value!;
                    serumenKiri = "Ada";
                  });
                },
              ),
              textDefault("Ada", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questTelinga4,
                onChanged: (value) {
                  setState(() {
                    serumenKiriF.text = "";
                    _questTelinga4 = value!;
                    serumenKiri = "Tidak Ada";
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
                      _questTelinga4 = 0;
                    });
                  },
                  controller: serumenKiriF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
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
                value: 1,
                groupValue: _questTelinga5,
                onChanged: (value) {
                  setState(() {
                    telingaKananF.text = "";
                    _questTelinga5 = value!;
                    telingaKanan = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questTelinga5,
                onChanged: (value) {
                  setState(() {
                    telingaKananF.text = "";
                    _questTelinga5 = value!;
                    telingaKanan = "Tidak Normal";
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
                      _questTelinga5 = 0;
                    });
                  },
                  controller: telingaKananF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Serumen", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questTelinga6,
                onChanged: (value) {
                  setState(() {
                    serumenKananF.text = "";
                    _questTelinga6 = value!;
                    serumenKanan = "Ada";
                  });
                },
              ),
              textDefault("Ada", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questTelinga6,
                onChanged: (value) {
                  setState(() {
                    serumenKananF.text = "";
                    _questTelinga6 = value!;
                    serumenKanan = "Tidak Ada";
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
                      _questTelinga6 = 0;
                    });
                  },
                  controller: serumenKananF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
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
                value: 1,
                groupValue: _questHidung1,
                onChanged: (value) {
                  setState(() {
                    pilekF.text = "";
                    _questHidung1 = value!;
                    pilek = "Ya";
                  });
                },
              ),
              textDefault("Ya", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questHidung1,
                onChanged: (value) {
                  setState(() {
                    pilekF.text = "";
                    _questHidung1 = value!;
                    pilek = "Tidak Ada";
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
                      _questHidung1 = 0;
                    });
                  },
                  controller: pilekF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Lidah", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questHidung2,
                onChanged: (value) {
                  setState(() {
                    lidahF.text = "";
                    _questHidung2 = value!;
                    lidah = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questHidung2,
                onChanged: (value) {
                  setState(() {
                    lidahF.text = "";
                    _questHidung2 = value!;
                    lidah = "Tidak Normal";
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
                      _questHidung2 = 0;
                    });
                  },
                  controller: lidahF,
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
                groupValue: _questHidung3,
                onChanged: (value) {
                  setState(() {
                    lainlainHidungF.text = "";
                    _questHidung3 = value!;
                    lainlainHidung = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questHidung3,
                onChanged: (value) {
                  setState(() {
                    lainlainHidungF.text = "";
                    _questHidung3 = value!;
                    lainlainHidung = "Tidak Normal";
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
                      _questHidung3 = 0;
                    });
                  },
                  controller: lainlainHidungF,
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
                value: 1,
                groupValue: _questKerongkongan1,
                onChanged: (value) {
                  setState(() {
                    tonsilKanaF.text = "";
                    _questKerongkongan1 = value!;
                    tonsilKanan = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questKerongkongan1,
                onChanged: (value) {
                  setState(() {
                    tonsilKanaF.text = "";
                    _questKerongkongan1 = value!;
                    tonsilKanan = "Tidak Normal";
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
                      _questKerongkongan1 = 0;
                    });
                  },
                  controller: tonsilKanaF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Tonsil Kiri", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questKerongkongan2,
                onChanged: (value) {
                  setState(() {
                    tonsilKiriF.text = "";
                    _questKerongkongan2 = value!;
                    tonsilKiri = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questKerongkongan2,
                onChanged: (value) {
                  setState(() {
                    tonsilKiriF.text = "";
                    _questKerongkongan2 = value!;
                    tonsilKiri = "Tidak Normal";
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
                      _questKerongkongan2 = 0;
                    });
                  },
                  controller: tonsilKiriF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Pharing", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questKerongkongan3,
                onChanged: (value) {
                  setState(() {
                    pharingF.text = "";
                    _questKerongkongan3 = value!;
                    pharing = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questKerongkongan3,
                onChanged: (value) {
                  setState(() {
                    pharingF.text = "";
                    _questKerongkongan3 = value!;
                    pharing = "Tidak Normal";
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
                      _questKerongkongan3 = 0;
                    });
                  },
                  controller: pharingF,
                  maxLength: 12,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          textDefault("Tiroid", Colors.black, 14, FontWeight.bold),
          Row(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _questKerongkongan4,
                onChanged: (value) {
                  setState(() {
                    tiroidF.text = "";
                    _questKerongkongan4 = value!;
                    tiroid = "Normal";
                  });
                },
              ),
              textDefault("Normal", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questKerongkongan4,
                onChanged: (value) {
                  setState(() {
                    tiroidF.text = "";
                    _questKerongkongan4 = value!;
                    tiroid = "Tidak Normal";
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
                      _questKerongkongan4 = 0;
                    });
                  },
                  controller: tiroidF,
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
                groupValue: _questKerongkongan5,
                onChanged: (value) {
                  setState(() {
                    lainlainKerongkonganF.text = "";
                    _questKerongkongan5 = value!;
                    lainlainKerongkongan = "Ada";
                  });
                },
              ),
              textDefault("Ada", Colors.black, 13, FontWeight.normal),
              Radio(
                value: 2,
                groupValue: _questKerongkongan5,
                onChanged: (value) {
                  setState(() {
                    lainlainKerongkonganF.text = "";
                    _questKerongkongan5 = value!;
                    lainlainKerongkongan = "Tidak Ada";
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
                      _questKerongkongan5 = 0;
                    });
                  },
                  controller: lainlainKerongkonganF,
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
    tympKiri = tympKiriF.text != "" ? tympKiriF.text : tympKiri;
    tympKanan = tympKananF.text != "" ? tympKananF.text : tympKanan;
    telingaKiri = telingaKiriF.text != "" ? telingaKiriF.text : telingaKiri;
    serumenKiri = serumenKiriF.text != "" ? serumenKiriF.text : serumenKiri;
    telingaKanan = telingaKananF.text != "" ? telingaKananF.text : telingaKanan;
    serumenKanan = serumenKananF.text != "" ? serumenKananF.text : serumenKanan;

    pilek = pilekF.text != "" ? pilekF.text : pilek;
    lidah = lidahF.text != "" ? lidahF.text : lidah;
    lainlainHidung =
        lainlainHidungF.text != "" ? lainlainHidungF.text : lainlainHidung;

    tonsilKanan = tonsilKanaF.text != "" ? tonsilKanaF.text : tonsilKanan;
    tonsilKiri = tonsilKiriF.text != "" ? tonsilKiriF.text : tonsilKiri;
    pharing = pharingF.text != "" ? pharingF.text : pharing;
    tiroid = tiroidF.text != "" ? tiroidF.text : tiroid;
    lainlainKerongkongan = lainlainKerongkonganF.text != ""
        ? lainlainKerongkonganF.text
        : lainlainKerongkongan;

    lidah = lidahF.text != "" ? lidahF.text : lidah;
    lidah = lidahF.text != "" ? lidahF.text : lidah;
    lidah = lidahF.text != "" ? lidahF.text : lidah;
    lidah = lidahF.text != "" ? lidahF.text : lidah;

    PemeriksaanTHTModel data = PemeriksaanTHTModel(
      telinga: Telinga(
        membranTympKiri: tympKiri,
        membranTympKanan: tympKanan,
        penyakitTelingaKiri: telingaKiri,
        serumenKiri: serumenKiri,
        penyakitTelingaKanan: telingaKanan,
        serumenKanan: serumenKanan,
      ),
      hidung: Hidung(
        pilekTersumbat: pilek,
        lidah: lidah,
        lainLain: lainlainHidung,
      ),
      kerongkongan: Kerongkongan(
        tonsilKanan: tonsilKanan,
        tonsilKiri: tonsilKiri,
        pharing: pharing,
        tiroid: tiroid,
        lainLain: lainlainKerongkongan,
      ),
    );

    firestore.setPemeriksaanTHT(
        pemeriksaanTHT: data, idPasien: widget.idPasien!);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MenuForm(idPasien: widget.idPasien!);
    }));
  }
}
