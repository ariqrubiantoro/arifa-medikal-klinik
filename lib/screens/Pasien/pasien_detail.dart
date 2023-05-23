// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/components/colors/color.dart';
import 'package:arifa_medikal_klink_3/components/widget/text.dart';
import 'package:flutter/material.dart';

class PasienDetail extends StatefulWidget {
  const PasienDetail({super.key});

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  bool boolProfilPasien = false;
  bool boolRiwayatPenTerdahulu = false;
  bool boolRiyatPenKeluarga = false;
  bool boolRiwayatKebiasaan = false;
  bool boolKeluhanSekarang = false;
  bool boolPemeriksaan = false;
  bool boolAnjuran = false;
  bool boolKesimpulanKelayakan = false;
  bool boolKesimpulanDerajat = false;

  bool boolKeadaanUmum = false;
  bool boolPemeriksaanUmum = false;
  bool boolPemeriksaanMata = false;
  bool boolPemeriksaanTHT = false;
  bool boolPemeriksaanRonggaDada = false;
  bool boolPemeriksaanRonggaPerut = false;
  bool boolPemeriksaanGentalia = false;
  bool boolPemeriksaanAnggotaGerak = false;
  bool boolPemeriksaanRefleks = false;
  bool boolPemeriksaanKelenjarGetah = false;

