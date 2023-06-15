// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:arifa_medikal_klink_3/components/colors/color.dart';
import 'package:arifa_medikal_klink_3/components/widget/text.dart';
import 'package:arifa_medikal_klink_3/model/hasil_pemeriksaan/hasil_pemeriksaan_model.dart';
import 'package:arifa_medikal_klink_3/model/hasil_pemeriksaan/hasil_pemeriksaan_usg_model.dart';
import 'package:arifa_medikal_klink_3/model/pasien_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_umum_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_napza.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_usg.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/add_pasien_profil.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_anggota_gerak.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_gentalia.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_hasil_pemeriksaan.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_hidung.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_jantung.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_kerongkongan.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_kesimpulan_derajat.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_kesimpulan_kelayakan.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_paru.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_pemeriksaan_mata.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_pemeriksaan_umum.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_penyakit_keluarga.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_penyakit_terdahulu.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_refleks.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_riwayat_kebiasaan.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_riwayat_pajanan.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_rongga_perut.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Review/components/list_telinga.dart';
import 'package:arifa_medikal_klink_3/service/firebase_firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
import 'package:arifa_medikal_klink_3/screens/menu_utama.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as htmm;

import '../../model/hasil_pemeriksaan/hasil_pemeriksaan_laboratorium_model.dart';
import 'Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_laboratorium1.dart';
import 'Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_napfa.dart';
import 'Review/components/list_anjuran.dart';
import 'Review/components/list_kelenjar_getah.dart';
import 'Review/components/list_profile_pasien.dart';

class PasienDetail extends StatefulWidget {
  PasienDetail({super.key, required this.idPasien});
  String idPasien;
  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  PasienModel? _pasien;

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
  HasilPemeriksaanLaboratoriumModel? _hasilLaboratorium;
  HasilPemeriksaanModel? _hasilJantung;
  HasilPemeriksaanModel? _hasilParu;
  HasilPemeriksaanUSGModel? _hasilUsg;
  HasilPemeriksaanModel? _hasilNapfa;
  HasilPemeriksaanModel? _hasilNapza;

  FotoLainLain? _fotoLainLain;
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
  bool boolHidung = false;
  bool boolTelinga = false;
  bool boolKerongkongan = false;
  bool boolPemeriksaanRonggaDada = false;
  bool boolJantung = false;
  bool boolParu = false;
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

  bool boolHasilFisik = false;
  bool boolHasilMata = false;
  bool boolHasilGigiMulut = false;
  bool boolHasilAudiometri = false;
  bool boolHasilSpirometri = false;
  bool boolHasilTreadmill = false;
  bool boolHasilLaboratorium = false;
  bool boolHasilJantung = false;
  bool boolHasilParu = false;
  bool boolHasilUsg = false;
  bool boolHasilNapfa = false;
  bool boolHasilNapza = false;
  bool boolFotoLainLain = false;

  String merokokLama = "";
  String merokokBanyak = "";
  String merokokBungkus = "";

  String mirasLama = "";
  String mirasBanyak = "";
  String mirasBotol = "";

  bool isLoading = false;
  bool btnLoading = false;
  String tanggal = "";

  @override
  void initState() {
    cekData();
    super.initState();
  }

