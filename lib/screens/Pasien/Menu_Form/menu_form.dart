// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:arifa_medikal_klink_3/model/ajuran_model.dart';
import 'package:arifa_medikal_klink_3/model/biologi_model.dart';
import 'package:arifa_medikal_klink_3/model/ergonomis_model.dart';
import 'package:arifa_medikal_klink_3/model/fisik_model.dart';
import 'package:arifa_medikal_klink_3/model/foto_lain_lain_model.dart';
import 'package:arifa_medikal_klink_3/model/kelayakan_kerja_model.dart';
import 'package:arifa_medikal_klink_3/model/kesimpulan_derajat_kesehatan.dart';
import 'package:arifa_medikal_klink_3/model/kimia_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_anggota_gerak_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_gentalia_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_kelenjar_getah_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_mata_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_refleks_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_rongga_dada_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_rongga_perut_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_tht_model.dart';
import 'package:arifa_medikal_klink_3/model/penyakit_keluarga_mode.dart';
import 'package:arifa_medikal_klink_3/model/penyakit_terdahulu_model.dart';
import 'package:arifa_medikal_klink_3/model/psikologi_model.dart';
import 'package:arifa_medikal_klink_3/model/riwayat_kebiasaan_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_audiometri.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_fisik.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_gigi_mulut.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_jantung.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_laboratorium.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_mata.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_paru.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_spirometri.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_treadmill.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/anjuran_6_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/foto_lain_lain_view.dart';
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
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/kesimpulan_derajat_8_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/kesimpulan_kelayakan_7_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/pemeriksaan_5_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/penyakit_keluarga_2_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/penyakit_terdahulu_1_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/riwayat_kebiasaan_3_8.dart';
import 'package:arifa_medikal_klink_3/screens/detail_pasien.dart';
import 'package:arifa_medikal_klink_3/screens/menu_utama.dart';
import 'package:flutter/material.dart';

import '../../../components/colors/color.dart';
import '../../../components/widget/text.dart';
import '../../../model/hasil_pemeriksaan/hasil_pemeriksaan_model.dart';
import '../../../model/pemeriksaan_umum_model.dart';
import '../../../service/firebase_firestore_service.dart';

class MenuForm extends StatefulWidget {
  MenuForm({super.key, required this.idPasien});

  String idPasien;

  @override
  State<MenuForm> createState() => _MenuFormState();
}

class _MenuFormState extends State<MenuForm> {
  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  PenyakitTerdahuluModel? _penyakitTerdahulu;
  PenyakitKeluargaModel? _penyakitKeluarga;
  PemeriksaanModel? _pemeriksaan;
  AjuranModel? _ajuran;
  KelayakanKerjaModel? _kelayakanKerja;
  KesimpulanDerajatKesehatanModel? _kesimpulanDerajatKesehatan;
  PemeriksaanUmumModel? _pemeriksaanUmum;
  PemeriksaanMataModel? _pemeriksaanMata;
  PemeriksaanTHTModel? _pemeriksaanTHT;
  PemeriksaanRonggaDadaModel? _pemeriksaanRonggaDada;
  PemeriksaanRonggaPerutModel? _pemeriksaanRonggaPerut;
  PemeriksaanGentaliaModel? _pemeriksaanGentalia;
  PemeriksaanAnggotaGerakModel? _pemeriksaanAnggotaGerak;
  PemeriksaanRefleksModel? _pemeriksaanRefleks;
  PemeriksaanKelenjarGetahModel? _pemeriksaanKelenjarGetah;
  RiwayatKebiasaanModel? _riwayatKebiasaan;
  FisikModel? _fisik;
  KimiaModel? _kimia;
  BiologiModel? _biologi;
  PsikologiModel? _psikologi;
  ErgonomisModel? _ergonomis;
  HasilPemeriksaanModel? _hasilFisik;
  HasilPemeriksaanModel? _hasilMata;
  HasilPemeriksaanModel? _hasilGigiMulut;
  HasilPemeriksaanModel? _hasilAudiometri;
  HasilPemeriksaanModel? _hasilSpirometri;
  HasilPemeriksaanModel? _hasilTreadmill;
  HasilPemeriksaanModel? _hasilLaboratorium;
  HasilPemeriksaanModel? _hasilJantung;
  HasilPemeriksaanModel? _hasilParu;
  FotoLainLain? _fotoLainLain;

