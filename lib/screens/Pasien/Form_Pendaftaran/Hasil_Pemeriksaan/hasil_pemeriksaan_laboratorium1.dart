// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

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
                    textDefault("Dokter Penanggung Jawab", Colors.black, 14,
                        FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: dokter,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Analisa", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: analisa,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Hematologi", Colors.black, 20, FontWeight.bold),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Hemoglobin", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: hemoglobin,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Hematokrit", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: hematokrit,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Eritrosit", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: eritrosit,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Trombosit", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: trombosit,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Leukosit", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: leukosit,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("MCV", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: mcv,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("MCH", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: mch,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("MCHC", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: mchc,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("RDW", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: rdw,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("LED", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: led,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Limfosit", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: limfosit,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Granulosit", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: granulosit,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("MID", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: mid,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textDefault(
                        "KIMIA DARAH", Colors.black, 20, FontWeight.bold),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Bilirubin Total", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: bilirubinTotal,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Bilirubin Direct", Colors.black, 14,
                        FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: bilirubinDirect,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Bilirubin Indirect", Colors.black, 14,
                        FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: bilirubinIndirect,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "SGOT/AST", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: sgot,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "SGPT/ALT", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: sgpt,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Alkaline Phosphatase", Colors.black, 14,
                        FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: alkalinePhosphatase,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Cholinesterase", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: cholinesterase,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Ureum", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: ureum,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Creatinine", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: creatinine,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Uric Acid", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: uricAcid,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Glukosa Puasa", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: glukosaPuasa,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "KGD 2 Jam PP", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: kgd2JamPP,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Cholesterol-Total", Colors.black, 14,
                        FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: cholesterolTotal,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "HDL-Cholesterol", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: hdlCholesterol,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "LDL-Cholesterol", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: ldlCholesterol,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Triglyserida", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: triglyserida,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textDefault(
                        "URINALISASI", Colors.black, 20, FontWeight.bold),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Leukosit", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: leukositUrinalisa,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Nitrit", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: nitrit,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Urobilin", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: urobilin,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Protein", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: protein,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("PH", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: ph,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Darah", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: darah,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Berat Jenis", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: beratJenis,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Keton", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: keton,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Bilirubi", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: bilirubi,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Glukosa", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: glukosa,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Golongan Darah", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: golonganDarah,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textDefault("FESES", Colors.black, 20, FontWeight.bold),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Konsistensi", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: konsitensi,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Warna", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: warna,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Lendir", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: lendir,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Darah", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: darahFeses,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Telur Cacing", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: telurCacing,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Parasit", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: parasit,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Cyste", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: cyste,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Leucocyte", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: leucocyte,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Erythrochyte", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: erythrocyte,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Lemak", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: lemak,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Amylum", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: amylum,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Serabut", Colors.black, 14, FontWeight.normal),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: serabut,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
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
                  showDialogLab();
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
    );
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