  bool boolRiwayatPajanan = false;
  bool boolFisik = false;
  bool boolKimia = false;
  bool boolBiologi = false;
  bool boolPsikologis = false;
  bool boolErgonomis = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: blueDefault,
          title: Row(
            children: [
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              textDefault("Hasil MCU", Colors.white, 20, FontWeight.bold),
            ],
          )),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textDefault("Anamnesa dan Pemeriksaan Fisik", blueDefault, 18,
                      FontWeight.bold)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolProfilPasien = !boolProfilPasien;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Profil Pasien", Colors.black, 14,
                              FontWeight.normal),
                          Icon(
                            boolProfilPasien
                                ? Icons.edit
                                : Icons.arrow_drop_down,
                          )
                        ],
                      ),
                    ),
                    boolProfilPasien ? listProfilePasien() : Container()
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolRiwayatPenTerdahulu = !boolRiwayatPenTerdahulu;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Riwayat Penyakit Terdahulu",
                              Colors.black, 14, FontWeight.normal),
                          Icon(boolRiwayatPenTerdahulu
                              ? Icons.edit
                              : Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    boolRiwayatPenTerdahulu
                        ? listPenyakitTerdahulu()
                        : Container()
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolRiyatPenKeluarga = !boolRiyatPenKeluarga;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Riwayat Penyakit Keluarga", Colors.black,
                              14, FontWeight.normal),
                          Icon(boolRiyatPenKeluarga
                              ? Icons.edit
                              : Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    boolRiyatPenKeluarga ? listPenyakitKeluarga() : Container()
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolRiwayatKebiasaan = !boolRiwayatKebiasaan;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Riwayat Kebiasaan", Colors.black, 14,
                              FontWeight.normal),
                          Icon(boolRiwayatKebiasaan
                              ? Icons.edit
                              : Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    boolRiwayatKebiasaan ? listRiwayatKebiasaan() : Container()
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolKeluhanSekarang = !boolKeluhanSekarang;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Keluhan Sekarang", Colors.black, 14,
                              FontWeight.normal),
                          Icon(boolKeluhanSekarang
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              boolKeluhanSekarang == false
                  ? Container()
                  : Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    boolKeadaanUmum = !boolKeadaanUmum;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textDefault("Keadaan Umum", Colors.black,
                                        14, FontWeight.normal),
                                    Icon(boolKeadaanUmum
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down)
                                  ],
                                ),
                              ),
                              boolKeadaanUmum == false
                                  ? Container()
                                  : Column(
                                      children: [
                                        Divider(
                                          thickness: 1,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    boolPemeriksaanUmum =
                                                        !boolPemeriksaanUmum;
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    textDefault(
                                                        "Pemeriksaan Umum",
                                                        Colors.black,
                                                        14,
                                                        FontWeight.normal),
                                                    Icon(boolPemeriksaanUmum
                                                        ? Icons.edit
                                                        : Icons.arrow_drop_down)
                                                  ],
                                                ),
                                              ),
                                              boolPemeriksaanUmum
                                                  ? listPemeriksaanUmum()
                                                  : Container()
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    boolPemeriksaanMata =
                                                        !boolPemeriksaanMata;
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    textDefault(
                                                        "Pemeriksaan Mata",
                                                        Colors.black,
                                                        14,
                                                        FontWeight.normal),
                                                    Icon(boolPemeriksaanMata
                                                        ? Icons.edit
                                                        : Icons.arrow_drop_down)
                                                  ],
                                                ),
                                              ),
                                              boolPemeriksaanMata
                                                  ? listPemeriksaanMata()
                                                  : Container()
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  textDefault(
                                                      "Pemeriksaan THT",
                                                      Colors.black,
                                                      14,
                                                      FontWeight.normal),
                                                  Icon(Icons.arrow_drop_down)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  textDefault(
                                                      "Pemeriksaan Rongga Dada",
                                                      Colors.black,
                                                      14,
                                                      FontWeight.normal),
                                                  Icon(Icons.arrow_drop_down)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  textDefault(
                                                      "Pemeriksaan Rongga Perut",
                                                      Colors.black,
                                                      14,
                                                      FontWeight.normal),
                                                  Icon(Icons.arrow_drop_down)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  textDefault(
                                                      "Pemeriksaan Gentalia dan Anokretal",
                                                      Colors.black,
                                                      14,
                                                      FontWeight.normal),
                                                  Icon(Icons.arrow_drop_down)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  textDefault(
                                                      "Pemeriksaan Anggota Gerak",
                                                      Colors.black,
                                                      14,
                                                      FontWeight.normal),
                                                  Icon(Icons.arrow_drop_down)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  textDefault(
                                                      "Pemeriksaan Refleks",
                                                      Colors.black,
                                                      14,
                                                      FontWeight.normal),
                                                  Icon(Icons.arrow_drop_down)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  textDefault(
                                                      "Pemeriksaan Kelenjar Getah Bening",
                                                      Colors.black,
                                                      14,
                                                      FontWeight.normal),
                                                  Icon(Icons.arrow_drop_down)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    boolRiwayatPajanan = !boolRiwayatPajanan;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textDefault(
                                        "Riwayat Pajanan Pada Pekerjaan",
                                        Colors.black,
                                        14,
                                        FontWeight.normal),
                                    Icon(boolRiwayatPajanan
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down)
                                  ],
                                ),
                              ),
                              boolRiwayatPajanan == false
                                  ? Container()
                                  : Column(
                                      children: [
                                        Divider(
                                          thickness: 1,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  textDefault(
                                                      "Fisik",
                                                      Colors.black,
                                                      14,
                                                      FontWeight.normal),
                                                  Icon(Icons.arrow_drop_down)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  textDefault(
                                                      "Kimia",
                                                      Colors.black,
                                                      14,
                                                      FontWeight.normal),
                                                  Icon(Icons.arrow_drop_down)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  textDefault(
                                                      "Biologi",
                                                      Colors.black,
                                                      14,
                                                      FontWeight.normal),
                                                  Icon(Icons.arrow_drop_down)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  textDefault(
                                                      "Psikologis",
                                                      Colors.black,
                                                      14,
                                                      FontWeight.normal),
                                                  Icon(Icons.arrow_drop_down)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  textDefault(
                                                      "Ergonomis",
                                                      Colors.black,
                                                      14,
                                                      FontWeight.normal),
                                                  Icon(Icons.arrow_drop_down)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault(
                            "Pemeriksaan", Colors.black, 14, FontWeight.normal),
                        Icon(Icons.arrow_drop_down)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Anjuran-Anjuran", Colors.black, 14,
                            FontWeight.normal),
                        Icon(Icons.arrow_drop_down)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Kesimpulan Kelayakan Kerja", Colors.black,
                            14, FontWeight.normal),
                        Icon(Icons.arrow_drop_down)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDefault("Kesimpulan Derajat Kesehatan",
                            Colors.black, 14, FontWeight.normal),
                        Icon(Icons.arrow_drop_down)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: blueDefault,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: textDefault("Download Hasil MCU", Colors.white, 14,
                      FontWeight.normal),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listProfilePasien() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Nama Pasien", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Jenis Kelamin", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault("NIK", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Alamat", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault("Tanggal\nPemeriksaan", Colors.black, 12,
                    FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "TTL/Umur", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Perusahaan", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Bagian/Seksi", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "No. Handphone", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("No MCU", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "asdajsdhaksdjhaksdjhakjsdhakjsdhakjdhkajhdakjdhakjdhkjahdkajdkajhdjkahdkjhajdajdhkajhdkjahdjkahdkjhadkjshajkd",
                    Colors.black,
                    12,
                    FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget listPenyakitTerdahulu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Darah Tinggi", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault("Penyakit Paru(Asma,TBC,dll)", Colors.black,
                    12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Asam Lambung", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Alergi", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Riwayat Operasi", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Riwayat Kecelakaan", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Riwayat Rawat RS", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Hepatitis", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Kencing Manis", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault("Patah Tulang(Terpasang PEN)", Colors.black,
                    12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "asdajsdhaksdjhaksdjhakjsdhakjsdhakjdhkajhdakjdhakjdhkjahdkajdkajhdjkahdkjhajdajdhkajhdkjahdjkahdkjhadkjshajkd",
                    Colors.black,
                    12,
                    FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget listPenyakitKeluarga() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Kencing Manis", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Darah Tinggi", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Asam Lambung", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Alergi", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault("Penyakit Paru(Asma,TBC, dll)", Colors.black,
                    12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Stroke", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Ginjal", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Hemorhoid", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Kanker", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Jantung", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "asdajsdhaksdjhaksdjhakjsdhakjsdhakjdhkajhdakjdhakjdhkjahdkajdkajhdjkahdkjhajdajdhkajhdkjahdjkahdkjhadkjshajkd",
                    Colors.black,
                    12,
                    FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget listRiwayatKebiasaan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Merokok", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: textDefault(
                        "a) Lama", Colors.black, 12, FontWeight.normal),
                  ),
                ),
                Container(
                  child:
                      textDefault(":  ", Colors.black, 12, FontWeight.normal),
                ),
                Expanded(
                  child: Container(
                    child: textDefault("", Colors.black, 12, FontWeight.normal),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: textDefault(
                        "b) Banyak", Colors.black, 12, FontWeight.normal),
                  ),
                ),
                Container(
                  child:
                      textDefault(":  ", Colors.black, 12, FontWeight.normal),
                ),
                Expanded(
                  child: Container(
                    child: textDefault("", Colors.black, 12, FontWeight.normal),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Miras", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: textDefault(
                        "a) Lama", Colors.black, 12, FontWeight.normal),
                  ),
                ),
                Container(
                  child:
                      textDefault(":  ", Colors.black, 12, FontWeight.normal),
                ),
                Expanded(
                  child: Container(
                    child: textDefault("", Colors.black, 12, FontWeight.normal),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: textDefault(
                        "b) Banyak", Colors.black, 12, FontWeight.normal),
                  ),
                ),
                Container(
                  child:
                      textDefault(":  ", Colors.black, 12, FontWeight.normal),
                ),
                Expanded(
                  child: Container(
                    child: textDefault("", Colors.black, 12, FontWeight.normal),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Olahraga", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget listPemeriksaanUmum() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Tinggi Badan", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Berat Badan", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Berat Badan Ideal", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault("IMT", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Lingkaran Perut", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Tekanan Darah", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Denyut Nadi", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault("Frekuensi Pernapasan", Colors.black, 12,
                    FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault("Suhu", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget listPemeriksaanMata() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Berkaca Mata", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Kondisi", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Visus Os Kiri", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Visus Os Kanan", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Buta Warna", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Penyakit Mata", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Konjungtiva", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Sklera", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
