import 'package:arifa_medikal_klink_3/model/pasien_model.dart';
import 'package:arifa_medikal_klink_3/model/penyakit_keluarga_mode.dart';
import 'package:arifa_medikal_klink_3/model/penyakit_terdahulu_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
}
