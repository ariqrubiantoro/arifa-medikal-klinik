// ignore_for_file: prefer_const_constructors

import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/add_pasien_profil.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/anjuran_6_8.dart';
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
import 'package:arifa_medikal_klink_3/screens/formulir/form1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/widget/text.dart';
import '../model/ajuran_model.dart';
import '../model/biologi_model.dart';
import '../model/ergonomis_model.dart';
import '../model/fisik_model.dart';
import '../model/kelayakan_kerja_model.dart';
import '../model/kesimpulan_derajat_kesehatan.dart';
import '../model/kimia_model.dart';
import '../model/pemeriksaan_anggota_gerak_model.dart';
import '../model/pemeriksaan_gentalia_model.dart';
import '../model/pemeriksaan_kelenjar_getah_model.dart';
import '../model/pemeriksaan_mata_model.dart';
import '../model/pemeriksaan_model.dart';
import '../model/pemeriksaan_refleks_model.dart';
import '../model/pemeriksaan_rongga_dada_model.dart';
import '../model/pemeriksaan_rongga_perut_model.dart';
import '../model/pemeriksaan_tht_model.dart';
import '../model/pemeriksaan_umum_model.dart';
import '../model/penyakit_keluarga_mode.dart';
import '../model/penyakit_terdahulu_model.dart';
import '../model/psikologi_model.dart';
import '../model/riwayat_kebiasaan_model.dart';
import '../service/firebase_firestore_service.dart';

class MenuUtama extends StatefulWidget {
  const MenuUtama({super.key});

  @override
  State<MenuUtama> createState() => _MenuUtamaState();
}

class _MenuUtamaState extends State<MenuUtama> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
        actions: [
          DropdownButton(
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(children: <Widget>[
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Logout')
                  ]),
                ),
                value: 'logout',
              )
            ],
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onChanged: (itemIdentifier) {
              FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('pasien').snapshots(),
        builder: (context, pasienSnapshot) {
          if (pasienSnapshot.hasError) {
            return Text('Something went wrong');
          }
          if (pasienSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final listPasien = pasienSnapshot.data!.docs;
          return ListView.builder(
            itemCount: listPasien.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot pasienSnapshots =
                  pasienSnapshot.data!.docs[index];
              return InkWell(
                onTap: () {
                  cekData(pasienSnapshots.id, pasienSnapshots);
                },
                onLongPress: () => showDialogDelete(pasienSnapshots.id),
                child: Card(
                  child: Column(children: [
                    Text(pasienSnapshots['namaPasien']),
                    Text(pasienSnapshots['NIK'])
                  ]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return AddPasienProfil();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showDialogDelete(String id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actionsPadding: EdgeInsets.all(10),
          title: Container(
            child: Icon(
              Icons.delete_outline,
              color: Colors.red,
              size: 70,
            ),
          ),
          content: Text(
            "Apakah Anda yakin ingin\nmenghapus data?",
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
                  onTap: () {
                    setState(() {
                      firestore.deletePasien(id);
                      Navigator.of(context).pop();
                      // .then((value) => Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => MenuUtama(),
                      //     ),
                      //     (route) => false));
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: textDefault(
                            "Ya, Hapus", Colors.white, 14, FontWeight.bold),
                      )),
                )),
              ],
            )
          ],
        );
      },
    );
  }

  cekData(String id, DocumentSnapshot pasienSnapshots) async {
    _penyakitTerdahulu = await firestore.getPenyakitTerdahulu(id);
    _penyakitKeluarga = await firestore.getPenyakitKeluarga(id);
    _riwayatKebiasaan = await firestore.getRiwayatKebiasaan(id);
    _pemeriksaanUmum = await firestore.getPemeriksaanUmum(id);
    _pemeriksaanMata = await firestore.getPemeriksaanMata(id);
    _pemeriksaanTHT = await firestore.getPemeriksaanTHT(id);

    _pemeriksaanRonggaDada = await firestore.getPemeriksaanRonggaDada(id);
    _pemeriksaanRonggaPerut = await firestore.getPemeriksaanRonggaPerut(id);
    _pemeriksaanGentalia = await firestore.getPemeriksaanGentalia(id);
    _pemeriksaanAnggotaGerak = await firestore.getPemeriksaanAnggotaGerak(id);
    _pemeriksaanRefleks = await firestore.getPemeriksaanRefleks(id);
    _pemeriksaanKelenjarGetah = await firestore.getPemeriksaanKelenjarGetah(id);
    _fisik = await firestore.getFisik(id);
    _kimia = await firestore.getKimia(id);
    _biologi = await firestore.getBiologi(id);
    _psikologi = await firestore.getPsikologi(id);
    _ergonomis = await firestore.getErgonomis(id);
    _pemeriksaan = await firestore.getPemeriksaan(id);
    _ajuran = await firestore.getAjuran(id);
    _kelayakanKerja = await firestore.getKelayakanKerja(id);
    _kesimpulanDerajatKesehatan =
        await firestore.getKesimpulanDerajatKesehatan(id);

    // setState(() {});

    if (_penyakitTerdahulu == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return PenyakitTerdahulu1(
          idPasien: id,
        );
      }));
    } else if (_penyakitKeluarga == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return PenyakitKeluarga(
          idPasien: id,
        );
      }));
    } else if (_riwayatKebiasaan == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return RiwwayatKebiasaan3(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanUmum == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return PemeriksaanUmum(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanMata == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return PemeriksaanMata(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanTHT == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return PemeriksaanTHT(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanRonggaDada == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return PemeriksaanRonggaDada(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanRonggaPerut == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return PemeriksaanRonggaPerut(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanGentalia == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return PemeriksaanGentalia(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanAnggotaGerak == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return PemeriksaanAnggotaGerak(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanRefleks == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return PemeriksaanRefleks(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanKelenjarGetah == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return PemeriksaanKelenjarGetah(
          idPasien: id,
        );
      }));
    } else if (_fisik == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return Fisik(
          idPasien: id,
        );
      }));
    } else if (_kimia == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return Kimia(
          pasienId: id,
        );
      }));
    } else if (_biologi == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return Biologi(
          idPasien: id,
        );
      }));
    } else if (_psikologi == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return Psikologis(
          idPasien: id,
        );
      }));
    } else if (_ergonomis == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return Ergonomis(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaan == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return Pemeriksaan5(
          idPasien: id,
        );
      }));
    } else if (_ajuran == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return Anjuran6(
          idPasien: id,
        );
      }));
    } else if (_kelayakanKerja == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return KesimpulanKelayakan7(
          idPasien: id,
        );
      }));
    } else if (_kesimpulanDerajatKesehatan == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return KesimpulanDerajat8(
          idPasien: id,
        );
      }));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return DetailPasien(pasienSnapshots: pasienSnapshots);
      }));
    }
  }
}
