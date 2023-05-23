// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/ergonomis_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/pemeriksaan_5_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak, none }

class Ergonomis extends StatefulWidget {
  const Ergonomis({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<Ergonomis> createState() => _ErgonomisState();
}

class _ErgonomisState extends State<Ergonomis> {
  Question _quest1 = Question.none;
  Question _quest2 = Question.none;
  Question _quest3 = Question.none;
  Question _quest4 = Question.none;
  Question _quest5 = Question.none;
  Question _quest6 = Question.none;
  Question _quest7 = Question.none;

  String gerakanBerulang = "";
  String angkatAngkutBerat = "";
  String dudukLama = "";
  String berdiriLama = "";
  String posisiTubuh = "";
  String pencahayaan = "";
  String bekerjaDenganLayar = "";

  final lainlain = TextEditingController();

  TextEditingController gerakanBerulangController = TextEditingController();
  TextEditingController angkatAngkutBeratController = TextEditingController();
  TextEditingController dudukLamaController = TextEditingController();
  TextEditingController berdiriLamaController = TextEditingController();
  TextEditingController posisiTubuhController = TextEditingController();
  TextEditingController pencahayaanController = TextEditingController();
  TextEditingController bekerjaDenganLayarController = TextEditingController();

  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  ErgonomisModel? data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    data = await firestore.getErgonomis(widget.idPasien!);
    if (data != null) {
      setState(() {
        lainlain.text = data!.lainLain!;
      });
      if (data!.gerakanBerulang == "Ya") {
        setState(() {
          gerakanBerulang = data!.gerakanBerulang!;
          _quest1 = Question.ya;
        });
      } else if (data!.gerakanBerulang == "Tidak") {
        setState(() {
          gerakanBerulang = data!.gerakanBerulang!;
          _quest1 = Question.tidak;
        });
      } else if (data!.gerakanBerulang == "") {
      } else {
        gerakanBerulangController.text = data!.gerakanBerulang!;
      }

      if (data!.angkatBerat == "Ya") {
        setState(() {
          angkatAngkutBerat = data!.angkatBerat!;
          _quest2 = Question.ya;
        });
      } else if (data!.angkatBerat == "Tidak") {
        setState(() {
          angkatAngkutBerat = data!.angkatBerat!;
          _quest2 = Question.tidak;
        });
      } else if (data!.angkatBerat == "") {
      } else {
        angkatAngkutBeratController.text = data!.angkatBerat!;
      }

      if (data!.dudukLama == "Ya") {
        setState(() {
          dudukLama = data!.dudukLama!;
          _quest3 = Question.ya;
        });
      } else if (data!.dudukLama == "Tidak") {
        setState(() {
          dudukLama = data!.dudukLama!;
          _quest3 = Question.tidak;
        });
      } else if (data!.dudukLama == "") {
      } else {
        dudukLamaController.text = data!.dudukLama!;
      }

      if (data!.berdiriLama == "Ya") {
        setState(() {
          berdiriLama = data!.berdiriLama!;
          _quest4 = Question.ya;
        });
      } else if (data!.berdiriLama == "Tidak") {
        setState(() {
          berdiriLama = data!.berdiriLama!;
          _quest4 = Question.tidak;
        });
      } else if (data!.berdiriLama == "") {
      } else {
        berdiriLamaController.text = data!.berdiriLama!;
      }

      if (data!.posisiTubuh == "Ya") {
        setState(() {
          posisiTubuh = data!.posisiTubuh!;
          _quest5 = Question.ya;
        });
      } else if (data!.posisiTubuh == "Tidak") {
        setState(() {
          posisiTubuh = data!.posisiTubuh!;
          _quest5 = Question.tidak;
        });
      } else if (data!.posisiTubuh == "") {
      } else {
        posisiTubuhController.text = data!.posisiTubuh!;
      }

      if (data!.pencahayaanTidakSesuai == "Ya") {
        setState(() {
          pencahayaan = data!.pencahayaanTidakSesuai!;
          _quest6 = Question.ya;
        });
      } else if (data!.pencahayaanTidakSesuai == "Tidak") {
        setState(() {
          pencahayaan = data!.pencahayaanTidakSesuai!;
          _quest6 = Question.tidak;
        });
      } else if (data!.pencahayaanTidakSesuai == "") {
      } else {
        pencahayaanController.text = data!.pencahayaanTidakSesuai!;
      }

      if (data!.bekerjaDenganLayar == "Ya") {
        setState(() {
          bekerjaDenganLayar = data!.bekerjaDenganLayar!;
          _quest7 = Question.ya;
        });
      } else if (data!.bekerjaDenganLayar == "Tidak") {
        setState(() {
          bekerjaDenganLayar = data!.bekerjaDenganLayar!;
          _quest7 = Question.tidak;
        });
      } else if (data!.bekerjaDenganLayar == "") {
      } else {
        bekerjaDenganLayarController.text = data!.bekerjaDenganLayar!;
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
                  
            textDefault("Riwayat Pajanan - Ergonomis", Colors.white, 16,
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
                      textDefault("Gerakan Berulang dengan Tangan",
                          Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ya,
                            groupValue: _quest1,
                            onChanged: (value) {
                              setState(() {
                                _quest1 = value!;
                                gerakanBerulang = "Ya";
                                gerakanBerulangController.text = "";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest1,
                            onChanged: (value) {
                              setState(() {
                                _quest1 = value!;
                                gerakanBerulang = "Tidak";
                                gerakanBerulangController.text = "";
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
                                controller: gerakanBerulangController,
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
                      textDefault("Angkat/Angkut Berat", Colors.black, 14,
                          FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ya,
                            groupValue: _quest2,
                            onChanged: (value) {
                              setState(() {
                                _quest2 = value!;
                                angkatAngkutBerat = "Ya";
                                angkatAngkutBeratController.text = "";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest2,
                            onChanged: (value) {
                              setState(() {
                                _quest2 = value!;
                                angkatAngkutBerat = "Tidak";
                                angkatAngkutBeratController.text = "";
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
                                controller: angkatAngkutBeratController,
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
                      textDefault("Duduk Lama > 4 Jam Terus Menerus",
                          Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ya,
                            groupValue: _quest3,
                            onChanged: (value) {
                              setState(() {
                                _quest3 = value!;
                                dudukLama = "Ya";
                                dudukLamaController.text = "";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest3,
                            onChanged: (value) {
                              setState(() {
                                _quest3 = value!;
                                dudukLama = "Tidak";
                                dudukLamaController.text = "";
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
                                controller: dudukLamaController,
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
                      textDefault("Berdiri Lama > 4 Jam Terus Menerus",
                          Colors.black, 14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ya,
                            groupValue: _quest4,
                            onChanged: (value) {
                              setState(() {
                                _quest4 = value!;
                                berdiriLama = "Ya";
                                berdiriLamaController.text = "";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest4,
                            onChanged: (value) {
                              setState(() {
                                _quest4 = value!;
                                berdiriLama = "Tidak";
                                berdiriLamaController.text = "";
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
                                controller: berdiriLamaController,
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
                      textDefault("Posisi Tubuh Tidak Ergonomis", Colors.black,
                          14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ya,
                            groupValue: _quest5,
                            onChanged: (value) {
                              setState(() {
                                _quest5 = value!;
                                posisiTubuh = "Ya";
                                posisiTubuhController.text = "";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest5,
                            onChanged: (value) {
                              setState(() {
                                _quest5 = value!;
                                posisiTubuh = "Tidak";
                                posisiTubuhController.text = "";
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
                                controller: posisiTubuhController,
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
                      textDefault("Pencahayaan Tidak Sesuai", Colors.black, 14,
                          FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ya,
                            groupValue: _quest6,
                            onChanged: (value) {
                              setState(() {
                                _quest6 = value!;
                                pencahayaan = "Ya";
                                pencahayaanController.text = "";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest6,
                            onChanged: (value) {
                              setState(() {
                                _quest6 = value!;
                                pencahayaan = "Tidak";
                                pencahayaanController.text = "";
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
                                controller: pencahayaanController,
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
                          "Bekerja dengan Layar/Monitor 4 Jam/Lebih dalam Sehari",
                          Colors.black,
                          14,
                          FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ya,
                            groupValue: _quest7,
                            onChanged: (value) {
                              setState(() {
                                _quest7 = value!;
                                bekerjaDenganLayar = "Ya";
                                bekerjaDenganLayarController.text = "";
                              });
                            },
                          ),
                          textDefault(
                              "Ya", Colors.black, 13, FontWeight.normal),
                          Radio(
                            value: Question.tidak,
                            groupValue: _quest7,
                            onChanged: (value) {
                              setState(() {
                                _quest7 = value!;
                                bekerjaDenganLayar = "Tidak";
                                bekerjaDenganLayarController.text = "";
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
                                controller: bekerjaDenganLayarController,
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
                          "Lain-Lain", Colors.black, 14, FontWeight.bold),
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
    ErgonomisModel data = ErgonomisModel(
      gerakanBerulang: gerakanBerulangController.text != ""
          ? gerakanBerulangController.text
          : gerakanBerulang,
      angkatBerat: angkatAngkutBeratController.text != ""
          ? angkatAngkutBeratController.text
          : angkatAngkutBerat,
      dudukLama:
          dudukLamaController.text != "" ? dudukLamaController.text : dudukLama,
      berdiriLama: berdiriLamaController.text != ""
          ? berdiriLamaController.text
          : berdiriLama,
      posisiTubuh: posisiTubuhController.text != ""
          ? posisiTubuhController.text
          : posisiTubuh,
      pencahayaanTidakSesuai: pencahayaanController.text != ""
          ? pencahayaanController.text
          : pencahayaan,
      bekerjaDenganLayar: bekerjaDenganLayarController.text != ""
          ? bekerjaDenganLayarController.text
          : bekerjaDenganLayar,
      lainLain: lainlain.text,
    );

    firestore.setErgonomis(ergonomis: data, idPasien: widget.idPasien!);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MenuForm(idPasien: widget.idPasien!);
    }));
  }
}
