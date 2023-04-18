// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/riwayat_kebiasaan_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keluhan_sekarang_4_8.dart';
import 'package:flutter/material.dart';

import '../../../components/colors/color.dart';
import '../../../components/widget/text.dart';
import '../../../service/firebase_firestore_service.dart';

enum Question { ya, tidak }

class RiwwayatKebiasaan3 extends StatefulWidget {
  const RiwwayatKebiasaan3({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<RiwwayatKebiasaan3> createState() => _RiwwayatKebiasaan3State();
}

class _RiwwayatKebiasaan3State extends State<RiwwayatKebiasaan3> {
  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  int _quest = 0;
  int _quest2 = 0;
  int _quest3 = 0;

  String merokok = "Tidak";
  String miras = "Tidak";
  String olahraga = "Tidak";

  final merokokF = TextEditingController();
  final mirasF = TextEditingController();
  final olahragaF = TextEditingController();

  bool visibleFormMeroko = false;
  bool visibleFormMiras = false;

  final lamaMerokok = TextEditingController();
  final banyakBatangMerokok = TextEditingController();
  final banyakBungkusMerokok = TextEditingController();

  final lamaMiras = TextEditingController();
  final banyakGelasMiras = TextEditingController();
  final banyakBotolMiras = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueDefault,
        automaticallyImplyLeading: false,
        title: Row(children: [
          Icon(Icons.arrow_back),
          SizedBox(
            width: 20,
          ),
          textDefault("Riwayat Kebiasaan", Colors.white, 16, FontWeight.bold)
        ]),
      ),
      body: Container(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        textDefault("3/8", Colors.black, 14, FontWeight.bold)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 120,
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
                    textDefault("Merokok", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest,
                          onChanged: (value) {
                            setState(() {
                              _quest = value!;
                              merokok = "Ya";
                              visibleFormMeroko = true;
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _quest,
                          onChanged: (value) {
                            setState(() {
                              _quest = value!;
                              merokok = "Tidak";
                              visibleFormMeroko = false;
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
                                _quest = 0;
                                visibleFormMeroko = false;
                              });
                            },
                            controller: merokokF,
                            maxLength: 15,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    visibleFormMeroko
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 70,
                                    child: textDefault("Lama", Colors.black, 14,
                                        FontWeight.normal),
                                  ),
                                  textDefault(":  ", Colors.black, 14,
                                      FontWeight.normal),
                                  Container(
                                    width: 70,
                                    height: 30,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: TextField(
                                      controller: lamaMerokok,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  textDefault(" Tahun", Colors.black, 14,
                                      FontWeight.normal),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 70,
                                    child: textDefault("Banyak", Colors.black,
                                        16, FontWeight.normal),
                                  ),
                                  textDefault(":  ", Colors.black, 14,
                                      FontWeight.normal),
                                  Container(
                                    width: 70,
                                    height: 30,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: TextField(
                                      controller: banyakBatangMerokok,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  textDefault(" Batang/Hari", Colors.black, 14,
                                      FontWeight.normal),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 70,
                                    child: textDefault("", Colors.black, 14,
                                        FontWeight.normal),
                                  ),
                                  textDefault("   ", Colors.black, 14,
                                      FontWeight.normal),
                                  Container(
                                    width: 70,
                                    height: 30,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: TextField(
                                      controller: banyakBungkusMerokok,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  textDefault(" Bungkus/Hari", Colors.black, 14,
                                      FontWeight.normal),
                                ],
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault(
                        "Minuman Keras", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              _quest2 = value!;
                              miras = "Ya";
                              visibleFormMiras = true;
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              _quest2 = value!;
                              miras = "Tidak";
                              visibleFormMiras = false;
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
                                _quest2 = 0;
                                visibleFormMiras = false;
                              });
                            },
                            controller: mirasF,
                            maxLength: 15,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ))
                      ],
                    ),
                    visibleFormMiras
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 70,
                                    child: textDefault("Lama", Colors.black, 14,
                                        FontWeight.normal),
                                  ),
                                  textDefault(":  ", Colors.black, 14,
                                      FontWeight.normal),
                                  Container(
                                    width: 70,
                                    height: 30,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: TextField(
                                      controller: lamaMiras,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  textDefault(" Tahun", Colors.black, 14,
                                      FontWeight.normal),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 70,
                                    child: textDefault("Banyak", Colors.black,
                                        16, FontWeight.normal),
                                  ),
                                  textDefault(":  ", Colors.black, 14,
                                      FontWeight.normal),
                                  Container(
                                    width: 70,
                                    height: 30,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: TextField(
                                      controller: banyakGelasMiras,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  textDefault(" Gelas/Hari", Colors.black, 14,
                                      FontWeight.normal),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 70,
                                    child: textDefault("", Colors.black, 14,
                                        FontWeight.normal),
                                  ),
                                  textDefault("   ", Colors.black, 14,
                                      FontWeight.normal),
                                  Container(
                                    width: 70,
                                    height: 30,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: TextField(
                                      controller: banyakBotolMiras,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  textDefault(" Botol/Hari", Colors.black, 14,
                                      FontWeight.normal),
                                ],
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Olahraga", Colors.black, 14, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              olahraga = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 13, FontWeight.normal),
                        Radio(
                          value: 2,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              olahraga = "Tidak";
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
                                _quest3 = 0;
                              });
                            },
                            controller: olahragaF,
                            maxLength: 15,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
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
                  // onTap: () => showDialogProfil(),
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) {
                  //     return KeluhanSekarang4();
                  //   }),
                  // ),
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
          )
        ],
      )),
    );
  }

  void saveButton() async {
    merokok = merokokF.text != "" ? merokokF.text : merokok;
    miras = mirasF.text != "" ? mirasF.text : miras;
    olahraga = olahragaF.text != "" ? olahragaF.text : olahraga;

    RiwayatKebiasaanModel data = RiwayatKebiasaanModel(
      strMerokok: merokok,
      strMiras: miras,
      merokok: _quest != 2
          ? MerokokModel(
              lama: lamaMerokok.text,
              batang: banyakBatangMerokok.text,
              bungkus: banyakBungkusMerokok.text)
          : null,
      miras: _quest2 != 2
          ? MirasModel(
              lama: lamaMiras.text,
              gelas: banyakGelasMiras.text,
              botol: banyakBotolMiras.text)
          : null,
      olahraga: olahraga,
    );

    firestore.setRiwayatKebiasaan(data, widget.idPasien!);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => KeluhanSekarang4(
            idPasien: widget.idPasien,
          ),
        ));
  }
}
