import 'package:arifa_medikal_klink_3/model/pasien_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_anggota_gerak_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_gentalia_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_mata_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_refleks_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_tht_model.dart';
import 'package:arifa_medikal_klink_3/model/penyakit_keluarga_mode.dart';
import 'package:arifa_medikal_klink_3/model/penyakit_terdahulu_model.dart';
import 'package:arifa_medikal_klink_3/model/psikologi_model.dart';
import 'package:arifa_medikal_klink_3/model/riwayat_kebiasaan_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/ajuran_model.dart';
import '../model/biologi_model.dart';
import '../model/ergonomis_model.dart';
import '../model/fisik_model.dart';
import '../model/kelayakan_kerja_model.dart';
import '../model/kesimpulan_derajat_kesehatan.dart';
import '../model/kimia_model.dart';
import '../model/pemeriksaan_kelenjar_getah_model.dart';
import '../model/pemeriksaan_model.dart';
import '../model/pemeriksaan_rongga_dada_model.dart';
import '../model/pemeriksaan_rongga_perut_model.dart';
import '../model/pemeriksaan_umum_model.dart';

class FirebaseFirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<PasienModel> setPasien(PasienModel pasien) async {
    DocumentReference doc = firestore.collection('pasien').doc(pasien.id);
    pasien.id = doc.id;

    await doc.set(pasien.toJson());

