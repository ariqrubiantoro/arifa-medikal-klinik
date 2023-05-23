// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/kimia_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/riwayat_pajanan/biologi.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak, none }

class Kimia extends StatefulWidget {
  const Kimia({this.pasienId, super.key});
  final String? pasienId;

  @override
  State<Kimia> createState() => _KimiaState();
}

class _KimiaState extends State<Kimia> {
  Question _quest1 = Question.none;
  Question _quest2 = Question.none;
  Question _quest3 = Question.none;
  Question _quest4 = Question.none;
  Question _quest5 = Question.none;
  Question _quest6 = Question.none;
  Question _quest7 = Question.none;
  Question _quest8 = Question.none;
  Question _quest9 = Question.none;
  Question _quest10 = Question.none;

  String debuAnorganik = "";
  String debuOrganik = "";
  String asap = "";
  String logamBerat = "";
  String pelarutOrganik = "";
  String iritanAsam = "";
  String iritanBasa = "";
  String cairanPembersih = "";
  String pestisida = "";
  String uapLogam = "";

  TextEditingController debuAnorganikController = TextEditingController();
  TextEditingController debuOrganikController = TextEditingController();
  TextEditingController asapController = TextEditingController();
  TextEditingController logamBeratController = TextEditingController();
  TextEditingController pelarutOrganikController = TextEditingController();
  TextEditingController iritanAsamController = TextEditingController();
  TextEditingController iritanBasaController = TextEditingController();
  TextEditingController cairanPembersihController = TextEditingController();
  TextEditingController pestisidaController = TextEditingController();
  TextEditingController uapLogamController = TextEditingController();

