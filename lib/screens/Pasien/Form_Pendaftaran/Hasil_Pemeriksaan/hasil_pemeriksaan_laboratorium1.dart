// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:arifa_medikal_klink_3/components/alert/alert.dart';
import 'package:arifa_medikal_klink_3/model/hasil_pemeriksaan/hasil_pemeriksaan_laboratorium_model.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../components/colors/color.dart';
import '../../../../components/widget/text.dart';
import '../../Menu_Form/menu_form.dart';
import '../../pasien_detail.dart';
import '../pemeriksaan_5_8.dart';

class HasilPemeriksaanLaboratorium1 extends StatefulWidget {
  HasilPemeriksaanLaboratorium1({super.key, required this.idPasien});
  String idPasien;

  @override
  State<HasilPemeriksaanLaboratorium1> createState() =>
      _HasilPemeriksaanLaboratorium1State();
}

class _HasilPemeriksaanLaboratorium1State
    extends State<HasilPemeriksaanLaboratorium1> {
  final FirebaseFirestoreService firestore = FirebaseFirestoreService();

  final dokter = TextEditingController();
  final analisa = TextEditingController();

  final hemoglobin = TextEditingController();
  final hematokrit = TextEditingController();
  final eritrosit = TextEditingController();
  final trombosit = TextEditingController();
  final leukosit = TextEditingController();
  final mcv = TextEditingController();
  final mch = TextEditingController();
  final mchc = TextEditingController();
  final rdw = TextEditingController();
  final led = TextEditingController();
  final limfosit = TextEditingController();
  final granulosit = TextEditingController();
  final mid = TextEditingController();

  final bilirubinTotal = TextEditingController();
  final bilirubinDirect = TextEditingController();
  final bilirubinIndirect = TextEditingController();
  final sgot = TextEditingController();
  final sgpt = TextEditingController();
  final alkalinePhosphatase = TextEditingController();
  final cholinesterase = TextEditingController();
  final ureum = TextEditingController();
  final creatinine = TextEditingController();
  final uricAcid = TextEditingController();
  final glukosaPuasa = TextEditingController();
  final kgd2JamPP = TextEditingController();
  final cholesterolTotal = TextEditingController();
  final hdlCholesterol = TextEditingController();
  final ldlCholesterol = TextEditingController();
  final triglyserida = TextEditingController();

  final leukositUrinalisa = TextEditingController();
  final nitrit = TextEditingController();
  final urobilin = TextEditingController();
  final protein = TextEditingController();
  final ph = TextEditingController();
  final darah = TextEditingController();
  final beratJenis = TextEditingController();
  final keton = TextEditingController();
  final bilirubi = TextEditingController();
  final glukosa = TextEditingController();
  final golonganDarah = TextEditingController();

  final konsitensi = TextEditingController();
  final warna = TextEditingController();
  final lendir = TextEditingController();
  final darahFeses = TextEditingController();
  final telurCacing = TextEditingController();
  final parasit = TextEditingController();
  final cyste = TextEditingController();
  final leucocyte = TextEditingController();
  final erythrocyte = TextEditingController();
  final lemak = TextEditingController();
  final amylum = TextEditingController();
  final serabut = TextEditingController();

  bool booldokter = false;
  bool boolanalisa = false;

  bool boolhemoglobin = false;
  bool boolhematokrit = false;
  bool booleritrosit = false;
  bool booltrombosit = false;
  bool boolleukosit = false;
  bool boolmcv = false;
  bool boolmch = false;
  bool boolmchc = false;
  bool boolrdw = false;
  bool boolled = false;
  bool boollimfosit = false;
  bool boolgranulosit = false;
  bool boolmid = false;

  bool boolbilirubinTotal = false;
  bool boolbilirubinDirect = false;
  bool boolbilirubinIndirect = false;
  bool boolsgot = false;
  bool boolsgpt = false;
  bool boolalkalinePhosphatase = false;
  bool boolcholinesterase = false;
  bool boolureum = false;
  bool boolcreatinine = false;
  bool booluricAcid = false;
  bool boolglukosaPuasa = false;
  bool boolkgd2JamPP = false;
  bool boolcholesterolTotal = false;
  bool boolhdlCholesterol = false;
  bool boolldlCholesterol = false;
  bool booltriglyserida = false;

  bool boolleukositUrinalisa = false;
  bool boolnitrit = false;
  bool boolurobilin = false;
  bool boolprotein = false;
  bool boolph = false;
  bool booldarah = false;
  bool boolberatJenis = false;
  bool boolketon = false;
  bool boolbilirubi = false;
  bool boolglukosa = false;
  bool boolgolonganDarah = false;

  bool boolkonsitensi = false;
  bool boolwarna = false;
  bool boollendir = false;
  bool booldarahFeses = false;
  bool booltelurCacing = false;
  bool boolparasit = false;
  bool boolcyste = false;
  bool boolleucocyte = false;
  bool boolerythrocyte = false;
  bool boollemak = false;
  bool boolamylum = false;
  bool boolserabut = false;

  HasilPemeriksaanLaboratoriumModel? _hasilPemeriksaanLaboratorium;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    _hasilPemeriksaanLaboratorium =
        await firestore.getHasilPemeriksaanLaboratorium1(widget.idPasien);
    if (_hasilPemeriksaanLaboratorium != null) {
      setState(() {
        hemoglobin.text = _hasilPemeriksaanLaboratorium!.hemoglobin ?? "";
        hematokrit.text = _hasilPemeriksaanLaboratorium!.hematokrit ?? "";
        eritrosit.text = _hasilPemeriksaanLaboratorium!.eritrosit ?? "";
        trombosit.text = _hasilPemeriksaanLaboratorium!.trombosit ?? "";
        leukosit.text = _hasilPemeriksaanLaboratorium!.leukosit ?? "";
        mcv.text = _hasilPemeriksaanLaboratorium!.mcv ?? "";
        mch.text = _hasilPemeriksaanLaboratorium!.mch ?? "";
        mchc.text = _hasilPemeriksaanLaboratorium!.mchc ?? "";
        rdw.text = _hasilPemeriksaanLaboratorium!.rdw ?? "";
        limfosit.text = _hasilPemeriksaanLaboratorium!.limfosit ?? "";
        granulosit.text = _hasilPemeriksaanLaboratorium!.granulosit ?? "";
        mid.text = _hasilPemeriksaanLaboratorium!.mid ?? "";

        bilirubinTotal.text =
            _hasilPemeriksaanLaboratorium!.bilirubinTotal ?? "";
        bilirubinDirect.text =
            _hasilPemeriksaanLaboratorium!.bilirubinDirect ?? "";

        sgot.text = _hasilPemeriksaanLaboratorium!.sgot ?? "";
        sgpt.text = _hasilPemeriksaanLaboratorium!.sgpt ?? "";
        alkalinePhosphatase.text =
            _hasilPemeriksaanLaboratorium!.alkalinePhosphatase ?? "";
        cholinesterase.text =
            _hasilPemeriksaanLaboratorium!.cholinesterase ?? "";
        ureum.text = _hasilPemeriksaanLaboratorium!.ureum ?? "";
        creatinine.text = _hasilPemeriksaanLaboratorium!.creatinine ?? "";
        uricAcid.text = _hasilPemeriksaanLaboratorium!.uricAcid ?? "";
        glukosaPuasa.text = _hasilPemeriksaanLaboratorium!.glukosaPuasa ?? "";
        kgd2JamPP.text = _hasilPemeriksaanLaboratorium!.kgd2JamPP ?? "";
        cholesterolTotal.text =
            _hasilPemeriksaanLaboratorium!.cholesterolTotal ?? "";
        hdlCholesterol.text =
            _hasilPemeriksaanLaboratorium!.hdlCholesterol ?? "";
        ldlCholesterol.text =
            _hasilPemeriksaanLaboratorium!.ldlCholesterol ?? "";
        triglyserida.text = _hasilPemeriksaanLaboratorium!.triglyserida ?? "";

        leukositUrinalisa.text =
            _hasilPemeriksaanLaboratorium!.leukositUrinalisa ?? "";
        nitrit.text = _hasilPemeriksaanLaboratorium!.nitrit ?? "";
        urobilin.text = _hasilPemeriksaanLaboratorium!.urobilin ?? "";
        protein.text = _hasilPemeriksaanLaboratorium!.protein ?? "";
        ph.text = _hasilPemeriksaanLaboratorium!.ph ?? "";
        darah.text = _hasilPemeriksaanLaboratorium!.darah ?? "";
        beratJenis.text = _hasilPemeriksaanLaboratorium!.beratJenis ?? "";
        keton.text = _hasilPemeriksaanLaboratorium!.keton ?? "";
        bilirubi.text = _hasilPemeriksaanLaboratorium!.bilirubi ?? "";
        glukosa.text = _hasilPemeriksaanLaboratorium!.glukosa ?? "";

        konsitensi.text = _hasilPemeriksaanLaboratorium!.konsitensi ?? "";
        warna.text = _hasilPemeriksaanLaboratorium!.warna ?? "";
        lendir.text = _hasilPemeriksaanLaboratorium!.lendir ?? "";
        darahFeses.text = _hasilPemeriksaanLaboratorium!.darahFeses ?? "";
        telurCacing.text = _hasilPemeriksaanLaboratorium!.telurCacing ?? "";
        parasit.text = _hasilPemeriksaanLaboratorium!.parasit ?? "";
        cyste.text = _hasilPemeriksaanLaboratorium!.cyste ?? "";
        leucocyte.text = _hasilPemeriksaanLaboratorium!.leucocyte ?? "";
        erythrocyte.text = _hasilPemeriksaanLaboratorium!.erythrocyte ?? "";
        lemak.text = _hasilPemeriksaanLaboratorium!.lemak ?? "";
        amylum.text = _hasilPemeriksaanLaboratorium!.amylum ?? "";
        serabut.text = _hasilPemeriksaanLaboratorium!.serabut ?? "";
        dokter.text = _hasilPemeriksaanLaboratorium!.dokter ?? "";
        analisa.text = _hasilPemeriksaanLaboratorium!.analisa ?? "";

        led.text = _hasilPemeriksaanLaboratorium!.led ?? "";
        bilirubinIndirect.text =
            _hasilPemeriksaanLaboratorium!.bilirubinIndirect ?? "";
        golonganDarah.text = _hasilPemeriksaanLaboratorium!.golonganDarah ?? "";
      });
    }
    if (dokter.text != "") {
      setState(() {
        booldokter = true;
      });
    }
    if (analisa.text != "") {
      setState(() {
        boolanalisa = true;
      });
    }
    if (hemoglobin.text != "") {
      setState(() {
        boolhemoglobin = true;
      });
    }
    if (hematokrit.text != "") {
      setState(() {
        boolhematokrit = true;
      });
    }
    if (eritrosit.text != "") {
      setState(() {
        booleritrosit = true;
      });
    }
    if (trombosit.text != "") {
      setState(() {
        booltrombosit = true;
      });
    }
    if (leukosit.text != "") {
      setState(() {
        boolleukosit = true;
      });
    }
    if (mcv.text != "") {
      setState(() {
        boolmcv = true;
      });
    }
    if (mch.text != "") {
      setState(() {
        boolmch = true;
      });
    }
    if (mchc.text != "") {
      setState(() {
        boolmchc = true;
      });
    }
    if (rdw.text != "") {
      setState(() {
        boolrdw = true;
      });
    }
    if (led.text != "") {
      setState(() {
        boolled = true;
      });
    }
    if (limfosit.text != "") {
      setState(() {
        boollimfosit = true;
      });
    }
    if (granulosit.text != "") {
      setState(() {
        boolgranulosit = true;
      });
    }
    if (mid.text != "") {
      setState(() {
        boolmid = true;
      });
    }
    if (bilirubinTotal.text != "") {
      setState(() {
        boolbilirubinTotal = true;
      });
    }
    if (bilirubinDirect.text != "") {
      setState(() {
        boolbilirubinDirect = true;
      });
    }
    if (bilirubinIndirect.text != "") {
      setState(() {
        boolbilirubinIndirect = true;
      });
    }
    if (sgot.text != "") {
      setState(() {
        boolsgot = true;
      });
    }
    if (sgpt.text != "") {
      setState(() {
        boolsgpt = true;
      });
    }
    if (alkalinePhosphatase.text != "") {
      setState(() {
        boolalkalinePhosphatase = true;
      });
    }
    if (cholinesterase.text != "") {
      setState(() {
        boolcholinesterase = true;
      });
    }
    if (ureum.text != "") {
      setState(() {
        boolureum = true;
      });
    }
    if (creatinine.text != "") {
      setState(() {
        boolcreatinine = true;
      });
    }
    if (uricAcid.text != "") {
      setState(() {
        booluricAcid = true;
      });
    }
    if (glukosaPuasa.text != "") {
      setState(() {
        boolglukosaPuasa = true;
      });
    }
    if (kgd2JamPP.text != "") {
      setState(() {
        boolkgd2JamPP = true;
      });
    }
    if (cholesterolTotal.text != "") {
      setState(() {
        boolcholesterolTotal = true;
      });
    }
    if (hdlCholesterol.text != "") {
      setState(() {
        boolhdlCholesterol = true;
      });
    }
    if (ldlCholesterol.text != "") {
      setState(() {
        boolldlCholesterol = true;
      });
    }
    if (golonganDarah.text != "") {
      setState(() {
        boolgolonganDarah = true;
      });
    }
    if (triglyserida.text != "") {
      setState(() {
        booltriglyserida = true;
      });
    }
    if (leukositUrinalisa.text != "") {
      setState(() {
        boolleukositUrinalisa = true;
      });
    }
    if (nitrit.text != "") {
      setState(() {
        boolnitrit = true;
      });
    }
    if (urobilin.text != "") {
      setState(() {
        boolurobilin = true;
      });
    }
    if (protein.text != "") {
      setState(() {
        boolprotein = true;
      });
    }
    if (ph.text != "") {
      setState(() {
        boolph = true;
      });
    }
    if (darah.text != "") {
      setState(() {
        booldarah = true;
      });
    }
    if (beratJenis.text != "") {
      setState(() {
        boolberatJenis = true;
      });
    }
    if (keton.text != "") {
      setState(() {
        boolketon = true;
      });
    }
    if (bilirubi.text != "") {
      setState(() {
        boolbilirubi = true;
      });
    }
    if (glukosa.text != "") {
      setState(() {
        boolglukosa = true;
      });
    }
    if (golonganDarah.text != "") {
      setState(() {
        booldokter = true;
      });
    }
    if (konsitensi.text != "") {
      setState(() {
        boolkonsitensi = true;
      });
    }
    if (warna.text != "") {
      setState(() {
        boolwarna = true;
      });
    }
    if (lendir.text != "") {
      setState(() {
        boollendir = true;
      });
    }
    if (darahFeses.text != "") {
      setState(() {
        booldarahFeses = true;
      });
    }
    if (telurCacing.text != "") {
      setState(() {
        booltelurCacing = true;
      });
    }
    if (parasit.text != "") {
      setState(() {
        boolparasit = true;
      });
    }
    if (cyste.text != "") {
      setState(() {
        boolcyste = true;
      });
    }
    if (leucocyte.text != "") {
      setState(() {
        boolleucocyte = true;
      });
    }
    if (erythrocyte.text != "") {
      setState(() {
        boolerythrocyte = true;
      });
    }
    if (lemak.text != "") {
      setState(() {
        boollemak = true;
      });
    }
    if (amylum.text != "") {
      setState(() {
        boolamylum = true;
      });
    }
    if (serabut.text != "") {
      setState(() {
        boolserabut = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: blueDefault,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          InkWell(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              if (prefs.getString('iconHasil') == null) {
                if (prefs.getString("detail1") == null) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MenuForm(idPasien: widget.idPasien);
                  }));
                } else {
                  prefs.remove("detail1");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return PasienDetail(idPasien: widget.idPasien);
                  }));
                }
              } else {
                prefs.remove("iconHasil");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Pemeriksaan5(idPasien: widget.idPasien);
                }));
              }
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back),
              ],
            ),
          ),
          textDefault("Hasil Pemeriksaan Laboratorium", Colors.white, 16,
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
            child: Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    booldokter == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Dokter Penanggung Jawab",
                                      Colors.black, 14, FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        booldokter = false;
                                        dokter.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: dokter,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolanalisa == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Analis", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolanalisa = false;
                                        analisa.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: analisa,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolhemoglobin == false &&
                            boolhematokrit == false &&
                            booleritrosit == false &&
                            booltrombosit == false &&
                            boolleukosit == false &&
                            boolmcv == false &&
                            boolmch == false &&
                            boolmchc == false &&
                            boolrdw == false &&
                            boolled == false &&
                            boollimfosit == false &&
                            boolgranulosit == false &&
                            boolmid == false
                        ? Container()
                        : textDefault(
                            "Hematologi", Colors.black, 20, FontWeight.bold),
                    boolhemoglobin == false &&
                            boolhematokrit == false &&
                            booleritrosit == false &&
                            booltrombosit == false &&
                            boolleukosit == false &&
                            boolmcv == false &&
                            boolmch == false &&
                            boolmchc == false &&
                            boolrdw == false &&
                            boolled == false &&
                            boollimfosit == false &&
                            boolgranulosit == false &&
                            boolmid == false
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolhemoglobin == false &&
                            boolhematokrit == false &&
                            booleritrosit == false &&
                            booltrombosit == false &&
                            boolleukosit == false &&
                            boolmcv == false &&
                            boolmch == false &&
                            boolmchc == false &&
                            boolrdw == false &&
                            boolled == false &&
                            boollimfosit == false &&
                            boolgranulosit == false &&
                            boolmid == false
                        ? Container()
                        : SizedBox(
                            height: 10,
                          ),
                    boolhemoglobin == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Hemoglobin", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolhemoglobin = false;
                                        hemoglobin.text = "";
                                      });

                                      print("HEMO ${hemoglobin.text}");
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: hemoglobin,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolhematokrit == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Hematokrit", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolhematokrit = false;
                                        hematokrit.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: hematokrit,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    booleritrosit == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Eritrosit", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        booleritrosit = false;
                                        eritrosit.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: eritrosit,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    booltrombosit == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Trombosit", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        booltrombosit = false;
                                        trombosit.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: trombosit,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolleukosit == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Leukosit", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolleukosit = false;
                                        leukosit.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: leukosit,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolmcv == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("MCV", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolmcv = false;
                                        mcv.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: mcv,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolmch == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("MCH", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolmch = false;
                                        mch.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: mch,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolmchc == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("MCHC", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolmchc = false;
                                        mchc.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: mchc,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolrdw == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("RDW", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolrdw = false;
                                        rdw.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: rdw,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolled == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("LED", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolled = false;
                                        led.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: led,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boollimfosit == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Limfosit", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boollimfosit = false;
                                        limfosit.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: limfosit,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolgranulosit == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Granulosit", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolgranulosit = false;
                                        granulosit.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: granulosit,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolmid == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("MID", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolmid = false;
                                        mid.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: mid,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolbilirubinTotal == false &&
                            boolbilirubinDirect == false &&
                            boolbilirubinIndirect == false &&
                            boolbilirubinDirect == false &&
                            boolsgot == false &&
                            boolsgpt == false &&
                            boolalkalinePhosphatase == false &&
                            boolcholinesterase == false &&
                            boolureum == false &&
                            boolcreatinine == false &&
                            booluricAcid == false &&
                            boolglukosaPuasa == false &&
                            boolkgd2JamPP == false &&
                            boolcholesterolTotal == false &&
                            boolhdlCholesterol == false &&
                            boolldlCholesterol == false &&
                            booltriglyserida == false
                        ? Container()
                        : textDefault(
                            "KIMIA DARAH", Colors.black, 20, FontWeight.bold),
                    boolbilirubinTotal == false &&
                            boolbilirubinDirect == false &&
                            boolbilirubinIndirect == false &&
                            boolbilirubinDirect == false &&
                            boolsgot == false &&
                            boolsgpt == false &&
                            boolalkalinePhosphatase == false &&
                            boolcholinesterase == false &&
                            boolureum == false &&
                            boolcreatinine == false &&
                            booluricAcid == false &&
                            boolglukosaPuasa == false &&
                            boolkgd2JamPP == false &&
                            boolcholesterolTotal == false &&
                            boolhdlCholesterol == false &&
                            boolldlCholesterol == false &&
                            booltriglyserida == false
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolbilirubinTotal == false &&
                            boolbilirubinDirect == false &&
                            boolbilirubinIndirect == false &&
                            boolbilirubinDirect == false &&
                            boolsgot == false &&
                            boolsgpt == false &&
                            boolalkalinePhosphatase == false &&
                            boolcholinesterase == false &&
                            boolureum == false &&
                            boolcreatinine == false &&
                            booluricAcid == false &&
                            boolglukosaPuasa == false &&
                            boolkgd2JamPP == false &&
                            boolcholesterolTotal == false &&
                            boolhdlCholesterol == false &&
                            boolldlCholesterol == false &&
                            booltriglyserida == false
                        ? Container()
                        : SizedBox(
                            height: 10,
                          ),
                    boolbilirubinTotal == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Bilirubin Total", Colors.black,
                                      14, FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolbilirubinTotal = false;
                                        bilirubinTotal.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: bilirubinTotal,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolbilirubinDirect == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Bilirubin Direct", Colors.black,
                                      14, FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolbilirubinDirect = false;
                                        bilirubinDirect.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: bilirubinDirect,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolbilirubinIndirect == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Bilirubin Indirect",
                                      Colors.black, 14, FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolbilirubinIndirect = false;
                                        bilirubinIndirect.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: bilirubinIndirect,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolsgot == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("SGOT/AST", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolsgot = false;
                                        sgot.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: sgot,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolsgpt == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("SGPT/ALT", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolsgpt = false;
                                        sgpt.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: sgpt,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolalkalinePhosphatase == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Alkaline Phosphatase",
                                      Colors.black, 14, FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolalkalinePhosphatase = false;
                                        alkalinePhosphatase.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: alkalinePhosphatase,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolcholinesterase == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Cholinesterase", Colors.black,
                                      14, FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolcholinesterase = false;
                                        cholinesterase.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: cholinesterase,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolureum == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Ureum", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolureum = false;
                                        ureum.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: ureum,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolcreatinine == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Creatinine", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolcreatinine = false;
                                        creatinine.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: creatinine,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    booluricAcid == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Uric Acid", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        booluricAcid = false;
                                        uricAcid.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: uricAcid,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolglukosaPuasa == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Glukosa Puasa", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolglukosaPuasa = false;
                                        glukosaPuasa.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: glukosaPuasa,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolkgd2JamPP == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("KGD 2 Jam PP", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolkgd2JamPP = false;
                                        kgd2JamPP.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: kgd2JamPP,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolcholesterolTotal == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Cholesterol-Total", Colors.black,
                                      14, FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolcholesterolTotal = false;
                                        cholesterolTotal.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: cholesterolTotal,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolhdlCholesterol == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("HDL-Cholesterol", Colors.black,
                                      14, FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolhdlCholesterol = false;
                                        hdlCholesterol.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: hdlCholesterol,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolldlCholesterol == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("LDL-Cholesterol", Colors.black,
                                      14, FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolldlCholesterol = false;
                                        ldlCholesterol.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: ldlCholesterol,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    booltriglyserida == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Triglyserida", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        booltriglyserida = false;
                                        triglyserida.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: triglyserida,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolleukosit == false &&
                            boolnitrit == false &&
                            boolurobilin == false &&
                            boolprotein == false &&
                            boolph == false &&
                            booldarah == false &&
                            boolberatJenis == false &&
                            boolketon == false &&
                            boolbilirubi == false &&
                            boolglukosa == false &&
                            boolgolonganDarah == false
                        ? Container()
                        : textDefault(
                            "URINALISASI", Colors.black, 20, FontWeight.bold),
                    boolleukosit == false &&
                            boolnitrit == false &&
                            boolurobilin == false &&
                            boolprotein == false &&
                            boolph == false &&
                            booldarah == false &&
                            boolberatJenis == false &&
                            boolketon == false &&
                            boolbilirubi == false &&
                            boolglukosa == false &&
                            boolgolonganDarah == false
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolleukosit == false &&
                            boolnitrit == false &&
                            boolurobilin == false &&
                            boolprotein == false &&
                            boolph == false &&
                            booldarah == false &&
                            boolberatJenis == false &&
                            boolketon == false &&
                            boolbilirubi == false &&
                            boolglukosa == false &&
                            boolgolonganDarah == false
                        ? Container()
                        : SizedBox(
                            height: 10,
                          ),
                    boolleukositUrinalisa == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Leukosit", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolleukositUrinalisa = false;
                                        leukositUrinalisa.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: leukositUrinalisa,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolnitrit == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Nitrit", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolnitrit = false;
                                        nitrit.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: nitrit,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolurobilin == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Urobilin", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolurobilin = false;
                                        urobilin.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: urobilin,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolprotein == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Protein", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolprotein = false;
                                        protein.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: protein,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolph == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("PH", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolph = false;
                                        ph.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: ph,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    booldarah == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Darah", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        booldarah = false;
                                        darah.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: darah,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolberatJenis == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Berat Jenis", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolberatJenis = false;
                                        beratJenis.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: beratJenis,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolketon == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Keton", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolketon = false;
                                        keton.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: keton,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolbilirubi == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Bilirubi", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolbilirubi = false;
                                        bilirubi.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: bilirubi,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolglukosa == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Glukosa", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolglukosa = false;
                                        glukosa.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: glukosa,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolgolonganDarah == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Golongan Darah", Colors.black,
                                      14, FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolgolonganDarah = false;
                                        golonganDarah.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: golonganDarah,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolkonsitensi == false &&
                            boolwarna == false &&
                            boollendir == false &&
                            booldarahFeses == false &&
                            booltelurCacing == false &&
                            boolparasit == false &&
                            boolcyste == false &&
                            boolleucocyte == false &&
                            boolerythrocyte == false &&
                            boollemak == false &&
                            boolamylum == false &&
                            boolserabut == false
                        ? Container()
                        : textDefault(
                            "FESES", Colors.black, 20, FontWeight.bold),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    boolkonsitensi == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Konsistensi", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolkonsitensi = false;
                                        konsitensi.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: konsitensi,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolwarna == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Warna", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolwarna = false;
                                        warna.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: warna,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boollendir == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Lendir", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boollendir = false;
                                        lendir.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: lendir,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    booldarahFeses == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Darah", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        booldarahFeses = false;
                                        darahFeses.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: darahFeses,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    booltelurCacing == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Telur Cacing", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        booltelurCacing = false;
                                        telurCacing.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: telurCacing,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolparasit == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Parasit", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolparasit = false;
                                        parasit.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: parasit,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolcyste == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Cyste", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolcyste = false;
                                        cyste.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: cyste,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolleucocyte == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Leucocyte", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolleucocyte = false;
                                        leucocyte.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: leucocyte,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolerythrocyte == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Erythrocyte", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolerythrocyte = false;
                                        erythrocyte.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: erythrocyte,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boollemak == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Lemak", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boollemak = false;
                                        lemak.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: lemak,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolamylum == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Amylum", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolamylum = false;
                                        amylum.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: amylum,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                    boolserabut == false
                        ? Container()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Serabut", Colors.black, 14,
                                      FontWeight.normal),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        boolserabut = false;
                                        serabut.text = "";
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  controller: serabut,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
              child: InkWell(
                onTap: () {
                  if (dokter.text != "" && analisa.text != "") {
                    showDialogLab();
                  } else {
                    alertError(context,
                        "Dokter Penanggung Jawab dan Analis harus di isi !");
                  }
                },
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
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 60),
        child: FloatingActionButton(
          onPressed: () {
            showBottomSheetLaboratorium();
          },
          child: Container(child: Icon(Icons.add)),
        ),
      ),
    );
  }

  showBottomSheetLaboratorium() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setT) {
            return Container(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Tambah Laboratorium", Colors.black, 16,
                            FontWeight.bold),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.close))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    booldokter
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  booldokter = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Dokter Penanggung Jawab",
                                  Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    booldokter
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolanalisa
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolanalisa = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Analisa", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolanalisa
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolhemoglobin
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolhemoglobin = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Hemoglobin", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolhemoglobin
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolhematokrit
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolhematokrit = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Hematokrit", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolhematokrit
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    booleritrosit
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  booleritrosit = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Eritrosit", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    booleritrosit
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    booltrombosit
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  booltrombosit = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Trombosit", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    booltrombosit
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolleukosit
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolleukosit = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Leukosit", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolleukosit
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolmcv
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolmcv = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault(
                                  "MCV", Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolmcv
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolmch
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolmch = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault(
                                  "MCH", Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolmch
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolmchc
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolmchc = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault(
                                  "MCHC", Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolmchc
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolrdw
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolrdw = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault(
                                  "RDW", Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolrdw
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolled
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolled = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault(
                                  "LED", Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolled
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boollimfosit
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boollimfosit = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Limfosit", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boollimfosit
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolgranulosit
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolgranulosit = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Granulosit", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolgranulosit
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolmid
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolmid = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault(
                                  "MID", Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolmid
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolbilirubinTotal
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolbilirubinTotal = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Bilirubin Total",
                                  Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolbilirubinTotal
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolbilirubinDirect
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolbilirubinDirect = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Bilirubin Direct",
                                  Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolbilirubinDirect
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolbilirubinIndirect
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolbilirubinIndirect = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Bilirubin Indirect",
                                  Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolbilirubinIndirect
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolsgot
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolsgot = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("SGOT/AST", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolsgot
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolsgpt
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolsgpt = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("SGPT/ALT", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolsgpt
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolalkalinePhosphatase
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolalkalinePhosphatase = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Alkaline Phosphatase",
                                  Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolalkalinePhosphatase
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolcholinesterase
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolcholinesterase = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Cholinesterase", Colors.black,
                                  14, FontWeight.normal),
                            ),
                          ),
                    boolcholinesterase
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolureum
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolureum = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault(
                                  "Ureum", Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolureum
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolcreatinine
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolcreatinine = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Creatinine", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolcreatinine
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    booluricAcid
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  booluricAcid = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Uric Acid", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    booluricAcid
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolglukosaPuasa
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolglukosaPuasa = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Glukosa Puasa", Colors.black,
                                  14, FontWeight.normal),
                            ),
                          ),
                    boolglukosaPuasa
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolkgd2JamPP
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolkgd2JamPP = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("KGD 2 Jam PP", Colors.black,
                                  14, FontWeight.normal),
                            ),
                          ),
                    boolkgd2JamPP
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolcholesterolTotal
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolcholesterolTotal = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Cholesterol-Total",
                                  Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolcholesterolTotal
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolhdlCholesterol
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolhdlCholesterol = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("HDL-Cholesterol",
                                  Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolhdlCholesterol
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolldlCholesterol
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolldlCholesterol = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("LDL-Cholesterol",
                                  Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolldlCholesterol
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    booltriglyserida
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  booltriglyserida = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Triglyserida", Colors.black,
                                  14, FontWeight.normal),
                            ),
                          ),
                    booltriglyserida
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolleukositUrinalisa
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolleukositUrinalisa = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Leukosit Urinalisasi",
                                  Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolleukositUrinalisa
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolnitrit
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolnitrit = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Nitrit", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolnitrit
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolurobilin
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolurobilin = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Urobilin", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolurobilin
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolprotein
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolprotein = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Protein", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolprotein
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolph
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolph = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault(
                                  "PH", Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolph
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    booldarah
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  booldarah = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault(
                                  "Darah", Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    booldarah
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolberatJenis
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolberatJenis = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Berat Jenis", Colors.black,
                                  14, FontWeight.normal),
                            ),
                          ),
                    boolberatJenis
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolketon
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolketon = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault(
                                  "Keton", Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolketon
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolbilirubi
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolbilirubi = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Bilirubi", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolbilirubi
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolglukosa
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolglukosa = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Glukosa", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolglukosa
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolgolonganDarah
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolgolonganDarah = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Golongan Darah", Colors.black,
                                  14, FontWeight.normal),
                            ),
                          ),
                    boolgolonganDarah
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolkonsitensi
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolkonsitensi = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Konsistensi", Colors.black,
                                  14, FontWeight.normal),
                            ),
                          ),
                    boolkonsitensi
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolwarna
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolwarna = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault(
                                  "Warna", Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boolwarna
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boollendir
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boollendir = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Lendir", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boollendir
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    booldarahFeses
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  booldarahFeses = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Darah Feses", Colors.black,
                                  14, FontWeight.normal),
                            ),
                          ),
                    booldarahFeses
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    booltelurCacing
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  booltelurCacing = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Telur Cacing", Colors.black,
                                  14, FontWeight.normal),
                            ),
                          ),
                    booltelurCacing
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolparasit
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolparasit = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Parasit", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolparasit
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolcyste
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolcyste = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Glukosa", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolcyste
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolleucocyte
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolleucocyte = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Leucocyte", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolleucocyte
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolerythrocyte
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolerythrocyte = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Erythrocyte", Colors.black,
                                  14, FontWeight.normal),
                            ),
                          ),
                    boolerythrocyte
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boollemak
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boollemak = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault(
                                  "Lemak", Colors.black, 14, FontWeight.normal),
                            ),
                          ),
                    boollemak
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolamylum
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolamylum = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Amylum", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolamylum
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                    boolserabut
                        ? Container()
                        : InkWell(
                            onTap: () {
                              setT(
                                () {
                                  boolserabut = true;
                                  // Navigator.of(context).pop();
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              child: textDefault("Serabut", Colors.black, 14,
                                  FontWeight.normal),
                            ),
                          ),
                    boolserabut
                        ? Container()
                        : Divider(
                            thickness: 1,
                          ),
                  ],
                ),
              ),
            );
          });
        });
  }

  void showDialogLab() {
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
    HasilPemeriksaanLaboratoriumModel? _pemeriksaan;

    HasilPemeriksaanLaboratoriumModel data = HasilPemeriksaanLaboratoriumModel(
      dokter: dokter.text,
      analisa: analisa.text,
      hemoglobin: hemoglobin.text,
      hematokrit: hematokrit.text,
      eritrosit: eritrosit.text,
      trombosit: trombosit.text,
      leukosit: leukosit.text,
      mcv: mcv.text,
      mch: mch.text,
      mchc: mchc.text,
      rdw: rdw.text,
      limfosit: limfosit.text,
      granulosit: granulosit.text,
      mid: mid.text,
      bilirubinTotal: bilirubinTotal.text,
      bilirubinDirect: bilirubinDirect.text,
      sgot: sgot.text,
      sgpt: sgpt.text,
      alkalinePhosphatase: alkalinePhosphatase.text,
      cholinesterase: cholinesterase.text,
      ureum: ureum.text,
      creatinine: creatinine.text,
      uricAcid: uricAcid.text,
      glukosaPuasa: glukosaPuasa.text,
      kgd2JamPP: kgd2JamPP.text,
      cholesterolTotal: cholesterolTotal.text,
      hdlCholesterol: hdlCholesterol.text,
      ldlCholesterol: ldlCholesterol.text,
      triglyserida: triglyserida.text,
      leukositUrinalisa: leukositUrinalisa.text,
      nitrit: nitrit.text,
      urobilin: urobilin.text,
      protein: protein.text,
      ph: ph.text,
      darah: darah.text,
      beratJenis: beratJenis.text,
      keton: keton.text,
      bilirubi: bilirubi.text,
      glukosa: glukosa.text,
      konsitensi: konsitensi.text,
      warna: warna.text,
      lendir: lendir.text,
      darahFeses: darahFeses.text,
      telurCacing: telurCacing.text,
      parasit: parasit.text,
      cyste: cyste.text,
      leucocyte: leucocyte.text,
      erythrocyte: erythrocyte.text,
      lemak: lemak.text,
      amylum: amylum.text,
      serabut: serabut.text,
      led: led.text,
      bilirubinIndirect: bilirubinIndirect.text,
      golonganDarah: golonganDarah.text,
    );

    firestore.setHasilPemeriksaanLaboratorium1(
        pemeriksaan: data, idPasien: widget.idPasien);
    _pemeriksaan =
        await firestore.getHasilPemeriksaanLaboratorium1(widget.idPasien);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('iconHasil') == null) {
      if (prefs.getString("detail1") == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return MenuForm(idPasien: widget.idPasien);
        }));
      } else {
        prefs.remove("detail1");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return PasienDetail(idPasien: widget.idPasien);
        }));
      }
    } else {
      prefs.remove("iconHasil");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Pemeriksaan5(idPasien: widget.idPasien);
      }));
    }
  }
}