    return pasien;
  }

  Future<PenyakitTerdahuluModel> setPenyakitTerdahulu(
      PenyakitTerdahuluModel penyakitTerdahulu, String idPasien) async {
    DocumentReference doc =
        firestore.collection('penyakitTerdahulu').doc(idPasien);

    await doc.set(penyakitTerdahulu.toJson());

    return penyakitTerdahulu;
  }

  Future<PenyakitTerdahuluModel> getPenyakitTerdahulu(String idPasien) async {
    DocumentReference doc =
        firestore.collection('penyakitTerdahulu').doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();

    return PenyakitTerdahuluModel.fromJson(
        snapshot.id, snapshot.data() as Map<String, dynamic>);
  }

  Future<PenyakitKeluargaModel> setPenyakitKeluarga(
      PenyakitKeluargaModel penyakitKeluarga, String idPasien) async {
    DocumentReference doc =
        firestore.collection('penyakitKeluarga').doc(idPasien);

    await doc.set(penyakitKeluarga.toJson());

    return penyakitKeluarga;
  }

  Future<RiwayatKebiasaanModel> setRiwayatKebiasaan(
      RiwayatKebiasaanModel riwayatKebiasaan, String idPasien) async {
    DocumentReference doc =
        firestore.collection('riwayatKebiasaan').doc(idPasien);

    await doc.set(riwayatKebiasaan.toJson());

    return riwayatKebiasaan;
  }

  Future<PemeriksaanUmumModel> setPemeriksaanUmum(
      {required PemeriksaanUmumModel pemeriksaanUmum,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanUmum')
        .doc(idPasien);

    await doc.set(pemeriksaanUmum.toJson());

    return pemeriksaanUmum;
  }

  Future<PemeriksaanMataModel> setPemeriksaanMata(
      {required PemeriksaanMataModel pemeriksaanMata,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanMata')
        .doc(idPasien);

    await doc.set(pemeriksaanMata.toJson());

    return pemeriksaanMata;
  }

  Future<PemeriksaanTHTModel> setPemeriksaanTHT(
      {required PemeriksaanTHTModel pemeriksaanTHT,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanTHT')
        .doc(idPasien);

    await doc.set(pemeriksaanTHT.toJson());

    return pemeriksaanTHT;
  }

  Future<PemeriksaanRonggaDadaModel> setPemeriksaanRonggaDada(
      {required PemeriksaanRonggaDadaModel pemeriksaanRonggaDada,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanRonggaDada')
        .doc(idPasien);

    await doc.set(pemeriksaanRonggaDada.toJson());

    return pemeriksaanRonggaDada;
  }

  Future<PemeriksaanRonggaPerutModel> setPemeriksaanRonggaPerut(
      {required PemeriksaanRonggaPerutModel pemeriksaanRonggaPerut,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanRonggaPerut')
        .doc(idPasien);

    await doc.set(pemeriksaanRonggaPerut.toJson());

    return pemeriksaanRonggaPerut;
  }

  Future<PemeriksaanGentaliaModel> setPemeriksaanGentalia(
      {required PemeriksaanGentaliaModel pemeriksaanGentalia,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanGentalia')
        .doc(idPasien);

    await doc.set(pemeriksaanGentalia.toJson());

    return pemeriksaanGentalia;
  }

  Future<PemeriksaanAnggotaGerakModel> setPemeriksaanAnggotaGerak(
      {required PemeriksaanAnggotaGerakModel pemeriksaanAnggotaGerak,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanAnggotaGerak')
        .doc(idPasien);

    await doc.set(pemeriksaanAnggotaGerak.toJson());

    return pemeriksaanAnggotaGerak;
  }

  Future<PemeriksaanRefleksModel> setPemeriksaanRefleks(
      {required PemeriksaanRefleksModel pemeriksaanRefleks,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanRefleks')
        .doc(idPasien);

    await doc.set(pemeriksaanRefleks.toJson());

    return pemeriksaanRefleks;
  }

  Future<PemeriksaanKelenjarGetahModel> setPemeriksaanKelenjarGetah(
      {required PemeriksaanKelenjarGetahModel pemeriksaanKelenjarGetah,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanKelenjarGetah')
        .doc(idPasien);

    await doc.set(pemeriksaanKelenjarGetah.toJson());

    return pemeriksaanKelenjarGetah;
  }

  Future<FisikModel> setFisik(
      {required FisikModel fisik, required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('riwayatPajananPadaPekerjaan')
        .collection('fisik')
        .doc(idPasien);

    await doc.set(fisik.toJson());

    return fisik;
  }

  Future<KimiaModel> setKimia(
      {required KimiaModel kimia, required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('riwayatPajananPadaPekerjaan')
        .collection('kimia')
        .doc(idPasien);

    await doc.set(kimia.toJson());

    return kimia;
  }

  Future<BiologiModel> setBiologi(
      {required BiologiModel biologi, required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('riwayatPajananPadaPekerjaan')
        .collection('biologi')
        .doc(idPasien);

    await doc.set(biologi.toJson());

    return biologi;
  }

  Future<PsikologiModel> setPsikologi(
      {required PsikologiModel psikologi, required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('riwayatPajananPadaPekerjaan')
        .collection('psikologi')
        .doc(idPasien);

    await doc.set(psikologi.toJson());

    return psikologi;
  }

  Future<ErgonomisModel> setErgonomis(
      {required ErgonomisModel ergonomis, required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('riwayatPajananPadaPekerjaan')
        .collection('ergonomis')
        .doc(idPasien);

    await doc.set(ergonomis.toJson());

    return ergonomis;
  }

  Future<PemeriksaanModel> setPemeriksaan(
      {required PemeriksaanModel pemeriksaan, required String idPasien}) async {
    DocumentReference doc = firestore.collection('pemeriksaan').doc(idPasien);

    await doc.set(pemeriksaan.toJson());

    return pemeriksaan;
  }

  Future<AjuranModel> setAjuran(
      {required AjuranModel ajuran, required String idPasien}) async {
    DocumentReference doc = firestore.collection('ajuran').doc(idPasien);

    await doc.set(ajuran.toJson());

    return ajuran;
  }

  Future<KelayakanKerjaModel> setKelayakanKerja(
      {required KelayakanKerjaModel kelayakanKerja,
      required String idPasien}) async {
    DocumentReference doc =
        firestore.collection('kelayakanKerja').doc(idPasien);

    await doc.set(kelayakanKerja.toJson());

    return kelayakanKerja;
  }

  Future<KesimpulanDerajatKesehatanModel> setKesimpulanDerajatKesehatan(
      {required KesimpulanDerajatKesehatanModel kesimpulanDerajatKesehatan,
      required String idPasien}) async {
    DocumentReference doc =
        firestore.collection('kesimpulanDerajatKesehatan').doc(idPasien);

    await doc.set(kesimpulanDerajatKesehatan.toJson());

    return kesimpulanDerajatKesehatan;
  }
}
