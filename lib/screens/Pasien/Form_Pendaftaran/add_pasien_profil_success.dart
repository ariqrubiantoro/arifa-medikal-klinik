// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:arifa_medikal_klink_3/components/widget/text.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/penyakit_terdahulu_1_8.dart';
import 'package:flutter/material.dart';

import '../../../components/colors/color.dart';

class AddPasienProfilSucces extends StatefulWidget {
  const AddPasienProfilSucces({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<AddPasienProfilSucces> createState() => _AddPasienProfilSuccesState();
}

class _AddPasienProfilSuccesState extends State<AddPasienProfilSucces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )
        ]),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: blueGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(1000)),
                child: Icon(
                  Icons.done_rounded,
                  color: Colors.white,
                  size: 200,
                )),
            Row(),
            SizedBox(
              height: 50,
            ),
            Text(
              "Profil Pasien berhasil\ndisimpan!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PenyakitTerdahulu1(
                  idPasien: widget.idPasien,
                );
              })),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: textDefault(
                      "Lanjut ke Anamnesa dan Pemeriksaan Fisik >",
                      Colors.white,
                      16,
                      FontWeight.normal),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