  final lainlain = TextEditingController();
  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  KimiaModel? data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    data = await firestore.getKimia(widget.pasienId!);
    if (data != null) {
      setState(() {
        lainlain.text = data!.lainLain!;
      });
      if (data!.debuAnorganik == "Ya") {
        setState(() {
          debuAnorganik = data!.debuAnorganik!;
          _quest1 = Question.ya;
        });
      } else if (data!.debuAnorganik == "Tidak") {
        setState(() {
          debuAnorganik = data!.debuAnorganik!;
          _quest1 = Question.tidak;
        });
      } else if (data!.debuAnorganik == "") {
      } else {
        debuAnorganikController.text = data!.debuAnorganik!;
      }

      if (data!.debuOrganik == "Ya") {
        setState(() {
          debuOrganik = data!.debuOrganik!;
          _quest2 = Question.ya;
        });
      } else if (data!.debuOrganik == "Tidak") {
        setState(() {
          debuOrganik = data!.debuOrganik!;
          _quest2 = Question.tidak;
        });
      } else if (data!.debuOrganik == "") {
      } else {
        debuOrganikController.text = data!.debuOrganik!;
      }

      if (data!.asap == "Ya") {
        setState(() {
          asap = data!.asap!;
          _quest3 = Question.ya;
        });
      } else if (data!.asap == "Tidak") {
        setState(() {
          asap = data!.asap!;
          _quest3 = Question.tidak;
        });
      } else if (data!.asap == "") {
      } else {
        asapController.text = data!.asap!;
      }

      if (data!.logamBerat == "Ya") {
        setState(() {
          logamBerat = data!.logamBerat!;
          _quest4 = Question.ya;
        });
      } else if (data!.logamBerat == "Tidak") {
        setState(() {
          logamBerat = data!.logamBerat!;
          _quest4 = Question.tidak;
        });
      } else if (data!.logamBerat == "") {
      } else {
        logamBeratController.text = data!.logamBerat!;
      }

      if (data!.pelarutOrganik == "Ya") {
        setState(() {
          pelarutOrganik = data!.pelarutOrganik!;
          _quest5 = Question.ya;
        });
      } else if (data!.pelarutOrganik == "Tidak") {
        setState(() {
          pelarutOrganik = data!.pelarutOrganik!;
          _quest5 = Question.tidak;
        });
      } else if (data!.pelarutOrganik == "") {
      } else {
        pelarutOrganikController.text = data!.pelarutOrganik!;
      }

      if (data!.iritanAsam == "Ya") {
        setState(() {
          iritanAsam = data!.iritanAsam!;
          _quest6 = Question.ya;
        });
      } else if (data!.iritanAsam == "Tidak") {
        setState(() {
          iritanAsam = data!.iritanAsam!;
          _quest6 = Question.tidak;
        });
      } else if (data!.iritanAsam == "") {
      } else {
        iritanAsamController.text = data!.iritanAsam!;
      }

      if (data!.iritanBasa == "Ya") {
        setState(() {
          iritanBasa = data!.iritanBasa!;
          _quest7 = Question.ya;
        });
      } else if (data!.iritanBasa == "Tidak") {
        setState(() {
          iritanBasa = data!.iritanBasa!;
          _quest7 = Question.tidak;
        });
      } else if (data!.iritanBasa == "") {
      } else {
        iritanBasaController.text = data!.iritanBasa!;
      }

      if (data!.cairanPembersih == "Ya") {
        setState(() {
          cairanPembersih = data!.cairanPembersih!;
          _quest8 = Question.ya;
        });
      } else if (data!.cairanPembersih == "Tidak") {
        setState(() {
          cairanPembersih = data!.cairanPembersih!;
          _quest8 = Question.tidak;
        });
      } else if (data!.cairanPembersih == "") {
      } else {
        cairanPembersihController.text = data!.cairanPembersih!;
      }

      if (data!.pestisida == "Ya") {
        setState(() {
          pestisida = data!.pestisida!;
          _quest9 = Question.ya;
        });
      } else if (data!.pestisida == "Tidak") {
        setState(() {
          pestisida = data!.pestisida!;
          _quest9 = Question.tidak;
        });
      } else if (data!.pestisida == "") {
      } else {
        pestisidaController.text = data!.pestisida!;
      }

      if (data!.uapLogam == "Ya") {
        setState(() {
          uapLogam = data!.uapLogam!;
          _quest10 = Question.ya;
        });
      } else if (data!.uapLogam == "Tidak") {
        setState(() {
          uapLogam = data!.uapLogam!;
          _quest10 = Question.tidak;
        });
      } else if (data!.uapLogam == "") {
      } else {
        uapLogamController.text = data!.uapLogam!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return MenuForm(idPasien: widget.pasienId!);
        }));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blueDefault,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return MenuForm(idPasien: widget.pasienId!);
                }));
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                ],
              ),
            ),
            textDefault(
                "Riwayat Pajanan - Kimia", Colors.white, 16, FontWeight.bold),
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
                    textDefault("Debu Anorganik (Silika, Semen, dll)",
                        Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest1,
                          onChanged: (value) {
                            setState(() {
                              _quest1 = value!;
                              debuAnorganik = "Ya";
                              debuAnorganikController.text = "";
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
                              debuAnorganik = "Tidak";
                              debuAnorganikController.text = "";
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
                              controller: debuAnorganikController,
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
                    textDefault("Debu Organik (Kapas, Tekstil, Gandum)",
                        Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              _quest2 = value!;
                              debuOrganik = "Ya";
                              debuOrganikController.text = "";
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
                              debuOrganik = "Tidak";
                              debuOrganikController.text = "";
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
                              controller: debuOrganikController,
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
                    textDefault("Asap", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              asap = "Ya";
                              asapController.text = "";
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
                              asap = "Tidak";
                              asapController.text = "";
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
                              controller: asapController,
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
                    textDefault("Logam Berat (Timah Hitam, Air Raksa)",
                        Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              _quest4 = value!;
                              logamBerat = "Ya";
                              logamBeratController.text = "";
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
                              logamBerat = "Tidak";
                              logamBeratController.text = "";
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
                              controller: logamBeratController,
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
                    textDefault("Pelarut Organik (Benzene, Alkil, Toluen)",
                        Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              _quest5 = value!;
                              pelarutOrganik = "Ya";
                              pelarutOrganikController.text = "";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest5,
                          onChanged: (value) {
                            setState(() {
                              _quest5 = value!;
                              pelarutOrganik = "Tidak";
                              pelarutOrganikController.text = "";
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
                                  _quest5 = Question.none;
                                });
                              },
                              controller: pelarutOrganikController,
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
                    textDefault("Iritan Asam (Air Keras, Asam Sulfat)",
                        Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              _quest6 = value!;
                              iritanAsam = "Ya";
                              iritanAsamController.text = "";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest6,
                          onChanged: (value) {
                            setState(() {
                              _quest6 = value!;
                              iritanAsam = "Tidak";
                              iritanAsamController.text = "";
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
                                  _quest6 = Question.none;
                                });
                              },
                              controller: iritanAsamController,
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
                    textDefault("Iritan Basa (Amoniak, Soda Api)", Colors.black,
                        14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              _quest7 = value!;
                              iritanBasa = "Ya";
                              iritanBasaController.text = "";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest7,
                          onChanged: (value) {
                            setState(() {
                              _quest7 = value!;
                              iritanBasa = "Tidak";
                              iritanBasaController.text = "";
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
                                  _quest7 = Question.none;
                                });
                              },
                              controller: iritanBasaController,
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
                    textDefault("Cairan Pembersih (Amonia, Klor, Kaporit)",
                        Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest8,
                          onChanged: (value) {
                            setState(() {
                              _quest8 = value!;
                              cairanPembersih = "Ya";
                              cairanPembersihController.text = "";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest8,
                          onChanged: (value) {
                            setState(() {
                              _quest8 = value!;
                              cairanPembersih = "Tidak";
                              cairanPembersihController.text = "";
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
                                  _quest8 = Question.none;
                                });
                              },
                              controller: cairanPembersihController,
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
                    textDefault("Pestisida", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest9,
                          onChanged: (value) {
                            setState(() {
                              _quest9 = value!;
                              pestisida = "Ya";
                              pestisidaController.text = "";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest9,
                          onChanged: (value) {
                            setState(() {
                              _quest9 = value!;
                              pestisida = "Tidak";
                              pestisidaController.text = "";
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
                                  _quest9 = Question.none;
                                });
                              },
                              controller: pestisidaController,
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
                    textDefault("Uap Logam (Mangan, Seng)", Colors.black, 14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest10,
                          onChanged: (value) {
                            setState(() {
                              _quest10 = value!;
                              uapLogam = "Ya";
                              uapLogamController.text = "";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest10,
                          onChanged: (value) {
                            setState(() {
                              _quest10 = value!;
                              uapLogam = "Tidak";
                              uapLogamController.text = "";
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
                                  _quest10 = Question.none;
                                });
                              },
                              controller: uapLogamController,
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
    KimiaModel data = KimiaModel(
      debuAnorganik: debuAnorganikController.text != ""
          ? debuAnorganikController.text
          : debuAnorganik,
      debuOrganik: debuOrganikController.text != ""
          ? debuOrganikController.text
          : debuOrganik,
      asap: asapController.text != "" ? asapController.text : asap,
      logamBerat: logamBeratController.text != ""
          ? logamBeratController.text
          : logamBerat,
      pelarutOrganik: pelarutOrganikController.text != ""
          ? pelarutOrganikController.text
          : pelarutOrganik,
      iritanAsam: iritanAsamController.text != ""
          ? iritanAsamController.text
          : iritanAsam,
      iritanBasa: iritanBasaController.text != ""
          ? iritanBasaController.text
          : iritanBasa,
      cairanPembersih: cairanPembersihController.text != ""
          ? cairanPembersihController.text
          : cairanPembersih,
      pestisida:
          pestisidaController.text != "" ? pestisidaController.text : pestisida,
      uapLogam:
          uapLogamController.text != "" ? uapLogamController.text : uapLogam,
      lainLain: lainlain.text,
    );

    firestore.setKimia(kimia: data, idPasien: widget.pasienId!);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MenuForm(idPasien: widget.pasienId!);
    }));
  }
}
