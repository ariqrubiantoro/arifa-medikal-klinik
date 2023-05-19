// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:arifa_medikal_klink_3/model/kesimpulan_derajat_kesehatan.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/form_success.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../components/colors/color.dart';
import '../../../components/widget/text.dart';

enum Question { ya, tidak, none }

class KesimpulanDerajat8 extends StatefulWidget {
  const KesimpulanDerajat8({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<KesimpulanDerajat8> createState() => _KesimpulanDerajat8State();
}

class _KesimpulanDerajat8State extends State<KesimpulanDerajat8> {
  Question _quest1 = Question.tidak;
  Question _quest2 = Question.tidak;
  Question _quest3 = Question.tidak;
  Question _quest4 = Question.tidak;
  Question _quest5 = Question.tidak;
  Question _quest6 = Question.tidak;
  Question _quest7 = Question.tidak;

  String str1 = "Tidak";
  String str2 = "Tidak";
  String str3 = "Tidak";
  String str4 = "Tidak";
  String str5 = "Tidak";
  String str6 = "Tidak";
  String str7 = "Tidak";

  TextEditingController str1Controller = TextEditingController();
  TextEditingController str2Controller = TextEditingController();
  TextEditingController str3Controller = TextEditingController();
  TextEditingController str4Controller = TextEditingController();
  TextEditingController str5Controller = TextEditingController();
  TextEditingController str6Controller = TextEditingController();
  TextEditingController str7Controller = TextEditingController();

  final FirebaseFirestoreService firestore = FirebaseFirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blueDefault,
          title: textDefault("Kesimpulan Derajat Kesehatan", Colors.white, 16,
              FontWeight.bold)),
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
                      textDefault("8/8", Colors.black, 14, FontWeight.bold)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 10,
                        decoration: BoxDecoration(
                            color: blueDefault,
                            borderRadius: BorderRadius.circular(10)),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  textDefault("Ditemukan Kelainan Medis", Colors.black, 14,
                      FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest1,
                        onChanged: (value) {
                          setState(() {
                            _quest1 = value!;
                            str1 = "Ya";
                            str1Controller.text = "";
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
                            str1 = "Tidak";
                            str1Controller.text = "";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
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
                            controller: str1Controller,
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
                  textDefault("Ditemukan Kelainan Medis yang Tidak Serius",
                      Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest2,
                        onChanged: (value) {
                          setState(() {
                            _quest2 = value!;
                            str2 = "Ya";
                            str2Controller.text = "";
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
                            str2 = "Tidak";
                            str2Controller.text = "";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
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
                            controller: str2Controller,
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
                      "Ditemukan Kelainan Medis, Resiko Kesehatan Rendah",
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
                            str3 = "Ya";
                            str3Controller.text = "";
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
                            str3 = "Tidak";
                            str3Controller.text = "";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
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
                            controller: str3Controller,
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
                      "Ditemukan Kelainan Medis Bermakna yang Dapat Menjadi Serius, Resiko Kesehatan Sedang",
                      Colors.black,
                      14,
                      FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest4,
                        onChanged: (value) {
                          setState(() {
                            _quest4 = value!;
                            str4 = "Ya";
                            str4Controller.text = "";
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
                            str4 = "Tidak";
                            str4Controller.text = "";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
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
                            controller: str4Controller,
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
                      "Ditemukan Kelainan Medis yang Serius, Resiko Kesehatan Tinggi",
                      Colors.black,
                      14,
                      FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest5,
                        onChanged: (value) {
                          setState(() {
                            _quest5 = value!;
                            str5 = "Ya";
                            str5Controller.text = "";
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
                            str5 = "Tidak";
                            str5Controller.text = "";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
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
                            controller: str5Controller,
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
                      "Ditemukan Kelainan Medis yang Menyebabkan Keterbatasan Fisik Maupun Psikis Untuk Melakukan Sesuai Jabatan/Posisinya",
                      Colors.black,
                      14,
                      FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest6,
                        onChanged: (value) {
                          setState(() {
                            _quest6 = value!;
                            str6 = "Ya";
                            str6Controller.text = "";
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
                            str6 = "Tidak";
                            str6Controller.text = "";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
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
                            controller: str6Controller,
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
                      "Tidak Dapat Bekerja Untuk Melakukan Pekerjaan Sesuai Jabatan/Posisinya dan/atau Posisi Apapun, dalam Perawatan Rumah Sakit, atau dalam Status Izin Sakit",
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
                            str7 = "Ya";
                            str7Controller.text = "";
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
                            str7 = "Tidak";
                            str7Controller.text = "";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 13, FontWeight.normal),
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
                            controller: str7Controller,
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
                ],
              ),
            ),
          )),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)]),
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
                  onTap: () => showDialogKesimpulan(),
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
          ),
        ],
      ),
    );
  }

  void showDialogKesimpulan() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.all(10),
          title: Container(
            width: 80,
            child: Image.asset('assets/images/icon1.png'),
          ),
          content: Text(
            "Apakah Anda yakin ingin\nmenyimpan?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: textDefault(
                            "Tidak", Colors.black, 13, FontWeight.bold),
                      )),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: InkWell(
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) {
                  //     return FormSuccess();
                  //   }),
                  // ),
                  onTap: saveButton,
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: textDefault(
                            "Ya, Simpan", Colors.white, 14, FontWeight.bold),
                      )),
                )),
              ],
            )
          ],
        );
      },
    );
  }

  saveButton() async {
    KesimpulanDerajatKesehatanModel data = KesimpulanDerajatKesehatanModel(
      ditemukanKelainanMedis:
          str1Controller.text != "" ? str1Controller.text : str1,
      ditemukanKelainanYangTidakSerius:
          str2Controller.text != "" ? str2Controller.text : str2,
      ditemukanKelainanResikoKesehatanRendah:
          str3Controller.text != "" ? str3Controller.text : str3,
      ditemukanKelainanResikoKesehatanSedang:
          str4Controller.text != "" ? str4Controller.text : str4,
      ditemukanKelainanResikoKesehatanTinggi:
          str5Controller.text != "" ? str5Controller.text : str5,
      ditemukanKelainanMenyebabkanKeterbatasan:
          str6Controller.text != "" ? str6Controller.text : str6,
      tidakDapatBekerja: str7Controller.text != "" ? str7Controller.text : str7,
    );

    firestore
        .setKesimpulanDerajatKesehatan(
            kesimpulanDerajatKesehatan: data, idPasien: widget.idPasien!)
        .whenComplete(
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return FormSuccess(
                idPasien: widget.idPasien,
              );
            }),
          ),
        );
  }
}
