// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:arifa_medikal_klink_3/components/alert/alert.dart';
import 'package:arifa_medikal_klink_3/components/colors/color.dart';
import 'package:arifa_medikal_klink_3/model/pasien_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/add_pasien_profil_success.dart';
import 'package:flutter/material.dart';

import '../../../components/widget/text.dart';
import '../../../service/firebase_firestore_service.dart';

class AddPasienProfil extends StatefulWidget {
  const AddPasienProfil({super.key});

  @override
  State<AddPasienProfil> createState() => _AddPasienProfilState();
}

class _AddPasienProfilState extends State<AddPasienProfil> {
  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  final namaC = TextEditingController();
  final nikC = TextEditingController();
  final alamatC = TextEditingController();
  final tglPemeriksaanC = TextEditingController();
  final tempatLahirC = TextEditingController();
  final tglLahirC = TextEditingController();
  final umurC = TextEditingController();
  final perusahaanC = TextEditingController();
  final bagianC = TextEditingController();
  final nohpC = TextEditingController();
  final nomcuC = TextEditingController();
  int idJk = 0;

  var jkStr = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueDefault,
        title: Row(
          children: [
            textDefault("Tambah Pasien", Colors.white, 18, FontWeight.bold)
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textDefault("Nama", Colors.black, 16, FontWeight.normal),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: namaC,
                          decoration: InputDecoration(border: InputBorder.none),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Jenis Kelamin", Colors.black, 16, FontWeight.normal),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: idJk,
                                  onChanged: (index) {
                                    setState(() {
                                      jkStr = "Pria";
                                      idJk = 1;
                                    });
                                  }),
                              Expanded(
                                child: Text('Pria'),
                              )
                            ],
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                  value: 2,
                                  groupValue: idJk,
                                  onChanged: (index) {
                                    setState(() {
                                      jkStr = "Wanita";
                                      idJk = 2;
                                    });
                                  }),
                              Expanded(child: Text('Wanita'))
                            ],
                          ),
                          flex: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("NIK", Colors.black, 16, FontWeight.normal),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: nikC,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(border: InputBorder.none),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Alamat", Colors.black, 16, FontWeight.normal),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: alamatC,
                          decoration: InputDecoration(border: InputBorder.none),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Tanggal Pemeriksaan", Colors.black, 16,
                        FontWeight.normal),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: tglPemeriksaanC,
                          decoration: InputDecoration(border: InputBorder.none),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Tempat Lahir", Colors.black, 16, FontWeight.normal),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: tempatLahirC,
                          decoration: InputDecoration(border: InputBorder.none),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Tanggal Lahir", Colors.black, 16, FontWeight.normal),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: tglLahirC,
                          decoration: InputDecoration(border: InputBorder.none),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault("Umur", Colors.black, 16, FontWeight.normal),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: umurC,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(border: InputBorder.none),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Perusahaan", Colors.black, 16, FontWeight.normal),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: perusahaanC,
                          decoration: InputDecoration(border: InputBorder.none),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "Bagian/Seksi", Colors.black, 16, FontWeight.normal),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: bagianC,
                          decoration: InputDecoration(border: InputBorder.none),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    textDefault(
                        "No. Handphone", Colors.black, 16, FontWeight.normal),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: nohpC,
                          decoration: InputDecoration(border: InputBorder.none),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => showDialogProfil(),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
                child: Center(
                  child: textDefault(
                      "Simpan", Colors.white, 16, FontWeight.normal),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  validasi() {
    if (namaC.text == "") {
      alertError(context, "Nama Harus Diisi !");
    } else if (jkStr == "") {
      alertError(context, "Jenis Kelamin Harus Di Pilih !");
    } else if (nikC.text == "") {
      alertError(context, "NIK Harus Diisi !");
    } else if (nikC.text.length < 15) {
      alertError(context, "NIK Tidak Valid !");
    } else if (alamatC.text == "") {
      alertError(context, "Alamat Harus Diisi !");
    } else if (tempatLahirC.text == "") {
      alertError(context, "Tempat Lahir Harus Diisi !");
    } else if (tglLahirC.text == "") {
      alertError(context, "Tanggal Lahir Harus Diisi !");
    } else if (umurC.text == "") {
      alertError(context, "Umur Harus Diisi !");
    } else if (perusahaanC.text == "") {
      alertError(context, "Perusahaan Harus Diisi !");
    } else if (bagianC.text == "") {
      alertError(context, "Bagian/seksi Harus Diisi !");
    } else if (nohpC.text == "") {
      alertError(context, "No.Handphone Harus Diisi !");
    } else {
      showDialogProfil();
    }
  }

  void showDialogProfil() {
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
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                            "Tidak", Colors.black, 16, FontWeight.bold),
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
                            "Ya, Simpan", Colors.white, 16, FontWeight.bold),
                      )),
                )),
              ],
            )
          ],
        );
      },
    );
  }

  void saveButton() async {
    PasienModel pasien = PasienModel(
      nama: namaC.text,
      jenisKelamin: jkStr,
      nik: nikC.text,
      alamat: alamatC.text,
      tanggalPemeriksaan: tglPemeriksaanC.text,
      tempatLahir: tempatLahirC.text,
      tanggalLahir: tglLahirC.text,
      umur: int.parse(umurC.text),
      perusahaan: perusahaanC.text,
      bagian: bagianC.text,
      noHp: nohpC.text,
      waktu: DateTime.now().toString(),
    );

    await firestore.setPasien(pasien);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return AddPasienProfilSucces(
          idPasien: pasien.id,
        );
      }),
    );
  }
}
