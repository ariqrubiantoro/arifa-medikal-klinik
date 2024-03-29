// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:arifa_medikal_klink_3/model/kesimpulan_derajat_kesehatan.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/form_success.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/pasien_detail.dart';
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
  KesimpulanDerajatKesehatanModel? data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    data = await firestore.getKesimpulanDerajatKesehatan(widget.idPasien!);
    if (data != null) {
      if (data!.ditemukanKelainanMedis! == "Ya") {
        setState(() {
          str1 = data!.ditemukanKelainanMedis!;
          _quest1 = Question.ya;
        });
      } else if (data!.ditemukanKelainanMedis! == "Tidak") {
        setState(() {
          str1 = data!.ditemukanKelainanMedis!;
          _quest1 = Question.tidak;
        });
      } else if (data!.ditemukanKelainanMedis! == "") {
      } else {
        setState(() {
          str1Controller.text = data!.ditemukanKelainanMedis!;
        });
      }

      if (data!.ditemukanKelainanYangTidakSerius! == "Ya") {
        setState(() {
          str2 = data!.ditemukanKelainanYangTidakSerius!;
          _quest2 = Question.ya;
        });
      } else if (data!.ditemukanKelainanYangTidakSerius! == "Tidak") {
        setState(() {
          str2 = data!.ditemukanKelainanYangTidakSerius!;
          _quest2 = Question.tidak;
        });
      } else if (data!.ditemukanKelainanYangTidakSerius! == "") {
      } else {
        setState(() {
          str2Controller.text = data!.ditemukanKelainanYangTidakSerius!;
        });
      }

      if (data!.ditemukanKelainanResikoKesehatanRendah! == "Ya") {
        setState(() {
          str3 = data!.ditemukanKelainanResikoKesehatanRendah!;
          _quest3 = Question.ya;
        });
      } else if (data!.ditemukanKelainanResikoKesehatanRendah! == "Tidak") {
        setState(() {
          str3 = data!.ditemukanKelainanResikoKesehatanRendah!;
          _quest3 = Question.tidak;
        });
      } else if (data!.ditemukanKelainanResikoKesehatanRendah! == "") {
      } else {
        setState(() {
          str3Controller.text = data!.ditemukanKelainanResikoKesehatanRendah!;
        });
      }

      if (data!.ditemukanKelainanResikoKesehatanSedang! == "Ya") {
        setState(() {
          str4 = data!.ditemukanKelainanResikoKesehatanSedang!;
          _quest4 = Question.ya;
        });
      } else if (data!.ditemukanKelainanResikoKesehatanSedang! == "Tidak") {
        setState(() {
          str4 = data!.ditemukanKelainanResikoKesehatanSedang!;
          _quest4 = Question.tidak;
        });
      } else if (data!.ditemukanKelainanResikoKesehatanSedang! == "") {
      } else {
        setState(() {
          str4Controller.text = data!.ditemukanKelainanResikoKesehatanSedang!;
        });
      }

      if (data!.ditemukanKelainanResikoKesehatanTinggi! == "Ya") {
        setState(() {
          str5 = data!.ditemukanKelainanResikoKesehatanTinggi!;
          _quest5 = Question.ya;
        });
      } else if (data!.ditemukanKelainanResikoKesehatanTinggi! == "Tidak") {
        setState(() {
          str5 = data!.ditemukanKelainanResikoKesehatanTinggi!;
          _quest5 = Question.tidak;
        });
      } else if (data!.ditemukanKelainanResikoKesehatanTinggi! == "") {
      } else {
        setState(() {
          str5Controller.text = data!.ditemukanKelainanResikoKesehatanTinggi!;
        });
      }

      if (data!.ditemukanKelainanMenyebabkanKeterbatasan! == "Ya") {
        setState(() {
          str6 = data!.ditemukanKelainanMenyebabkanKeterbatasan!;
          _quest6 = Question.ya;
        });
      } else if (data!.ditemukanKelainanMenyebabkanKeterbatasan! == "Tidak") {
        setState(() {
          str6 = data!.ditemukanKelainanMenyebabkanKeterbatasan!;
          _quest6 = Question.tidak;
        });
      } else if (data!.ditemukanKelainanMenyebabkanKeterbatasan! == "") {
      } else {
        setState(() {
          str6Controller.text = data!.ditemukanKelainanMenyebabkanKeterbatasan!;
        });
      }

      if (data!.tidakDapatBekerja! == "Ya") {
        setState(() {
          str7 = data!.tidakDapatBekerja!;
          _quest7 = Question.ya;
        });
      } else if (data!.tidakDapatBekerja! == "Tidak") {
        setState(() {
          str7 = data!.tidakDapatBekerja!;
          _quest7 = Question.tidak;
        });
      } else if (data!.tidakDapatBekerja! == "") {
      } else {
        setState(() {
          str7Controller.text = data!.tidakDapatBekerja!;
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
            textDefault("Kesimpulan Derajat Kesehatan", Colors.white, 16,
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
                    textDefault("Tidak Ditemukan Kelainan Medis", Colors.black,
                        14, FontWeight.bold),
                    textDefault(
                        "(Note: Pilih Ya jika ditemukan kelainan medis)",
                        Colors.grey,
                        12,
                        FontWeight.normal),
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
                        textDefault(
                            "Tidak", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Tidak Ditemukan Kelainan Medis yang Tidak Serius",
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
                        textDefault(
                            "Tidak", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    // textDefault(
                    //     "(Note: Pilih Ya jika ditemukan kelainan medis yang tidak serius)",
                    //     Colors.grey,
                    //     12,
                    //     FontWeight.normal),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Tidak Ditemukan Kelainan Medis, Resiko Kesehatan Rendah",
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
                        textDefault(
                            "Tidak", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    // textDefault(
                    //     "(Note: Pilih Ya jika ditemukan kelainan medis, Resiko kesehatan rendah)",
                    //     Colors.grey,
                    //     12,
                    //     FontWeight.normal),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Tidak Ditemukan Kelainan Medis Bermakna yang Dapat Menjadi Serius, Resiko Kesehatan Sedang",
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
                        textDefault(
                            "Tidak", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    // textDefault(
                    //     "(Note: Pilih Ya jika ditemukan kelainan medis, Resiko kesehatan sedang)",
                    //     Colors.grey,
                    //     12,
                    //     FontWeight.normal),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Tidak Ditemukan Kelainan Medis yang Serius, Resiko Kesehatan Tinggi",
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
                        textDefault(
                            "Tidak", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    // textDefault(
                    //     "(Note: Pilih Ya jika ditemukan kelainan medis, Resiko kesehatan tinggi)",
                    //     Colors.grey,
                    //     12,
                    //     FontWeight.normal),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Tidak Ditemukan Kelainan Medis yang Menyebabkan Keterbatasan Fisik Maupun Psikis Untuk Melakukan Sesuai Jabatan/Posisinya",
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
                        textDefault(
                            "Tidak", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    // textDefault(
                    //     "(Note: Pilih Ya jika ditemukan kelainan medis yang Menyebabkan Keterbatasan Fisik Maupun Psikis Untuk Melakukan Sesuai Jabatan/Posisinya)",
                    //     Colors.grey,
                    //     12,
                    //     FontWeight.normal),
                    SizedBox(
                      height: 10,
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
                        textDefault(
                            "Tidak", Colors.black, 13, FontWeight.normal),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    // textDefault(
                    //     "(Note: Pilih Ya jika Tidak Dapat Bekerja Untuk Melakukan Pekerjaan Sesuai Jabatan/Posisinya)",
                    //     Colors.grey,
                    //     12,
                    //     FontWeight.normal),
                    SizedBox(
                      height: 10,
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

    firestore.setKesimpulanDerajatKesehatan(
        kesimpulanDerajatKesehatan: data, idPasien: widget.idPasien!);

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
