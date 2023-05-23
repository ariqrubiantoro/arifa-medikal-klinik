// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'dart:html' as html;

import 'package:arifa_medikal_klink_3/model/hasil_pemeriksaan/hasil_pemeriksaan_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_gigi_mulut.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_jantung.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_laboratorium.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_mata.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_paru.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_spirometri.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_treadmill.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/anjuran_6_8.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../../../components/colors/color.dart';
import '../../../../components/widget/text.dart';
import '../../../../service/firebase_firestore_service.dart';
import '../../Menu_Form/menu_form.dart';

class HasilPemeriksaanAudiometri extends StatefulWidget {
  HasilPemeriksaanAudiometri({super.key, required this.idPasien});
  String idPasien;
  @override
  State<HasilPemeriksaanAudiometri> createState() =>
      _HasilPemeriksaanAudiometriState();
}

class _HasilPemeriksaanAudiometriState
    extends State<HasilPemeriksaanAudiometri> {
  HasilPemeriksaanModel? _hasilPemeriksaan;
  bool isLoading = false;
  final judulConn = TextEditingController();
  final keteranganConn = TextEditingController();
  final dokterApa = TextEditingController();
  final namaDokter = TextEditingController();

  final FirebaseFirestoreService firestore = FirebaseFirestoreService();

  String fotoHasilBase64 = "";
  Uint8List? fromPicker;

  @override
  void initState() {
    judulConn.text = "Hasil Pemeriksaan Audiometri";
    dokterApa.text = "Dokter ";
    getData();
    super.initState();
  }

  getData() async {
    _hasilPemeriksaan =
        await firestore.getHasilPemeriksaanAudiometri(widget.idPasien);
    setState(() {
      judulConn.text = _hasilPemeriksaan!.judul!;
      keteranganConn.text = _hasilPemeriksaan!.keterangan!;
      fotoHasilBase64 = _hasilPemeriksaan!.image!;
    });
  }

  File? _image;
  dynamic bytes;

  Future getfoto(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: source, imageQuality: 50);
    _image = File(imagePicked!.path);
    print(imagePicked.path);
    // bytes = File(imagePicked.path).readAsBytesSync();
    setState(() {
      fotoHasilBase64 = base64Encode(File(imagePicked.path).readAsBytesSync());
      print(fotoHasilBase64);
    });
  }

  Future<void> _pickImage() async {
    fromPicker = await ImagePickerWeb.getImageAsBytes();
    if (fromPicker != null) {
      setState(() {
        fotoHasilBase64 = base64Encode(fromPicker!);
        print(fotoHasilBase64);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Uint8List bytes2 = base64.decode(fotoHasilBase64);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return MenuForm(idPasien: widget.idPasien);
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
                  return MenuForm(idPasien: widget.idPasien);
                }));
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                ],
              ),
            ),
            textDefault("Hasil Pemeriksaan", Colors.white, 16, FontWeight.bold),
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
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          controller: judulConn,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      bytes2.isEmpty
                          ? Container()
                          : Container(
                              // width: MediaQuery.of(context).size.width,
                              // height: 200,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                  child: Image.memory(
                                bytes2,
                                fit: BoxFit.cover,
                              )),
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (kIsWeb) {
                            setState(() {
                              _pickImage();
                            });
                          } else {
                            setState(() {
                              getfoto(ImageSource.gallery);
                            });
                          }
                        },
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ]),
                          child: Center(
                            child: textDefault(
                                fotoHasilBase64 != ""
                                    ? "Upload Foto"
                                    : "Ubah Foto",
                                Colors.black,
                                14,
                                FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextFormField(
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                                textAlign: TextAlign.center,
                                controller: dokterApa,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          textDefault(":", Colors.black, 14, FontWeight.normal),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextFormField(
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                                textAlign: TextAlign.center,
                                controller: namaDokter,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: TextFormField(
                          controller: keteranganConn,
                          style: TextStyle(fontFamily: 'poppins'),
                          maxLines: 10,
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
    PemeriksaanModel? _pemeriksaan;
    HasilPemeriksaanModel data = HasilPemeriksaanModel(
        judul: judulConn.text,
        keterangan: keteranganConn.text,
        image: fotoHasilBase64,
        dokterApa: dokterApa.text,
        namaDokter: namaDokter.text);
    firestore.setHasilPemeriksaanAudiometri(
        pemeriksaan: data, idPasien: widget.idPasien);
    _pemeriksaan = await firestore.getPemeriksaan(widget.idPasien);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MenuForm(idPasien: widget.idPasien);
    }));
  }
}