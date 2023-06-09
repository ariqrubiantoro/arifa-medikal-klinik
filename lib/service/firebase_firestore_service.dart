import 'package:arifa_medikal_klink_3/model/foto_lain_lain_model.dart';
import 'package:arifa_medikal_klink_3/model/fotolainlain_new_model.dart';
import 'package:arifa_medikal_klink_3/model/hasil_pemeriksaan/hasil_pemeriksaan_laboratorium_model.dart';
import 'package:arifa_medikal_klink_3/model/hasil_pemeriksaan/hasil_pemeriksaan_model.dart';
import 'package:arifa_medikal_klink_3/model/hasil_pemeriksaan/hasil_pemeriksaan_usg_model.dart';
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
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_fisik.dart';
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

  // Future<PasienModel> setPasien(PasienModel pasien) async {
  //   DocumentReference doc = firestore.collection('pasien').doc(pasien.id);
  //   pasien.id = doc.id;

  //   await doc.set(pasien.toJson());

  //   return pasien;
  // }
  Future<PasienModel> setPasien(PasienModel pasien, String idPasien) async {
    if (idPasien == '') {
      DocumentReference doc = firestore.collection('pasien').doc(pasien.id);
      pasien.id = doc.id;
      await doc.set(pasien.toJson());
    } else {
      pasien.id = idPasien;
      DocumentReference doc = firestore.collection('pasien').doc(pasien.id);
      await doc.set(pasien.toJson());
    }

    return pasien;
  }

  Future<PasienModel?> getPasien(String idPasien) async {
    DocumentReference doc = firestore.collection('pasien').doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();

    if (snapshot.data() == null) {
      return null;
    } else {
      print(snapshot.data());
      return PasienModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<PenyakitTerdahuluModel> setPenyakitTerdahulu(
      PenyakitTerdahuluModel penyakitTerdahulu, String idPasien) async {
    DocumentReference doc =
        firestore.collection('penyakitTerdahulu').doc(idPasien);

    await doc.set(penyakitTerdahulu.toJson());

    return penyakitTerdahulu;
  }

  Future<PenyakitTerdahuluModel?> getPenyakitTerdahulu(String idPasien) async {
    DocumentReference doc =
        firestore.collection('penyakitTerdahulu').doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();

    if (snapshot.data() == null) {
      return null;
    } else {
      return PenyakitTerdahuluModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<PenyakitKeluargaModel> setPenyakitKeluarga(
      PenyakitKeluargaModel penyakitKeluarga, String idPasien) async {
    DocumentReference doc =
        firestore.collection('penyakitKeluarga').doc(idPasien);

    await doc.set(penyakitKeluarga.toJson());

    return penyakitKeluarga;
  }

  Future<PenyakitKeluargaModel?> getPenyakitKeluarga(String idPasien) async {
    DocumentReference doc =
        firestore.collection('penyakitKeluarga').doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return PenyakitKeluargaModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<RiwayatKebiasaanModel> setRiwayatKebiasaan(
      RiwayatKebiasaanModel riwayatKebiasaan, String idPasien) async {
    DocumentReference doc =
        firestore.collection('riwayatKebiasaan').doc(idPasien);

    await doc.set(riwayatKebiasaan.toJson());

    return riwayatKebiasaan;
  }

  Future<RiwayatKebiasaanModel?> getRiwayatKebiasaan(String idPasien) async {
    DocumentReference doc =
        firestore.collection('riwayatKebiasaan').doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();

    if (snapshot.data() == null) {
      return null;
    } else {
      return RiwayatKebiasaanModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
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

  Future<PemeriksaanUmumModel?> getPemeriksaanUmum(String idPasien) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanUmum')
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();

    if (snapshot.data() == null) {
      return null;
    } else {
      return PemeriksaanUmumModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
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

  Future<PemeriksaanMataModel?> getPemeriksaanMata(String idPasien) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanMata')
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return PemeriksaanMataModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
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

  Future<PemeriksaanTHTModel?> getPemeriksaanTHT(String idPasien) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanTHT')
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return PemeriksaanTHTModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
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

  Future<PemeriksaanRonggaDadaModel?> getPemeriksaanRonggaDada(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanRonggaDada')
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return PemeriksaanRonggaDadaModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
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

  Future<PemeriksaanRonggaPerutModel?> getPemeriksaanRonggaPerut(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanRonggaPerut')
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return PemeriksaanRonggaPerutModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
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

  Future<PemeriksaanGentaliaModel?> getPemeriksaanGentalia(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanGentalia')
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return PemeriksaanGentaliaModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
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

  Future<PemeriksaanAnggotaGerakModel?> getPemeriksaanAnggotaGerak(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanAnggotaGerak')
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return PemeriksaanAnggotaGerakModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
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

  Future<PemeriksaanRefleksModel?> getPemeriksaanRefleks(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanRefleks')
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return PemeriksaanRefleksModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
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

  Future<PemeriksaanKelenjarGetahModel?> getPemeriksaanKelenjarGetah(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanKelenjarGetah')
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return PemeriksaanKelenjarGetahModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
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

  Future<FisikModel?> getFisik(String idPasien) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('riwayatPajananPadaPekerjaan')
        .collection('fisik')
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return FisikModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
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

  Future<KimiaModel?> getKimia(String idPasien) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('riwayatPajananPadaPekerjaan')
        .collection('kimia')
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return KimiaModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
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

  Future<BiologiModel?> getBiologi(String idPasien) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('riwayatPajananPadaPekerjaan')
        .collection('biologi')
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return BiologiModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
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

  Future<PsikologiModel?> getPsikologi(String idPasien) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('riwayatPajananPadaPekerjaan')
        .collection('psikologi')
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return PsikologiModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
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

  Future<ErgonomisModel?> getErgonomis(String idPasien) async {
    DocumentReference doc = firestore
        .collection('keluhan')
        .doc('riwayatPajananPadaPekerjaan')
        .collection('ergonomis')
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return ErgonomisModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<PemeriksaanModel> setPemeriksaan(
      {required PemeriksaanModel pemeriksaan, required String idPasien}) async {
    DocumentReference doc = firestore.collection('pemeriksaan').doc(idPasien);

    await doc.set(pemeriksaan.toJson());

    return pemeriksaan;
  }

  Future<PemeriksaanModel?> getPemeriksaan(String idPasien) async {
    DocumentReference doc = firestore.collection('pemeriksaan').doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return PemeriksaanModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<HasilPemeriksaanModel> setHasilPemeriksaanFisik(
      {required HasilPemeriksaanModel pemeriksaan,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Fisik")
        .doc(idPasien);

    await doc.set(pemeriksaan.toJson());

    return pemeriksaan;
  }

  Future<HasilPemeriksaanModel?> getHasilPemeriksaanFisik(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Fisik")
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return HasilPemeriksaanModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<HasilPemeriksaanModel> setHasilPemeriksaanMata(
      {required HasilPemeriksaanModel pemeriksaan,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Mata")
        .doc(idPasien);

    await doc.set(pemeriksaan.toJson());

    return pemeriksaan;
  }

  Future<HasilPemeriksaanModel?> getHasilPemeriksaanMata(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Mata")
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return HasilPemeriksaanModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<HasilPemeriksaanModel> setHasilPemeriksaanGigi(
      {required HasilPemeriksaanModel pemeriksaan,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Gigi")
        .doc(idPasien);

    await doc.set(pemeriksaan.toJson());

    return pemeriksaan;
  }

  Future<HasilPemeriksaanModel?> getHasilPemeriksaanGigi(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Gigi")
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return HasilPemeriksaanModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<HasilPemeriksaanModel> setHasilPemeriksaanAudiometri(
      {required HasilPemeriksaanModel pemeriksaan,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Audiometri")
        .doc(idPasien);

    await doc.set(pemeriksaan.toJson());

    return pemeriksaan;
  }

  Future<HasilPemeriksaanModel?> getHasilPemeriksaanAudiometri(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Audiometri")
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return HasilPemeriksaanModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<HasilPemeriksaanModel> setHasilPemeriksaanSpirometri(
      {required HasilPemeriksaanModel pemeriksaan,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Spirometri")
        .doc(idPasien);

    await doc.set(pemeriksaan.toJson());

    return pemeriksaan;
  }

  Future<HasilPemeriksaanModel?> getHasilPemeriksaanSpirometri(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Spirometri")
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return HasilPemeriksaanModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<HasilPemeriksaanModel> setHasilPemeriksaanTreadmill(
      {required HasilPemeriksaanModel pemeriksaan,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Treadmill")
        .doc(idPasien);

    await doc.set(pemeriksaan.toJson());

    return pemeriksaan;
  }

  Future<HasilPemeriksaanModel?> getHasilPemeriksaanTreadmill(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Treadmill")
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return HasilPemeriksaanModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<HasilPemeriksaanModel> setHasilPemeriksaanLaboratorium(
      {required HasilPemeriksaanModel pemeriksaan,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Laboratorium")
        .doc(idPasien);

    await doc.set(pemeriksaan.toJson());

    return pemeriksaan;
  }

  Future<HasilPemeriksaanModel?> getHasilPemeriksaanLaboratorium(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Laboratorium")
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return HasilPemeriksaanModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<HasilPemeriksaanLaboratoriumModel> setHasilPemeriksaanLaboratorium1(
      {required HasilPemeriksaanLaboratoriumModel pemeriksaan,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Laboratorium1")
        .doc(idPasien);

    await doc.set(pemeriksaan.toJson());

    return pemeriksaan;
  }

  Future<HasilPemeriksaanLaboratoriumModel?> getHasilPemeriksaanLaboratorium1(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Laboratorium1")
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return HasilPemeriksaanLaboratoriumModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<HasilPemeriksaanModel> setHasilPemeriksaanJantung(
      {required HasilPemeriksaanModel pemeriksaan,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Jantung")
        .doc(idPasien);

    await doc.set(pemeriksaan.toJson());

    return pemeriksaan;
  }

  Future<HasilPemeriksaanModel?> getHasilPemeriksaanJantung(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Jantung")
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return HasilPemeriksaanModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<HasilPemeriksaanModel> setHasilPemeriksaanParu(
      {required HasilPemeriksaanModel pemeriksaan,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Paru")
        .doc(idPasien);

    await doc.set(pemeriksaan.toJson());

    return pemeriksaan;
  }

  Future<HasilPemeriksaanModel?> getHasilPemeriksaanParu(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Paru")
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return HasilPemeriksaanModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<HasilPemeriksaanUSGModel> setHasilPemeriksaanUsg(
      {required HasilPemeriksaanUSGModel pemeriksaan,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Usg")
        .doc(idPasien);

    await doc.set(pemeriksaan.toJson());

    return pemeriksaan;
  }

  Future<HasilPemeriksaanUSGModel?> getHasilPemeriksaanUsg(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Usg")
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return HasilPemeriksaanUSGModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<HasilPemeriksaanModel> setHasilPemeriksaanNapfa(
      {required HasilPemeriksaanModel pemeriksaan,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Napfa")
        .doc(idPasien);

    await doc.set(pemeriksaan.toJson());

    return pemeriksaan;
  }

  Future<HasilPemeriksaanModel?> getHasilPemeriksaanNapfa(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Napfa")
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return HasilPemeriksaanModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<HasilPemeriksaanModel> setHasilPemeriksaanNapza(
      {required HasilPemeriksaanModel pemeriksaan,
      required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Napza")
        .doc(idPasien);

    await doc.set(pemeriksaan.toJson());

    return pemeriksaan;
  }

  Future<HasilPemeriksaanModel?> getHasilPemeriksaanNapza(
      String idPasien) async {
    DocumentReference doc = firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Napza")
        .doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return HasilPemeriksaanModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<AjuranModel> setAjuran(
      {required AjuranModel ajuran, required String idPasien}) async {
    DocumentReference doc = firestore.collection('ajuran').doc(idPasien);

    await doc.set(ajuran.toJson());

    return ajuran;
  }

  Future<AjuranModel?> getAjuran(String idPasien) async {
    DocumentReference doc = firestore.collection('ajuran').doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return AjuranModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<KelayakanKerjaModel> setKelayakanKerja(
      {required KelayakanKerjaModel kelayakanKerja,
      required String idPasien}) async {
    DocumentReference doc =
        firestore.collection('kelayakanKerja').doc(idPasien);

    await doc.set(kelayakanKerja.toJson());

    return kelayakanKerja;
  }

  Future<KelayakanKerjaModel?> getKelayakanKerja(String idPasien) async {
    DocumentReference doc =
        firestore.collection('kelayakanKerja').doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return KelayakanKerjaModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<KesimpulanDerajatKesehatanModel> setKesimpulanDerajatKesehatan(
      {required KesimpulanDerajatKesehatanModel kesimpulanDerajatKesehatan,
      required String idPasien}) async {
    DocumentReference doc =
        firestore.collection('kesimpulanDerajatKesehatan').doc(idPasien);

    await doc.set(kesimpulanDerajatKesehatan.toJson());

    return kesimpulanDerajatKesehatan;
  }

  Future<KesimpulanDerajatKesehatanModel?> getKesimpulanDerajatKesehatan(
      String idPasien) async {
    DocumentReference doc =
        firestore.collection('kesimpulanDerajatKesehatan').doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return KesimpulanDerajatKesehatanModel.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<FotoLainLain> setFotoLainLain(
      {required FotoLainLain fotoLain, required String idPasien}) async {
    DocumentReference doc = firestore.collection('fotoLainLain').doc(idPasien);

    await doc.set(fotoLain.toJson());

    return fotoLain;
  }

  Future<FotoLainLainNew> setFotoLainLain12(
      {required FotoLainLainNew fotoLain, required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('fotoLainLain')
        .doc(idPasien)
        .collection('foto')
        .doc('foto1-2');

    await doc.set(fotoLain.toJson());

    return fotoLain;
  }

  Future<FotoLainLainNew?> getFotoLainLain12(String idPasien) async {
    DocumentReference doc = firestore
        .collection('fotoLainLain')
        .doc(idPasien)
        .collection('foto')
        .doc('foto1-2');
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return FotoLainLainNew.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<FotoLainLainNew> setFotoLainLain34(
      {required FotoLainLainNew fotoLain, required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('fotoLainLain')
        .doc(idPasien)
        .collection('foto')
        .doc('foto3-4');

    await doc.set(fotoLain.toJson());

    return fotoLain;
  }

  Future<FotoLainLainNew?> getFotoLainLain34(String idPasien) async {
    DocumentReference doc = firestore
        .collection('fotoLainLain')
        .doc(idPasien)
        .collection('foto')
        .doc('foto3-4');
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return FotoLainLainNew.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<FotoLainLainNew> setFotoLainLain56(
      {required FotoLainLainNew fotoLain, required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('fotoLainLain')
        .doc(idPasien)
        .collection('foto')
        .doc('foto5-6');

    await doc.set(fotoLain.toJson());

    return fotoLain;
  }

  Future<FotoLainLainNew?> getFotoLainLain56(String idPasien) async {
    DocumentReference doc = firestore
        .collection('fotoLainLain')
        .doc(idPasien)
        .collection('foto')
        .doc('foto5-6');
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return FotoLainLainNew.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<FotoLainLainNew> setFotoLainLain78(
      {required FotoLainLainNew fotoLain, required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('fotoLainLain')
        .doc(idPasien)
        .collection('foto')
        .doc('foto7-8');

    await doc.set(fotoLain.toJson());

    return fotoLain;
  }

  Future<FotoLainLainNew?> getFotoLainLain78(String idPasien) async {
    DocumentReference doc = firestore
        .collection('fotoLainLain')
        .doc(idPasien)
        .collection('foto')
        .doc('foto7-8');
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return FotoLainLainNew.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<FotoLainLainNew> setFotoLainLain9(
      {required FotoLainLainNew fotoLain, required String idPasien}) async {
    DocumentReference doc = firestore
        .collection('fotoLainLain')
        .doc(idPasien)
        .collection('foto')
        .doc('foto9');

    await doc.set(fotoLain.toJson());

    return fotoLain;
  }

  Future<FotoLainLainNew?> getFotoLainLain9(String idPasien) async {
    DocumentReference doc = firestore
        .collection('fotoLainLain')
        .doc(idPasien)
        .collection('foto')
        .doc('foto9');
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return FotoLainLainNew.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }

  Future<FotoLainLain?> getFotoLainLain(String idPasien) async {
    DocumentReference doc = firestore.collection('fotoLainLain').doc(idPasien);
    DocumentSnapshot snapshot = await doc.get();
    if (snapshot.data() == null) {
      return null;
    } else {
      return FotoLainLain.fromJson(
          snapshot.id, snapshot.data() as Map<String, dynamic>);
    }
  }
}