  cekData() async {
    _pasien = await firestore.getPasien(widget.idPasien);
    // DateTime a = DateTime.parse("${_pasien!.tanggalPemeriksaan!} 07:00:23.114");
    // tanggal = DateFormat("dd MMM yyyy").format(a);
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
        await firestore.getHasilPemeriksaanLaboratorium1(widget.idPasien);
    _hasilJantung = await firestore.getHasilPemeriksaanJantung(widget.idPasien);
    _hasilParu = await firestore.getHasilPemeriksaanParu(widget.idPasien);
    _hasilUsg = await firestore.getHasilPemeriksaanUsg(widget.idPasien);
    _hasilNapfa = await firestore.getHasilPemeriksaanNapfa(widget.idPasien);
    _hasilNapza = await firestore.getHasilPemeriksaanNapza(widget.idPasien);

    _fotoLainLain = await firestore.getFotoLainLain(widget.idPasien);
    if (_riwayatKebiasaan!.strMerokok == "Tidak") {
      merokokLama = ": -";
      merokokBanyak = ": -";
      merokokBungkus = ": -";
      if (_riwayatKebiasaan!.strMiras == "Tidak") {
        mirasLama = ": -";
        mirasBanyak = ": -";
        mirasBotol = ": -";
      } else {
        mirasLama = ": ${_riwayatKebiasaan!.miras!.lama!} Tahun";
        mirasBanyak = ": ${_riwayatKebiasaan!.miras!.gelas!} Gelas/hari";
        mirasBotol = ": ${_riwayatKebiasaan!.miras!.botol!} Botol/hari";
      }
    } else {
      merokokLama = ": ${_riwayatKebiasaan!.merokok!.lama!} Tahun";
      merokokBanyak = ": ${_riwayatKebiasaan!.merokok!.batang!} Batang/hari";
      merokokBungkus = ": ${_riwayatKebiasaan!.merokok!.bungkus!} Bungkus/hari";
      if (_riwayatKebiasaan!.strMiras == "Tidak") {
        mirasLama = ": -";
        mirasBanyak = ": -";
        mirasBotol = ": -";
      } else {
        mirasLama = ": ${_riwayatKebiasaan!.miras!.lama!} Tahun";
        mirasBanyak = ": ${_riwayatKebiasaan!.miras!.gelas!} Gelas/hari";
        mirasBotol = ": ${_riwayatKebiasaan!.miras!.botol!} Botol/hari";
      }
    }
    isLoading = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Future<void> getHasilPDFMCU() async {
      final pdf = pw.Document();
      final ByteData bytesImage1 =
          await rootBundle.load('assets/images/header.jpeg');
      final Uint8List headerImage = bytesImage1.buffer.asUint8List();

      final ByteData bytesImage2 =
          await rootBundle.load('assets/images/footer.jpeg');
      final Uint8List footerImage = bytesImage2.buffer.asUint8List();

      final ByteData bytesImagePolos1 =
          await rootBundle.load('assets/images/headerpng.png');
      final Uint8List headerImagePolos1 = bytesImagePolos1.buffer.asUint8List();

      final ByteData bytesImagePolos2 =
          await rootBundle.load('assets/images/footerpng.png');
      final Uint8List footerImagePolos2 = bytesImagePolos2.buffer.asUint8List();

      final ByteData bytesImage3 =
          await rootBundle.load('assets/images/ttd.png');
      final Uint8List ttdDokter = bytesImage3.buffer.asUint8List();

      final ByteData faviconByte =
          await rootBundle.load('assets/images/icon_arifa.jpeg');
      final Uint8List faviconImage = faviconByte.buffer.asUint8List();

      final ByteData skjByte =
          await rootBundle.load('assets/images/standar_skj.jpg');
      final Uint8List skjImage = skjByte.buffer.asUint8List();

      pdf.addPage(pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          maxPages: 20,
          margin: pw.EdgeInsets.all(0),
          header: (context) {
            return pw.Container(
              width: 1000,
              height: 80,
              margin: pw.EdgeInsets.only(bottom: 10),
              decoration: pw.BoxDecoration(),
              child: pw.ClipRRect(
                child: pw.Container(
                  child: pw.Image(
                    pw.MemoryImage(headerImagePolos1),
                    fit: pw.BoxFit.fill,
                  ),
                ),
              ),
            );
          },
          footer: (context) {
            return pw.Container(
              width: 1000,
              height: 80,
              decoration: pw.BoxDecoration(),
              child: pw.ClipRRect(
                child: pw.Container(
                  child: pw.Image(
                    pw.MemoryImage(footerImagePolos2),
                    fit: pw.BoxFit.fill,
                  ),
                ),
              ),
            );
          },
          build: (pw.Context context) {
            return [
              pw.Center(
                  child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                    pw.SizedBox(height: 30),
                    pw.Container(
                      width: 250,
                      height: 130,
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(faviconImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    pw.SizedBox(height: 70),
                    pw.Text("Medical Check Up",
                        style: pw.TextStyle(
                            fontSize: 30, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 70),
                    pw.Text(_pasien!.nama!,
                        style: pw.TextStyle(
                            fontSize: 20, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 20),
                    pw.Text(_pasien!.bagian!,
                        style: pw.TextStyle(
                            fontSize: 20, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 20),
                    pw.Text(_pasien!.perusahaan!,
                        style: pw.TextStyle(
                            fontSize: 20, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 180),
                    pw.Text(
                        "Jln. Banda Aceh - Medan No.22 Desa Blang Pulo, Kecamatan Muara Satu, Kota Lhokseumawe",
                        style: pw.TextStyle(
                            fontSize: 11, fontWeight: pw.FontWeight.normal)),
                    pw.Text(
                        "Email: klinik_arifamedikal@yahoo.com | Website: www.arifamedikalklinik.com\nTelp: 0645-8451168, HP: 0852-6060-1909",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            fontSize: 11, fontWeight: pw.FontWeight.normal)),
                  ]))
            ];
          }));

      pdf.addPage(
        pw.MultiPage(
            pageFormat: PdfPageFormat.a4,
            maxPages: 20,
            margin: pw.EdgeInsets.all(0),
            header: (context) {
              return pw.Container(
                width: 1000,
                height: 80,
                margin: pw.EdgeInsets.only(bottom: 10),
                decoration: pw.BoxDecoration(),
                child: pw.ClipRRect(
                  child: pw.Container(
                    child: pw.Image(
                      pw.MemoryImage(headerImage),
                      fit: pw.BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
            footer: (context) {
              return pw.Container(
                width: 1000,
                height: 80,
                decoration: pw.BoxDecoration(),
                child: pw.ClipRRect(
                  child: pw.Container(
                    child: pw.Image(
                      pw.MemoryImage(footerImage),
                      fit: pw.BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
            build: (pw.Context context) {
              return [
                pw.Container(
                  padding: pw.EdgeInsets.symmetric(horizontal: 10),
                  child: pw.Column(children: [
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Text("ANAMNESA DAN PEMERIKSAAN FISIK",
                              style: pw.TextStyle(
                                  fontSize: 16, fontWeight: pw.FontWeight.bold))
                        ]),
                    pw.SizedBox(height: 10),
                    pw.Row(children: [
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 120,
                          height: 25,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Text("Nama",
                              style: pw.TextStyle(fontSize: 11))),
                      pw.Container(
                        padding: pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                        width: 120,
                        height: 25,
                        decoration: pw.BoxDecoration(
                            border: pw.Border.all(color: PdfColors.black)),
                        child: pw.Container(
                            child: pw.Text(_pasien!.nama!,
                                style: pw.TextStyle(
                                    fontSize:
                                        _pasien!.nama!.length < 15 ? 10 : 8))),
                      ),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 100,
                          height: 25,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Text("Tgl. Pemeriksaan",
                              style: pw.TextStyle(fontSize: 11))),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 240,
                          height: 25,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Text(_pasien!.tanggalPemeriksaan!,
                              style: pw.TextStyle(fontSize: 11))),
                    ]),
                    pw.Row(children: [
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 120,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Text("Jenis Kelamin",
                              style: pw.TextStyle(fontSize: 11))),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 120,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Text(_pasien!.jenisKelamin!,
                              style: pw.TextStyle(fontSize: 11))),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 100,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Text("TTL/Umur",
                              style: pw.TextStyle(fontSize: 11))),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 240,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Text(
                              _pasien!.tanggalLahir! + "/" + "${_pasien!.umur}",
                              style: pw.TextStyle(fontSize: 11))),
                    ]),
                    pw.Row(children: [
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 120,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Text("NIK",
                              style: pw.TextStyle(fontSize: 11))),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 120,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Text("${_pasien!.nik}",
                              style: pw.TextStyle(fontSize: 11))),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 100,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Text("Perusahaan",
                              style: pw.TextStyle(fontSize: 11))),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 240,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Text(_pasien!.perusahaan!,
                              style: pw.TextStyle(fontSize: 11))),
                    ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Container(
                              padding: pw.EdgeInsets.only(
                                  left: 5, top: 2, bottom: 2),
                              width: 120,
                              height: 60,
                              decoration: pw.BoxDecoration(
                                  border:
                                      pw.Border.all(color: PdfColors.black)),
                              child: pw.Text("Alamat",
                                  style: pw.TextStyle(fontSize: 11))),
                          pw.Container(
                              padding: pw.EdgeInsets.only(
                                  left: 5, top: 2, bottom: 2),
                              width: 120,
                              height: 60,
                              decoration: pw.BoxDecoration(
                                  border:
                                      pw.Border.all(color: PdfColors.black)),
                              child: pw.Text(_pasien!.alamat!,
                                  style: pw.TextStyle(fontSize: 11))),
                          pw.Column(children: [
                            pw.Row(children: [
                              pw.Container(
                                  padding: pw.EdgeInsets.only(
                                      left: 5, top: 2, bottom: 2),
                                  width: 100,
                                  height: 20,
                                  decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColors.black)),
                                  child: pw.Text("Bagian / Seksi",
                                      style: pw.TextStyle(fontSize: 11))),
                              pw.Container(
                                  padding: pw.EdgeInsets.only(
                                      left: 5, top: 2, bottom: 2),
                                  width: 240,
                                  height: 20,
                                  decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColors.black)),
                                  child: pw.Text(_pasien!.bagian!,
                                      style: pw.TextStyle(fontSize: 11))),
                            ]),
                            pw.Row(children: [
                              pw.Container(
                                  padding: pw.EdgeInsets.only(
                                      left: 5, top: 2, bottom: 2),
                                  width: 100,
                                  height: 20,
                                  decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColors.black)),
                                  child: pw.Text("No HP",
                                      style: pw.TextStyle(fontSize: 11))),
                              pw.Container(
                                  padding: pw.EdgeInsets.only(
                                      left: 5, top: 2, bottom: 2),
                                  width: 240,
                                  height: 20,
                                  decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColors.black)),
                                  child: pw.Text(_pasien!.noHp!,
                                      style: pw.TextStyle(fontSize: 11))),
                            ]),
                            pw.Row(children: [
                              pw.Container(
                                  padding: pw.EdgeInsets.only(
                                      left: 5, top: 2, bottom: 2),
                                  width: 100,
                                  height: 20,
                                  decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColors.black)),
                                  child: pw.Text("No MCU",
                                      style: pw.TextStyle(fontSize: 11))),
                              pw.Container(
                                  padding: pw.EdgeInsets.only(
                                      left: 5, top: 2, bottom: 2),
                                  width: 240,
                                  height: 20,
                                  decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColors.black)),
                                  child: pw.Text(
                                      _pasien!.noMcu == null
                                          ? ""
                                          : "${_pasien!.noMcu!}",
                                      style: pw.TextStyle(fontSize: 11))),
                            ])
                          ])
                        ]),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 10),
                          pw.Text("I.",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 20),
                          pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Riwayat Penyakit Terdahulu",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("a. Darah tinggi",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(
                                      ": ${_penyakitTerdahulu!.darahTinggi ?? ""}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text(
                                        "b. Penyakit paru (Asma, TBC dll)",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ${_penyakitTerdahulu!.paru ?? ""}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("c. Asam lambung",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(
                                      ": ${_penyakitTerdahulu!.asamLambung ?? ""}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("d. Alergi",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(
                                      ": ${_penyakitTerdahulu!.alergi ?? ""}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("e. Riwayat operasi",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(
                                      ": ${_penyakitTerdahulu!.riwayatOperasi ?? ""}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("f. Riwayat kecelakaan",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(
                                      ": ${_penyakitTerdahulu!.riwayatKecelakaan ?? ""}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("g. Riwayat rawat RS",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(
                                      ": ${_penyakitTerdahulu!.riwayatRawatRs ?? ""}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("h. Hepatitis",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(
                                      ": ${_penyakitTerdahulu!.hepatitis ?? ""}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("i. Kencing manis",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(
                                      ": ${_penyakitTerdahulu!.kencingManis ?? ""}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text(
                                        "j. Patah tulang (terpasang PEN)",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(
                                      ": ${_penyakitTerdahulu!.patahTulang ?? ""}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                              ])
                        ]),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 5),
                          pw.Text("II.",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 20),
                          pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Riwayat Penyakit Keluarga (Orang Tua)",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("a. Kencing manis",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(
                                      ": ${_penyakitKeluarga!.kencingManis}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("b. Darah tinggi",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ${_penyakitKeluarga!.darahTinggi}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("c. Asam lambung",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ${_penyakitKeluarga!.asamLambung}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("d. Alergi",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ${_penyakitKeluarga!.alergi}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text(
                                        "e. Penyakit paru (Asma, TBC, dll)",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ${_penyakitKeluarga!.paru}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("f. Stroke",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ${_penyakitKeluarga!.stroke}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("g. Ginjal",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ${_penyakitKeluarga!.ginjal}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("h. Hemorrhoid",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ${_penyakitKeluarga!.hemorhoid}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("i. Kanker",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ${_penyakitKeluarga!.kanker}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("j. Jantung",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ${_penyakitKeluarga!.jantung}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                              ])
                        ]),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 5),
                          pw.Text("III.",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 15),
                          pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Riwayat Kebiasaan",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("a. Merokok",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ${_riwayatKebiasaan!.strMerokok}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("   a). Lama",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(merokokLama,
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("   b). Banyak",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(merokokBanyak,
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(merokokBungkus,
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("b. Minum Miras",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ${_riwayatKebiasaan!.strMiras}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("   a). Lama",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(mirasLama,
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("   b). Banyak",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(mirasBanyak,
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(mirasBotol,
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("c. Olahraga",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(
                                      ": ${_riwayatKebiasaan!.olahraga != null ? 'Ya' : 'Tidak'}",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                              ])
                        ]),
                    // pw.Row(children: [
                    //   pw.SizedBox(width: 5),
                    //   pw.Text("IV.",
                    //       style: pw.TextStyle(
                    //           fontSize: 11, fontWeight: pw.FontWeight.bold)),
                    //   pw.SizedBox(width: 15),
                    //   pw.Text("Keluhan Sekarang",
                    //       style: pw.TextStyle(
                    //           fontSize: 11, fontWeight: pw.FontWeight.bold)),
                    // ]),
                  ]),
                ),
              ];
            }),
      );

      pdf.addPage(pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          maxPages: 20,
          margin: pw.EdgeInsets.all(0),
          header: (context) {
            return pw.Container(
              width: 1000,
              height: 80,
              margin: pw.EdgeInsets.only(bottom: 10),
              decoration: pw.BoxDecoration(),
              child: pw.ClipRRect(
                child: pw.Container(
                  child: pw.Image(
                    pw.MemoryImage(headerImage),
                    fit: pw.BoxFit.fill,
                  ),
                ),
              ),
            );
          },
          footer: (context) {
            return pw.Container(
              width: 1000,
              height: 80,
              decoration: pw.BoxDecoration(),
              child: pw.ClipRRect(
                child: pw.Container(
                  child: pw.Image(
                    pw.MemoryImage(footerImage),
                    fit: pw.BoxFit.fill,
                  ),
                ),
              ),
            );
          },
          build: (pw.Context context) {
            return [
              pw.Container(
                  padding: pw.EdgeInsets.symmetric(horizontal: 10),
                  child: pw.Column(children: [
                    pw.SizedBox(height: 10),
                    pw.Row(children: [
                      pw.SizedBox(width: 5),
                      pw.Text("IV.",
                          style: pw.TextStyle(
                              fontSize: 11, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(width: 15),
                      pw.Text("Keluhan Sekarang",
                          style: pw.TextStyle(
                              fontSize: 11, fontWeight: pw.FontWeight.bold)),
                    ]),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 5),
                          pw.Text("A.",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 15),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("KEADAAN UMUM",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("1.",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight: pw.FontWeight.bold)),
                                      pw.SizedBox(width: 10),
                                      pw.Column(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pw.Text("Pemeriksaan Umum",
                                                style: pw.TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        pw.FontWeight.bold)),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "a. Tinggi Badan",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanUmum!.tinggiBadan}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text("cm",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  )
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "b. Berat Badan",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanUmum!.beratBadan}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text("kg",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  )
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "c. Berat Badan Ideal",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanUmum!.beratBadanIdeal}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text("kg",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  )
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text("d. IMT",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanUmum!.imt}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "e. Lingkaran Perut",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanUmum!.lingkarPerut}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text("cm",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  )
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "f. Tekanan Darah",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanUmum!.tekananDarah}/${_pemeriksaanUmum!.tekananDarahDistole == null ? "" : _pemeriksaanUmum!.tekananDarahDistole}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text("mmHg",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  )
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "g. Denyut Nadi",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanUmum!.denyutNadi}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text("x/menit",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  )
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "h. Frek. Pernafasan",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanUmum!.pernapasan}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text("x/menit",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  )
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text("i. Suhu",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanUmum!.suhu}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text("°C",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  )
                                                ]),
                                          ])
                                    ]),
                                pw.SizedBox(
                                  height: 10,
                                ),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("2.",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight: pw.FontWeight.bold)),
                                      pw.SizedBox(width: 10),
                                      pw.Column(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pw.Text("Pemeriksaan Mata",
                                                style: pw.TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        pw.FontWeight.bold)),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "a. Berkaca mata",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanMata!.kacaMata}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    child: pw.Text(
                                                        "(${_pemeriksaanMata!.kondisi})",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  )
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "b. Visus      Os(kiri)",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanMata!.visusKiri}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    child: pw.Text(
                                                        "(Tanpa lensa koreksi)",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  )
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "                   Os(kanan)",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanMata!.visusKanan}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    child: pw.Text(
                                                        "(Tanpa lensa koreksi)",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  )
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "c. Buta Warna",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanMata!.butaWarna}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "d. Penyakit Mata",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanMata!.penyakitMata}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "e. Konjungtiva",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanMata!.konjungtiva}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text("f. Sklera",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanMata!.sklera}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                ]),
                                          ])
                                    ]),
                                pw.SizedBox(
                                  height: 10,
                                ),
                              ])
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 35),
                          pw.Text("3.",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(
                                    "Pemeriksaan Telinga, Hidung dan Tenggorokan",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("a.",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight: pw.FontWeight.bold)),
                                      pw.SizedBox(width: 10),
                                      pw.Column(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pw.Text("Telinga",
                                                style: pw.TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        pw.FontWeight.bold)),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "(a) Membran tymp kiri",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanTHT!.telinga!.membranTympKiri}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "(b) Membran tymp kanan",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanTHT!.telinga!.membranTympKanan}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "(c) Penyakit telinga kiri",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanTHT!.telinga!.penyakitTelingaKiri}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Text(
                                                      "Serumen : ${_pemeriksaanTHT!.telinga!.serumenKiri}",
                                                      style: pw.TextStyle(
                                                          fontSize: 11,
                                                          fontWeight: pw
                                                              .FontWeight
                                                              .normal)),
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 200,
                                                    child: pw.Text(
                                                        "(d) Penyakit telinga kanan",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanTHT!.telinga!.penyakitTelingaKanan}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Text(
                                                      "Serumen : ${_pemeriksaanTHT!.telinga!.serumenKanan}",
                                                      style: pw.TextStyle(
                                                          fontSize: 11,
                                                          fontWeight: pw
                                                              .FontWeight
                                                              .normal)),
                                                ]),
                                          ])
                                    ]),
                              ])
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 60),
                          pw.Text("b.",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Hidung",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text("(a) Pilek / tersumbat",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanTHT!.hidung!.pilekTersumbat}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text("(b) Lidah",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanTHT!.hidung!.lidah}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text("(c) Lain-lain",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanTHT!.hidung!.lainLain}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ])
                              ]),
                        ]),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 60),
                          pw.Text("c.",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Kerongkongan",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text("(a) Tonsil kanan",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanTHT!.kerongkongan!.tonsilKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text("(b) Tonsil kiri",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanTHT!.kerongkongan!.tonsilKiri}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text("(c) Pharing",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanTHT!.kerongkongan!.pharing}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text("(d) Tiroid  ",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanTHT!.kerongkongan!.tiroid}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text("(e) Lain-lain",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanTHT!.kerongkongan!.lainLain}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                              ]),
                        ]),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 35),
                          pw.Text("4.",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Pemeriksaan Rongga Dada",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("a.",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight: pw.FontWeight.bold)),
                                      pw.SizedBox(width: 10),
                                      pw.Column(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pw.Text("Jantung",
                                                style: pw.TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        pw.FontWeight.bold)),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        "(a) Batas-batas Jantung",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": ${_pemeriksaanRonggaDada!.jantung!.batasBatasJantung}",
                                                        style: pw.TextStyle(
                                                            fontSize: 11,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Text(
                                                      "Iktus Kordis :${_pemeriksaanRonggaDada!.jantung!.iktusKordis}",
                                                      style: pw.TextStyle(
                                                          fontSize: 11,
                                                          fontWeight: pw
                                                              .FontWeight
                                                              .normal)),
                                                ]),
                                          ])
                                    ]),
                              ])
                        ]),
                  ]))
            ];
          }));

      pdf.addPage(pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          maxPages: 20,
          margin: pw.EdgeInsets.all(0),
          header: (context) {
            return pw.Container(
              width: 1000,
              height: 80,
              margin: pw.EdgeInsets.only(bottom: 10),
              decoration: pw.BoxDecoration(),
              child: pw.ClipRRect(
                child: pw.Container(
                  child: pw.Image(
                    pw.MemoryImage(headerImage),
                    fit: pw.BoxFit.fill,
                  ),
                ),
              ),
            );
          },
          footer: (context) {
            return pw.Container(
              width: 1000,
              height: 80,
              decoration: pw.BoxDecoration(),
              child: pw.ClipRRect(
                child: pw.Container(
                  child: pw.Image(
                    pw.MemoryImage(footerImage),
                    fit: pw.BoxFit.fill,
                  ),
                ),
              ),
            );
          },
          build: (pw.Context context) {
            return [
              pw.Container(
                  padding: pw.EdgeInsets.symmetric(horizontal: 10),
                  child: pw.Column(children: [
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 59),
                          pw.Text("b.",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Paru",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 100,
                                        child: pw.Text("(a) Inspeksi",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : ${_pemeriksaanRonggaDada!.paru!.inspeksiKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text(
                                          "Kiri : ${_pemeriksaanRonggaDada!.paru!.inspeksiKiri}",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 100,
                                        child: pw.Text("(b) Palpasi",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : ${_pemeriksaanRonggaDada!.paru!.palpasiKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text(
                                          "Kiri : ${_pemeriksaanRonggaDada!.paru!.palpasiKiri}",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 100,
                                        child: pw.Text("(c) Perkusi",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : ${_pemeriksaanRonggaDada!.paru!.perkusiKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text(
                                          "Kiri : ${_pemeriksaanRonggaDada!.paru!.perkusiKiri}",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 100,
                                        child: pw.Text("(d) Auskultasi",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : ${_pemeriksaanRonggaDada!.paru!.auskultasiKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text(
                                          "Kiri : ${_pemeriksaanRonggaDada!.paru!.auskultasiKiri}",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                              ])
                        ]),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 35),
                          pw.Text("5.",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Pemeriksaan Rongga Perut",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("a. Inspeksi",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanRonggaPerut!.inspeksi}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("b. Perkusi",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanRonggaPerut!.perkusi}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("c. Auskultasi",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanRonggaPerut!.auskultasi}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("d. Hati",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanRonggaPerut!.hati}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("e. Limpa",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanRonggaPerut!.limpa}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("f. Ginjal Kiri",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanRonggaPerut!.ginjalKiri}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Ballotement : ${_pemeriksaanRonggaPerut!.ballotementKiri}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      )
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("g. Ginjal Kanan",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanRonggaPerut!.ginjalKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Ballotement : ${_pemeriksaanRonggaPerut!.ballotementKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      )
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("h. Hernia",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanRonggaPerut!.hernia}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("i. Tumor",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanRonggaPerut!.tumor}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("j. Lain - lain",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanRonggaPerut!.lainLain}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                              ])
                        ]),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 35),
                          pw.Text("6.",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Pemeriksaan Gentalia dan Anorektal",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("a. Hernia",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            ": ${_pemeriksaanGentalia!.hernia == "" ? "Tidak ada pemeriksaan" : _pemeriksaanGentalia!.hernia}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("b. Haemorhoid",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            ": ${_pemeriksaanGentalia!.hemorhoid == "" ? "Tidak ada pemeriksaan" : _pemeriksaanGentalia!.hemorhoid}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("c. Sikatriks",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            ": ${_pemeriksaanGentalia!.sikatriks == "" ? "Tidak ada pemeriksaan" : _pemeriksaanGentalia!.sikatriks}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("d. Spincter",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            ": ${_pemeriksaanGentalia!.spincter == "" ? "Tidak ada pemeriksaan" : _pemeriksaanGentalia!.spincter}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("e. Untuk laki-laki",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text("",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            "   - Efidymis/testis/prostat",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            ": ${_pemeriksaanGentalia!.efidymisTestisProstat == "" ? "Tidak ada pemeriksaan" : _pemeriksaanGentalia!.efidymisTestisProstat}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("   - Ekskresi",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            ": ${_pemeriksaanGentalia!.ekskresi}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                              ])
                        ]),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 35),
                          pw.Text("7.",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Pemeriksaan Anggota Gerak",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("a. Atas kiri / kanan",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : ${_pemeriksaanAnggotaGerak!.atasKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text(
                                          "Kiri : ${_pemeriksaanAnggotaGerak!.atasKiri}",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("b. Bawah kiri / kanan",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : ${_pemeriksaanAnggotaGerak!.bawahKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text(
                                          "Kiri : ${_pemeriksaanAnggotaGerak!.bawahKiri}",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("c. Sembab/Oedem",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : ${_pemeriksaanAnggotaGerak!.sembabOedemKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text(
                                          "Kiri : ${_pemeriksaanAnggotaGerak!.sembabOedemKiri}",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("d. Cacat",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : ${_pemeriksaanAnggotaGerak!.cacatKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text(
                                          "Kiri : ${_pemeriksaanAnggotaGerak!.cacatKiri}",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                              ])
                        ]),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 35),
                          pw.Text("8.",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Pemeriksaan Refleks",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment: pw.MainAxisAlignment.end,
                                    children: [
                                      pw.SizedBox(width: 340),
                                      pw.Container(
                                        width: 65,
                                        child: pw.Text("Kanan",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 50,
                                        child: pw.Text("Kiri",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 70,
                                        child: pw.Text("a. Pupil",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanRefleks!.pupil!.pupil}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 80,
                                        child: pw.Text("Biceps",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 50,
                                        child: pw.Text(":",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 55,
                                        child: pw.Text(
                                            "${_pemeriksaanRefleks!.pupil!.bicepsKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                      ),
                                      pw.Container(
                                        width: 50,
                                        child: pw.Text(
                                            "${_pemeriksaanRefleks!.pupil!.bicepsKiri}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 70,
                                        child: pw.Text("b. Patella",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanRefleks!.patella!.patella}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 80,
                                        child: pw.Text("Triceps",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 50,
                                        child: pw.Text(":",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 55,
                                        child: pw.Text(
                                            "${_pemeriksaanRefleks!.patella!.tricepsKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                      ),
                                      pw.Container(
                                        width: 50,
                                        child: pw.Text(
                                            "${_pemeriksaanRefleks!.patella!.tricepsKiri}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                      ),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 70,
                                        child: pw.Text("c. Achiles",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(
                                            ": ${_pemeriksaanRefleks!.achilles!.acciles}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 80,
                                        child: pw.Text("Babinsky",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 50,
                                        child: pw.Text(":",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 55,
                                        child: pw.Text(
                                            "${_pemeriksaanRefleks!.achilles!.babinskiKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                      ),
                                      pw.Container(
                                        width: 50,
                                        child: pw.Text(
                                            "${_pemeriksaanRefleks!.achilles!.babinskiKiri}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                      ),
                                    ]),
                              ])
                        ]),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 35),
                          pw.Text("9.",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Pemeriksaan Kelenjar Getah Bening",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("a. Cervical",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : ${_pemeriksaanKelenjarGetah!.cervicalKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text(
                                          "Kiri : ${_pemeriksaanKelenjarGetah!.cervicalKiri}",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("b. Axila",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : ${_pemeriksaanKelenjarGetah!.axilaKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text(
                                          "Kiri : ${_pemeriksaanKelenjarGetah!.axilaKiri}",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("c. Supra Clavicula",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : ${_pemeriksaanKelenjarGetah!.supraclaviculaKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text(
                                          "Kiri : ${_pemeriksaanKelenjarGetah!.supraclaviculaKiri}",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("d. Infra Clavicula",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : ${_pemeriksaanKelenjarGetah!.infraclaviculaKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text(
                                          "Kiri : ${_pemeriksaanKelenjarGetah!.infraclaviculaKiri}",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("e. Inguinal",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : ${_pemeriksaanKelenjarGetah!.inguinalKanan}",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text(
                                          "Kiri : ${_pemeriksaanKelenjarGetah!.inguinalKiri}",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                              ])
                        ]),
                    pw.SizedBox(height: 10),
                  ]))
            ];
          }));

      pdf.addPage(pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          maxPages: 20,
          margin: pw.EdgeInsets.all(0),
          header: (context) {
            return pw.Container(
              width: 1000,
              height: 80,
              margin: pw.EdgeInsets.only(bottom: 10),
              decoration: pw.BoxDecoration(),
              child: pw.ClipRRect(
                child: pw.Container(
                  child: pw.Image(
                    pw.MemoryImage(headerImage),
                    fit: pw.BoxFit.fill,
                  ),
                ),
              ),
            );
          },
          footer: (context) {
            return pw.Container(
              width: 1000,
              height: 80,
              decoration: pw.BoxDecoration(),
              child: pw.ClipRRect(
                child: pw.Container(
                  child: pw.Image(
                    pw.MemoryImage(footerImage),
                    fit: pw.BoxFit.fill,
                  ),
                ),
              ),
            );
          },
          build: (pw.Context context) {
            return [
              pw.Container(
                  padding: pw.EdgeInsets.symmetric(horizontal: 10),
                  child: pw.Column(children: [
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 5),
                          pw.Text("A.",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 15),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Riwayat Pajanan Pada Pekerjaan",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("1.",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight: pw.FontWeight.bold)),
                                      pw.SizedBox(width: 15),
                                      pw.Column(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pw.Text("Fisik",
                                                style: pw.TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        pw.FontWeight.bold)),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text("a. Kebisingan",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(": ${_fisik!.kebisingan}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text("b. Suhu Panas",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(": ${_fisik!.suhuPanas}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text("c. Suhu Dingin",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(": ${_fisik!.suhuDingin}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text(
                                                    "d. Radiasi bukan pengion (gel mikro, infrared, medan listrik, dll)",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_fisik!.radiasiBukanPengion}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text(
                                                    "e. Radiasi pengion (sinar X, Gamma, dll)",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_fisik!.radiasiPengion}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text(
                                                    "f. Getaran lokal",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_fisik!.getaranLokal}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text(
                                                    "g. Getaran seluruh tubuh",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_fisik!.getaranSeluruhTubuh}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text("h. Ketinggian ",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(": ${_fisik!.ketinggian}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text("i. Lain-lain",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(": ${_fisik!.lainLain}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                          ])
                                    ]),
                                pw.SizedBox(
                                  height: 10,
                                ),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("2.",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight: pw.FontWeight.bold)),
                                      pw.SizedBox(width: 15),
                                      pw.Column(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pw.Text("Kimia",
                                                style: pw.TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        pw.FontWeight.bold)),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text(
                                                    "a. Debu anorganik (silika, semen, dll)",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_kimia!.debuAnorganik ?? ""}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text(
                                                    "b. Debu organik (kapas,tekstil,gandum)",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_kimia!.debuOrganik ?? ""}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text("c. Asap",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(": ${_kimia!.asap ?? ""}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text(
                                                    "d. Bahan Kimia berbahaya",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_kimia!.logamBerat != null ? "Ya" : "Tidak"}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 20),
                                              pw.Container(
                                                width: 440,
                                                child: pw.Text(
                                                    "- Logam berat (Timah Hitam, Air Raksa, dll)",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_kimia!.logamBerat ?? ""}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 20),
                                              pw.Container(
                                                width: 440,
                                                child: pw.Text(
                                                    "- Pelarut organik (Benzene, Alkil, Toluen, dll)",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_kimia!.pelarutOrganik ?? ""}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 20),
                                              pw.Container(
                                                width: 440,
                                                child: pw.Text(
                                                    "- Iritan asam (Air keras, Asam Sulfat) ",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_kimia!.iritanAsam ?? ""}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 20),
                                              pw.Container(
                                                width: 440,
                                                child: pw.Text(
                                                    "- Iritan basa (Amoniak, Soda api) ",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_kimia!.iritanBasa ?? ""}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 20),
                                              pw.Container(
                                                width: 440,
                                                child: pw.Text(
                                                    "- Cairan pembersih (Amonia, Klor, Kaporit)",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_kimia!.cairanPembersih ?? ""}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 20),
                                              pw.Container(
                                                width: 440,
                                                child: pw.Text("- Pestisida",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_kimia!.pestisida ?? ""}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 20),
                                              pw.Container(
                                                width: 440,
                                                child: pw.Text(
                                                    "- Uap Logam (Mangan, Seng)",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_kimia!.uapLogam ?? ""}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 20),
                                              pw.Container(
                                                width: 440,
                                                child: pw.Text("- Lain-lain",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_kimia!.lainLain ?? ""}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                          ])
                                    ]),
                                pw.SizedBox(height: 10),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("3.",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight: pw.FontWeight.bold)),
                                      pw.SizedBox(width: 15),
                                      pw.Column(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pw.Text("Biologi",
                                                style: pw.TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        pw.FontWeight.bold)),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text(
                                                    "a. Bakteri / Virus / Jamur / Parasit",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_biologi!.bakteri ?? ""}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text(
                                                    "b. Darah / cairan tubuh lain",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_biologi!.darah ?? ""}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text(
                                                    "c. Nyamuk / serangga / lain-lain",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_biologi!.nyamuk ?? ""}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text(
                                                    "d. Limbah (kotoran manusia / hewan)",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_biologi!.limbah ?? ""}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 450,
                                                child: pw.Text("e. . Lain-lain",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                              pw.Text(
                                                  ": ${_biologi!.lainLain ?? ""}",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: pw
                                                          .FontWeight.normal)),
                                            ]),
                                          ])
                                    ]),
                                pw.SizedBox(height: 10),
                                pw.Row(children: [
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text("4.",
                                            style: pw.TextStyle(
                                                fontSize: 11,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                        pw.SizedBox(width: 15),
                                        pw.Column(
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            children: [
                                              pw.Text("Psikologis",
                                                  style: pw.TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          pw.FontWeight.bold)),
                                              pw.Row(children: [
                                                pw.SizedBox(width: 10),
                                                pw.Container(
                                                  width: 450,
                                                  child: pw.Text(
                                                      "a. Beban Kerja tidak sesuai dengan waktu & jumlah pekerjaan",
                                                      style: pw.TextStyle(
                                                          fontSize: 11,
                                                          fontWeight: pw
                                                              .FontWeight
                                                              .normal)),
                                                ),
                                                pw.Text(
                                                    ": ${_psikologi!.bebanKerja ?? ""}",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ]),
                                              pw.Row(children: [
                                                pw.SizedBox(width: 10),
                                                pw.Container(
                                                  width: 450,
                                                  child: pw.Text(
                                                      "b. Pekerjaan tidak sesuai dengan pengetahuan dan keterampilan",
                                                      style: pw.TextStyle(
                                                          fontSize: 11,
                                                          fontWeight: pw
                                                              .FontWeight
                                                              .normal)),
                                                ),
                                                pw.Text(
                                                    ": ${_psikologi!.pekerjaanTidakSesuai ?? ""}",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ]),
                                              pw.Row(children: [
                                                pw.SizedBox(width: 10),
                                                pw.Container(
                                                  width: 450,
                                                  child: pw.Text(
                                                      "c. Ketidakjelasan tugas",
                                                      style: pw.TextStyle(
                                                          fontSize: 11,
                                                          fontWeight: pw
                                                              .FontWeight
                                                              .normal)),
                                                ),
                                                pw.Text(
                                                    ": ${_psikologi!.ketidakjelasanTugas ?? ""}",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ]),
                                              pw.Row(children: [
                                                pw.SizedBox(width: 10),
                                                pw.Container(
                                                  width: 450,
                                                  child: pw.Text(
                                                      "d. Hambatan jenjang karir ",
                                                      style: pw.TextStyle(
                                                          fontSize: 11,
                                                          fontWeight: pw
                                                              .FontWeight
                                                              .normal)),
                                                ),
                                                pw.Text(
                                                    ": ${_psikologi!.hamabatanJenjangKarir ?? ""}",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ]),
                                              pw.Row(children: [
                                                pw.SizedBox(width: 10),
                                                pw.Container(
                                                  width: 450,
                                                  child: pw.Text(
                                                      "e. Bekerja giliran (shift) ",
                                                      style: pw.TextStyle(
                                                          fontSize: 11,
                                                          fontWeight: pw
                                                              .FontWeight
                                                              .normal)),
                                                ),
                                                pw.Text(
                                                    ": ${_psikologi!.shift ?? ""}",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ]),
                                              pw.Row(children: [
                                                pw.SizedBox(width: 10),
                                                pw.Container(
                                                  width: 450,
                                                  child: pw.Text(
                                                      "f. Konflik dengan teman sekerja",
                                                      style: pw.TextStyle(
                                                          fontSize: 11,
                                                          fontWeight: pw
                                                              .FontWeight
                                                              .normal)),
                                                ),
                                                pw.Text(
                                                    ": ${_psikologi!.konflikRekanKerja ?? ""}",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ]),
                                              pw.Row(children: [
                                                pw.SizedBox(width: 10),
                                                pw.Container(
                                                  width: 450,
                                                  child: pw.Text(
                                                      "g. Konflik dalam keluarga",
                                                      style: pw.TextStyle(
                                                          fontSize: 11,
                                                          fontWeight: pw
                                                              .FontWeight
                                                              .normal)),
                                                ),
                                                pw.Text(
                                                    ": ${_psikologi!.konflikKeluarga ?? ""}",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ]),
                                              pw.Row(children: [
                                                pw.SizedBox(width: 10),
                                                pw.Container(
                                                  width: 450,
                                                  child: pw.Text(
                                                      "h. Lain-lain ",
                                                      style: pw.TextStyle(
                                                          fontSize: 11,
                                                          fontWeight: pw
                                                              .FontWeight
                                                              .normal)),
                                                ),
                                                pw.Text(
                                                    ": ${_psikologi!.lainLain ?? ""}",
                                                    style: pw.TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ]),
                                            ])
                                      ]),
                                ]),
                              ])
                        ]),
                    pw.SizedBox(height: 10),
                    pw.Row(children: [
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.SizedBox(width: 35),
                            pw.Text("5.",
                                style: pw.TextStyle(
                                    fontSize: 11,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.SizedBox(width: 15),
                            pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text("Ergonomis",
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Row(children: [
                                    pw.SizedBox(width: 10),
                                    pw.Container(
                                      width: 450,
                                      child: pw.Text(
                                          "a. Gerakan berulang dengan tangan",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ),
                                    pw.Text(
                                        ": ${_ergonomis!.gerakanBerulang ?? ""}",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ]),
                                  pw.Row(children: [
                                    pw.SizedBox(width: 10),
                                    pw.Container(
                                      width: 450,
                                      child: pw.Text(
                                          "b. Angkat / angkut berat ",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ),
                                    pw.Text(
                                        ": ${_ergonomis!.angkatBerat ?? ""}",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ]),
                                  pw.Row(children: [
                                    pw.SizedBox(width: 10),
                                    pw.Container(
                                      width: 450,
                                      child: pw.Text(
                                          "c. Duduk lama > 4 jam terus menerus",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ),
                                    pw.Text(": ${_ergonomis!.dudukLama ?? ""}",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ]),
                                  pw.Row(children: [
                                    pw.SizedBox(width: 10),
                                    pw.Container(
                                      width: 450,
                                      child: pw.Text(
                                          "d. Berdiri lama > 4 jam terus menerus",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ),
                                    pw.Text(
                                        ": ${_ergonomis!.berdiriLama ?? ""}",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ]),
                                  pw.Row(children: [
                                    pw.SizedBox(width: 10),
                                    pw.Container(
                                      width: 450,
                                      child: pw.Text(
                                          "e. Posisi tubuh tidak ergonomis",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ),
                                    pw.Text(
                                        ": ${_ergonomis!.posisiTubuh ?? ""}",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ]),
                                  pw.Row(children: [
                                    pw.SizedBox(width: 10),
                                    pw.Container(
                                      width: 450,
                                      child: pw.Text(
                                          "f. Pencahayaan tidak sesuai",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ),
                                    pw.Text(
                                        ": ${_ergonomis!.pencahayaanTidakSesuai ?? ""}",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ]),
                                  pw.Row(children: [
                                    pw.SizedBox(width: 10),
                                    pw.Container(
                                      width: 450,
                                      child: pw.Text(
                                          "g. Bekerja dengan layar / monitor 4 jam / lebih dalam sehari",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ),
                                    pw.Text(
                                        ": ${_ergonomis!.bekerjaDenganLayar ?? ""}",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ]),
                                  pw.Row(children: [
                                    pw.SizedBox(width: 10),
                                    pw.Container(
                                      width: 450,
                                      child: pw.Text("h. Lain-lain ",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ),
                                    pw.Text(": ${_ergonomis!.lainLain ?? ""}",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                  ]),
                                ])
                          ]),
                    ]),
                  ]))
            ];
          }));

      pdf.addPage(pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: pw.EdgeInsets.all(0),
          maxPages: 20,
          header: (context) {
            return pw.Container(
              width: 1000,
              height: 80,
              margin: pw.EdgeInsets.only(bottom: 10),
              decoration: pw.BoxDecoration(),
              child: pw.ClipRRect(
                child: pw.Container(
                  child: pw.Image(
                    pw.MemoryImage(headerImage),
                    fit: pw.BoxFit.fill,
                  ),
                ),
              ),
            );
          },
          footer: (context) {
            return pw.Container(
              width: 1000,
              height: 80,
              decoration: pw.BoxDecoration(),
              child: pw.ClipRRect(
                child: pw.Container(
                  child: pw.Image(
                    pw.MemoryImage(footerImage),
                    fit: pw.BoxFit.fill,
                  ),
                ),
              ),
            );
          },
          build: (pw.Context context) {
            return [
              pw.Container(
                  padding: pw.EdgeInsets.symmetric(horizontal: 10),
                  child: pw.Column(children: [
                    pw.SizedBox(height: 10),
                    pw.Row(children: [
                      pw.SizedBox(width: 10),
                      pw.Container(
                          width: 240,
                          child: pw.Text("PEMERIKSAAN FISIK",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold))),
                      pw.Text(": ${_pemeriksaan!.pemeriksaanFisik}",
                          style: pw.TextStyle(
                              fontSize: 11, fontWeight: pw.FontWeight.normal))
                    ]),
                    pw.Row(children: [
                      pw.SizedBox(width: 10),
                      pw.Container(
                          width: 240,
                          child: pw.Text("PEMERIKSAAN MATA",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold))),
                      pw.Text(": ${_pemeriksaan!.pemeriksaanMata}",
                          style: pw.TextStyle(
                              fontSize: 11, fontWeight: pw.FontWeight.normal))
                    ]),
                    pw.Row(children: [
                      pw.SizedBox(width: 10),
                      pw.Container(
                          width: 240,
                          child: pw.Text("PEMERIKSAAN GIGI & MULUT",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold))),
                      pw.Text(": ${_pemeriksaan!.pemeriksaanGigiMulut}",
                          style: pw.TextStyle(
                              fontSize: 11, fontWeight: pw.FontWeight.normal))
                    ]),
                    pw.Row(children: [
                      pw.SizedBox(width: 10),
                      pw.Container(
                          width: 240,
                          child: pw.Text("PEMERIKSAAN AUDIOMETRI",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold))),
                      pw.Text(": ${_pemeriksaan!.pemeriksaanAudioMetri}",
                          style: pw.TextStyle(
                              fontSize: 11, fontWeight: pw.FontWeight.normal))
                    ]),
                    pw.Row(children: [
                      pw.SizedBox(width: 10),
                      pw.Container(
                          width: 240,
                          child: pw.Text("PEMERIKSAAN SPIROMETRI",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold))),
                      pw.Text(": ${_pemeriksaan!.pemeriksaanSpirometri}",
                          style: pw.TextStyle(
                              fontSize: 11, fontWeight: pw.FontWeight.normal))
                    ]),
                    pw.Row(children: [
                      pw.SizedBox(width: 10),
                      pw.Container(
                          width: 240,
                          child: pw.Text("PEMERIKSAAN TREADMILL/EKG",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold))),
                      pw.Text(": ${_pemeriksaan!.pemeriksaanTreadmill}",
                          style: pw.TextStyle(
                              fontSize: 11, fontWeight: pw.FontWeight.normal))
                    ]),
                    pw.Row(children: [
                      pw.SizedBox(width: 10),
                      pw.Container(
                          width: 240,
                          child: pw.Text("PEMERIKSAAN LABORATORIUM",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold))),
                      pw.Text(": ${_pemeriksaan!.pemeriksaanLaboratorium}",
                          style: pw.TextStyle(
                              fontSize: 11, fontWeight: pw.FontWeight.normal))
                    ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Container(
                                    width: 240,
                                    child: pw.Text("PEMERIKSAAN X RAY",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.bold))),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.SizedBox(width: 10),
                                      pw.Container(
                                          width: 230,
                                          child: pw.Text("1. JANTUNG",
                                              style: pw.TextStyle(
                                                  fontSize: 11,
                                                  fontWeight:
                                                      pw.FontWeight.bold))),
                                      pw.Text(
                                          ": ${_pemeriksaan!.pemeriksaanXrayJantung}",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight: pw.FontWeight.normal))
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.SizedBox(width: 10),
                                      pw.Container(
                                          width: 230,
                                          child: pw.Text("2. PARU",
                                              style: pw.TextStyle(
                                                  fontSize: 11,
                                                  fontWeight:
                                                      pw.FontWeight.bold))),
                                      pw.Text(": ${_pemeriksaan!.paru}",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight: pw.FontWeight.normal))
                                    ]),
                              ])
                        ]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 10),
                          pw.Container(
                              width: 240,
                              child: pw.Text("ANJURAN-ANJURAN",
                                  style: pw.TextStyle(
                                      fontSize: 11,
                                      fontWeight: pw.FontWeight.bold))),
                          pw.Text(":",
                              style: pw.TextStyle(
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.normal)),
                          pw.SizedBox(width: 5),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(
                                    _ajuran!.konsumsiAir == "Ya"
                                        ? "1. Konsumsi air mineral 2-3 liter dalam sehari"
                                        : _ajuran!.konsumsiAir == "Tidak"
                                            ? "1. -"
                                            : "1. ${_ajuran!.konsumsiAir}",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.normal)),
                                pw.Text(
                                    _ajuran!.olahragaTeratur == "Ya"
                                        ? "2. Olahraga teratur minimal 30 menit setiap harinya 3-4x seminggu"
                                        : _ajuran!.olahragaTeratur == "Tidak"
                                            ? "2. -"
                                            : "2. ${_ajuran!.olahragaTeratur}",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.normal)),
                                _ajuran!.anjuran3 == ""
                                    ? pw.Container()
                                    : pw.Text("3. ${_ajuran!.anjuran3}",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                _ajuran!.anjuran4 == ""
                                    ? pw.Container()
                                    : pw.Text("4. ${_ajuran!.anjuran4}",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                _ajuran!.anjuran5 == ""
                                    ? pw.Container()
                                    : pw.Text("5. ${_ajuran!.anjuran5}",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                _ajuran!.anjuran6 == ""
                                    ? pw.Container()
                                    : pw.Text("6. ${_ajuran!.anjuran6}",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                _ajuran!.anjuran7 == ""
                                    ? pw.Container()
                                    : pw.Text("7. ${_ajuran!.anjuran7}",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                _ajuran!.anjuran8 == ""
                                    ? pw.Container()
                                    : pw.Text("8. ${_ajuran!.anjuran8}",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                                _ajuran!.anjuran9 == ""
                                    ? pw.Container()
                                    : pw.Text("9. ${_ajuran!.anjuran9}",
                                        style: pw.TextStyle(
                                            fontSize: 11,
                                            fontWeight: pw.FontWeight.normal)),
                              ])
                        ]),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("KESIMPULAN KELAYAKAN KERJA",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Text(
                                    _kelayakanKerja!.layakBekerjaSesuaiPosisi ==
                                            "Ya"
                                        ? "(v) : Laik Bekerja Sesuai Posisi dan Lokasi Saat Ini"
                                        : "(  ) : Laik Bekerja Sesuai Posisi dan Lokasi Saat Ini",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.normal)),
                                pw.Text(
                                    _kelayakanKerja!
                                                .layakBekerjaDenganCatatan ==
                                            "Ya"
                                        ? "(v) : Laik Bekerja Sesuai Posisi dan Lokasi Saat Ini, Dengan Catatan"
                                        : "(  ) : Laik Bekerja Sesuai Posisi dan Lokasi Saat Ini, Dengan Catatan",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.normal)),
                                pw.Text(
                                    _kelayakanKerja!
                                                .layakBekerjaDenganPenyesuaian ==
                                            "Ya"
                                        ? "(v) : Laik Bekerja Dengan Penyesuaian dan atau Pembatasan Pekerjaan"
                                        : "(  ) : Laik Bekerja Dengan Penyesuaian dan atau Pembatasan Pekerjaan",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.normal)),
                                pw.Text(
                                    _kelayakanKerja!.layakuntukBekerja == "Ya"
                                        ? "(v) : Tidak Laik Untuk Bekerja"
                                        : "(  ) : Tidak Laik Untuk Bekerja",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.normal)),
                                pw.Text(
                                    "Resiko Cardiovaskuler : ${_kelayakanKerja!.resikoCardioVascular}",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.normal)),
                              ])
                        ]),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("KESIMPULAN DERAJAT KESEHATAN :",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.bold)),
                                // pw.Text(
                                //     "Lingkar Perut : ${_kesimpulanDerajatKesehatan!.lingkarPerut}",
                                //     style: pw.TextStyle(
                                //         fontSize: 11,
                                //         fontWeight: pw.FontWeight.normal)),
                                pw.Text(
                                    _kesimpulanDerajatKesehatan!
                                                .ditemukanKelainanMedis ==
                                            "Ya"
                                        ? "(  ) : P1. Tidak ditemukan kelainan medis"
                                        : "(v) : P1. Tidak ditemukan kelainan medis",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.normal)),
                                pw.Text(
                                    _kesimpulanDerajatKesehatan!
                                                .ditemukanKelainanYangTidakSerius ==
                                            "Ya"
                                        ? "(v) : P2. Ditemukan kelainan medis yang tidak serius"
                                        : "(  ) : P2. Ditemukan kelainan medis yang tidak serius",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.normal)),
                                pw.Text(
                                    _kesimpulanDerajatKesehatan!
                                                .ditemukanKelainanResikoKesehatanRendah ==
                                            "Ya"
                                        ? "(v) : P3. Ditemukan kelainan medis, resiko kesehatan rendah"
                                        : "(  ) : P3. Ditemukan kelainan medis, resiko kesehatan rendah",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.normal)),
                                pw.Text(
                                    _kesimpulanDerajatKesehatan!
                                                .ditemukanKelainanResikoKesehatanSedang ==
                                            "Ya"
                                        ? "(v) : P4. Ditemukan kelainan medis bermakna yang dapat menjadi serius, resiko kesehatan sedang"
                                        : "(  ) : P4. Ditemukan kelainan medis bermakna yang dapat menjadi serius, resiko kesehatan sedang",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.normal)),
                                pw.Text(
                                    _kesimpulanDerajatKesehatan!
                                                .ditemukanKelainanResikoKesehatanTinggi ==
                                            "Ya"
                                        ? "(v) : P5. Ditemukan kelainan medis yang serius, resiko kesehatan tinggi"
                                        : "(  ) : P5. Ditemukan kelainan medis yang serius, resiko kesehatan tinggi",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.normal)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(
                                          _kesimpulanDerajatKesehatan!
                                                      .ditemukanKelainanMenyebabkanKeterbatasan ==
                                                  "Ya"
                                              ? "(v) : "
                                              : "(  ) : ",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                      pw.Column(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pw.Text(
                                                "P6. Ditemukan kelainan medis yang menyebabkan keterbatasan fisik maupun psikis untuk",
                                                style: pw.TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        pw.FontWeight.normal)),
                                            pw.Text(
                                                "melakukan sesuai jabatan/posisinya",
                                                style: pw.TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        pw.FontWeight.normal)),
                                          ])
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(
                                          _kesimpulanDerajatKesehatan!
                                                      .tidakDapatBekerja ==
                                                  "Ya"
                                              ? "(v) : "
                                              : "(  ) : ",
                                          style: pw.TextStyle(
                                              fontSize: 11,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                      pw.Column(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pw.Text(
                                                " P7. Tidak dapat bekerja untuk melakukan pekerjaan sesuai jabatan/posisinya dan/atau posisi apapun, ",
                                                style: pw.TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        pw.FontWeight.normal)),
                                            pw.Text(
                                                "Dalam perawatan rumah sakit, atau dalam status ijin sakit",
                                                style: pw.TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        pw.FontWeight.normal)),
                                          ])
                                    ])
                              ])
                        ]),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(
                                    "Lhokseumawe, ${_pasien!.tanggalPemeriksaan}",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.normal)),
                                pw.Text("Dokter Penanggung Jawab MCU",
                                    style: pw.TextStyle(
                                        fontSize: 11,
                                        fontWeight: pw.FontWeight.normal)),
                              ])
                        ])
                  ])),
              // pw.SizedBox(height: 60),
              pw.Container(
                width: 100,
                height: 60,
                margin: pw.EdgeInsets.only(left: 50),
                child: pw.Image(
                  pw.MemoryImage(ttdDokter),
                  fit: pw.BoxFit.fill,
                ),
              ),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(width: 50),
                    pw.Text("dr. Rajab Saputra",
                        style: pw.TextStyle(
                            fontSize: 11,
                            fontWeight: pw.FontWeight.bold,
                            decoration: pw.TextDecoration.underline)),
                  ]),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(width: 45),
                    pw.Text("NO.SIP.503/055/2021",
                        style: pw.TextStyle(
                          fontSize: 11,
                          fontWeight: pw.FontWeight.bold,
                        )),
                  ])
            ];
          }));

      _hasilFisik == null
          ? null
          : pdf.addPage(pw.MultiPage(
              pageFormat: PdfPageFormat.a4,
              margin: pw.EdgeInsets.all(0),
              maxPages: 20,
              header: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  margin: pw.EdgeInsets.only(bottom: 10),
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(headerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              footer: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(footerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              build: (pw.Context context) {
                return [
                  pw.Container(
                      padding: pw.EdgeInsets.all(20),
                      child: pw.Column(children: [
                        pw.Text(_hasilFisik!.judul!,
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 20),
                        pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("Nama Pasien",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Umur",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("J.Kelamin",
                                          style: pw.TextStyle(fontSize: 12))
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_pasien!.nama}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.umur}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.jenisKelamin}",
                                          style: pw.TextStyle(fontSize: 12))
                                    ])
                              ]),
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(_hasilFisik!.dokterApa!,
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Tanggal Pemeriksaan",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_hasilFisik!.namaDokter!}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(
                                          ": ${_pasien!.tanggalPemeriksaan}",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ])
                              ])
                            ]),
                        pw.SizedBox(height: 10),
                        _hasilFisik!.image! == ""
                            ? pw.Container()
                            : pw.Container(
                                width: 700,
                                height: 450,
                                child: pw.Image(
                                  pw.MemoryImage(
                                      base64Decode(_hasilFisik!.image!)),
                                  fit: pw.BoxFit.contain,
                                ),
                              ),
                        pw.SizedBox(height: 10),
                        pw.Row(children: [
                          pw.Text(_hasilFisik!.keterangan!,
                              style: pw.TextStyle(fontSize: 12)),
                        ])
                      ]))
                ];
              }));

      _hasilMata == null
          ? null
          : pdf.addPage(pw.MultiPage(
              pageFormat: PdfPageFormat.a4,
              margin: pw.EdgeInsets.all(0),
              maxPages: 20,
              header: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  margin: pw.EdgeInsets.only(bottom: 10),
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(headerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              footer: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(footerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              build: (pw.Context context) {
                return [
                  pw.Container(
                      padding: pw.EdgeInsets.all(20),
                      child: pw.Column(children: [
                        pw.Text(_hasilMata!.judul!,
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 20),
                        pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("Nama Pasien",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Umur",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("J.Kelamin",
                                          style: pw.TextStyle(fontSize: 12))
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_pasien!.nama}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.umur}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.jenisKelamin}",
                                          style: pw.TextStyle(fontSize: 12))
                                    ])
                              ]),
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(_hasilMata!.dokterApa!,
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Tanggal Pemeriksaan",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_hasilMata!.namaDokter!}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(
                                          ": ${_pasien!.tanggalPemeriksaan}",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ])
                              ])
                            ]),
                        pw.SizedBox(height: 10),
                        _hasilMata!.image! == ""
                            ? pw.Container()
                            : pw.Container(
                                width: 700,
                                height: 450,
                                child: pw.Image(
                                  pw.MemoryImage(
                                      base64Decode(_hasilMata!.image!)),
                                  fit: pw.BoxFit.contain,
                                ),
                              ),
                        pw.SizedBox(height: 10),
                        pw.Row(children: [
                          pw.Text(_hasilMata!.keterangan!,
                              style: pw.TextStyle(fontSize: 12)),
                        ])
                      ]))
                ];
              }));

      _hasilGigiMulut == null
          ? null
          : pdf.addPage(pw.MultiPage(
              pageFormat: PdfPageFormat.a4,
              margin: pw.EdgeInsets.all(0),
              maxPages: 20,
              header: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  margin: pw.EdgeInsets.only(bottom: 10),
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(headerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              footer: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(footerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              build: (pw.Context context) {
                return [
                  pw.Container(
                      padding: pw.EdgeInsets.all(20),
                      child: pw.Column(children: [
                        pw.Text(_hasilGigiMulut!.judul!,
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 20),
                        pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("Nama Pasien",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Umur",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("J.Kelamin",
                                          style: pw.TextStyle(fontSize: 12))
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_pasien!.nama}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.umur}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.jenisKelamin}",
                                          style: pw.TextStyle(fontSize: 12))
                                    ])
                              ]),
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(_hasilGigiMulut!.dokterApa!,
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Tanggal Pemeriksaan",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(
                                          ": ${_hasilGigiMulut!.namaDokter!}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(
                                          ": ${_pasien!.tanggalPemeriksaan}",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ])
                              ])
                            ]),
                        pw.SizedBox(height: 10),
                        _hasilGigiMulut!.image! == ""
                            ? pw.Container()
                            : pw.Container(
                                width: 700,
                                height: 450,
                                child: pw.Image(
                                  pw.MemoryImage(
                                      base64Decode(_hasilGigiMulut!.image!)),
                                  fit: pw.BoxFit.contain,
                                ),
                              ),
                        pw.SizedBox(height: 10),
                        pw.Row(children: [
                          pw.Text(_hasilGigiMulut!.keterangan!,
                              style: pw.TextStyle(fontSize: 12)),
                        ])
                      ]))
                ];
              }));

      _hasilAudiometri == null
          ? null
          : pdf.addPage(pw.MultiPage(
              pageFormat: PdfPageFormat.a4,
              margin: pw.EdgeInsets.all(0),
              maxPages: 20,
              header: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  margin: pw.EdgeInsets.only(bottom: 10),
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(headerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              footer: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(footerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              build: (pw.Context context) {
                return [
                  pw.Container(
                      padding: pw.EdgeInsets.all(20),
                      child: pw.Column(children: [
                        pw.Text(_hasilAudiometri!.judul!,
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 20),
                        pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("Nama Pasien",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Umur",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("J.Kelamin",
                                          style: pw.TextStyle(fontSize: 12))
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_pasien!.nama}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.umur}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.jenisKelamin}",
                                          style: pw.TextStyle(fontSize: 12))
                                    ])
                              ]),
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(_hasilAudiometri!.dokterApa!,
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Tanggal Pemeriksaan",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(
                                          ": ${_hasilAudiometri!.namaDokter!}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(
                                          ": ${_pasien!.tanggalPemeriksaan}",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ])
                              ])
                            ]),
                        pw.SizedBox(height: 10),
                        _hasilAudiometri!.image! == ""
                            ? pw.Container()
                            : pw.Container(
                                width: 700,
                                height: 450,
                                child: pw.Image(
                                  pw.MemoryImage(
                                      base64Decode(_hasilAudiometri!.image!)),
                                  fit: pw.BoxFit.contain,
                                ),
                              ),
                        pw.SizedBox(height: 10),
                        pw.Row(children: [
                          pw.Text(_hasilAudiometri!.keterangan!,
                              style: pw.TextStyle(fontSize: 12)),
                        ])
                      ]))
                ];
              }));

      _hasilSpirometri == null
          ? null
          : pdf.addPage(pw.MultiPage(
              pageFormat: PdfPageFormat.a4,
              margin: pw.EdgeInsets.all(0),
              maxPages: 20,
              header: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  margin: pw.EdgeInsets.only(bottom: 10),
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(headerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              footer: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(footerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              build: (pw.Context context) {
                return [
                  pw.Container(
                      padding: pw.EdgeInsets.all(20),
                      child: pw.Column(children: [
                        pw.Text(_hasilSpirometri!.judul!,
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 20),
                        pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("Nama Pasien",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Umur",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("J.Kelamin",
                                          style: pw.TextStyle(fontSize: 12))
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_pasien!.nama}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.umur}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.jenisKelamin}",
                                          style: pw.TextStyle(fontSize: 12))
                                    ])
                              ]),
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(_hasilSpirometri!.dokterApa!,
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Tanggal Pemeriksaan",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(
                                          ": ${_hasilSpirometri!.namaDokter!}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(
                                          ": ${_pasien!.tanggalPemeriksaan}",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ])
                              ])
                            ]),
                        pw.SizedBox(height: 10),
                        _hasilSpirometri!.image! == ""
                            ? pw.Container()
                            : pw.Container(
                                width: 700,
                                height: 450,
                                child: pw.Image(
                                  pw.MemoryImage(
                                      base64Decode(_hasilSpirometri!.image!)),
                                  fit: pw.BoxFit.contain,
                                ),
                              ),
                        pw.SizedBox(height: 10),
                        pw.Row(children: [
                          pw.Text(_hasilSpirometri!.keterangan!,
                              style: pw.TextStyle(fontSize: 12)),
                        ])
                      ]))
                ];
              }));

      _hasilJantung == null
          ? null
          : _hasilJantung!.image == ""
              ? null
              : pdf.addPage(pw.MultiPage(
                  pageFormat: PdfPageFormat.a4,
                  margin: pw.EdgeInsets.all(0),
                  maxPages: 20,
                  header: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      margin: pw.EdgeInsets.only(bottom: 10),
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(headerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  footer: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(footerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  build: (pw.Context context) {
                    return [
                      pw.Container(
                          padding: pw.EdgeInsets.all(20),
                          child: pw.Column(children: [
                            pw.SizedBox(height: 50),
                            pw.Text("RADIOLOGI (TORAKS PA)",
                                style: pw.TextStyle(
                                    fontSize: 18,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.SizedBox(height: 20),
                            // pw.Row(
                            //     crossAxisAlignment: pw.CrossAxisAlignment.start,
                            //     mainAxisAlignment:
                            //         pw.MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       pw.Row(children: [
                            //         pw.Column(
                            //             crossAxisAlignment:
                            //                 pw.CrossAxisAlignment.start,
                            //             children: [
                            //               pw.Text("Nama Pasien",
                            //                   style: pw.TextStyle(fontSize: 12)),
                            //               pw.Text("Umur",
                            //                   style: pw.TextStyle(fontSize: 12)),
                            //               pw.Text("J.Kelamin",
                            //                   style: pw.TextStyle(fontSize: 12))
                            //             ]),
                            //         pw.SizedBox(width: 20),
                            //         pw.Column(
                            //             crossAxisAlignment:
                            //                 pw.CrossAxisAlignment.start,
                            //             children: [
                            //               pw.Text(": ${_pasien!.nama}",
                            //                   style: pw.TextStyle(fontSize: 12)),
                            //               pw.Text(": ${_pasien!.umur}",
                            //                   style: pw.TextStyle(fontSize: 12)),
                            //               pw.Text(": ${_pasien!.jenisKelamin}",
                            //                   style: pw.TextStyle(fontSize: 12))
                            //             ])
                            //       ]),
                            //       pw.Row(children: [
                            //         pw.Column(
                            //             crossAxisAlignment:
                            //                 pw.CrossAxisAlignment.start,
                            //             children: [
                            //               pw.Text(_hasilJantung!.dokterApa!,
                            //                   style: pw.TextStyle(fontSize: 12)),
                            //               pw.Text("Tanggal Pemeriksaan",
                            //                   style: pw.TextStyle(fontSize: 12)),
                            //             ]),
                            //         pw.SizedBox(width: 20),
                            //         pw.Column(
                            //             crossAxisAlignment:
                            //                 pw.CrossAxisAlignment.start,
                            //             children: [
                            //               pw.Text(": ${_hasilJantung!.namaDokter!}",
                            //                   style: pw.TextStyle(fontSize: 12)),
                            //               pw.Text(
                            //                   ": ${_pasien!.tanggalPemeriksaan}",
                            //                   style: pw.TextStyle(fontSize: 12)),
                            //             ])
                            //       ])
                            //     ]),
                            pw.SizedBox(height: 10),
                            _hasilJantung!.image! == ""
                                ? pw.Container()
                                : pw.Container(
                                    width: 700,
                                    height: 450,
                                    child: pw.Center(
                                      child: pw.Image(
                                        pw.MemoryImage(base64Decode(
                                            _hasilJantung!.image!)),
                                        fit: pw.BoxFit.contain,
                                      ),
                                    )),
                            // pw.SizedBox(height: 10),
                            // pw.Row(children: [
                            //   pw.Text(_hasilJantung!.keterangan!,
                            //       style: pw.TextStyle(fontSize: 12)),
                            // ])
                          ]))
                    ];
                  }));
      _hasilJantung == null
          ? null
          : pdf.addPage(pw.MultiPage(
              pageFormat: PdfPageFormat.a4,
              margin: pw.EdgeInsets.all(0),
              maxPages: 20,
              header: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  margin: pw.EdgeInsets.only(bottom: 10),
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(headerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              footer: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(footerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              build: (pw.Context context) {
                return [
                  pw.Container(
                      padding: pw.EdgeInsets.all(20),
                      child: pw.Column(children: [
                        pw.Text(_hasilJantung!.judul!,
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 20),
                        pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("Nama Pasien",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Umur",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("J.Kelamin",
                                          style: pw.TextStyle(fontSize: 12))
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_pasien!.nama}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.umur}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.jenisKelamin}",
                                          style: pw.TextStyle(fontSize: 12))
                                    ])
                              ]),
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(_hasilJantung!.dokterApa!,
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Tanggal Pemeriksaan",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_hasilJantung!.namaDokter!}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(
                                          ": ${_pasien!.tanggalPemeriksaan}",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ])
                              ])
                            ]),
                        // pw.SizedBox(height: 10),
                        // _hasilJantung!.image! == ""
                        //     ? pw.Container()
                        //     : pw.Container(
                        //         width: 700,
                        //         height: 450,
                        //         child: pw.Image(
                        //           pw.MemoryImage(
                        //               base64Decode(_hasilJantung!.image!)),
                        //           fit: pw.BoxFit.contain,
                        //         ),
                        //       ),
                        pw.SizedBox(height: 10),
                        pw.Row(children: [
                          pw.Text(_hasilJantung!.keterangan!,
                              style: pw.TextStyle(fontSize: 12)),
                        ])
                      ]))
                ];
              }));

      _hasilParu == null
          ? null
          : pdf.addPage(pw.MultiPage(
              pageFormat: PdfPageFormat.a4,
              margin: pw.EdgeInsets.all(0),
              maxPages: 20,
              header: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  margin: pw.EdgeInsets.only(bottom: 10),
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(headerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              footer: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(footerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              build: (pw.Context context) {
                return [
                  pw.Container(
                      padding: pw.EdgeInsets.all(20),
                      child: pw.Column(children: [
                        pw.Text(_hasilParu!.judul!,
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 20),
                        pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("Nama Pasien",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Umur",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("J.Kelamin",
                                          style: pw.TextStyle(fontSize: 12))
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_pasien!.nama}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.umur}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.jenisKelamin}",
                                          style: pw.TextStyle(fontSize: 12))
                                    ])
                              ]),
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(_hasilParu!.dokterApa!,
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Tanggal Pemeriksaan",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_hasilParu!.namaDokter!}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(
                                          ": ${_pasien!.tanggalPemeriksaan}",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ])
                              ])
                            ]),
                        pw.SizedBox(height: 10),
                        _hasilParu!.image! == ""
                            ? pw.Container()
                            : pw.Container(
                                width: 700,
                                height: 450,
                                child: pw.Image(
                                  pw.MemoryImage(
                                      base64Decode(_hasilParu!.image!)),
                                  fit: pw.BoxFit.contain,
                                ),
                              ),
                        pw.SizedBox(height: 10),
                        pw.Row(children: [
                          pw.Text(_hasilParu!.keterangan!,
                              style: pw.TextStyle(fontSize: 12)),
                        ])
                      ]))
                ];
              }));

      _hasilUsg == null
          ? null
          : _hasilUsg!.image1 == "" || _hasilUsg!.image1 == null
              ? null
              : pdf.addPage(pw.MultiPage(
                  pageFormat: PdfPageFormat.a4,
                  margin: pw.EdgeInsets.all(0),
                  maxPages: 20,
                  header: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      margin: pw.EdgeInsets.only(bottom: 10),
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(headerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  footer: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(footerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  build: (pw.Context context) {
                    return [
                      pw.Container(
                          padding: pw.EdgeInsets.all(20),
                          child: pw.Column(children: [
                            pw.Text(_hasilUsg!.judul!,
                                style: pw.TextStyle(
                                    fontSize: 20,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.SizedBox(height: 20),
                            pw.Row(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Row(children: [
                                    pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Text("Nama Pasien",
                                              style:
                                                  pw.TextStyle(fontSize: 12)),
                                          pw.Text("Umur",
                                              style:
                                                  pw.TextStyle(fontSize: 12)),
                                          pw.Text("J.Kelamin",
                                              style: pw.TextStyle(fontSize: 12))
                                        ]),
                                    pw.SizedBox(width: 20),
                                    pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Text(": ${_pasien!.nama}",
                                              style:
                                                  pw.TextStyle(fontSize: 12)),
                                          pw.Text(": ${_pasien!.umur}",
                                              style:
                                                  pw.TextStyle(fontSize: 12)),
                                          pw.Text(": ${_pasien!.jenisKelamin}",
                                              style: pw.TextStyle(fontSize: 12))
                                        ])
                                  ]),
                                  pw.Row(children: [
                                    pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Text(_hasilUsg!.dokterApa!,
                                              style:
                                                  pw.TextStyle(fontSize: 12)),
                                          pw.Text("Tanggal Pemeriksaan",
                                              style:
                                                  pw.TextStyle(fontSize: 12)),
                                        ]),
                                    pw.SizedBox(width: 20),
                                    pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Text(": ${_hasilUsg!.namaDokter!}",
                                              style:
                                                  pw.TextStyle(fontSize: 12)),
                                          pw.Text(
                                              ": ${_pasien!.tanggalPemeriksaan}",
                                              style:
                                                  pw.TextStyle(fontSize: 12)),
                                        ])
                                  ])
                                ]),
                            pw.SizedBox(height: 20),
                            pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Container(
                                    width: 150,
                                    height: 150,
                                    child: _hasilUsg!.image1! == "" ||
                                            _hasilUsg!.image1 == null
                                        ? pw.Container()
                                        : pw.Image(
                                            pw.MemoryImage(base64Decode(
                                                _hasilUsg!.image1!)),
                                            fit: pw.BoxFit.contain,
                                          ),
                                  ),
                                  pw.SizedBox(width: 20),
                                  pw.Container(
                                    width: 150,
                                    height: 150,
                                    child: _hasilUsg!.image2! == "" ||
                                            _hasilUsg!.image2 == null
                                        ? pw.Container()
                                        : pw.Image(
                                            pw.MemoryImage(base64Decode(
                                                _hasilUsg!.image2!)),
                                            fit: pw.BoxFit.contain,
                                          ),
                                  ),
                                ]),
                            pw.SizedBox(height: 20),
                            pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Container(
                                    width: 150,
                                    height: 150,
                                    child: _hasilUsg!.image3! == "" ||
                                            _hasilUsg!.image3 == null
                                        ? pw.Container()
                                        : pw.Image(
                                            pw.MemoryImage(base64Decode(
                                                _hasilUsg!.image3!)),
                                            fit: pw.BoxFit.contain,
                                          ),
                                  ),
                                  pw.SizedBox(width: 20),
                                  pw.Container(
                                    width: 150,
                                    height: 150,
                                    child: _hasilUsg!.image4! == "" ||
                                            _hasilUsg!.image4 == null
                                        ? pw.Container()
                                        : pw.Image(
                                            pw.MemoryImage(base64Decode(
                                                _hasilUsg!.image4!)),
                                            fit: pw.BoxFit.contain,
                                          ),
                                  ),
                                ]),
                            pw.SizedBox(height: 20),
                            pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Container(
                                    width: 150,
                                    height: 150,
                                    child: _hasilUsg!.image5! == "" ||
                                            _hasilUsg!.image5 == null
                                        ? pw.Container()
                                        : pw.Image(
                                            pw.MemoryImage(base64Decode(
                                                _hasilUsg!.image5!)),
                                            fit: pw.BoxFit.contain,
                                          ),
                                  ),
                                  pw.SizedBox(width: 20),
                                  pw.Container(
                                    width: 150,
                                    height: 150,
                                    child: _hasilUsg!.image6! == "" ||
                                            _hasilUsg!.image6 == null
                                        ? pw.Container()
                                        : pw.Image(
                                            pw.MemoryImage(base64Decode(
                                                _hasilUsg!.image6!)),
                                            fit: pw.BoxFit.contain,
                                          ),
                                  ),
                                ])
                          ]))
                    ];
                  }));
      _hasilUsg == null
          ? null
          : pdf.addPage(pw.MultiPage(
              pageFormat: PdfPageFormat.a4,
              margin: pw.EdgeInsets.all(0),
              maxPages: 20,
              header: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  margin: pw.EdgeInsets.only(bottom: 10),
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(headerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              footer: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(footerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              build: (pw.Context context) {
                return [
                  pw.Container(
                      padding: pw.EdgeInsets.all(20),
                      child: pw.Column(children: [
                        pw.Text(_hasilUsg!.judul!,
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 20),
                        pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("Nama Pasien",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Umur",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("J.Kelamin",
                                          style: pw.TextStyle(fontSize: 12))
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_pasien!.nama}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.umur}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.jenisKelamin}",
                                          style: pw.TextStyle(fontSize: 12))
                                    ])
                              ]),
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(_hasilUsg!.dokterApa!,
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Tanggal Pemeriksaan",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_hasilUsg!.namaDokter!}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(
                                          ": ${_pasien!.tanggalPemeriksaan}",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ])
                              ])
                            ]),
                        // pw.SizedBox(height: 10),
                        // _hasilUsg!.image! == ""
                        //     ? pw.Container()
                        //     : pw.Container(
                        //         width: 700,
                        //         height: 450,
                        //         child: pw.Image(
                        //           pw.MemoryImage(
                        //               base64Decode(_hasilUsg!.image!)),
                        //           fit: pw.BoxFit.contain,
                        //         ),
                        //       ),
                        pw.SizedBox(height: 20),
                        pw.Text("PEMERIKSAAN USG ABDOMEN",
                            style: pw.TextStyle(
                                fontSize: 12, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 10),
                        pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text("KLINIS : MEDIKAL CHECK UP",
                                  style: pw.TextStyle(
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.bold)),
                            ]),
                        pw.SizedBox(height: 10),
                        pw.Row(children: [
                          pw.Text(_hasilUsg!.keterangan!,
                              style: pw.TextStyle(fontSize: 11)),
                        ])
                      ]))
                ];
              }));

      _hasilNapfa == null
          ? null
          : pdf.addPage(pw.MultiPage(
              pageFormat: PdfPageFormat.a4,
              margin: pw.EdgeInsets.all(0),
              maxPages: 20,
              header: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  margin: pw.EdgeInsets.only(bottom: 10),
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(headerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              footer: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(footerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              build: (pw.Context context) {
                return [
                  pw.Container(
                      padding: pw.EdgeInsets.all(20),
                      child: pw.Column(children: [
                        pw.Text("${_hasilNapfa!.judul!}",
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 20),
                        pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("Nama Pasien",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Umur",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("J.Kelamin",
                                          style: pw.TextStyle(fontSize: 12))
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_pasien!.nama}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.umur}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.jenisKelamin}",
                                          style: pw.TextStyle(fontSize: 12))
                                    ])
                              ]),
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(_hasilNapfa!.dokterApa!,
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Tanggal Pemeriksaan",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_hasilNapfa!.namaDokter!}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(
                                          ": ${_pasien!.tanggalPemeriksaan}",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ])
                              ])
                            ]),
                        pw.SizedBox(height: 10),
                        _hasilNapfa!.image! == ""
                            ? pw.Container()
                            : pw.Container(
                                width: 700,
                                height: 450,
                                child: pw.Image(
                                  pw.MemoryImage(
                                      base64Decode(_hasilNapfa!.image!)),
                                  fit: pw.BoxFit.contain,
                                ),
                              ),
                        pw.SizedBox(height: 10),
                        pw.Row(children: [
                          pw.Text(_hasilNapfa!.keterangan!,
                              style: pw.TextStyle(fontSize: 12)),
                        ])
                      ]))
                ];
              }));

      _hasilNapza == null
          ? null
          : pdf.addPage(pw.MultiPage(
              pageFormat: PdfPageFormat.a4,
              margin: pw.EdgeInsets.all(0),
              maxPages: 20,
              header: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  margin: pw.EdgeInsets.only(bottom: 10),
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(headerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              footer: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(footerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              build: (pw.Context context) {
                return [
                  pw.Container(
                      padding: pw.EdgeInsets.all(20),
                      child: pw.Column(children: [
                        pw.Text("${_hasilNapza!.judul!}",
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 20),
                        pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("Nama Pasien",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Umur",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("J.Kelamin",
                                          style: pw.TextStyle(fontSize: 12))
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_pasien!.nama}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.umur}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.jenisKelamin}",
                                          style: pw.TextStyle(fontSize: 12))
                                    ])
                              ]),
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(_hasilNapza!.dokterApa!,
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Tanggal Pemeriksaan",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_hasilNapza!.namaDokter!}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(
                                          ": ${_pasien!.tanggalPemeriksaan}",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ])
                              ])
                            ]),
                        pw.SizedBox(height: 10),
                        _hasilNapza!.image! == ""
                            ? pw.Container()
                            : pw.Container(
                                width: 700,
                                height: 450,
                                child: pw.Image(
                                  pw.MemoryImage(
                                      base64Decode(_hasilNapza!.image!)),
                                  fit: pw.BoxFit.contain,
                                ),
                              ),
                        pw.SizedBox(height: 10),
                        pw.Row(children: [
                          pw.Text(_hasilNapza!.keterangan!,
                              style: pw.TextStyle(fontSize: 12)),
                        ])
                      ]))
                ];
              }));

      _hasilTreadmill == null
          ? null
          : pdf.addPage(pw.MultiPage(
              pageFormat: PdfPageFormat.a4,
              margin: pw.EdgeInsets.all(0),
              maxPages: 20,
              header: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  margin: pw.EdgeInsets.only(bottom: 10),
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(headerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              footer: (context) {
                return pw.Container(
                  width: 1000,
                  height: 80,
                  decoration: pw.BoxDecoration(),
                  child: pw.ClipRRect(
                    child: pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(footerImage),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
              build: (pw.Context context) {
                return [
                  pw.Container(
                      padding: pw.EdgeInsets.all(20),
                      child: pw.Column(children: [
                        pw.Text(_hasilTreadmill!.judul!,
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 20),
                        pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("Nama Pasien",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Umur",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("J.Kelamin",
                                          style: pw.TextStyle(fontSize: 12))
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(": ${_pasien!.nama}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.umur}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(": ${_pasien!.jenisKelamin}",
                                          style: pw.TextStyle(fontSize: 12))
                                    ])
                              ]),
                              pw.Row(children: [
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(_hasilTreadmill!.dokterApa!,
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text("Tanggal Pemeriksaan",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ]),
                                pw.SizedBox(width: 20),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(
                                          ": ${_hasilTreadmill!.namaDokter!}",
                                          style: pw.TextStyle(fontSize: 12)),
                                      pw.Text(
                                          ": ${_pasien!.tanggalPemeriksaan}",
                                          style: pw.TextStyle(fontSize: 12)),
                                    ])
                              ])
                            ]),
                        pw.SizedBox(height: 10),
                        _hasilTreadmill!.image! == ""
                            ? pw.Container()
                            : pw.Container(
                                width: 700,
                                height: 450,
                                child: pw.Image(
                                  pw.MemoryImage(
                                      base64Decode(_hasilTreadmill!.image!)),
                                  fit: pw.BoxFit.contain,
                                ),
                              ),
                        pw.SizedBox(height: 10),
                        pw.Row(children: [
                          pw.Text(_hasilTreadmill!.keterangan!,
                              style: pw.TextStyle(fontSize: 12)),
                        ])
                      ]))
                ];
              }));

      _fotoLainLain == null
          ? null
          : _fotoLainLain!.foto1 == ""
              ? null
              : pdf.addPage(pw.MultiPage(
                  pageFormat: PdfPageFormat.a4,
                  margin: pw.EdgeInsets.all(0),
                  maxPages: 20,
                  header: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      margin: pw.EdgeInsets.only(bottom: 10),
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(headerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  footer: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(footerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  build: (pw.Context context) {
                    return [
                      pw.Container(
                        margin: pw.EdgeInsets.all(10),
                        width: 600,
                        height: 620,
                        child: pw.Image(
                          pw.MemoryImage(base64Decode(_fotoLainLain!.foto2!)),
                          fit: pw.BoxFit.fill,
                        ),
                      ),
                    ];
                  }));

      _fotoLainLain == null
          ? null
          : _fotoLainLain!.foto2 == ""
              ? null
              : pdf.addPage(pw.MultiPage(
                  pageFormat: PdfPageFormat.a4,
                  margin: pw.EdgeInsets.all(0),
                  maxPages: 20,
                  header: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      margin: pw.EdgeInsets.only(bottom: 10),
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(headerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  footer: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(footerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  build: (pw.Context context) {
                    return [
                      pw.Container(
                        margin: pw.EdgeInsets.all(10),
                        width: 600,
                        height: 620,
                        child: pw.Image(
                          pw.MemoryImage(base64Decode(_fotoLainLain!.foto2!)),
                          fit: pw.BoxFit.fill,
                        ),
                      ),
                    ];
                  }));

      _fotoLainLain == null
          ? null
          : _fotoLainLain!.foto3 == ""
              ? null
              : pdf.addPage(pw.MultiPage(
                  pageFormat: PdfPageFormat.a4,
                  margin: pw.EdgeInsets.all(0),
                  maxPages: 20,
                  header: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      margin: pw.EdgeInsets.only(bottom: 10),
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(headerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  footer: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(footerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  build: (pw.Context context) {
                    return [
                      pw.Container(
                        margin: pw.EdgeInsets.all(10),
                        width: 600,
                        height: 620,
                        child: pw.Image(
                          pw.MemoryImage(base64Decode(_fotoLainLain!.foto3!)),
                          fit: pw.BoxFit.fill,
                        ),
                      ),
                    ];
                  }));

      _fotoLainLain == null
          ? null
          : _fotoLainLain!.foto4 == ""
              ? null
              : pdf.addPage(pw.MultiPage(
                  pageFormat: PdfPageFormat.a4,
                  margin: pw.EdgeInsets.all(0),
                  maxPages: 20,
                  header: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      margin: pw.EdgeInsets.only(bottom: 10),
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(headerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  footer: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(footerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  build: (pw.Context context) {
                    return [
                      pw.Container(
                        margin: pw.EdgeInsets.all(10),
                        width: 600,
                        height: 620,
                        child: pw.Image(
                          pw.MemoryImage(base64Decode(_fotoLainLain!.foto4!)),
                          fit: pw.BoxFit.fill,
                        ),
                      ),
                    ];
                  }));

      _fotoLainLain == null
          ? null
          : _fotoLainLain!.foto5 == ""
              ? null
              : pdf.addPage(pw.MultiPage(
                  pageFormat: PdfPageFormat.a4,
                  margin: pw.EdgeInsets.all(0),
                  maxPages: 20,
                  header: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      margin: pw.EdgeInsets.only(bottom: 10),
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(headerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  footer: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(footerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  build: (pw.Context context) {
                    return [
                      pw.Container(
                        margin: pw.EdgeInsets.all(10),
                        width: 600,
                        height: 620,
                        child: pw.Image(
                          pw.MemoryImage(base64Decode(_fotoLainLain!.foto5!)),
                          fit: pw.BoxFit.fill,
                        ),
                      ),
                    ];
                  }));

      _fotoLainLain == null
          ? null
          : _fotoLainLain!.foto6 == ""
              ? null
              : pdf.addPage(pw.MultiPage(
                  pageFormat: PdfPageFormat.a4,
                  margin: pw.EdgeInsets.all(0),
                  maxPages: 20,
                  header: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      margin: pw.EdgeInsets.only(bottom: 10),
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(headerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  footer: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(footerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  build: (pw.Context context) {
                    return [
                      pw.Container(
                        margin: pw.EdgeInsets.all(10),
                        width: 600,
                        height: 620,
                        child: pw.Image(
                          pw.MemoryImage(base64Decode(_fotoLainLain!.foto6!)),
                          fit: pw.BoxFit.fill,
                        ),
                      ),
                    ];
                  }));

      _fotoLainLain == null
          ? null
          : _fotoLainLain!.foto7 == ""
              ? null
              : pdf.addPage(pw.MultiPage(
                  pageFormat: PdfPageFormat.a4,
                  margin: pw.EdgeInsets.all(0),
                  maxPages: 20,
                  header: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      margin: pw.EdgeInsets.only(bottom: 10),
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(headerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  footer: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(footerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  build: (pw.Context context) {
                    return [
                      pw.Container(
                        margin: pw.EdgeInsets.all(10),
                        width: 600,
                        height: 620,
                        child: pw.Image(
                          pw.MemoryImage(base64Decode(_fotoLainLain!.foto7!)),
                          fit: pw.BoxFit.fill,
                        ),
                      ),
                    ];
                  }));

      _fotoLainLain == null
          ? null
          : _fotoLainLain!.foto8 == ""
              ? null
              : pdf.addPage(pw.MultiPage(
                  pageFormat: PdfPageFormat.a4,
                  margin: pw.EdgeInsets.all(0),
                  maxPages: 20,
                  header: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      margin: pw.EdgeInsets.only(bottom: 10),
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(headerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  footer: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(footerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  build: (pw.Context context) {
                    return [
                      pw.Container(
                        margin: pw.EdgeInsets.all(10),
                        width: 600,
                        height: 620,
                        child: pw.Image(
                          pw.MemoryImage(base64Decode(_fotoLainLain!.foto8!)),
                          fit: pw.BoxFit.fill,
                        ),
                      ),
                    ];
                  }));

      _fotoLainLain == null
          ? null
          : _fotoLainLain!.foto9 == ""
              ? null
              : pdf.addPage(pw.MultiPage(
                  pageFormat: PdfPageFormat.a4,
                  margin: pw.EdgeInsets.all(0),
                  maxPages: 20,
                  header: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      margin: pw.EdgeInsets.only(bottom: 10),
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(headerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  footer: (context) {
                    return pw.Container(
                      width: 1000,
                      height: 80,
                      decoration: pw.BoxDecoration(),
                      child: pw.ClipRRect(
                        child: pw.Container(
                          child: pw.Image(
                            pw.MemoryImage(footerImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  build: (pw.Context context) {
                    return [
                      pw.Container(
                        margin: pw.EdgeInsets.all(10),
                        width: 600,
                        height: 620,
                        child: pw.Image(
                          pw.MemoryImage(base64Decode(_fotoLainLain!.foto9!)),
                          fit: pw.BoxFit.fill,
                        ),
                      ),
                    ];
                  }));

      pdf.addPage(pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: pw.EdgeInsets.all(0),
          maxPages: 20,
          header: (context) {
            return pw.Container(
              width: 1000,
              height: 80,
              margin: pw.EdgeInsets.only(bottom: 10),
              decoration: pw.BoxDecoration(),
              child: pw.ClipRRect(
                child: pw.Container(
                  child: pw.Image(
                    pw.MemoryImage(headerImage),
                    fit: pw.BoxFit.fill,
                  ),
                ),
              ),
            );
          },
          footer: (context) {
            return pw.Container(
              width: 1000,
              height: 80,
              decoration: pw.BoxDecoration(),
              child: pw.ClipRRect(
                child: pw.Container(
                  child: pw.Image(
                    pw.MemoryImage(footerImage),
                    fit: pw.BoxFit.fill,
                  ),
                ),
              ),
            );
          },
          build: (pw.Context context) {
            return [
              pw.Container(
                  margin: pw.EdgeInsets.all(10),
                  width: 600,
                  height: 620,
                  child: pw.Center(
                    child: pw.Image(
                      pw.MemoryImage(skjImage),
                    ),
                  )),
            ];
          }));

      if (kIsWeb) {
        final bytes = await pdf.save();
        final blob = htmm.Blob([bytes], 'application/pdf');
        final url = htmm.Url.createObjectUrlFromBlob(blob);
        htmm.AnchorElement anchorElement = htmm.AnchorElement(href: url);
        anchorElement.download = "Hasil MCU ${_pasien!.nama}";
        anchorElement.click();
      } else {
        Uint8List bytes = await pdf.save();
        final dir = await getApplicationDocumentsDirectory();
        // final file = File('${dir.path}/pasienMCU.pdf');

        final file = File('${dir.path}/Hasil MCU ${_pasien!.nama}');
        // await OpenFilex.open(file.path);
        await OpenFilex.open(file.path);
        await file.writeAsBytes(bytes);
      }
      setState(() {
        btnLoading = false;
      });
    }

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return MenuUtama();
        }));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: blueDefault,
            title: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return MenuUtama();
                    }));
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                textDefault("Hasil MCU", Colors.white, 20, FontWeight.bold),
              ],
            )),
        body: isLoading == false
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textDefault("Anamnesa dan Pemeriksaan Fisik",
                              blueDefault, 18, FontWeight.bold)
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Profil Pasien", Colors.black, 14,
                                      FontWeight.normal),
                                  boolProfilPasien
                                      ? InkWell(
                                          onTap: () async {
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setString('detail1', "value");
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return AddPasienProfil(
                                                  idPasien: widget.idPasien);
                                            }));
                                          },
                                          child: Icon(Icons.edit))
                                      : Icon(Icons.arrow_drop_down)
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
                                  boolRiwayatPenTerdahulu =
                                      !boolRiwayatPenTerdahulu;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Riwayat Penyakit Terdahulu",
                                      Colors.black, 14, FontWeight.normal),
                                  boolRiwayatPenTerdahulu
                                      ? InkWell(
                                          onTap: () async {
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setString('detail1', "value");
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return PenyakitTerdahulu1(
                                                  idPasien: widget.idPasien);
                                            }));
                                          },
                                          child: Icon(Icons.edit))
                                      : Icon(Icons.arrow_drop_down)
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Riwayat Penyakit Keluarga",
                                      Colors.black, 14, FontWeight.normal),
                                  boolRiyatPenKeluarga
                                      ? InkWell(
                                          onTap: () async {
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setString('detail1', "value");
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return PenyakitKeluarga(
                                                  idPasien: widget.idPasien);
                                            }));
                                          },
                                          child: Icon(Icons.edit))
                                      : Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                            boolRiyatPenKeluarga
                                ? listPenyakitKeluarga()
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
                                  boolRiwayatKebiasaan = !boolRiwayatKebiasaan;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Riwayat Kebiasaan", Colors.black,
                                      14, FontWeight.normal),
                                  boolRiwayatKebiasaan
                                      ? InkWell(
                                          onTap: () async {
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setString('detail1', "value");
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return RiwwayatKebiasaan3(
                                                  idPasien: widget.idPasien);
                                            }));
                                          },
                                          child: Icon(Icons.edit))
                                      : Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                            boolRiwayatKebiasaan
                                ? listRiwayatKebiasaan()
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
                                  boolKeluhanSekarang = !boolKeluhanSekarang;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Keluhan Sekarang", Colors.black,
                                      14, FontWeight.normal),
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
                                            textDefault(
                                                "Keadaan Umum",
                                                Colors.black,
                                                14,
                                                FontWeight.normal),
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
                                                                FontWeight
                                                                    .normal),
                                                            boolPemeriksaanUmum
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      SharedPreferences
                                                                          prefs =
                                                                          await SharedPreferences
                                                                              .getInstance();
                                                                      prefs.setString(
                                                                          'detail1',
                                                                          "value");
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(builder:
                                                                              (context) {
                                                                        return PemeriksaanUmum(
                                                                            idPasien:
                                                                                widget.idPasien);
                                                                      }));
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .edit))
                                                                : Icon(Icons
                                                                    .arrow_drop_down)
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
                                                                FontWeight
                                                                    .normal),
                                                            boolPemeriksaanMata
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      SharedPreferences
                                                                          prefs =
                                                                          await SharedPreferences
                                                                              .getInstance();
                                                                      prefs.setString(
                                                                          'detail1',
                                                                          "value");
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(builder:
                                                                              (context) {
                                                                        return PemeriksaanMata(
                                                                            idPasien:
                                                                                widget.idPasien);
                                                                      }));
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .edit))
                                                                : Icon(Icons
                                                                    .arrow_drop_down)
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
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            boolPemeriksaanTHT =
                                                                !boolPemeriksaanTHT;
                                                          });
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            textDefault(
                                                                "Pemeriksaan THT",
                                                                Colors.black,
                                                                14,
                                                                FontWeight
                                                                    .normal),
                                                            boolPemeriksaanTHT
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      SharedPreferences
                                                                          prefs =
                                                                          await SharedPreferences
                                                                              .getInstance();
                                                                      prefs.setString(
                                                                          'detail1',
                                                                          "value");
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(builder:
                                                                              (context) {
                                                                        return PemeriksaanTHT(
                                                                            idPasien:
                                                                                widget.idPasien);
                                                                      }));
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .edit))
                                                                : Icon(Icons
                                                                    .arrow_drop_down)
                                                          ],
                                                        ),
                                                      ),
                                                      boolPemeriksaanTHT ==
                                                              false
                                                          ? Container()
                                                          : Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                              child: Column(
                                                                children: [
                                                                  Divider(
                                                                    thickness:
                                                                        1,
                                                                  ),
                                                                  Container(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              boolTelinga = !boolTelinga;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              textDefault("Pemeriksaan Telinga", Colors.black, 14, FontWeight.normal),
                                                                              boolTelinga
                                                                                  ? InkWell(
                                                                                      onTap: () async {
                                                                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                                        prefs.setString('detail1', "value");
                                                                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                                                                          return PemeriksaanTHT(idPasien: widget.idPasien);
                                                                                        }));
                                                                                      },
                                                                                      child: Icon(Icons.edit))
                                                                                  : Icon(Icons.arrow_drop_down)
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        boolTelinga ==
                                                                                false
                                                                            ? Container()
                                                                            : listTelinga()
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        1,
                                                                  ),
                                                                  Container(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              boolHidung = !boolHidung;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              textDefault("Pemeriksaan Hidung", Colors.black, 14, FontWeight.normal),
                                                                              boolHidung
                                                                                  ? InkWell(
                                                                                      onTap: () async {
                                                                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                                        prefs.setString('detail1', "value");
                                                                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                                                                          return PemeriksaanTHT(idPasien: widget.idPasien);
                                                                                        }));
                                                                                      },
                                                                                      child: Icon(Icons.edit))
                                                                                  : Icon(Icons.arrow_drop_down)
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        boolHidung
                                                                            ? listHidung()
                                                                            : Container()
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        1,
                                                                  ),
                                                                  Container(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              boolKerongkongan = !boolKerongkongan;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              textDefault("Pemeriksaan Kerongkongan", Colors.black, 14, FontWeight.normal),
                                                                              boolKerongkongan
                                                                                  ? InkWell(
                                                                                      onTap: () async {
                                                                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                                        prefs.setString('detail1', "value");
                                                                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                                                                          return PemeriksaanTHT(idPasien: widget.idPasien);
                                                                                        }));
                                                                                      },
                                                                                      child: Icon(Icons.edit))
                                                                                  : Icon(Icons.arrow_drop_down)
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        boolKerongkongan
                                                                            ? listKerongkongan()
                                                                            : Container()
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
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
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            boolPemeriksaanRonggaDada =
                                                                !boolPemeriksaanRonggaDada;
                                                          });
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            textDefault(
                                                                "Pemeriksaan Rongga Dada",
                                                                Colors.black,
                                                                14,
                                                                FontWeight
                                                                    .normal),
                                                            boolPemeriksaanRonggaDada
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      SharedPreferences
                                                                          prefs =
                                                                          await SharedPreferences
                                                                              .getInstance();
                                                                      prefs.setString(
                                                                          'detail1',
                                                                          "value");
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(builder:
                                                                              (context) {
                                                                        return PemeriksaanRonggaDada(
                                                                            idPasien:
                                                                                widget.idPasien);
                                                                      }));
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .edit))
                                                                : Icon(Icons
                                                                    .arrow_drop_down)
                                                          ],
                                                        ),
                                                      ),
                                                      boolPemeriksaanRonggaDada ==
                                                              false
                                                          ? Container()
                                                          : Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                              child: Column(
                                                                children: [
                                                                  Divider(
                                                                    thickness:
                                                                        1,
                                                                  ),
                                                                  Container(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              boolJantung = !boolJantung;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              textDefault("Jantung", Colors.black, 14, FontWeight.normal),
                                                                              boolJantung
                                                                                  ? InkWell(
                                                                                      onTap: () async {
                                                                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                                        prefs.setString('detail1', "value");
                                                                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                                                                          return PemeriksaanRonggaDada(idPasien: widget.idPasien);
                                                                                        }));
                                                                                      },
                                                                                      child: Icon(Icons.edit))
                                                                                  : Icon(Icons.arrow_drop_down)
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        boolJantung
                                                                            ? listJantung()
                                                                            : Container()
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        1,
                                                                  ),
                                                                  Container(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              boolParu = !boolParu;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              textDefault("Paru", Colors.black, 14, FontWeight.normal),
                                                                              boolParu
                                                                                  ? InkWell(
                                                                                      onTap: () async {
                                                                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                                        prefs.setString('detail1', "value");
                                                                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                                                                          return PemeriksaanRonggaDada(idPasien: widget.idPasien);
                                                                                        }));
                                                                                      },
                                                                                      child: Icon(Icons.edit))
                                                                                  : Icon(Icons.arrow_drop_down)
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        boolParu
                                                                            ? listParu()
                                                                            : Container()
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
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
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            boolPemeriksaanRonggaPerut =
                                                                !boolPemeriksaanRonggaPerut;
                                                          });
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            textDefault(
                                                                "Pemeriksaan Rongga Perut",
                                                                Colors.black,
                                                                14,
                                                                FontWeight
                                                                    .normal),
                                                            boolPemeriksaanRonggaPerut
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      SharedPreferences
                                                                          prefs =
                                                                          await SharedPreferences
                                                                              .getInstance();
                                                                      prefs.setString(
                                                                          'detail1',
                                                                          "value");
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(builder:
                                                                              (context) {
                                                                        return PemeriksaanRonggaPerut(
                                                                            idPasien:
                                                                                widget.idPasien);
                                                                      }));
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .edit))
                                                                : Icon(Icons
                                                                    .arrow_drop_down)
                                                          ],
                                                        ),
                                                      ),
                                                      boolPemeriksaanRonggaPerut
                                                          ? listRonggaPerut()
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
                                                            boolPemeriksaanGentalia =
                                                                !boolPemeriksaanGentalia;
                                                          });
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            textDefault(
                                                                "Pemeriksaan Gentalia dan Anokretal",
                                                                Colors.black,
                                                                14,
                                                                FontWeight
                                                                    .normal),
                                                            boolPemeriksaanGentalia
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      SharedPreferences
                                                                          prefs =
                                                                          await SharedPreferences
                                                                              .getInstance();
                                                                      prefs.setString(
                                                                          'detail1',
                                                                          "value");
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(builder:
                                                                              (context) {
                                                                        return PemeriksaanGentalia(
                                                                            idPasien:
                                                                                widget.idPasien);
                                                                      }));
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .edit))
                                                                : Icon(Icons
                                                                    .arrow_drop_down)
                                                          ],
                                                        ),
                                                      ),
                                                      boolPemeriksaanGentalia
                                                          ? listGentalia()
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
                                                            boolPemeriksaanAnggotaGerak =
                                                                !boolPemeriksaanAnggotaGerak;
                                                          });
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            textDefault(
                                                                "Pemeriksaan Anggota Gerak",
                                                                Colors.black,
                                                                14,
                                                                FontWeight
                                                                    .normal),
                                                            boolPemeriksaanAnggotaGerak
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      SharedPreferences
                                                                          prefs =
                                                                          await SharedPreferences
                                                                              .getInstance();
                                                                      prefs.setString(
                                                                          'detail1',
                                                                          "value");
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(builder:
                                                                              (context) {
                                                                        return PemeriksaanAnggotaGerak(
                                                                            idPasien:
                                                                                widget.idPasien);
                                                                      }));
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .edit))
                                                                : Icon(Icons
                                                                    .arrow_drop_down)
                                                          ],
                                                        ),
                                                      ),
                                                      boolPemeriksaanAnggotaGerak
                                                          ? listAnggotaGerak()
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
                                                            boolPemeriksaanRefleks =
                                                                !boolPemeriksaanRefleks;
                                                          });
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            textDefault(
                                                                "Pemeriksaan Refleks",
                                                                Colors.black,
                                                                14,
                                                                FontWeight
                                                                    .normal),
                                                            boolPemeriksaanRefleks
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      SharedPreferences
                                                                          prefs =
                                                                          await SharedPreferences
                                                                              .getInstance();
                                                                      prefs.setString(
                                                                          'detail1',
                                                                          "value");
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(builder:
                                                                              (context) {
                                                                        return PemeriksaanRefleks(
                                                                            idPasien:
                                                                                widget.idPasien);
                                                                      }));
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .edit))
                                                                : Icon(Icons
                                                                    .arrow_drop_down)
                                                          ],
                                                        ),
                                                      ),
                                                      boolPemeriksaanRefleks
                                                          ? listRefleks()
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
                                                            boolPemeriksaanKelenjarGetah =
                                                                !boolPemeriksaanKelenjarGetah;
                                                          });
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            textDefault(
                                                                "Pemeriksaan Kelenjar Getah Bening",
                                                                Colors.black,
                                                                14,
                                                                FontWeight
                                                                    .normal),
                                                            boolPemeriksaanKelenjarGetah
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      SharedPreferences
                                                                          prefs =
                                                                          await SharedPreferences
                                                                              .getInstance();
                                                                      prefs.setString(
                                                                          'detail1',
                                                                          "value");
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(builder:
                                                                              (context) {
                                                                        return PemeriksaanKelenjarGetah(
                                                                            idPasien:
                                                                                widget.idPasien);
                                                                      }));
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .edit))
                                                                : Icon(Icons
                                                                    .arrow_drop_down)
                                                          ],
                                                        ),
                                                      ),
                                                      boolPemeriksaanKelenjarGetah
                                                          ? listKelenjarGetah()
                                                          : Container()
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
                                            boolRiwayatPajanan =
                                                !boolRiwayatPajanan;
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
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            boolFisik =
                                                                !boolFisik;
                                                          });
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            textDefault(
                                                                "Fisik",
                                                                Colors.black,
                                                                14,
                                                                FontWeight
                                                                    .normal),
                                                            boolFisik
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      SharedPreferences
                                                                          prefs =
                                                                          await SharedPreferences
                                                                              .getInstance();
                                                                      prefs.setString(
                                                                          'detail1',
                                                                          "value");
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(builder:
                                                                              (context) {
                                                                        return Fisik(
                                                                            idPasien:
                                                                                widget.idPasien);
                                                                      }));
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .edit))
                                                                : Icon(Icons
                                                                    .arrow_drop_down)
                                                          ],
                                                        ),
                                                      ),
                                                      boolFisik
                                                          ? listFisik()
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
                                                            boolKimia =
                                                                !boolKimia;
                                                          });
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            textDefault(
                                                                "Kimia",
                                                                Colors.black,
                                                                14,
                                                                FontWeight
                                                                    .normal),
                                                            boolKimia
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      SharedPreferences
                                                                          prefs =
                                                                          await SharedPreferences
                                                                              .getInstance();
                                                                      prefs.setString(
                                                                          'detail1',
                                                                          "value");
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(builder:
                                                                              (context) {
                                                                        return Kimia(
                                                                            pasienId:
                                                                                widget.idPasien);
                                                                      }));
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .edit))
                                                                : Icon(Icons
                                                                    .arrow_drop_down)
                                                          ],
                                                        ),
                                                      ),
                                                      boolKimia
                                                          ? listKimia()
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
                                                            boolBiologi =
                                                                !boolBiologi;
                                                          });
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            textDefault(
                                                                "Biologi",
                                                                Colors.black,
                                                                14,
                                                                FontWeight
                                                                    .normal),
                                                            boolBiologi
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      SharedPreferences
                                                                          prefs =
                                                                          await SharedPreferences
                                                                              .getInstance();
                                                                      prefs.setString(
                                                                          'detail1',
                                                                          "value");
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(builder:
                                                                              (context) {
                                                                        return Biologi(
                                                                            idPasien:
                                                                                widget.idPasien);
                                                                      }));
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .edit))
                                                                : Icon(Icons
                                                                    .arrow_drop_down)
                                                          ],
                                                        ),
                                                      ),
                                                      boolBiologi
                                                          ? listBiologi()
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
                                                            boolPsikologis =
                                                                !boolPsikologis;
                                                          });
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            textDefault(
                                                                "Psikologis",
                                                                Colors.black,
                                                                14,
                                                                FontWeight
                                                                    .normal),
                                                            boolPsikologis
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      SharedPreferences
                                                                          prefs =
                                                                          await SharedPreferences
                                                                              .getInstance();
                                                                      prefs.setString(
                                                                          'detail1',
                                                                          "value");
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(builder:
                                                                              (context) {
                                                                        return Psikologis(
                                                                            idPasien:
                                                                                widget.idPasien);
                                                                      }));
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .edit))
                                                                : Icon(Icons
                                                                    .arrow_drop_down)
                                                          ],
                                                        ),
                                                      ),
                                                      boolPsikologis
                                                          ? listPsikologis()
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
                                                            boolErgonomis =
                                                                !boolErgonomis;
                                                          });
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            textDefault(
                                                                "Ergonomis",
                                                                Colors.black,
                                                                14,
                                                                FontWeight
                                                                    .normal),
                                                            boolErgonomis
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      SharedPreferences
                                                                          prefs =
                                                                          await SharedPreferences
                                                                              .getInstance();
                                                                      prefs.setString(
                                                                          'detail1',
                                                                          "value");
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(builder:
                                                                              (context) {
                                                                        return Ergonomis(
                                                                            idPasien:
                                                                                widget.idPasien);
                                                                      }));
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .edit))
                                                                : Icon(Icons
                                                                    .arrow_drop_down)
                                                          ],
                                                        ),
                                                      ),
                                                      boolErgonomis
                                                          ? listErgonomis()
                                                          : Container()
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
                            InkWell(
                              onTap: () {
                                setState(() {
                                  boolPemeriksaan = !boolPemeriksaan;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Pemeriksaan", Colors.black, 14,
                                      FontWeight.normal),
                                  boolPemeriksaan
                                      ? InkWell(
                                          onTap: () async {
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setString('detail1', "value");
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return Pemeriksaan5(
                                                  idPasien: widget.idPasien);
                                            }));
                                          },
                                          child: Icon(Icons.edit))
                                      : Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                            boolPemeriksaan ? listPemeriksaan() : Container()
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
                                  boolAnjuran = !boolAnjuran;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Anjuran-Anjuran", Colors.black,
                                      14, FontWeight.normal),
                                  boolAnjuran
                                      ? InkWell(
                                          onTap: () async {
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setString('detail1', "value");
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return Anjuran6(
                                                  idPasien: widget.idPasien);
                                            }));
                                          },
                                          child: Icon(Icons.edit))
                                      : Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                            boolAnjuran ? listAnjuran() : Container()
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
                                  boolKesimpulanKelayakan =
                                      !boolKesimpulanKelayakan;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Kesimpulan Kelayakan Kerja",
                                      Colors.black, 14, FontWeight.normal),
                                  boolKesimpulanKelayakan
                                      ? InkWell(
                                          onTap: () async {
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setString('detail1', "value");
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return KesimpulanKelayakan7(
                                                  idPasien: widget.idPasien);
                                            }));
                                          },
                                          child: Icon(Icons.edit))
                                      : Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                            boolKesimpulanKelayakan
                                ? listKesimpulanKelayakan()
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
                                  boolKesimpulanDerajat =
                                      !boolKesimpulanDerajat;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Kesimpulan Derajat Kesehatan",
                                      Colors.black, 14, FontWeight.normal),
                                  boolKesimpulanDerajat
                                      ? InkWell(
                                          onTap: () async {
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setString('detail1', "value");
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return KesimpulanDerajat8(
                                                  idPasien: widget.idPasien);
                                            }));
                                          },
                                          child: Icon(Icons.edit))
                                      : Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                            boolKesimpulanDerajat
                                ? listKesimpulanDerajat()
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
                                  boolFotoLainLain = !boolFotoLainLain;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textDefault("Foto Lain Lain", Colors.black,
                                      14, FontWeight.normal),
                                  boolFotoLainLain
                                      ? InkWell(
                                          onTap: () async {
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setString('detail1', "value");
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return FotoLainLainView(
                                                  idPasien: widget.idPasien);
                                            }));
                                          },
                                          child: Icon(Icons.edit))
                                      : Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                            boolFotoLainLain ? listFotoLainLain() : Container()
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            btnLoading = true;
                          });
                          getHasilPDFMCU();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: blueDefault,
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: btnLoading
                                ? Container(
                                    width: 25,
                                    height: 25,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ))
                                : textDefault("Download Hasil MCU",
                                    Colors.white, 14, FontWeight.normal),
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

  Widget listProfilePasien() {
    return ListProfilePasien(pasien: _pasien);
  }

  Widget listPenyakitTerdahulu() {
    return ListPenyakitTerdahulu(penyakitTerdahulu: _penyakitTerdahulu);
  }

  Widget listPenyakitKeluarga() {
    return ListPenyakitKeluarga(penyakitKeluarga: _penyakitKeluarga);
  }

  Widget listRiwayatKebiasaan() {
    return ListRiwayatKebiasaan(
        riwayatKebiasaan: _riwayatKebiasaan,
        merokokLama: merokokLama,
        merokokBungkus: merokokBungkus,
        mirasLama: mirasLama,
        mirasBotol: mirasBotol);
  }

  Widget listPemeriksaanUmum() {
    return ListPemeriksaanUmum(pemeriksaanUmum: _pemeriksaanUmum);
  }

  Widget listPemeriksaanMata() {
    return ListPemeriksaanMata(pemeriksaanMata: _pemeriksaanMata);
  }

  Widget listTelinga() {
    return ListTelinga(pemeriksaanTHT: _pemeriksaanTHT);
  }

  Widget listHidung() {
    return ListHidung(pemeriksaanTHT: _pemeriksaanTHT);
  }

  Widget listKerongkongan() {
    return ListKerongkongan(pemeriksaanTHT: _pemeriksaanTHT);
  }

  Widget listJantung() {
    return ListJantung(pemeriksaanRonggaDada: _pemeriksaanRonggaDada);
  }

  Widget listParu() {
    return ListParu(pemeriksaanRonggaDada: _pemeriksaanRonggaDada);
  }

  Widget listRonggaPerut() {
    return ListRonggaPerut(pemeriksaanRonggaPerut: _pemeriksaanRonggaPerut);
  }

  Widget listGentalia() {
    return ListGentalia(pemeriksaanGentalia: _pemeriksaanGentalia);
  }

  Widget listAnggotaGerak() {
    return ListAnggotaGerak(pemeriksaanAnggotaGerak: _pemeriksaanAnggotaGerak);
  }

  Widget listRefleks() {
    return ListRefleks(pemeriksaanRefleks: _pemeriksaanRefleks);
  }

  Widget listKelenjarGetah() {
    return ListKelenjarGetah(
        pemeriksaanKelenjarGetah: _pemeriksaanKelenjarGetah);
  }

  Widget listFisik() {
    return ListFisik(fisik: _fisik);
  }

  Widget listKimia() {
    return ListKimia(kimia: _kimia);
  }

  Widget listBiologi() {
    return ListBiologi(biologi: _biologi);
  }

  Widget listPsikologis() {
    return ListPsikologis(psikologi: _psikologi);
  }

  Widget listErgonomis() {
    return ListErgonomis(ergonomis: _ergonomis);
  }

  Widget listPemeriksaan() {
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
                    "Aktivitas Fisik", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    _pemeriksaan!.aktivitasFisik == null
                        ? ""
                        : "${_pemeriksaan!.aktivitasFisik}",
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Pemeriksaan Fisik", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_pemeriksaan!.pemeriksaanFisik}",
                    Colors.black, 12, FontWeight.normal),
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
                    "Pemeriksaan Mata", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_pemeriksaan!.pemeriksaanMata}",
                    Colors.black, 12, FontWeight.normal),
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
                child: textDefault("Pemeriksaan Gigi dan Mulut", Colors.black,
                    12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_pemeriksaan!.pemeriksaanGigiMulut}",
                    Colors.black, 12, FontWeight.normal),
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
                child: textDefault("Pemeriksaan Audiometri", Colors.black, 12,
                    FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_pemeriksaan!.pemeriksaanAudioMetri}",
                    Colors.black, 12, FontWeight.normal),
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
                child: textDefault("Pemeriksaan Spirometri", Colors.black, 12,
                    FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_pemeriksaan!.pemeriksaanSpirometri}",
                    Colors.black, 12, FontWeight.normal),
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
                child: textDefault("Pemeriksaan Treadmill", Colors.black, 12,
                    FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_pemeriksaan!.pemeriksaanTreadmill}",
                    Colors.black, 12, FontWeight.normal),
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
                child: textDefault("Pemeriksaan Laboratorium", Colors.black, 12,
                    FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_pemeriksaan!.pemeriksaanLaboratorium}",
                    Colors.black, 12, FontWeight.normal),
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
                child: textDefault("${_pemeriksaan!.pemeriksaanXrayJantung}",
                    Colors.black, 12, FontWeight.normal),
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
                child: textDefault("Paru", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_pemeriksaan!.paru}", Colors.black, 12,
                    FontWeight.normal),
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
                    "Pemeriksaan USG", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    _pemeriksaan!.pemeriksaanUsg == null
                        ? ""
                        : "${_pemeriksaan!.pemeriksaanUsg}",
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Pemeriksaan NAPFA", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    _pemeriksaan!.pemeriksaanNapfa == null
                        ? ""
                        : "${_pemeriksaan!.pemeriksaanNapfa}",
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Pemeriksaan NAPZA", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    _pemeriksaan!.pemeriksaanNapza == null
                        ? ""
                        : "${_pemeriksaan!.pemeriksaanNapza}",
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
        _pemeriksaan!.pemeriksaanFisik == ""
            ? Container()
            : Divider(
                thickness: 1,
              ),
        _pemeriksaan!.pemeriksaanFisik == ""
            ? Container()
            : Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolHasilFisik = !boolHasilFisik;
                          boolHasilMata = false;
                          boolHasilGigiMulut = false;
                          boolHasilAudiometri = false;
                          boolHasilSpirometri = false;
                          boolHasilTreadmill = false;
                          boolHasilLaboratorium = false;
                          boolHasilJantung = false;
                          boolHasilParu = false;
                          boolHasilUsg = false;
                          boolHasilNapfa = false;
                          boolHasilNapza = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Hasil Pemeriksaan Fisik", Colors.black,
                              14, FontWeight.normal),
                          boolHasilFisik
                              ? InkWell(
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('detail1', "value");
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HasilPemeriksaanFisik(
                                          idPasien: widget.idPasien);
                                    }));
                                  },
                                  child: Icon(Icons.edit))
                              : Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    boolHasilFisik
                        ? _hasilFisik == null
                            ? listHasilPemeriksaan("", "", "", "", "")
                            : listHasilPemeriksaan(
                                "${_hasilFisik!.judul!}",
                                "${_hasilFisik!.dokterApa!}",
                                "${_hasilFisik!.namaDokter!}",
                                _hasilFisik!.image! == "" ? "" : "[FOTO]",
                                "${_hasilFisik!.keterangan!}")
                        : Container()
                  ],
                ),
              ),
        _pemeriksaan!.pemeriksaanMata == ""
            ? Container()
            : Divider(
                thickness: 1,
              ),
        _pemeriksaan!.pemeriksaanMata == ""
            ? Container()
            : Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolHasilMata = !boolHasilMata;
                          boolHasilFisik = false;
                          boolHasilGigiMulut = false;
                          boolHasilAudiometri = false;
                          boolHasilSpirometri = false;
                          boolHasilTreadmill = false;
                          boolHasilLaboratorium = false;
                          boolHasilJantung = false;
                          boolHasilParu = false;
                          boolHasilUsg = false;
                          boolHasilNapfa = false;
                          boolHasilNapza = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Hasil Pemeriksaan Mata", Colors.black,
                              14, FontWeight.normal),
                          boolHasilMata
                              ? InkWell(
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('detail1', "value");
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HasilPemeriksaanMata(
                                          idPasien: widget.idPasien);
                                    }));
                                  },
                                  child: Icon(Icons.edit))
                              : Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    boolHasilMata
                        ? _hasilMata == null
                            ? listHasilPemeriksaan("", "", "", "", "")
                            : listHasilPemeriksaan(
                                _hasilMata!.judul!,
                                _hasilMata!.dokterApa!,
                                _hasilMata!.namaDokter!,
                                _hasilMata!.image! == "" ? "" : "[FOTO]",
                                _hasilMata!.keterangan!)
                        : Container()
                  ],
                ),
              ),
        _pemeriksaan!.pemeriksaanGigiMulut == ""
            ? Container()
            : Divider(
                thickness: 1,
              ),
        _pemeriksaan!.pemeriksaanGigiMulut == ""
            ? Container()
            : Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolHasilGigiMulut = !boolHasilGigiMulut;
                          boolHasilFisik = false;
                          boolHasilMata = false;
                          boolHasilAudiometri = false;
                          boolHasilSpirometri = false;
                          boolHasilTreadmill = false;
                          boolHasilLaboratorium = false;
                          boolHasilJantung = false;
                          boolHasilParu = false;
                          boolHasilUsg = false;
                          boolHasilNapfa = false;
                          boolHasilNapza = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Hasil Pemeriksaan Gigi dan Mulut",
                              Colors.black, 14, FontWeight.normal),
                          boolHasilGigiMulut
                              ? InkWell(
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('detail1', "value");
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HasilPemeriksaanGigiMulut(
                                          idPasien: widget.idPasien);
                                    }));
                                  },
                                  child: Icon(Icons.edit))
                              : Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    boolHasilGigiMulut
                        ? _hasilGigiMulut == null
                            ? listHasilPemeriksaan("", "", "", "", "")
                            : listHasilPemeriksaan(
                                _hasilGigiMulut!.judul!,
                                _hasilGigiMulut!.dokterApa!,
                                _hasilGigiMulut!.namaDokter!,
                                _hasilGigiMulut!.image! == "" ? "" : "[FOTO]",
                                _hasilGigiMulut!.keterangan!)
                        : Container()
                  ],
                ),
              ),
        _pemeriksaan!.pemeriksaanAudioMetri == ""
            ? Container()
            : Divider(
                thickness: 1,
              ),
        _pemeriksaan!.pemeriksaanAudioMetri == ""
            ? Container()
            : Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolHasilAudiometri = !boolHasilAudiometri;
                          boolHasilFisik = false;
                          boolHasilGigiMulut = false;
                          boolHasilMata = false;
                          boolHasilSpirometri = false;
                          boolHasilTreadmill = false;
                          boolHasilLaboratorium = false;
                          boolHasilJantung = false;
                          boolHasilParu = false;
                          boolHasilUsg = false;
                          boolHasilNapfa = false;
                          boolHasilNapza = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Hasil Pemeriksaan Audiometri",
                              Colors.black, 14, FontWeight.normal),
                          boolHasilAudiometri
                              ? InkWell(
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('detail1', "value");
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HasilPemeriksaanAudiometri(
                                          idPasien: widget.idPasien);
                                    }));
                                  },
                                  child: Icon(Icons.edit))
                              : Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    boolHasilAudiometri
                        ? _hasilAudiometri == null
                            ? listHasilPemeriksaan("", "", "", "", "")
                            : listHasilPemeriksaan(
                                _hasilAudiometri!.judul!,
                                _hasilAudiometri!.dokterApa!,
                                _hasilAudiometri!.namaDokter!,
                                _hasilAudiometri!.image! == "" ? "" : "[FOTO]",
                                _hasilAudiometri!.keterangan!)
                        : Container()
                  ],
                ),
              ),
        _pemeriksaan!.pemeriksaanSpirometri == ""
            ? Container()
            : Divider(
                thickness: 1,
              ),
        _pemeriksaan!.pemeriksaanSpirometri == ""
            ? Container()
            : Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolHasilSpirometri = !boolHasilSpirometri;
                          boolHasilFisik = false;
                          boolHasilGigiMulut = false;
                          boolHasilAudiometri = false;
                          boolHasilMata = false;
                          boolHasilTreadmill = false;
                          boolHasilLaboratorium = false;
                          boolHasilJantung = false;
                          boolHasilParu = false;
                          boolHasilUsg = false;
                          boolHasilNapfa = false;
                          boolHasilNapza = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Hasil Pemeriksaan Spirometri",
                              Colors.black, 14, FontWeight.normal),
                          boolHasilSpirometri
                              ? InkWell(
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('detail1', "value");
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HasilPemeriksaanSpirometri(
                                          idPasien: widget.idPasien);
                                    }));
                                  },
                                  child: Icon(Icons.edit))
                              : Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    boolHasilSpirometri
                        ? _hasilSpirometri == null
                            ? listHasilPemeriksaan("", "", "", "", "")
                            : listHasilPemeriksaan(
                                _hasilSpirometri!.judul!,
                                _hasilSpirometri!.dokterApa!,
                                _hasilSpirometri!.namaDokter!,
                                _hasilSpirometri!.image! == "" ? "" : "[FOTO]",
                                _hasilSpirometri!.keterangan!)
                        : Container()
                  ],
                ),
              ),
        _pemeriksaan!.pemeriksaanTreadmill == ""
            ? Container()
            : Divider(
                thickness: 1,
              ),
        _pemeriksaan!.pemeriksaanTreadmill == ""
            ? Container()
            : Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolHasilTreadmill = !boolHasilTreadmill;
                          boolHasilFisik = false;
                          boolHasilGigiMulut = false;
                          boolHasilAudiometri = false;
                          boolHasilSpirometri = false;
                          boolHasilMata = false;
                          boolHasilLaboratorium = false;
                          boolHasilJantung = false;
                          boolHasilParu = false;
                          boolHasilUsg = false;
                          boolHasilNapfa = false;
                          boolHasilNapza = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Hasil Pemeriksaan Treadmill",
                              Colors.black, 14, FontWeight.normal),
                          boolHasilTreadmill
                              ? InkWell(
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('detail1', "value");
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HasilPemeriksaanTreadmill(
                                          idPasien: widget.idPasien);
                                    }));
                                  },
                                  child: Icon(Icons.edit))
                              : Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    boolHasilTreadmill
                        ? _hasilTreadmill == null
                            ? listHasilPemeriksaan("", "", "", "", "")
                            : listHasilPemeriksaan(
                                _hasilTreadmill!.judul!,
                                _hasilTreadmill!.dokterApa!,
                                _hasilTreadmill!.namaDokter!,
                                _hasilTreadmill!.image! == "" ? "" : "[FOTO]",
                                _hasilTreadmill!.keterangan!)
                        : Container()
                  ],
                ),
              ),
        _pemeriksaan!.pemeriksaanLaboratorium == ""
            ? Container()
            : Divider(
                thickness: 1,
              ),
        _pemeriksaan!.pemeriksaanLaboratorium == ""
            ? Container()
            : Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolHasilLaboratorium = !boolHasilLaboratorium;
                          boolHasilFisik = false;
                          boolHasilGigiMulut = false;
                          boolHasilAudiometri = false;
                          boolHasilSpirometri = false;
                          boolHasilTreadmill = false;
                          boolHasilMata = false;
                          boolHasilJantung = false;
                          boolHasilParu = false;
                          boolHasilUsg = false;
                          boolHasilNapfa = false;
                          boolHasilNapza = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Hasil Pemeriksaan Laboratorium",
                              Colors.black, 14, FontWeight.normal),
                          boolHasilLaboratorium
                              ? InkWell(
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('detail1', "value");
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HasilPemeriksaanLaboratorium1(
                                          idPasien: widget.idPasien);
                                    }));
                                  },
                                  child: Icon(Icons.edit))
                              : Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    boolHasilLaboratorium
                        ? _hasilLaboratorium == null
                            ? listHasilPemeriksaanLaboratorium()
                            : listHasilPemeriksaanLaboratorium()
                        : Container()
                  ],
                ),
              ),
        _pemeriksaan!.pemeriksaanXrayJantung == ""
            ? Container()
            : Divider(
                thickness: 1,
              ),
        _pemeriksaan!.pemeriksaanXrayJantung == ""
            ? Container()
            : Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolHasilJantung = !boolHasilJantung;
                          boolHasilFisik = false;
                          boolHasilGigiMulut = false;
                          boolHasilAudiometri = false;
                          boolHasilSpirometri = false;
                          boolHasilTreadmill = false;
                          boolHasilLaboratorium = false;
                          boolHasilMata = false;
                          boolHasilParu = false;
                          boolHasilUsg = false;
                          boolHasilNapfa = false;
                          boolHasilNapza = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Hasil Pemeriksaan Jantung", Colors.black,
                              14, FontWeight.normal),
                          boolHasilJantung
                              ? InkWell(
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('detail1', "value");
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HasilPemeriksaanJantung(
                                          idPasien: widget.idPasien);
                                    }));
                                  },
                                  child: Icon(Icons.edit))
                              : Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    boolHasilJantung
                        ? _hasilJantung == null
                            ? listHasilPemeriksaan("", "", "", "", "")
                            : listHasilPemeriksaan(
                                _hasilJantung!.judul!,
                                _hasilJantung!.dokterApa!,
                                _hasilJantung!.namaDokter!,
                                _hasilJantung!.image! == "" ? "" : "[FOTO]",
                                _hasilJantung!.keterangan!)
                        : Container()
                  ],
                ),
              ),
        _pemeriksaan!.paru == ""
            ? Container()
            : Divider(
                thickness: 1,
              ),
        _pemeriksaan!.paru == ""
            ? Container()
            : Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolHasilParu = !boolHasilParu;
                          boolHasilFisik = false;
                          boolHasilGigiMulut = false;
                          boolHasilAudiometri = false;
                          boolHasilSpirometri = false;
                          boolHasilTreadmill = false;
                          boolHasilLaboratorium = false;
                          boolHasilJantung = false;
                          boolHasilMata = false;
                          boolHasilUsg = false;
                          boolHasilNapfa = false;
                          boolHasilNapza = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Hasil Pemeriksaan Paru", Colors.black,
                              14, FontWeight.normal),
                          boolHasilParu
                              ? InkWell(
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('detail1', "value");
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HasilPemeriksaanParu(
                                          idPasien: widget.idPasien);
                                    }));
                                  },
                                  child: Icon(Icons.edit))
                              : Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    boolHasilParu
                        ? _hasilParu == null
                            ? listHasilPemeriksaan("", "", "", "", "")
                            : listHasilPemeriksaan(
                                _hasilParu!.judul!,
                                _hasilParu!.dokterApa!,
                                _hasilParu!.namaDokter!,
                                _hasilParu!.image! == "" ? "" : "[FOTO]",
                                _hasilParu!.keterangan!)
                        : Container()
                  ],
                ),
              ),
        _pemeriksaan!.pemeriksaanUsg == ""
            ? Container()
            : Divider(
                thickness: 1,
              ),
        _pemeriksaan!.pemeriksaanUsg == ""
            ? Container()
            : Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolHasilUsg = !boolHasilUsg;
                          boolHasilNapfa = false;
                          boolHasilNapza = false;
                          boolHasilParu = false;
                          boolHasilFisik = false;
                          boolHasilGigiMulut = false;
                          boolHasilAudiometri = false;
                          boolHasilSpirometri = false;
                          boolHasilTreadmill = false;
                          boolHasilLaboratorium = false;
                          boolHasilJantung = false;
                          boolHasilMata = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Hasil Pemeriksaan USG", Colors.black, 14,
                              FontWeight.normal),
                          boolHasilUsg
                              ? InkWell(
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('detail1', "value");
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HasilPemeriksaanUsg(
                                          idPasien: widget.idPasien);
                                    }));
                                  },
                                  child: Icon(Icons.edit))
                              : Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    boolHasilUsg
                        ? _hasilUsg == null
                            ? listHasilPemeriksaanUSG(
                                "", "", "", "", "", "", "", "", "", "")
                            : listHasilPemeriksaanUSG(
                                _hasilUsg!.judul!,
                                _hasilUsg!.dokterApa!,
                                _hasilUsg!.namaDokter!,
                                _hasilUsg!.image1! == "" ? "" : "[FOTO]",
                                _hasilUsg!.image2! == "" ? "" : "[FOTO]",
                                _hasilUsg!.image3! == "" ? "" : "[FOTO]",
                                _hasilUsg!.image4! == "" ? "" : "[FOTO]",
                                _hasilUsg!.image5! == "" ? "" : "[FOTO]",
                                _hasilUsg!.image6! == "" ? "" : "[FOTO]",
                                _hasilUsg!.keterangan!)
                        : Container()
                  ],
                ),
              ),
        _pemeriksaan!.pemeriksaanNapfa == ""
            ? Container()
            : Divider(
                thickness: 1,
              ),
        _pemeriksaan!.pemeriksaanNapfa == ""
            ? Container()
            : Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolHasilNapfa = !boolHasilNapfa;
                          boolHasilUsg = false;
                          boolHasilNapza = false;
                          boolHasilFisik = false;
                          boolHasilParu = false;
                          boolHasilGigiMulut = false;
                          boolHasilAudiometri = false;
                          boolHasilSpirometri = false;
                          boolHasilTreadmill = false;
                          boolHasilLaboratorium = false;
                          boolHasilJantung = false;
                          boolHasilMata = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Hasil Pemeriksaan Napfa", Colors.black,
                              14, FontWeight.normal),
                          boolHasilNapfa
                              ? InkWell(
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('detail1', "value");
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HasilPemeriksaanNapfa(
                                          idPasien: widget.idPasien);
                                    }));
                                  },
                                  child: Icon(Icons.edit))
                              : Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    boolHasilNapfa
                        ? _hasilNapfa == null
                            ? listHasilPemeriksaan("", "", "", "", "")
                            : listHasilPemeriksaan(
                                _hasilNapfa!.judul!,
                                _hasilNapfa!.dokterApa!,
                                _hasilNapfa!.namaDokter!,
                                _hasilNapfa!.image! == "" ? "" : "[FOTO]",
                                _hasilNapfa!.keterangan!)
                        : Container()
                  ],
                ),
              ),
        _pemeriksaan!.pemeriksaanNapza == ""
            ? Container()
            : Divider(
                thickness: 1,
              ),
        _pemeriksaan!.pemeriksaanNapza == ""
            ? Container()
            : Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boolHasilNapza = !boolHasilNapza;
                          boolHasilNapfa = false;
                          boolHasilUsg = false;
                          boolHasilFisik = false;
                          boolHasilParu = false;
                          boolHasilGigiMulut = false;
                          boolHasilAudiometri = false;
                          boolHasilSpirometri = false;
                          boolHasilTreadmill = false;
                          boolHasilLaboratorium = false;
                          boolHasilJantung = false;
                          boolHasilMata = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textDefault("Hasil Pemeriksaan Napza", Colors.black,
                              14, FontWeight.normal),
                          boolHasilNapza
                              ? InkWell(
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('detail1', "value");
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HasilPemeriksaanNapza(
                                          idPasien: widget.idPasien);
                                    }));
                                  },
                                  child: Icon(Icons.edit))
                              : Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    boolHasilNapza
                        ? _hasilNapza == null
                            ? listHasilPemeriksaan("", "", "", "", "")
                            : listHasilPemeriksaan(
                                _hasilNapza!.judul!,
                                _hasilNapza!.dokterApa!,
                                _hasilNapza!.namaDokter!,
                                _hasilNapza!.image! == "" ? "" : "[FOTO]",
                                _hasilNapza!.keterangan!)
                        : Container()
                  ],
                ),
              ),
      ],
    );
  }

  Widget listHasilPemeriksaan(String judul, String dokterApa, String namaDokter,
      String foto, String keterangan) {
    return ListHasilPemeriksaan(
        judul: judul,
        dokterApa: dokterApa,
        namaDokter: namaDokter,
        foto: foto,
        keterangan: keterangan);
  }

  Widget listHasilPemeriksaanUSG(
      String judul,
      String dokterApa,
      String namaDokter,
      String foto1,
      String foto2,
      String foto3,
      String foto4,
      String foto5,
      String foto6,
      String keterangan) {
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
                    textDefault("Judul", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child:
                    textDefault("$judul", Colors.black, 12, FontWeight.normal),
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
                    "$dokterApa", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "$namaDokter", Colors.black, 12, FontWeight.normal),
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
                    textDefault("Foto1", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child:
                    textDefault("$foto1", Colors.black, 12, FontWeight.normal),
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
                    textDefault("Foto 2", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child:
                    textDefault("$foto2", Colors.black, 12, FontWeight.normal),
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
                    textDefault("Foto 3", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child:
                    textDefault("$foto3", Colors.black, 12, FontWeight.normal),
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
                    textDefault("Foto 4", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child:
                    textDefault("$foto4", Colors.black, 12, FontWeight.normal),
              ),
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
                    textDefault("Foto 5", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child:
                    textDefault("$foto5", Colors.black, 12, FontWeight.normal),
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
                    textDefault("Foto 6", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child:
                    textDefault("$foto6", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
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
                    "Keterangan", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    // _hasilFisik == null
                    //     ? ""
                    //     : boolHasilFisik
                    //         ? "${_hasilFisik!.keterangan}"
                    //         : _hasilMata == null
                    //             ? ""
                    //             : boolHasilMata
                    //                 ? "${_hasilMata!.keterangan}"
                    //                 : _hasilGigiMulut == null
                    //                     ? ""
                    //                     : boolHasilGigiMulut
                    //                         ? "${_hasilGigiMulut!.keterangan}"
                    //                         : _hasilAudiometri == null
                    //                             ? ""
                    //                             : boolHasilAudiometri
                    //                                 ? "${_hasilAudiometri!.keterangan}"
                    //                                 : _hasilSpirometri == null
                    //                                     ? ""
                    //                                     : boolHasilSpirometri
                    //                                         ? "${_hasilSpirometri!.keterangan}"
                    //                                         : _hasilTreadmill ==
                    //                                                 null
                    //                                             ? ""
                    //                                             : _hasilLaboratorium ==
                    //                                                     null
                    //                                                 ? ""
                    //                                                 : boolHasilLaboratorium
                    //                                                     ? "${_hasilLaboratorium!.keterangan}"
                    //                                                     : _hasilJantung ==
                    //                                                             null
                    //                                                         ? ""
                    //                                                         : _hasilJantung == null
                    //                                                             ? ""
                    //                                                             : boolHasilJantung
                    //                                                                 ? "${_hasilJantung!.keterangan}"
                    //                                                                 : _hasilParu == null
                    //                                                                     ? ""
                    //                                                                     : boolHasilParu
                    //                                                                         ? "${_hasilParu!.keterangan}"
                    //                                                                         : "",
                    "$keterangan",
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

  Widget listAnjuran() {
    return ListAnjuran(ajuran: _ajuran);
  }

  Widget listKesimpulanKelayakan() {
    return ListKesimpulanKelayakan(kelayakanKerja: _kelayakanKerja);
  }

  Widget listKesimpulanDerajat() {
    return ListKesimpulanDerajat(
        kesimpulanDerajatKesehatan: _kesimpulanDerajatKesehatan);
  }

  Widget listFotoLainLain() {
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
                    textDefault("Foto 1", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_fotoLainLain!.foto1 == "" ? "" : "[FOTO]"}",
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Foto 2", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_fotoLainLain!.foto2 == "" ? "" : "[FOTO]"}",
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Foto 3", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_fotoLainLain!.foto3 == "" ? "" : "[FOTO]"}",
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Foto 4", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_fotoLainLain!.foto4 == "" ? "" : "[FOTO]"}",
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Foto 5", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_fotoLainLain!.foto5 == "" ? "" : "[FOTO]"}",
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Foto 6", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_fotoLainLain!.foto6 == "" ? "" : "[FOTO]"}",
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Foto 7", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_fotoLainLain!.foto7 == "" ? "" : "[FOTO]"}",
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Foto 8", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_fotoLainLain!.foto8 == "" ? "" : "[FOTO]"}",
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Foto 9", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_fotoLainLain!.foto9 == "" ? "" : "[FOTO]"}",
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
}
