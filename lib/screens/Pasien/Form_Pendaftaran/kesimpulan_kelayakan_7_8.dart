// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:arifa_medikal_klink_3/model/kelayakan_kerja_model.dart';
import 'package:arifa_medikal_klink_3/model/pasien_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_umum_model.dart';
import 'package:arifa_medikal_klink_3/model/penyakit_terdahulu_model.dart';
import 'package:arifa_medikal_klink_3/model/riwayat_kebiasaan_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/kesimpulan_derajat_8_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/pasien_detail.dart';
import '../../../components/colors/color.dart';
import '../../../components/widget/text.dart';

enum Question { ya, tidak, none }

class KesimpulanKelayakan7 extends StatefulWidget {
  const KesimpulanKelayakan7({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<KesimpulanKelayakan7> createState() => _KesimpulanKelayakan7State();
}

class _KesimpulanKelayakan7State extends State<KesimpulanKelayakan7> {
  Question _quest1 = Question.tidak;
  Question _quest2 = Question.tidak;
  Question _quest3 = Question.tidak;
  Question _quest4 = Question.tidak;

  String layakBekerjaTanpaCatatan = "Tidak";
  String layakBekerjaDenganCatatan = "Tidak";
  String layakBekerjaDenganPenyesuaian = "Tidak";
  String layakUntukBekerja = "Tidak";
  TextEditingController layakBekerjaTanpaCatatanController =
      TextEditingController();
  TextEditingController layakBekerjaDenganCatatanController =
      TextEditingController();
  TextEditingController layakBekerjaDenganPenyesuaianController =
      TextEditingController();
  TextEditingController layakUntukBekerjaController = TextEditingController();

  final cardiovaskuler = TextEditingController();

  final FirebaseFirestoreService firestore = FirebaseFirestoreService();
  KelayakanKerjaModel? data;
  int? valueKelamin;
  int valueUmur = 0;
  int? valueTekananDarah;
  int? valueIMT;
  int? valueMerokok;
  int? valueDiabetes;
  int? valueFisik;
  PasienModel? _pasien;
  PemeriksaanUmumModel? _pemeriksaanUmum;
  RiwayatKebiasaanModel? _riwayatKebiasan;
  PenyakitTerdahuluModel? _penyakitTerdahulu;
  PemeriksaanModel? _pemeriksaan;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    data = await firestore.getKelayakanKerja(widget.idPasien!);
    if (data != null) {
      setState(() {
        cardiovaskuler.text = data!.resikoCardioVascular!;
      });
      if (data!.layakBekerjaSesuaiPosisi! == "Ya") {
        setState(() {
          layakBekerjaTanpaCatatan = data!.layakBekerjaSesuaiPosisi!;
          _quest1 = Question.ya;
        });
      } else if (data!.layakBekerjaSesuaiPosisi! == "Tidak") {
        setState(() {
          layakBekerjaTanpaCatatan = data!.layakBekerjaSesuaiPosisi!;
          _quest1 = Question.tidak;
        });
      } else if (data!.layakBekerjaSesuaiPosisi! == "") {
      } else {
        setState(() {
          layakBekerjaTanpaCatatanController.text =
              data!.layakBekerjaSesuaiPosisi!;
        });
      }

      if (data!.layakBekerjaDenganCatatan! == "Ya") {
        setState(() {
          layakBekerjaDenganCatatan = data!.layakBekerjaDenganCatatan!;
          _quest2 = Question.ya;
        });
      } else if (data!.layakBekerjaDenganCatatan! == "Tidak") {
        setState(() {
          layakBekerjaDenganCatatan = data!.layakBekerjaDenganCatatan!;
          _quest2 = Question.tidak;
        });
      } else if (data!.layakBekerjaDenganCatatan! == "") {
      } else {
        setState(() {
          layakBekerjaTanpaCatatanController.text =
              data!.layakBekerjaDenganCatatan!;
        });
      }

      if (data!.layakBekerjaDenganPenyesuaian! == "Ya") {
        setState(() {
          layakBekerjaDenganPenyesuaian = data!.layakBekerjaDenganPenyesuaian!;
          _quest3 = Question.ya;
        });
      } else if (data!.layakBekerjaDenganPenyesuaian! == "Tidak") {
        setState(() {
          layakBekerjaDenganPenyesuaian = data!.layakBekerjaDenganPenyesuaian!;
          _quest3 = Question.tidak;
        });
      } else if (data!.layakBekerjaDenganPenyesuaian! == "") {
      } else {
        setState(() {
          layakBekerjaDenganPenyesuaianController.text =
              data!.layakBekerjaDenganPenyesuaian!;
        });
      }

      if (data!.layakuntukBekerja! == "Ya") {
        setState(() {
          layakUntukBekerja = data!.layakuntukBekerja!;
          _quest4 = Question.ya;
        });
      } else if (data!.layakuntukBekerja! == "Tidak") {
        setState(() {
          layakUntukBekerja = data!.layakuntukBekerja!;
          _quest4 = Question.tidak;
        });
      } else if (data!.layakuntukBekerja! == "") {
      } else {
        setState(() {
          layakUntukBekerjaController.text = data!.layakuntukBekerja!;
        });
      }
    }
    _pasien = await firestore.getPasien(widget.idPasien!);
    _pemeriksaanUmum = await firestore.getPemeriksaanUmum(widget.idPasien!);
    _penyakitTerdahulu = await firestore.getPenyakitTerdahulu(widget.idPasien!);
    _pemeriksaan = await firestore.getPemeriksaan(widget.idPasien!);
    _riwayatKebiasan = await firestore.getRiwayatKebiasaan(widget.idPasien!);

    if (_pasien != null &&
        _pemeriksaanUmum != null &&
        _penyakitTerdahulu != null &&
        _pemeriksaan != null) {
      if (_pasien!.jenisKelamin != "" &&
          _pasien!.umurTahun != "" &&
          _pemeriksaanUmum!.tekananDarah != "" &&
          _pemeriksaanUmum!.imt != "" &&
          _riwayatKebiasan!.strMerokok != "" &&
          _penyakitTerdahulu!.diabetes != "" &&
          _pemeriksaan!.aktivitasFisik != "") {
        // UMUR
        int umurKu = int.parse(_pasien!.umurTahun!);
        if (umurKu <= 34) {
          setState(() {
            valueUmur = -4;
          });
        } else if (umurKu > 34 && umurKu <= 39) {
          setState(() {
            valueUmur = -3;
          });
        } else if (umurKu >= 40 && umurKu <= 44) {
          setState(() {
            valueUmur = -2;
          });
        } else if (umurKu >= 45 && umurKu <= 49) {
          setState(() {
            valueUmur = 0;
          });
        } else if (umurKu >= 50 && umurKu <= 54) {
          setState(() {
            valueUmur = 1;
          });
        } else if (umurKu >= 55 && umurKu <= 59) {
          setState(() {
            valueUmur = 2;
          });
        } else if (umurKu >= 60) {
          setState(() {
            valueUmur = 3;
          });
        }

        // JENIS KELAMIN
        if (_pasien!.jenisKelamin == "Pria") {
          setState(() {
            valueKelamin = 1;
          });
        } else {
          setState(() {
            valueKelamin = 0;
          });
        }

        //TEKANAN DARAH
        var tekananDarah = int.parse(_pemeriksaanUmum!.tekananDarah!);
        if (tekananDarah < 130) {
          setState(() {
            valueTekananDarah = 0;
          });
        } else if (tekananDarah >= 130 && tekananDarah <= 139) {
          setState(() {
            valueTekananDarah = 1;
          });
        } else if (tekananDarah >= 140 && tekananDarah <= 159) {
          setState(() {
            valueTekananDarah = 2;
          });
        } else if (tekananDarah >= 160 && tekananDarah <= 179) {
          setState(() {
            valueTekananDarah = 3;
          });
        } else if (tekananDarah >= 180) {
          setState(() {
            valueTekananDarah = 4;
          });
        }

        //IMT
        var imt = double.parse(_pemeriksaanUmum!.imt!);

        if (imt <= 25.99) {
          setState(() {
            valueIMT = 0;
          });
        } else if (imt >= 26.00 && imt <= 29.99) {
          setState(() {
            valueIMT = 1;
          });
        } else if (imt <= 30.00) {
          setState(() {
            valueIMT = 2;
          });
        }

        //MEROKOK
        if (_riwayatKebiasan!.strMerokok == "Tidak") {
          setState(() {
            valueMerokok = 0;
          });
        } else if (_riwayatKebiasan!.strMerokok == "Ya") {
          setState(() {
            valueMerokok = 4;
          });
        }

        //DIABETES
        if (_penyakitTerdahulu!.diabetes == "Ya") {
          setState(() {
            valueDiabetes = 2;
          });
        } else if (_penyakitTerdahulu!.diabetes == "Tidak") {
          setState(() {
            valueDiabetes = 0;
          });
        }

        //AKTIVITAS FISIK
        var fisik = _pemeriksaan!.aktivitasFisik;
        if (fisik == "Tidak Ada") {
          setState(() {
            valueFisik = 2;
          });
        } else if (fisik == "Ringan") {
          setState(() {
            valueFisik = 1;
          });
        } else if (fisik == "Sedang") {
          setState(() {
            valueFisik = 0;
          });
        } else if (fisik == "Berat") {
          setState(() {
            valueFisik = -3;
          });
        }

        var total = valueKelamin! +
            valueUmur +
            valueTekananDarah! +
            valueIMT! +
            valueMerokok! +
            valueDiabetes! +
            valueFisik!;
        print("TOTAL $total");
        if (total <= 1) {
          setState(() {
            cardiovaskuler.text = "Resiko Rendah (Skor $total)";
          });
        } else if (total >= 2 && total <= 4) {
          setState(() {
            cardiovaskuler.text = "Resiko Sedang (Skor $total)";
          });
        } else if (total >= 5) {
          setState(() {
            cardiovaskuler.text = "Resiko Tinggi (Skor $total)";
          });
        }
        // print("awal UMUR ${valueUmur}");
        // print("awal KELAMIN $valueKelamin");
        // print("awal TEKANAN DARAH $valueTekananDarah");
        // print("awal MEROKOK $valueMerokok");
        // print("awal Diabetes $valueDiabetes");
        // print("awal AK FISIK $valueFisik");
        print("VALUE UMUR $valueUmur");
        print("VALUE KELAMIN $valueKelamin");
        print("VALUE TEKANAN DARAH $valueTekananDarah");
        print("VALUE IMT $valueIMT");
        print("VALUE MEROKOK $valueMerokok");
        print("VALUE Diabetes $valueDiabetes");
        print("VALUE AK FISIK $valueFisik");
      } else {
        print("gagal");
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
            textDefault("Kesimpulan Kelayakan Kerja", Colors.white, 16,
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
                        textDefault("7/8", Colors.black, 14, FontWeight.bold)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 300,
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
                        "Laik Bekerja Sesuai Posisi dan Lokasi Saat Ini",
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
                              layakBekerjaTanpaCatatan = "Ya";
                              layakBekerjaTanpaCatatanController.text = "";
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
                              layakBekerjaTanpaCatatan = "Tidak";
                              layakBekerjaTanpaCatatanController.text = "";
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
                              controller: layakBekerjaTanpaCatatanController,
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
                        "Laik Bekerja Sesuai Posisi dan Lokasi Saat Ini, dengan Catatan",
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
                              layakBekerjaDenganCatatan = "Ya";
                              layakBekerjaDenganCatatanController.text = "";
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
                              layakBekerjaDenganCatatan = "Tidak";
                              layakBekerjaDenganCatatanController.text = "";
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
                              controller: layakBekerjaDenganCatatanController,
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
                        "Laik Bekerja dengan Penyesuaian dan atau Pembatasan Kerja",
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
                              layakBekerjaDenganPenyesuaian = "Ya";
                              layakBekerjaDenganPenyesuaianController.text = "";
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
                              layakBekerjaDenganPenyesuaian = "Tidak";
                              layakBekerjaDenganPenyesuaianController.text = "";
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
                              controller:
                                  layakBekerjaDenganPenyesuaianController,
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
                    textDefault("Tidak Laik untuk Bekerja", Colors.black, 14,
                        FontWeight.bold),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: Question.ya,
                          groupValue: _quest4,
                          onChanged: (value) {
                            setState(() {
                              _quest4 = value!;
                              layakUntukBekerja = "Ya";
                              layakUntukBekerjaController.text = "";
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
                              layakUntukBekerja = "Tidak";
                              layakUntukBekerjaController.text = "";
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
                              controller: layakUntukBekerjaController,
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
                    textDefault("Resiko Cardiovaskuler", Colors.black, 14,
                        FontWeight.bold),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        enabled: false,
                        controller: cardiovaskuler,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
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

  saveButton() async {
    KelayakanKerjaModel data = KelayakanKerjaModel(
      layakBekerjaSesuaiPosisi: layakBekerjaTanpaCatatanController.text != ""
          ? layakBekerjaTanpaCatatanController.text
          : layakBekerjaTanpaCatatan,
      layakBekerjaDenganCatatan: layakBekerjaDenganCatatanController.text != ""
          ? layakBekerjaDenganCatatanController.text
          : layakBekerjaDenganCatatan,
      layakBekerjaDenganPenyesuaian:
          layakBekerjaDenganPenyesuaianController.text != ""
              ? layakBekerjaDenganPenyesuaianController.text
              : layakBekerjaDenganPenyesuaian,
      layakuntukBekerja: layakUntukBekerjaController.text != ""
          ? layakUntukBekerjaController.text
          : layakUntukBekerja,
      resikoCardioVascular: cardiovaskuler.text,
    );

    firestore.setKelayakanKerja(
        kelayakanKerja: data, idPasien: widget.idPasien!);

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
