// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/add_pasien_profil.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/pasien_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final searchConn = TextEditingController();
  List dataPasien2 = [];

  List _allResults = [];
  List _resultsList = [];

  @override
  void initState() {
    searchConn.addListener(onSearchChanged);
    super.initState();
  }

  onSearchChanged() {
    print(searchConn.text);
    searchResultList();
  }

  searchResultList() {
    var showResult = [];
    if (searchConn.text != "") {
      for (var i in _allResults) {
        var name = i['namaPasien'].toString().toLowerCase();
        if (name.contains(searchConn.text.toLowerCase())) {
          setState(() {
            showResult.add(i);
          });
        }
      }
      setState(() {
        _resultsList = showResult;
      });
    } else {
      setState(() {
        _resultsList = _allResults;
        print(_resultsList);
      });
    }
  }

  @override
  void dispose() {
    searchConn.removeListener(onSearchChanged);
    searchConn.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  getClientStream() async {
    FirebaseFirestore.instance
        .collection('pasien')
        .orderBy('waktu', descending: true)
        .get()
        .then((value) {
      setState(() {
        _allResults = value.docs;
        _resultsList = _allResults;
      });
    });
    searchResultList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textDefault("Main Menu", Colors.white, 18, FontWeight.bold),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchConn,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontFamily: 'poppins'),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Cari pasien disini..."),
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: List.generate(_resultsList.length, (index) {
                var data = _resultsList[index];
                print(data);
                return InkWell(
                  onTap: () {
                    cekData(data.id, "${data['NIK']}", data);
                  },
                  onLongPress: () => showDialogDelete(data.id),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 1)
                        ]),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_outline_rounded,
                          size: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textDefault(data['namaPasien'], Colors.black, 14,
                                  FontWeight.normal),
                              textDefault(data['NIK'], Colors.black, 14,
                                  FontWeight.normal),
                              textDefault(data['waktu'], Colors.grey, 10,
                                  FontWeight.normal)
                            ]),
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
      // body: StreamBuilder<QuerySnapshot>(
      //   stream: FirebaseFirestore.instance
      //       .collection('pasien')
      //       .orderBy('waktu', descending: true)
      //       .snapshots(),
      //   builder: (context, pasienSnapshot) {
      //     if (pasienSnapshot.hasError) {
      //       return Text('Something went wrong');
      //     }
      //     if (pasienSnapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: Container(),
      //       );
      //     }
      //     var listPasien = pasienSnapshot.data!.docs;
      //     return SingleChildScrollView(
      //       child: Column(
      //         children: [
      //           Container(
      //             margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      //             padding: EdgeInsets.symmetric(horizontal: 10),
      //             decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 border: Border.all(color: Colors.grey),
      //                 borderRadius: BorderRadius.circular(10)),
      //             child: Row(
      //               children: [
      //                 Icon(Icons.search),
      //                 SizedBox(
      //                   width: 10,
      //                 ),
      //                 Expanded(
      //                     child: TextFormField(
      //                   controller: searchConn,
      //                   style: TextStyle(fontFamily: 'poppins'),
      //                   decoration: InputDecoration(
      //                       border: InputBorder.none,
      //                       hintText: "Cari pasien disini..."),
      //                   onChanged: (value) {
      //                     setState(() {
      //                       searchConn.text = value;
      //                     });
      //                   },
      //                 ))
      //               ],
      //             ),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Column(
      //             children: List.generate(listPasien.length, (index) {

      //             }),
      //           )
      //         ],
      //       ),
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return AddPasienProfil(
              idPasien: "",
            );
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
                      deletePasien(id, setState);
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

  cekData(String id, String nik, DocumentSnapshot pasienSnapshots) async {
    Map<String, dynamic>? userMap;
    String idPasien = "";
    String nohpCek = "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final db = FirebaseFirestore.instance;
    await db
        .collection('pasien')
        .where('NIK', isEqualTo: nik)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        nohpCek = userMap!['no_hp'];
      });
    });
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
    if (userMap!['namaPasien'] == "") {
      prefs.setString('nikUser', userMap!['NIK']);
    } else if (_penyakitTerdahulu == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_penyakitKeluarga == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_riwayatKebiasaan == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanUmum == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanMata == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanTHT == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanRonggaDada == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanRonggaPerut == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanGentalia == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanAnggotaGerak == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanRefleks == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaanKelenjarGetah == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_fisik == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_kimia == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_biologi == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_psikologi == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_ergonomis == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_pemeriksaan == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_ajuran == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_kelayakanKerja == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else if (_kesimpulanDerajatKesehatan == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MenuForm(
          idPasien: id,
        );
      }));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return PasienDetail(
          idPasien: id,
        );
      }));
    }
  }

  Future<dynamic> deletePasien(String idPasien, Function setState) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection('pasien').doc(idPasien).delete();
    await firestore.collection('penyakitTerdahulu').doc(idPasien).delete();
    await firestore.collection('riwayatKebiasaan').doc(idPasien).delete();
    await firestore.collection('penyakitKeluarga').doc(idPasien).delete();
    await firestore.collection('pemeriksaan').doc(idPasien).delete();
    await firestore
        .collection('kesimpulanDerajatKesehatan')
        .doc(idPasien)
        .delete();
    await firestore.collection('kelayakanKerja').doc(idPasien).delete();
    await firestore.collection('ajuran').doc(idPasien).delete();
    await firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanUmum')
        .doc(idPasien)
        .delete();
    await firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanTHT')
        .doc(idPasien)
        .delete();
    await firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanRonggaPerut')
        .doc(idPasien)
        .delete();
    await firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanRonggaDada')
        .doc(idPasien)
        .delete();
    await firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanRefleks')
        .doc(idPasien)
        .delete();
    await firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanMata')
        .doc(idPasien)
        .delete();
    await firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanKelenjarGetah')
        .doc(idPasien)
        .delete();
    await firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanGentalia')
        .doc(idPasien)
        .delete();
    await firestore
        .collection('keluhan')
        .doc('keadaanUmum')
        .collection('pemeriksaanAnggotaGerak')
        .doc(idPasien)
        .delete();
    await firestore
        .collection('keluhan')
        .doc('riwayatPajananPadaPekerjaan')
        .collection('biologi')
        .doc(idPasien)
        .delete();
    await firestore
        .collection('keluhan')
        .doc('riwayatPajananPadaPekerjaan')
        .collection('ergonomis')
        .doc(idPasien)
        .delete();
    await firestore
        .collection('keluhan')
        .doc('riwayatPajananPadaPekerjaan')
        .collection('fisik')
        .doc(idPasien)
        .delete();
    await firestore
        .collection('keluhan')
        .doc('riwayatPajananPadaPekerjaan')
        .collection('kimia')
        .doc(idPasien)
        .delete();
    await firestore
        .collection('keluhan')
        .doc('riwayatPajananPadaPekerjaan')
        .collection('psikologi')
        .doc(idPasien)
        .delete();
    await firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Audiometri")
        .doc(idPasien)
        .delete();
    await firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Fisik")
        .doc(idPasien)
        .delete();
    await firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Gigi")
        .doc(idPasien)
        .delete();
    await firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Jantung")
        .doc(idPasien)
        .delete();
    await firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Mata")
        .doc(idPasien)
        .delete();
    await firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Paru")
        .doc(idPasien)
        .delete();
    await firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Spirometri")
        .doc(idPasien)
        .delete();
    await firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Laboratorium1")
        .doc(idPasien)
        .delete();
    await firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Usg")
        .doc(idPasien)
        .delete();
    await firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Napfa")
        .doc(idPasien)
        .delete();
    await firestore
        .collection('pemeriksaan')
        .doc('Hasil_Pemeriksaan')
        .collection("Napza")
        .doc(idPasien)
        .delete();
    await firestore.collection('fotoLainLain').doc(idPasien).delete();
    setState(() {
      getClientStream();
    });
  }
}
