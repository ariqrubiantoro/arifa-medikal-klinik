// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/psikologi_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/riwayat_pajanan/ergonomis.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

enum Question { ya, tidak, none }

class Psikologis extends StatefulWidget {
  const Psikologis({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<Psikologis> createState() => _PsikologisState();
}

class _PsikologisState extends State<Psikologis> {
  Question _quest1 = Question.none;
  Question _quest2 = Question.none;
  Question _quest3 = Question.none;
  Question _quest4 = Question.none;
  Question _quest5 = Question.none;
  Question _quest6 = Question.none;
  Question _quest7 = Question.none;

  String bebanKerja = "";
  String pekerjaanTidakSesuai = "";
  String ketidakjelasanTugas = "";
  String hambatanJenjang = "";
  String bekerjaGiliran = "";
  String konflikDenganTeman = "";
  String konflikDalamKeluarga = "";

  final lainlain = TextEditingController();

  TextEditingController bebanKerjaController = TextEditingController();
  TextEditingController pekerjaanTidakSesuaiController =
      TextEditingController();
  TextEditingController ketidakjelasanTugasController = TextEditingController();
  TextEditingController hambatanJenjangController = TextEditingController();
  TextEditingController bekerjaGiliranController = TextEditingController();
  TextEditingController konflikDenganTemanController = TextEditingController();
  TextEditingController konflikDalamKeluargaController =
      TextEditingController();

  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  PsikologiModel? data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    data = await firestore.getPsikologi(widget.idPasien!);
    if (data != null) {
      setState(() {
        lainlain.text = data!.lainLain!;
      });
      if (data!.bebanKerja == "Ya") {
        setState(() {
          bebanKerja = data!.bebanKerja!;
          _quest1 = Question.ya;
        });
      } else if (data!.bebanKerja == "Tidak") {
        setState(() {
          bebanKerja = data!.bebanKerja!;
          _quest1 = Question.tidak;
        });
      } else if (data!.bebanKerja == "") {
      } else {
        bebanKerjaController.text = data!.bebanKerja!;
      }

      if (data!.pekerjaanTidakSesuai == "Ya") {
        setState(() {
          pekerjaanTidakSesuai = data!.pekerjaanTidakSesuai!;
          _quest2 = Question.ya;
        });
      } else if (data!.pekerjaanTidakSesuai == "Tidak") {
        setState(() {
          pekerjaanTidakSesuai = data!.pekerjaanTidakSesuai!;
          _quest2 = Question.tidak;
        });
      } else if (data!.pekerjaanTidakSesuai == "") {
      } else {
        pekerjaanTidakSesuaiController.text = data!.pekerjaanTidakSesuai!;
      }
    }

    if (data!.ketidakjelasanTugas == "Ya") {
      setState(() {
        ketidakjelasanTugas = data!.ketidakjelasanTugas!;
        _quest3 = Question.ya;
      });
    } else if (data!.ketidakjelasanTugas == "Tidak") {
      setState(() {
        ketidakjelasanTugas = data!.ketidakjelasanTugas!;
        _quest3 = Question.tidak;
      });
    } else if (data!.ketidakjelasanTugas == "") {
    } else {
      ketidakjelasanTugasController.text = data!.ketidakjelasanTugas!;
    }

    if (data!.hamabatanJenjangKarir == "Ya") {
      setState(() {
        hambatanJenjang = data!.hamabatanJenjangKarir!;
        _quest4 = Question.ya;
      });
    } else if (data!.hamabatanJenjangKarir == "Tidak") {
      setState(() {
        hambatanJenjang = data!.hamabatanJenjangKarir!;
        _quest4 = Question.tidak;
      });
    } else if (data!.hamabatanJenjangKarir == "") {
    } else {
      hambatanJenjangController.text = data!.hamabatanJenjangKarir!;
    }

    if (data!.shift == "Ya") {
      setState(() {
        bekerjaGiliran = data!.shift!;
        _quest5 = Question.ya;
      });
    } else if (data!.shift == "Tidak") {
      setState(() {
        bekerjaGiliran = data!.shift!;
        _quest5 = Question.tidak;
      });
    } else if (data!.shift == "") {
    } else {
      bekerjaGiliranController.text = data!.shift!;
    }

    if (data!.konflikRekanKerja == "Ya") {
      setState(() {
        konflikDenganTeman = data!.konflikRekanKerja!;
        _quest6 = Question.ya;
      });
    } else if (data!.konflikRekanKerja == "Tidak") {
      setState(() {
        konflikDenganTeman = data!.konflikRekanKerja!;
        _quest6 = Question.tidak;
      });
    } else if (data!.konflikRekanKerja == "") {
    } else {
      konflikDenganTemanController.text = data!.konflikRekanKerja!;
    }

    if (data!.konflikKeluarga == "Ya") {
      setState(() {
        konflikDalamKeluarga = data!.konflikKeluarga!;
        _quest7 = Question.ya;
      });
    } else if (data!.konflikKeluarga == "Tidak") {
      setState(() {
        konflikDalamKeluarga = data!.konflikKeluarga!;
        _quest7 = Question.tidak;
      });
    } else if (data!.konflikKeluarga == "") {
    } else {
      konflikDalamKeluargaController.text = data!.konflikKeluarga!;
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
                 
             textDefault("Riwayat Pajanan - Psikologis", Colors.white, 16,
                FontWeight.bold)
                 , SizedBox(
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
                      textDefault(
                          "Beban Kerja Tidak Sesuai dengan Waktu dan Jumlah Pekerjaan",
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
                                bebanKerja = "Ya";
                                bebanKerjaController.text = "";
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
                                bebanKerja = "Tidak";
                                bebanKerjaController.text = "";
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
                                controller: bebanKerjaController,
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
                          "Pekerjaan Tidak Sesuai dengan Pengetahuan dan Keterampilan",
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
                                pekerjaanTidakSesuai = "Ya";
                                pekerjaanTidakSesuaiController.text = "";
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
                                pekerjaanTidakSesuai = "Tidak";
                                pekerjaanTidakSesuaiController.text = "";
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
                                controller: pekerjaanTidakSesuaiController,
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
                      textDefault("Ketidakjelasan Tugas", Colors.black, 14,
                          FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ya,
                            groupValue: _quest3,
                            onChanged: (value) {
                              setState(() {
                                _quest3 = value!;
                                ketidakjelasanTugas = "Ya";
                                ketidakjelasanTugasController.text = "";
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
                                ketidakjelasanTugas = "Tidak";
                                ketidakjelasanTugasController.text = "";
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
                                controller: ketidakjelasanTugasController,
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
                      textDefault("Hambatan Jenjang Karir", Colors.black, 14,
                          FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ya,
                            groupValue: _quest4,
                            onChanged: (value) {
                              setState(() {
                                _quest4 = value!;
                                hambatanJenjang = "Ya";
                                hambatanJenjangController.text = "";
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
                                hambatanJenjang = "Tidak";
                                hambatanJenjangController.text = "";
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
                                controller: hambatanJenjangController,
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
                      textDefault("Bekerja Giliran (Shift)", Colors.black, 14,
                          FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ya,
                            groupValue: _quest5,
                            onChanged: (value) {
                              setState(() {
                                _quest5 = value!;
                                bekerjaGiliran = "Ya";
                                bekerjaGiliranController.text = "";
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
                                bekerjaGiliran = "Tidak";
                                bekerjaGiliranController.text = "";
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
                                controller: bekerjaGiliranController,
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
                      textDefault("Konflik dengan Teman Sekerja", Colors.black,
                          14, FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ya,
                            groupValue: _quest6,
                            onChanged: (value) {
                              setState(() {
                                _quest6 = value!;
                                konflikDenganTeman = "Ya";
                                konflikDenganTemanController.text = "";
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
                                konflikDenganTeman = "Tidak";
                                konflikDenganTemanController.text = "";
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
                                controller: konflikDenganTemanController,
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
                      textDefault("Konflik dalam Keluarga", Colors.black, 14,
                          FontWeight.bold),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Question.ya,
                            groupValue: _quest7,
                            onChanged: (value) {
                              setState(() {
                                _quest7 = value!;
                                konflikDalamKeluarga = "Ya";
                                konflikDalamKeluargaController.text = "";
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
                                konflikDalamKeluarga = "Tidak";
                                konflikDalamKeluargaController.text = "";
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
                                controller: konflikDalamKeluargaController,
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
    PsikologiModel data = PsikologiModel(
      bebanKerja: bebanKerjaController.text != ""
          ? bebanKerjaController.text
          : bebanKerja,
      pekerjaanTidakSesuai: pekerjaanTidakSesuaiController.text != ""
          ? pekerjaanTidakSesuaiController.text
          : pekerjaanTidakSesuai,
      ketidakjelasanTugas: ketidakjelasanTugasController.text != ""
          ? ketidakjelasanTugasController.text
          : ketidakjelasanTugas,
      hamabatanJenjangKarir: hambatanJenjangController.text != ""
          ? hambatanJenjangController.text
          : hambatanJenjang,
      shift: bekerjaGiliranController.text != ""
          ? bekerjaGiliranController.text
          : bekerjaGiliran,
      konflikRekanKerja: konflikDenganTemanController.text != ""
          ? konflikDenganTemanController.text
          : konflikDenganTeman,
      konflikKeluarga: konflikDalamKeluargaController.text != ""
          ? konflikDalamKeluargaController.text
          : konflikDalamKeluarga,
      lainLain: lainlain.text,
    );

    firestore.setPsikologi(psikologi: data, idPasien: widget.idPasien!);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MenuForm(idPasien: widget.idPasien!);
    }));
  }
}
