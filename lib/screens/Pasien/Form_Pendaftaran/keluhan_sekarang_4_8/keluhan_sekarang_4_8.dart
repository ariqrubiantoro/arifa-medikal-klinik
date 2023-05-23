// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_THT.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_anggota_gerak.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_gentalia.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_kelenjar_getah.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_mata.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_refleks.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_rongga_dada.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_rongga_perut.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_umum.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/riwayat_pajanan/biologi.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/riwayat_pajanan/ergonomis.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/riwayat_pajanan/fisik.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/riwayat_pajanan/kimia.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/riwayat_pajanan/psikologis.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/pemeriksaan_5_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:flutter/material.dart';

import '../../../../components/colors/color.dart';
import '../../../../components/widget/text.dart';

class KeluhanSekarang4 extends StatefulWidget {
  const KeluhanSekarang4({this.idPasien, super.key});
  final String? idPasien;

  @override
  State<KeluhanSekarang4> createState() => _KeluhanSekarang4State();
}

class _KeluhanSekarang4State extends State<KeluhanSekarang4> {
  bool tapKeadaanUmum = false;
  bool tapRiwayatPajanan = false;

  List listRiwayatPajanan = [
    'Fisik',
    'Kimia',
    'Biologi',
    'Psikologis',
    'Ergonomis',
  ];

  List listKeadaanUmum = [
    'Pemeriksaan Umum',
    'Pemeriksaan Mata',
    'Pemeriksaan THT',
    'Pemeriksaan Rongga Dada',
    'Pemeriksaan Rongga Perut',
    'Pemeriksaan Gentalia dan Anorektal',
    'Pemeriksaan Anggota Gerak',
    'Pemeriksaan Refleks',
    'Pemeriksaan Kelenjar Getah Bening',
  ];

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
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
            textDefault("Keluhan Sekarang", Colors.white, 16, FontWeight.bold),
            SizedBox(
              width: 5,
            ),
          ]),
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
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
                      InkWell(
                        onTap: () {
                          setState(() {
                            tapKeadaanUmum = !tapKeadaanUmum;
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 2)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textDefault("Keadaan Umum", Colors.black, 14,
                                    FontWeight.bold),
                                Icon(tapKeadaanUmum
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down)
                              ],
                            )),
                      ),
                      tapKeadaanUmum
                          ? ListView.builder(
                              itemCount: listKeadaanUmum.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    if (index == 0) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return PemeriksaanUmum(
                                          idPasien: widget.idPasien,
                                        );
                                      }));
                                    } else if (index == 1) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return PemeriksaanMata(
                                          idPasien: widget.idPasien,
                                        );
                                      }));
                                    } else if (index == 2) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return PemeriksaanTHT(
                                          idPasien: widget.idPasien,
                                        );
                                      }));
                                    } else if (index == 3) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return PemeriksaanRonggaDada(
                                          idPasien: widget.idPasien,
                                        );
                                      }));
                                    } else if (index == 4) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return PemeriksaanRonggaPerut(
                                          idPasien: widget.idPasien,
                                        );
                                      }));
                                    } else if (index == 5) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return PemeriksaanGentalia(
                                          idPasien: widget.idPasien,
                                        );
                                      }));
                                    } else if (index == 6) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return PemeriksaanAnggotaGerak(
                                          idPasien: widget.idPasien,
                                        );
                                      }));
                                    } else if (index == 7) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return PemeriksaanRefleks(
                                          idPasien: widget.idPasien,
                                        );
                                      }));
                                    } else if (index == 8) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return PemeriksaanKelenjarGetah(
                                          idPasien: widget.idPasien,
                                        );
                                      }));
                                    }
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5, right: 5, top: 5),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 2)
                                          ]),
                                      child: Row(
                                        children: [
                                          textDefault(
                                              listKeadaanUmum[index],
                                              Colors.black,
                                              14,
                                              FontWeight.normal),
                                        ],
                                      )),
                                );
                              })
                          : Container(),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            tapRiwayatPajanan = !tapRiwayatPajanan;
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 2)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textDefault("Riwayat Pajanan pada Pekerjaan",
                                    Colors.black, 14, FontWeight.bold),
                                Icon(tapRiwayatPajanan
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down)
                              ],
                            )),
                      ),
                      tapRiwayatPajanan
                          ? ListView.builder(
                              itemCount: listRiwayatPajanan.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    if (index == 0) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Fisik(
                                          idPasien: widget.idPasien,
                                        );
                                      }));
                                    } else if (index == 1) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Kimia(
                                          pasienId: widget.idPasien,
                                        );
                                      }));
                                    } else if (index == 2) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Biologi(
                                          idPasien: widget.idPasien,
                                        );
                                      }));
                                    } else if (index == 3) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Psikologis(
                                          idPasien: widget.idPasien,
                                        );
                                      }));
                                    } else if (index == 4) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Ergonomis(
                                          idPasien: widget.idPasien,
                                        );
                                      }));
                                    }
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5, right: 5, top: 5),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 2)
                                          ]),
                                      child: Row(
                                        children: [
                                          textDefault(
                                              listRiwayatPajanan[index],
                                              Colors.black,
                                              14,
                                              FontWeight.normal),
                                        ],
                                      )),
                                );
                              })
                          : Container()
                    ],
                  ),
                ),
              )),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(color: Colors.grey, blurRadius: 2)
                  ]),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return MenuForm(idPasien: widget.idPasien!);
                      }));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
      ),
    );
  }
}