  bool boolPenyakitTerdahulu = false;
  bool boolPenyakitKeluarga = false;
  bool boolRiwayatKebiasaan = false;
  bool boolPemeriksaanUmum = false;
  bool boolPemeriksaanMata = false;
  bool boolPemeriksaanTHT = false;
  bool boolPemeriksaanRonggaDada = false;
  bool boolPemeriksaanRonggaPerut = false;
  bool boolPemeriksaanGentalia = false;
  bool boolPemeriksaanAnggotaGerak = false;
  bool boolPemeriksaanRefleks = false;
  bool boolPemeriksaanKelenjarGetah = false;
  bool boolFisik = false;
  bool boolKimia = false;
  bool boolBiologi = false;
  bool boolPsikologi = false;
  bool boolErgonomis = false;
  bool boolPemeriksaan = false;
  bool boolAnjuran = false;
  bool boolKelayakanKerja = false;
  bool boolKesimpulanDerajat = false;
  bool isLoadingData = false;

  bool boolHasilFisik = false;
  bool boolHasilMata = false;
  bool boolHasilGigiMulut = false;
  bool boolHasilAudiometri = false;
  bool boolHasilSpirometri = false;
  bool boolHasilTreadmill = false;
  bool boolHasilLaboratorium = false;
  bool boolHasilJantung = false;
  bool boolHasilParu = false;
  bool boolFotoLainLain = false;

  bool btnSimpan = false;

  @override
  void initState() {
    isLoadingData = true;
    cekData();
    super.initState();
  }

