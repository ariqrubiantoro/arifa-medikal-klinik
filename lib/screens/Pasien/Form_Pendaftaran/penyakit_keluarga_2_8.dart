// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/components/colors/color.dart';
import 'package:arifa_medikal_klink_3/components/widget/text.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/penyakit_terdahulu_1_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/riwayat_kebiasaan_3_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/pasien_detail.dart';
import '../../../model/penyakit_keluarga_mode.dart';
import '../../../service/firebase_firestore_service.dart';

enum Question { ayah, ibu, tidak }

class PenyakitKeluarga extends StatefulWidget {
  const PenyakitKeluarga({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<PenyakitKeluarga> createState() => _PenyakitKeluargaState();
}

class _PenyakitKeluargaState extends State<PenyakitKeluarga> {
  FirebaseFirestoreService firestore = FirebaseFirestoreService();

  Question _quest = Question.tidak;
  Question _quest2 = Question.tidak;
  Question _quest3 = Question.tidak;
  Question _quest4 = Question.tidak;
  Question _quest5 = Question.tidak;
  Question _quest6 = Question.tidak;
  Question _quest7 = Question.tidak;
  Question _quest8 = Question.tidak;
  Question _quest9 = Question.tidak;
  Question _quest10 = Question.tidak;

  String kencingManis = "Tidak Ada";
  String darahTinggi = "Tidak Ada";
  String asamLambung = "Tidak Ada";
  String alergi = "Tidak Ada";
  String paru = "Tidak Ada";
  String stroke = "Tidak Ada";
  String ginjal = "Tidak Ada";
  String hermorhid = "Tidak Ada";
  String kanker = "Tidak Ada";
  String jantung = "Tidak Ada";
  PenyakitKeluargaModel? _data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    _data = await firestore.getPenyakitKeluarga(widget.idPasien!);
    if (_data != null) {
      if (_data!.kencingManis! == "Ayah") {
        setState(() {
          kencingManis = _data!.kencingManis!;
          _quest = Question.ayah;
        });
      } else if (_data!.kencingManis! == "Ibu") {
        setState(() {
          kencingManis = _data!.kencingManis!;
          _quest = Question.ibu;
        });
      } else if (_data!.kencingManis! == "Tidak Ada") {
        setState(() {
          kencingManis = _data!.kencingManis!;
          _quest = Question.tidak;
        });
      }

      if (_data!.darahTinggi! == "Ayah") {
        setState(() {
          darahTinggi = _data!.darahTinggi!;
          _quest2 = Question.ayah;
        });
      } else if (_data!.darahTinggi! == "Ibu") {
        setState(() {
          darahTinggi = _data!.darahTinggi!;
          _quest2 = Question.ibu;
        });
      } else if (_data!.darahTinggi! == "Tidak Ada") {
        setState(() {
          darahTinggi = _data!.darahTinggi!;
          _quest2 = Question.tidak;
        });
      }

      if (_data!.asamLambung! == "Ayah") {
        setState(() {
          asamLambung = _data!.asamLambung!;
          _quest3 = Question.ayah;
        });
      } else if (_data!.asamLambung! == "Ibu") {
        setState(() {
          asamLambung = _data!.asamLambung!;
          _quest3 = Question.ibu;
        });
      } else if (_data!.asamLambung! == "Tidak Ada") {
        setState(() {
          asamLambung = _data!.asamLambung!;
          _quest3 = Question.tidak;
        });
      }

      if (_data!.alergi! == "Ayah") {
        setState(() {
          alergi = _data!.alergi!;
          _quest4 = Question.ayah;
        });
      } else if (_data!.alergi! == "Ibu") {
        setState(() {
          alergi = _data!.alergi!;
          _quest4 = Question.ibu;
        });
      } else if (_data!.alergi! == "Tidak Ada") {
        setState(() {
          alergi = _data!.alergi!;
          _quest4 = Question.tidak;
        });
      }

      if (_data!.paru! == "Ayah") {
        setState(() {
          paru = _data!.paru!;
          _quest5 = Question.ayah;
        });
      } else if (_data!.paru! == "Ibu") {
        setState(() {
          paru = _data!.paru!;
          _quest5 = Question.ibu;
        });
      } else if (_data!.paru! == "Tidak Ada") {
        setState(() {
          paru = _data!.paru!;
          _quest5 = Question.tidak;
        });
      }

      if (_data!.stroke! == "Ayah") {
        setState(() {
          stroke = _data!.stroke!;
          _quest6 = Question.ayah;
        });
      } else if (_data!.stroke! == "Ibu") {
        setState(() {
          stroke = _data!.stroke!;
          _quest6 = Question.ibu;
        });
      } else if (_data!.stroke! == "Tidak Ada") {
        setState(() {
          stroke = _data!.stroke!;
          _quest6 = Question.tidak;
        });
      }

      if (_data!.ginjal! == "Ayah") {
        setState(() {
          ginjal = _data!.ginjal!;
          _quest7 = Question.ayah;
        });
      } else if (_data!.ginjal! == "Ibu") {
        setState(() {
          ginjal = _data!.ginjal!;
          _quest7 = Question.ibu;
        });
      } else if (_data!.ginjal! == "Tidak Ada") {
        setState(() {
          ginjal = _data!.ginjal!;
          _quest7 = Question.tidak;
        });
      }

      if (_data!.hemorhoid! == "Ayah") {
        setState(() {
          hermorhid = _data!.hemorhoid!;
          _quest8 = Question.ayah;
        });
      } else if (_data!.hemorhoid! == "Ibu") {
        setState(() {
          hermorhid = _data!.hemorhoid!;
          _quest8 = Question.ibu;
        });
      } else if (_data!.hemorhoid! == "Tidak Ada") {
        setState(() {
          hermorhid = _data!.hemorhoid!;
          _quest8 = Question.tidak;
        });
      }

      if (_data!.kanker! == "Ayah") {
        setState(() {
          kanker = _data!.kanker!;
          _quest9 = Question.ayah;
        });
      } else if (_data!.kanker! == "Ibu") {
        setState(() {
          kanker = _data!.kanker!;
          _quest9 = Question.ibu;
        });
      } else if (_data!.kanker! == "Tidak Ada") {
        setState(() {
          kanker = _data!.kanker!;
          _quest9 = Question.tidak;
        });
      }

      if (_data!.jantung! == "Ayah") {
        setState(() {
          jantung = _data!.jantung!;
          _quest10 = Question.ayah;
        });
      } else if (_data!.jantung! == "Ibu") {
        setState(() {
          jantung = _data!.jantung!;
          _quest10 = Question.ibu;
        });
      } else if (_data!.jantung! == "Tidak Ada") {
        setState(() {
          jantung = _data!.jantung!;
          _quest10 = Question.tidak;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("id pasien : ${widget.idPasien}");
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
            textDefault("Riwayat Penyakit Keluarga (Orang Tua)", Colors.white,
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
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          textDefault("2/8", Colors.black, 14, FontWeight.bold)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 10,
                            width: 80,
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
                          "Kencing Manis", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ayah,
                            groupValue: _quest,
                            onChanged: (value) {
                              setState(() {
                                _quest = value!;
                                kencingManis = "Ayah";
                              });
                            },
                          ),
                          textDefault(
                              "Ayah", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.ibu,
                            groupValue: _quest,
                            onChanged: (value) {
                              setState(() {
                                _quest = value!;
                                kencingManis = "Ibu";
                              });
                            },
                          ),
                          textDefault(
                              "Ibu", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest,
                            onChanged: (value) {
                              setState(() {
                                _quest = value!;
                                kencingManis = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textDefault(
                          "Darah Tinggi", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ayah,
                            groupValue: _quest2,
                            onChanged: (value) {
                              setState(() {
                                _quest2 = value!;
                                darahTinggi = "Ayah";
                              });
                            },
                          ),
                          textDefault(
                              "Ayah", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.ibu,
                            groupValue: _quest2,
                            onChanged: (value) {
                              setState(() {
                                _quest2 = value!;
                                darahTinggi = "Ibu";
                                print(paru);
                              });
                            },
                          ),
                          textDefault(
                              "Ibu", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest2,
                            onChanged: (value) {
                              setState(() {
                                _quest2 = value!;
                                darahTinggi = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
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
                            value: Question.ayah,
                            groupValue: _quest3,
                            onChanged: (value) {
                              setState(() {
                                _quest3 = value!;
                                asamLambung = "Ayah";
                              });
                            },
                          ),
                          textDefault(
                              "Ayah", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.ibu,
                            groupValue: _quest3,
                            onChanged: (value) {
                              setState(() {
                                _quest3 = value!;
                                asamLambung = "Ibu";
                              });
                            },
                          ),
                          textDefault(
                              "Ibu", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest3,
                            onChanged: (value) {
                              setState(() {
                                _quest3 = value!;
                                asamLambung = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textDefault("Alergi", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ayah,
                            groupValue: _quest4,
                            onChanged: (value) {
                              setState(() {
                                _quest4 = value!;
                                alergi = "Ayah";
                              });
                            },
                          ),
                          textDefault(
                              "Ayah", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.ibu,
                            groupValue: _quest4,
                            onChanged: (value) {
                              setState(() {
                                _quest4 = value!;
                                alergi = "Ibu";
                              });
                            },
                          ),
                          textDefault(
                              "Ibu", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest4,
                            onChanged: (value) {
                              setState(() {
                                _quest4 = value!;
                                alergi = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
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
                            value: Question.ayah,
                            groupValue: _quest5,
                            onChanged: (value) {
                              setState(() {
                                _quest5 = value!;
                                paru = "Ayah";
                              });
                            },
                          ),
                          textDefault(
                              "Ayah", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.ibu,
                            groupValue: _quest5,
                            onChanged: (value) {
                              setState(() {
                                _quest5 = value!;
                                paru = "Ibu";
                              });
                            },
                          ),
                          textDefault(
                              "Ibu", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest5,
                            onChanged: (value) {
                              setState(() {
                                _quest5 = value!;
                                paru = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textDefault("Stroke", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ayah,
                            groupValue: _quest6,
                            onChanged: (value) {
                              setState(() {
                                _quest6 = value!;
                                stroke = "Ayah";
                              });
                            },
                          ),
                          textDefault(
                              "Ayah", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.ibu,
                            groupValue: _quest6,
                            onChanged: (value) {
                              setState(() {
                                _quest6 = value!;
                                stroke = "Ibu";
                              });
                            },
                          ),
                          textDefault(
                              "Ibu", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest6,
                            onChanged: (value) {
                              setState(() {
                                _quest6 = value!;
                                stroke = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textDefault("Ginjal", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ayah,
                            groupValue: _quest7,
                            onChanged: (value) {
                              setState(() {
                                _quest7 = value!;
                                ginjal = "Ayah";
                              });
                            },
                          ),
                          textDefault(
                              "Ayah", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.ibu,
                            groupValue: _quest7,
                            onChanged: (value) {
                              setState(() {
                                _quest7 = value!;
                                ginjal = "Ibu";
                              });
                            },
                          ),
                          textDefault(
                              "Ibu", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest7,
                            onChanged: (value) {
                              setState(() {
                                _quest7 = value!;
                                ginjal = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textDefault(
                          "Hemorhoid", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ayah,
                            groupValue: _quest8,
                            onChanged: (value) {
                              setState(() {
                                _quest8 = value!;
                                hermorhid = "Ayah";
                              });
                            },
                          ),
                          textDefault(
                              "Ayah", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.ibu,
                            groupValue: _quest8,
                            onChanged: (value) {
                              setState(() {
                                _quest8 = value!;
                                hermorhid = "Ibu";
                              });
                            },
                          ),
                          textDefault(
                              "Ibu", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest8,
                            onChanged: (value) {
                              setState(() {
                                _quest8 = value!;
                                hermorhid = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textDefault("Kanker", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ayah,
                            groupValue: _quest9,
                            onChanged: (value) {
                              setState(() {
                                _quest9 = value!;
                                kanker = "Ayah";
                              });
                            },
                          ),
                          textDefault(
                              "Ayah", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.ibu,
                            groupValue: _quest9,
                            onChanged: (value) {
                              setState(() {
                                _quest9 = value!;
                                kanker = "Ibu";
                              });
                            },
                          ),
                          textDefault(
                              "Ibu", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest9,
                            onChanged: (value) {
                              setState(() {
                                _quest9 = value!;
                                kanker = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textDefault("Jantung", Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ayah,
                            groupValue: _quest10,
                            onChanged: (value) {
                              setState(() {
                                _quest10 = value!;
                                jantung = "Ayah";
                              });
                            },
                          ),
                          textDefault(
                              "Ayah", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.ibu,
                            groupValue: _quest10,
                            onChanged: (value) {
                              setState(() {
                                _quest10 = value!;
                                jantung = "Ibu";
                              });
                            },
                          ),
                          textDefault(
                              "Ibu", Colors.black, 14, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest10,
                            onChanged: (value) {
                              setState(() {
                                _quest10 = value!;
                                jantung = "Tidak Ada";
                              });
                            },
                          ),
                          textDefault(
                              "Tidak Ada", Colors.black, 13, FontWeight.normal),
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
    PenyakitKeluargaModel data = PenyakitKeluargaModel(
      kencingManis: kencingManis,
      darahTinggi: darahTinggi,
      asamLambung: asamLambung,
      alergi: alergi,
      paru: paru,
      stroke: stroke,
      ginjal: ginjal,
      hemorhoid: hermorhid,
      kanker: kanker,
      jantung: jantung,
    );

    firestore.setPenyakitKeluarga(data, widget.idPasien!);

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
