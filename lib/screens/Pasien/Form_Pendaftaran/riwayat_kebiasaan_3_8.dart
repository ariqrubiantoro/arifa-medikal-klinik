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
  Question _quest = Question.tidak;
  Question _quest2 = Question.tidak;
  Question _quest3 = Question.tidak;

  String merokok = "Tidak";
  String miras = "Tidak";
  String olahraga = "Tidak";

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
          textDefault("Riwayat Kebiasaan", Colors.white, 18, FontWeight.bold)
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
                        textDefault("3/8", Colors.black, 16, FontWeight.bold)
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
                    textDefault("Merokok", Colors.black, 16, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest,
                          onChanged: (value) {
                            setState(() {
                              _quest = value!;
                              merokok = "Ya";
                              visibleFormMeroko = true;
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
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
                            "Tidak", Colors.black, 14, FontWeight.normal),
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
                                    child: textDefault("Lama", Colors.black, 16,
                                        FontWeight.normal),
                                  ),
                                  textDefault(":  ", Colors.black, 16,
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
                                  textDefault(" Tahun", Colors.black, 16,
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
                                  textDefault(":  ", Colors.black, 16,
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
                                  textDefault(" Batang/Hari", Colors.black, 16,
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
                                    child: textDefault("", Colors.black, 16,
                                        FontWeight.normal),
                                  ),
                                  textDefault("   ", Colors.black, 16,
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
                                  textDefault(" Bungkus/Hari", Colors.black, 16,
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
                        "Minuman Keras", Colors.black, 16, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest2,
                          onChanged: (value) {
                            setState(() {
                              _quest2 = value!;
                              miras = "Ya";
                              visibleFormMiras = true;
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
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
                            "Tidak", Colors.black, 14, FontWeight.normal),
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
                                    child: textDefault("Lama", Colors.black, 16,
                                        FontWeight.normal),
                                  ),
                                  textDefault(":  ", Colors.black, 16,
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
                                  textDefault(" Tahun", Colors.black, 16,
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
                                  textDefault(":  ", Colors.black, 16,
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
                                  textDefault(" Gelas/Hari", Colors.black, 16,
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
                                    child: textDefault("", Colors.black, 16,
                                        FontWeight.normal),
                                  ),
                                  textDefault("   ", Colors.black, 16,
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
                                  textDefault(" Botol/Hari", Colors.black, 16,
                                      FontWeight.normal),
                                ],
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: 5,
                    ),
                    textDefault("Olahraga", Colors.black, 16, FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              olahraga = "Ya";
                            });
                          },
                        ),
                        textDefault("Ya", Colors.black, 14, FontWeight.normal),
                        Radio(
                          value: Question.tidak,
                          groupValue: _quest3,
                          onChanged: (value) {
                            setState(() {
                              _quest3 = value!;
                              olahraga = "Tidak";
                            });
                          },
                        ),
                        textDefault(
                            "Tidak", Colors.black, 14, FontWeight.normal),
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
                  // onTap: () => showDialogProfil(),
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
    print("data ${_quest2.name}");
    RiwayatKebiasaanModel data = RiwayatKebiasaanModel(
      merokok: _quest.name != "tidak"
          ? MerokokModel(
              lama: lamaMerokok.text,
              batang: banyakBatangMerokok.text,
              bungkus: banyakBungkusMerokok.text)
          : null,
      miras: _quest2.name != "tidak"
          ? MirasModel(
              lama: lamaMiras.text,
              gelas: banyakGelasMiras.text,
              botol: banyakBotolMiras.text)
          : null,
      olahraga: olahraga,
    );

    firestore.setRiwayatKebiasaan(data, widget.idPasien!);
  }
}
