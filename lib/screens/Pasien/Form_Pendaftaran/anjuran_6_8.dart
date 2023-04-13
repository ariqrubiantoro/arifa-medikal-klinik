// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/kesimpulan_kelayakan_7_8.dart';
import 'package:flutter/material.dart';

import '../../../components/colors/color.dart';
import '../../../components/widget/text.dart';

enum Question { ya, tidak }

class Anjuran6 extends StatefulWidget {
  const Anjuran6({super.key});

  @override
  State<Anjuran6> createState() => _Anjuran6State();
}

class _Anjuran6State extends State<Anjuran6> {
  Question _quest1 = Question.tidak;
  Question _quest2 = Question.tidak;

  String konsumsiAir = "";
  String olahragaTeratur = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blueDefault,
          title: textDefault(
              "Anjuran-Anjuran", Colors.white, 16, FontWeight.bold)),
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
                      textDefault("6/8", Colors.black, 14, FontWeight.bold)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 260,
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
                  textDefault("Konsumsi Air Mineral 2-3 Liter dalam Sehari",
                      Colors.black, 14, FontWeight.bold),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: Question.ya,
                        groupValue: _quest1,
                        onChanged: (value) {
                          setState(() {
                            _quest1 = value!;
                            konsumsiAir = "Ya";
                          });
                        },
                      ),
                      textDefault("Ya", Colors.black, 14, FontWeight.normal),
                      Radio(
                        value: Question.tidak,
                        groupValue: _quest1,
                        onChanged: (value) {
                          setState(() {
                            _quest1 = value!;
                            konsumsiAir = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 14, FontWeight.normal),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textDefault(
                      "Olahraga Teratur Minimal 30 Menit Setiap Harinya 3-4X Seminggu",
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
                            olahragaTeratur = "Ya";
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
                            olahragaTeratur = "Tidak";
                          });
                        },
                      ),
                      textDefault("Tidak", Colors.black, 14, FontWeight.normal),
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
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return KesimpulanKelayakan7();
                  })),
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
}