  cekData() async {
    _penyakitTerdahulu = await firestore.getPenyakitTerdahulu(widget.idPasien);
    _penyakitKeluarga = await firestore.getPenyakitKeluarga(widget.idPasien);
    _riwayatKebiasaan = await firestore.getRiwayatKebiasaan(widget.idPasien);
    _pemeriksaanUmum = await firestore.getPemeriksaanUmum(widget.idPasien);
    _pemeriksaanMata = await firestore.getPemeriksaanMata(widget.idPasien);
    _pemeriksaanTHT = await firestore.getPemeriksaanTHT(widget.idPasien);
    _pemeriksaanRonggaDada =
        await firestore.getPemeriksaanRonggaDada(widget.idPasien);
    _pemeriksaanRonggaPerut =
        await firestore.getPemeriksaanRonggaPerut(widget.idPasien);
    _pemeriksaanGentalia =
        await firestore.getPemeriksaanGentalia(widget.idPasien);
    _pemeriksaanAnggotaGerak =
        await firestore.getPemeriksaanAnggotaGerak(widget.idPasien);
    _pemeriksaanRefleks =
        await firestore.getPemeriksaanRefleks(widget.idPasien);
    _pemeriksaanKelenjarGetah =
        await firestore.getPemeriksaanKelenjarGetah(widget.idPasien);
    _fisik = await firestore.getFisik(widget.idPasien);
    _kimia = await firestore.getKimia(widget.idPasien);
    _biologi = await firestore.getBiologi(widget.idPasien);
    _psikologi = await firestore.getPsikologi(widget.idPasien);
    _ergonomis = await firestore.getErgonomis(widget.idPasien);
    _pemeriksaan = await firestore.getPemeriksaan(widget.idPasien);
    _ajuran = await firestore.getAjuran(widget.idPasien);
    _kelayakanKerja = await firestore.getKelayakanKerja(widget.idPasien);
    _kesimpulanDerajatKesehatan =
        await firestore.getKesimpulanDerajatKesehatan(widget.idPasien);

    _hasilFisik = await firestore.getHasilPemeriksaanFisik(widget.idPasien);
    _hasilMata = await firestore.getHasilPemeriksaanMata(widget.idPasien);
    _hasilGigiMulut = await firestore.getHasilPemeriksaanGigi(widget.idPasien);
    _hasilAudiometri =
        await firestore.getHasilPemeriksaanAudiometri(widget.idPasien);
    _hasilSpirometri =
        await firestore.getHasilPemeriksaanSpirometri(widget.idPasien);
    _hasilTreadmill =
        await firestore.getHasilPemeriksaanTreadmill(widget.idPasien);
    _hasilLaboratorium =
        await firestore.getHasilPemeriksaanLaboratorium(widget.idPasien);
    _hasilJantung = await firestore.getHasilPemeriksaanJantung(widget.idPasien);
    _hasilParu = await firestore.getHasilPemeriksaanParu(widget.idPasien);
    _fotoLainLain = await firestore.getFotoLainLain(widget.idPasien);

    if (_hasilFisik != null) {
      setState(() {
        boolHasilFisik = true;
      });
    }
    if (_hasilMata != null) {
      setState(() {
        boolHasilMata = true;
      });
    }
    if (_hasilGigiMulut != null) {
      setState(() {
        boolHasilGigiMulut = true;
      });
    }
    if (_hasilAudiometri != null) {
      setState(() {
        boolHasilAudiometri = true;
      });
    }
    if (_hasilSpirometri != null) {
      setState(() {
        boolHasilSpirometri = true;
      });
    }
    if (_hasilTreadmill != null) {
      setState(() {
        boolHasilTreadmill = true;
      });
    }
    if (_hasilLaboratorium != null) {
      setState(() {
        boolHasilLaboratorium = true;
      });
    }
    if (_hasilJantung != null) {
      setState(() {
        boolHasilJantung = true;
      });
    }
    if (_hasilParu != null) {
      setState(() {
        boolHasilParu = true;
      });
    }

    if (_penyakitTerdahulu != null) {
      setState(() {
        boolPenyakitTerdahulu = true;
      });
    }
    if (_penyakitKeluarga != null) {
      setState(() {
        boolPenyakitKeluarga = true;
      });
    }
    if (_riwayatKebiasaan != null) {
      setState(() {
        boolRiwayatKebiasaan = true;
      });
    }
    if (_pemeriksaanUmum != null) {
      setState(() {
        boolPemeriksaanUmum = true;
      });
    }
    if (_pemeriksaanMata != null) {
      setState(() {
        boolPemeriksaanMata = true;
      });
    }
    if (_pemeriksaanTHT != null) {
      setState(() {
        boolPemeriksaanTHT = true;
      });
    }
    if (_pemeriksaanRonggaDada != null) {
      setState(() {
        boolPemeriksaanRonggaDada = true;
      });
    }
    if (_pemeriksaanRonggaPerut != null) {
      setState(() {
        boolPemeriksaanRonggaPerut = true;
      });
    }
    if (_pemeriksaanGentalia != null) {
      setState(() {
        boolPemeriksaanGentalia = true;
      });
    }
    if (_pemeriksaanAnggotaGerak != null) {
      setState(() {
        boolPemeriksaanAnggotaGerak = true;
      });
    }
    if (_pemeriksaanRefleks != null) {
      setState(() {
        boolPemeriksaanRefleks = true;
      });
    }
    if (_pemeriksaanKelenjarGetah != null) {
      setState(() {
        boolPemeriksaanKelenjarGetah = true;
      });
    }
    if (_fisik != null) {
      setState(() {
        boolFisik = true;
      });
    }
    if (_kimia != null) {
      setState(() {
        boolKimia = true;
      });
    }
    if (_biologi != null) {
      setState(() {
        boolBiologi = true;
      });
    }
    if (_psikologi != null) {
      setState(() {
        boolPsikologi = true;
      });
    }
    if (_ergonomis != null) {
      setState(() {
        boolErgonomis = true;
      });
    }
    if (_pemeriksaan != null) {
      setState(() {
        boolPemeriksaan = true;
      });
    }
    if (_ajuran != null) {
      setState(() {
        boolAnjuran = true;
      });
    }
    if (_kelayakanKerja != null) {
      setState(() {
        boolKelayakanKerja = true;
      });
    }
    if (_kesimpulanDerajatKesehatan != null) {
      setState(() {
        boolKesimpulanDerajat = true;
      });
    }
    if (_fotoLainLain != null) {
      setState(() {
        boolFotoLainLain = true;
      });
    }

    if (boolPenyakitTerdahulu == true &&
        boolPenyakitKeluarga == true &&
        boolRiwayatKebiasaan == true &&
        boolPemeriksaanUmum == true &&
        boolPemeriksaanMata == true &&
        boolPemeriksaanTHT == true &&
        boolPemeriksaanRonggaDada == true &&
        boolPemeriksaanRonggaPerut == true &&
        boolPemeriksaanGentalia == true &&
        boolPemeriksaanAnggotaGerak == true &&
        boolPemeriksaanRefleks == true &&
        boolPemeriksaanKelenjarGetah == true &&
        boolFisik == true &&
        boolKimia == true &&
        boolBiologi == true &&
        boolPsikologi == true &&
        boolErgonomis == true &&
        boolPemeriksaan == true &&
        boolAnjuran == true &&
        boolKelayakanKerja == true &&
        boolKesimpulanDerajat == true) {
      setState(() {
        btnSimpan = true;
      });
    }
    isLoadingData = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        dialogBack();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: blueDefault,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () {
                dialogBack();
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                ],
              ),
            ),
            textDefault("Menu Form", Colors.white, 16, FontWeight.bold),
            SizedBox(
              width: 5,
            ),
          ]),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: isLoadingData
              ? Center(
                  child: CircularProgressIndicator(
                    color: blueDefault,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return PenyakitTerdahulu1(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Riwayat Penyakit Terdahulu",
                                  Colors.black, 14, FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolPenyakitTerdahulu == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolPenyakitTerdahulu == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return PenyakitKeluarga(idPasien: widget.idPasien);
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Riwayat Penyakit Keluarga",
                                  Colors.black, 14, FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolPenyakitKeluarga == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolPenyakitKeluarga == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return RiwwayatKebiasaan3(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Riwayat Kebiasaan", Colors.black, 14,
                                  FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolRiwayatKebiasaan == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolRiwayatKebiasaan == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return PemeriksaanUmum(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Pemeriksaan Umum", Colors.black, 14,
                                  FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolPemeriksaanUmum == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolPemeriksaanUmum == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return PemeriksaanMata(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Pemeriksaan Mata", Colors.black, 14,
                                  FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolPemeriksaanMata == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolPemeriksaanMata == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return PemeriksaanTHT(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Pemeriksaan THT", Colors.black, 14,
                                  FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolPemeriksaanTHT == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolPemeriksaanTHT == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return PemeriksaanRonggaDada(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Pemeriksaan Rongga Dada",
                                  Colors.black, 14, FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolPemeriksaanRonggaDada == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolPemeriksaanRonggaDada == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return PemeriksaanRonggaPerut(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Pemeriksaan Rongga Perut",
                                  Colors.black, 14, FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolPemeriksaanRonggaPerut == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolPemeriksaanRonggaPerut == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return PemeriksaanGentalia(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Pemeriksaan Gentalia", Colors.black,
                                  14, FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolPemeriksaanGentalia == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolPemeriksaanGentalia == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return PemeriksaanAnggotaGerak(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Pemeriksaan Anggota Gerak",
                                  Colors.black, 14, FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolPemeriksaanAnggotaGerak == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolPemeriksaanAnggotaGerak == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return PemeriksaanRefleks(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Pemeriksaan Refleks", Colors.black,
                                  14, FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolPemeriksaanRefleks == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolPemeriksaanRefleks == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return PemeriksaanKelenjarGetah(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Pemeriksaan Kelenjar Getah",
                                  Colors.black, 14, FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolPemeriksaanKelenjarGetah == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolPemeriksaanKelenjarGetah == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Fisik(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Riwayat Pajanan (Fisik)",
                                  Colors.black, 14, FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolFisik == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolFisik == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Kimia(
                              pasienId: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Riwayat Pajanan (Kimia)",
                                  Colors.black, 14, FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolKimia == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolKimia == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Biologi(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Riwayat Pajanan (Biologi)",
                                  Colors.black, 14, FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolBiologi == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolBiologi == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Psikologis(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Riwayat Pajanan (Psikologis)",
                                  Colors.black, 14, FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolPsikologi == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolPsikologi == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Ergonomis(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Riwayat Pajanan (Ergonomis)",
                                  Colors.black, 14, FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolErgonomis == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolErgonomis == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Pemeriksaan5(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Pemeriksaan", Colors.black, 14,
                                  FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolPemeriksaan == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolPemeriksaan == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _pemeriksaan == null
                          ? Container()
                          : _pemeriksaan!.pemeriksaanFisik == ""
                              ? Container()
                              : Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return HasilPemeriksaanFisik(
                                            idPasien: widget.idPasien,
                                          );
                                        }));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            textDefault(
                                                "Hasil Pemeriksaan Fisik",
                                                Colors.black,
                                                14,
                                                FontWeight.normal),
                                            Container(
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  color: boolHasilFisik == false
                                                      ? Colors.white
                                                      : Colors.green,
                                                  shape: BoxShape.circle),
                                              child: boolHasilFisik == false
                                                  ? Icon(
                                                      Icons.warning,
                                                      size: 30,
                                                      color: Colors.amber,
                                                    )
                                                  : Icon(
                                                      Icons.done,
                                                      size: 20,
                                                      color: Colors.white,
                                                    ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                      _pemeriksaan == null
                          ? Container()
                          : _pemeriksaan!.pemeriksaanMata == ""
                              ? Container()
                              : Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return HasilPemeriksaanMata(
                                            idPasien: widget.idPasien,
                                          );
                                        }));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            textDefault(
                                                "Hasil Pemeriksaan Mata",
                                                Colors.black,
                                                14,
                                                FontWeight.normal),
                                            Container(
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  color: boolHasilMata == false
                                                      ? Colors.white
                                                      : Colors.green,
                                                  shape: BoxShape.circle),
                                              child: boolHasilMata == false
                                                  ? Icon(
                                                      Icons.warning,
                                                      size: 30,
                                                      color: Colors.amber,
                                                    )
                                                  : Icon(
                                                      Icons.done,
                                                      size: 20,
                                                      color: Colors.white,
                                                    ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                      _pemeriksaan == null
                          ? Container()
                          : _pemeriksaan!.pemeriksaanGigiMulut == ""
                              ? Container()
                              : Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return HasilPemeriksaanGigiMulut(
                                            idPasien: widget.idPasien,
                                          );
                                        }));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            textDefault(
                                                "Hasil Pemeriksaan Gigi dan Mulut",
                                                Colors.black,
                                                14,
                                                FontWeight.normal),
                                            Container(
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  color: boolHasilGigiMulut ==
                                                          false
                                                      ? Colors.white
                                                      : Colors.green,
                                                  shape: BoxShape.circle),
                                              child: boolHasilGigiMulut == false
                                                  ? Icon(
                                                      Icons.warning,
                                                      size: 30,
                                                      color: Colors.amber,
                                                    )
                                                  : Icon(
                                                      Icons.done,
                                                      size: 20,
                                                      color: Colors.white,
                                                    ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                      _pemeriksaan == null
                          ? Container()
                          : _pemeriksaan!.pemeriksaanAudioMetri == ""
                              ? Container()
                              : Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return HasilPemeriksaanAudiometri(
                                            idPasien: widget.idPasien,
                                          );
                                        }));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            textDefault(
                                                "Hasil Pemeriksaan Audiometri",
                                                Colors.black,
                                                14,
                                                FontWeight.normal),
                                            Container(
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  color: boolHasilAudiometri ==
                                                          false
                                                      ? Colors.white
                                                      : Colors.green,
                                                  shape: BoxShape.circle),
                                              child:
                                                  boolHasilAudiometri == false
                                                      ? Icon(
                                                          Icons.warning,
                                                          size: 30,
                                                          color: Colors.amber,
                                                        )
                                                      : Icon(
                                                          Icons.done,
                                                          size: 20,
                                                          color: Colors.white,
                                                        ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                      _pemeriksaan == null
                          ? Container()
                          : _pemeriksaan!.pemeriksaanSpirometri == ""
                              ? Container()
                              : Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return HasilPemeriksaanSpirometri(
                                            idPasien: widget.idPasien,
                                          );
                                        }));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            textDefault(
                                                "Hasil Pemeriksaan Spirometri",
                                                Colors.black,
                                                14,
                                                FontWeight.normal),
                                            Container(
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  color: boolHasilSpirometri ==
                                                          false
                                                      ? Colors.white
                                                      : Colors.green,
                                                  shape: BoxShape.circle),
                                              child:
                                                  boolHasilSpirometri == false
                                                      ? Icon(
                                                          Icons.warning,
                                                          size: 30,
                                                          color: Colors.amber,
                                                        )
                                                      : Icon(
                                                          Icons.done,
                                                          size: 20,
                                                          color: Colors.white,
                                                        ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                      _pemeriksaan == null
                          ? Container()
                          : _pemeriksaan!.pemeriksaanTreadmill == ""
                              ? Container()
                              : Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return HasilPemeriksaanTreadmill(
                                            idPasien: widget.idPasien,
                                          );
                                        }));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            textDefault(
                                                "Hasil Pemeriksaan Treadmill",
                                                Colors.black,
                                                14,
                                                FontWeight.normal),
                                            Container(
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  color: boolHasilTreadmill ==
                                                          false
                                                      ? Colors.white
                                                      : Colors.green,
                                                  shape: BoxShape.circle),
                                              child: boolHasilTreadmill == false
                                                  ? Icon(
                                                      Icons.warning,
                                                      size: 30,
                                                      color: Colors.amber,
                                                    )
                                                  : Icon(
                                                      Icons.done,
                                                      size: 20,
                                                      color: Colors.white,
                                                    ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                      _pemeriksaan == null
                          ? Container()
                          : _pemeriksaan!.pemeriksaanLaboratorium == ""
                              ? Container()
                              : Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return HasilPemeriksaanLaboratorium(
                                            idPasien: widget.idPasien,
                                          );
                                        }));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            textDefault(
                                                "Hasil Pemeriksaan Laboratorium",
                                                Colors.black,
                                                14,
                                                FontWeight.normal),
                                            Container(
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  color:
                                                      boolHasilLaboratorium ==
                                                              false
                                                          ? Colors.white
                                                          : Colors.green,
                                                  shape: BoxShape.circle),
                                              child:
                                                  boolHasilLaboratorium == false
                                                      ? Icon(
                                                          Icons.warning,
                                                          size: 30,
                                                          color: Colors.amber,
                                                        )
                                                      : Icon(
                                                          Icons.done,
                                                          size: 20,
                                                          color: Colors.white,
                                                        ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                      _pemeriksaan == null
                          ? Container()
                          : _pemeriksaan!.pemeriksaanXrayJantung == ""
                              ? Container()
                              : Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return HasilPemeriksaanJantung(
                                            idPasien: widget.idPasien,
                                          );
                                        }));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            textDefault(
                                                "Hasil Pemeriksaan X-Ray Jantung",
                                                Colors.black,
                                                14,
                                                FontWeight.normal),
                                            Container(
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  color:
                                                      boolHasilJantung == false
                                                          ? Colors.white
                                                          : Colors.green,
                                                  shape: BoxShape.circle),
                                              child: boolHasilJantung == false
                                                  ? Icon(
                                                      Icons.warning,
                                                      size: 30,
                                                      color: Colors.amber,
                                                    )
                                                  : Icon(
                                                      Icons.done,
                                                      size: 20,
                                                      color: Colors.white,
                                                    ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                      _pemeriksaan == null
                          ? Container()
                          : _pemeriksaan!.paru == ""
                              ? Container()
                              : Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return HasilPemeriksaanParu(
                                            idPasien: widget.idPasien,
                                          );
                                        }));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            textDefault(
                                                "Hasil Pemeriksaan X-Ray Paru-Paru",
                                                Colors.black,
                                                14,
                                                FontWeight.normal),
                                            Container(
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  color: boolHasilParu == false
                                                      ? Colors.white
                                                      : Colors.green,
                                                  shape: BoxShape.circle),
                                              child: boolHasilParu == false
                                                  ? Icon(
                                                      Icons.warning,
                                                      size: 30,
                                                      color: Colors.amber,
                                                    )
                                                  : Icon(
                                                      Icons.done,
                                                      size: 20,
                                                      color: Colors.white,
                                                    ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Anjuran6(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Anjuran-anjuran", Colors.black, 14,
                                  FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolAnjuran == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolAnjuran == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return KesimpulanKelayakan7(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Kesimpulan Kelayakan Kerja",
                                  Colors.black, 14, FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolKelayakanKerja == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolKelayakanKerja == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return KesimpulanDerajat8(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Kesimpulan Derajat Kesehatan",
                                  Colors.black, 14, FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolKesimpulanDerajat == false
                                        ? Colors.red
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolKesimpulanDerajat == false
                                    ? Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return FotoLainLainView(
                              idPasien: widget.idPasien,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textDefault("Foto Lain-Lain", Colors.black, 14,
                                  FontWeight.normal),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: boolFotoLainLain == false
                                        ? Colors.white
                                        : Colors.green,
                                    shape: BoxShape.circle),
                                child: boolFotoLainLain == false
                                    ? Icon(
                                        Icons.warning,
                                        size: 30,
                                        color: Colors.amber,
                                      )
                                    : Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Note : ",
                            style: TextStyle(
                                fontFamily: 'poppins',
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.done,
                                  size: 10,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                ": Form sudah terisi",
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.red, shape: BoxShape.circle),
                                child: Icon(
                                  Icons.close,
                                  size: 10,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                ": Form belum terisi (Harus Di isi)",
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.warning,
                                  size: 15,
                                  color: Colors.amber,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                ": Form belum terisi (Boleh Di kosongkan)",
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (btnSimpan == true) {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return MenuUtama();
                            }), (route) => false);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: btnSimpan
                                ? blueDefault
                                : blueDefault.withOpacity(0.5),
                          ),
                          child: Center(
                            child: textDefault(
                                "Simpan", Colors.white, 14, FontWeight.normal),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  void dialogBack() {
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
            "Apakah Anda yakin ingin\nKeluar dari Form?",
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
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return MenuUtama();
                    }),
                  ),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: textDefault(
                            "Ya, Keluar", Colors.white, 14, FontWeight.bold),
                      )),
                )),
              ],
            )
          ],
        );
      },
    );
  }
}
