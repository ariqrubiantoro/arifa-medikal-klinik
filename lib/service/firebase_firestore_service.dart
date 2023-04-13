import 'package:arifa_medikal_klink_3/model/pasien_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_gentalia_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_mata_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_tht_model.dart';
import 'package:arifa_medikal_klink_3/model/penyakit_keluarga_mode.dart';
import 'package:arifa_medikal_klink_3/model/penyakit_terdahulu_model.dart';
import 'package:arifa_medikal_klink_3/model/riwayat_kebiasaan_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/keluhan_sekarang_4_8/keadaan_umum/pemeriksaan_gentalia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
}
