// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'dart:html' as html;

import 'package:arifa_medikal_klink_3/model/hasil_pemeriksaan/hasil_pemeriksaan_model.dart';
import 'package:arifa_medikal_klink_3/model/hasil_pemeriksaan/hasil_pemeriksaan_usg_model.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_jantung.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/Hasil_Pemeriksaan/hasil_pemeriksaan_paru.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/anjuran_6_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/pemeriksaan_5_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/pasien_detail.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../../../components/colors/color.dart';
import '../../../../components/widget/text.dart';
import '../../../../service/firebase_firestore_service.dart';
import 'hasil_pemeriksaan_laboratorium.dart';

class HasilPemeriksaanUsg extends StatefulWidget {
  HasilPemeriksaanUsg({super.key, required this.idPasien});
  String idPasien;
  @override
  State<HasilPemeriksaanUsg> createState() => _HasilPemeriksaanUsgState();
}

class _HasilPemeriksaanUsgState extends State<HasilPemeriksaanUsg> {
  HasilPemeriksaanUSGModel? _hasilPemeriksaan;
  bool isLoading = false;
  final judulConn = TextEditingController();
  final keteranganConn = TextEditingController();
  final dokterApa = TextEditingController();
  final namaDokter = TextEditingController();

  final FirebaseFirestoreService firestore = FirebaseFirestoreService();

  String fotoHasilBase64 = "";
  String fotoHasilBase642 = "";
  String fotoHasilBase643 = "";
  String fotoHasilBase644 = "";
  String fotoHasilBase645 = "";
  String fotoHasilBase646 = "";

  Uint8List? fromPicker;

  @override
  void initState() {
    judulConn.text = "Hasil Pemeriksaan USG Abdomen";
    dokterApa.text = "Dokter ";
    keteranganConn.text = '''
Hepar                       : ukuran normal, struktur parenkim homogen, ekogenesitas parenkim meningkat, permukaan
                                   reguler, liver tip lancip tak tampak nodul, v.porta tak melebar, v.hepatika tak melebar
Duktus biliaris           : infra dan ekstrahepatal tak melebar
Vesika felea              : dinding tak menebal, tak tampak batu, tak tampak massa, tak tampak sludge
Pankreas                  : ukuran normal, struktur parenkim homogen, tak tampak massa, tak tampak kalsifikasi
Lien                           : ukuran normal, struktur parekim homogen, tak tampak nodul v, lienalis tak melebar
Ginjal Kanan             : bentuk dan ukuran normal, batas kortikomeduler jelas, tak tampak penipisan korteks, tak
                                    tampak batu, PCS tak melebar. Ureter proksimal tak melebar
Ginjal kiri                   : bentuk dan ukuran normal, batas kortikomeduler jelas, tak tampak penipisan korteks, tak
                                    tampak batu, PCS tak melebar. Ureter proksimal tak melebar
Aorta                         : tak tampak limfadenopati paraaorta
Vesika urinaria          : dinding tak menebal, permukaan rata, tak tampak batu, tak tampak massa
Tak tampak cairan bebas pada intraabdomen
Tak tampak cairan bebas supradiafragma kanan kiri

KESAN :
Fatty Liver
Tak tampak kelainan pada organ-organ intraabdomen di atas''';
    getData();
    super.initState();
  }

  getData() async {
    _hasilPemeriksaan = await firestore.getHasilPemeriksaanUsg(widget.idPasien);
    setState(() {
      judulConn.text = _hasilPemeriksaan!.judul!;
      keteranganConn.text = _hasilPemeriksaan!.keterangan!;
      fotoHasilBase64 = _hasilPemeriksaan!.image1!;
      fotoHasilBase642 = _hasilPemeriksaan!.image2!;
      fotoHasilBase643 = _hasilPemeriksaan!.image3!;
      fotoHasilBase644 = _hasilPemeriksaan!.image4!;
      fotoHasilBase645 = _hasilPemeriksaan!.image5!;
      fotoHasilBase646 = _hasilPemeriksaan!.image6!;

      namaDokter.text = _hasilPemeriksaan!.namaDokter!;
      dokterApa.text = _hasilPemeriksaan!.dokterApa!;
      if (keteranganConn.text == "") {
        keteranganConn.text = '''
Hepar                       : ukuran normal, struktur parenkim homogen, ekogenesitas parenkim meningkat, permukaan
                                   reguler, liver tip lancip tak tampak nodul, v.porta tak melebar, v.hepatika tak melebar
Duktus biliaris           : infra dan ekstrahepatal tak melebar
Vesika felea              : dinding tak menebal, tak tampak batu, tak tampak massa, tak tampak sludge
Pankreas                  : ukuran normal, struktur parenkim homogen, tak tampak massa, tak tampak kalsifikasi
Lien                           : ukuran normal, struktur parekim homogen, tak tampak nodul v, lienalis tak melebar
Ginjal Kanan             : bentuk dan ukuran normal, batas kortikomeduler jelas, tak tampak penipisan korteks, tak
                                    tampak batu, PCS tak melebar. Ureter proksimal tak melebar
Ginjal kiri                   : bentuk dan ukuran normal, batas kortikomeduler jelas, tak tampak penipisan korteks, tak
                                    tampak batu, PCS tak melebar. Ureter proksimal tak melebar
Aorta                         : tak tampak limfadenopati paraaorta
Vesika urinaria          : dinding tak menebal, permukaan rata, tak tampak batu, tak tampak massa
Tak tampak cairan bebas pada intraabdomen
Tak tampak cairan bebas supradiafragma kanan kiri

KESAN :
Fatty Liver
Tak tampak kelainan pada organ-organ intraabdomen di atas
''';
      }
    });
  }

  File? _image;
  dynamic bytes;

  Future getfoto(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: source, imageQuality: 40);
    _image = File(imagePicked!.path);
    print(imagePicked.path);
    // bytes = File(imagePicked.path).readAsBytesSync();
    setState(() {
      fotoHasilBase64 = base64Encode(File(imagePicked.path).readAsBytesSync());
    });
  }

  Future<void> _pickImage() async {
    fromPicker = await ImagePickerWeb.getImageAsBytes();
    if (fromPicker != null) {
      setState(() {
        fotoHasilBase64 = base64Encode(fromPicker!);
        print(fotoHasilBase64);
      });
    }
  }

  Future<void> _pickImage2() async {
    fromPicker = await ImagePickerWeb.getImageAsBytes();
    if (fromPicker != null) {
      setState(() {
        fotoHasilBase642 = base64Encode(fromPicker!);
        print(fotoHasilBase64);
      });
    }
  }

  Future<void> _pickImage3() async {
    fromPicker = await ImagePickerWeb.getImageAsBytes();
    if (fromPicker != null) {
      setState(() {
        fotoHasilBase643 = base64Encode(fromPicker!);
        print(fotoHasilBase64);
      });
    }
  }

  Future<void> _pickImage4() async {
    fromPicker = await ImagePickerWeb.getImageAsBytes();
    if (fromPicker != null) {
      setState(() {
        fotoHasilBase644 = base64Encode(fromPicker!);
        print(fotoHasilBase644);
      });
    }
  }

  Future<void> _pickImage5() async {
    fromPicker = await ImagePickerWeb.getImageAsBytes();
    if (fromPicker != null) {
      setState(() {
        fotoHasilBase645 = base64Encode(fromPicker!);
        print(fotoHasilBase64);
      });
    }
  }

  Future<void> _pickImage6() async {
    fromPicker = await ImagePickerWeb.getImageAsBytes();
    if (fromPicker != null) {
      setState(() {
        fotoHasilBase646 = base64Encode(fromPicker!);
        print(fotoHasilBase64);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Uint8List bytes1 = base64.decode(fotoHasilBase64);
    Uint8List bytes2 = base64.decode(fotoHasilBase642);
    Uint8List bytes3 = base64.decode(fotoHasilBase643);
    Uint8List bytes4 = base64.decode(fotoHasilBase644);
    Uint8List bytes5 = base64.decode(fotoHasilBase645);
    Uint8List bytes6 = base64.decode(fotoHasilBase646);

    return WillPopScope(
      onWillPop: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        if (prefs.getString("detail1") == null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return MenuForm(idPasien: widget.idPasien);
          }));
        } else {
          prefs.remove("detail1");
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return PasienDetail(idPasien: widget.idPasien);
          }));
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: blueDefault,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                if (prefs.getString('iconHasil') == null) {
                  if (prefs.getString("detail1") == null) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return MenuForm(idPasien: widget.idPasien);
                    }));
                  } else {
                    prefs.remove("detail1");
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return PasienDetail(idPasien: widget.idPasien);
                    }));
                  }
                } else {
                  prefs.remove("iconHasil");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Pemeriksaan5(idPasien: widget.idPasien);
                  }));
                }
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                ],
              ),
            ),
            textDefault("Hasil Pemeriksaan", Colors.white, 16, FontWeight.bold),
            SizedBox(
              width: 5,
            ),
          ]),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          controller: judulConn,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      bytes1.isEmpty
                          ? Container()
                          : Container(
                              // width: MediaQuery.of(context).size.width,
                              // height: 200,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                  child: Image.memory(
                                bytes1,
                                fit: BoxFit.cover,
                              )),
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (kIsWeb) {
                            setState(() {
                              _pickImage();
                            });
                          } else {
                            setState(() {
                              getfoto(ImageSource.gallery);
                            });
                          }
                        },
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ]),
                          child: Center(
                            child: textDefault(
                                fotoHasilBase64 != ""
                                    ? "Upload Foto"
                                    : "Ubah Foto",
                                Colors.black,
                                14,
                                FontWeight.normal),
                          ),
                        ),
                      ),
                      fotoHasilBase64 == ""
                          ? Container()
                          : Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () async {
                                    setState(() {
                                      fotoHasilBase64 = "";
                                    });
                                  },
                                  child: Container(
                                    width: 150,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey, blurRadius: 2)
                                        ]),
                                    child: Center(
                                      child: textDefault("Hapus Foto",
                                          Colors.white, 14, FontWeight.normal),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      Divider(
                        thickness: 1,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          bytes2.isEmpty
                              ? Container()
                              : Container(
                                  // width: MediaQuery.of(context).size.width,
                                  // height: 200,
                                  alignment: Alignment.center,
                                  child: ClipRRect(
                                      child: Image.memory(
                                    bytes2,
                                    fit: BoxFit.cover,
                                  )),
                                ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              if (kIsWeb) {
                                setState(() {
                                  _pickImage2();
                                });
                              } else {
                                setState(() {
                                  getfoto(ImageSource.gallery);
                                });
                              }
                            },
                            child: Container(
                              width: 150,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, blurRadius: 2)
                                  ]),
                              child: Center(
                                child: textDefault(
                                    fotoHasilBase642 != ""
                                        ? "Upload Foto"
                                        : "Ubah Foto",
                                    Colors.black,
                                    14,
                                    FontWeight.normal),
                              ),
                            ),
                          ),
                          fotoHasilBase642 == ""
                              ? Container()
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        setState(() {
                                          fotoHasilBase642 = "";
                                        });
                                      },
                                      child: Container(
                                        width: 150,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2)
                                            ]),
                                        child: Center(
                                          child: textDefault(
                                              "Hapus Foto",
                                              Colors.white,
                                              14,
                                              FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          Divider(
                            thickness: 1,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          bytes3.isEmpty
                              ? Container()
                              : Container(
                                  // width: MediaQuery.of(context).size.width,
                                  // height: 200,
                                  alignment: Alignment.center,
                                  child: ClipRRect(
                                      child: Image.memory(
                                    bytes3,
                                    fit: BoxFit.cover,
                                  )),
                                ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              if (kIsWeb) {
                                setState(() {
                                  _pickImage3();
                                });
                              } else {
                                setState(() {
                                  getfoto(ImageSource.gallery);
                                });
                              }
                            },
                            child: Container(
                              width: 150,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, blurRadius: 2)
                                  ]),
                              child: Center(
                                child: textDefault(
                                    fotoHasilBase643 != ""
                                        ? "Upload Foto"
                                        : "Ubah Foto",
                                    Colors.black,
                                    14,
                                    FontWeight.normal),
                              ),
                            ),
                          ),
                          fotoHasilBase643 == ""
                              ? Container()
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        setState(() {
                                          fotoHasilBase643 = "";
                                        });
                                      },
                                      child: Container(
                                        width: 150,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2)
                                            ]),
                                        child: Center(
                                          child: textDefault(
                                              "Hapus Foto",
                                              Colors.white,
                                              14,
                                              FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          Divider(
                            thickness: 1,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          bytes4.isEmpty
                              ? Container()
                              : Container(
                                  // width: MediaQuery.of(context).size.width,
                                  // height: 200,
                                  alignment: Alignment.center,
                                  child: ClipRRect(
                                      child: Image.memory(
                                    bytes4,
                                    fit: BoxFit.cover,
                                  )),
                                ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              if (kIsWeb) {
                                setState(() {
                                  _pickImage4();
                                });
                              } else {
                                setState(() {
                                  getfoto(ImageSource.gallery);
                                });
                              }
                            },
                            child: Container(
                              width: 150,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, blurRadius: 2)
                                  ]),
                              child: Center(
                                child: textDefault(
                                    fotoHasilBase644 != ""
                                        ? "Upload Foto"
                                        : "Ubah Foto",
                                    Colors.black,
                                    14,
                                    FontWeight.normal),
                              ),
                            ),
                          ),
                          fotoHasilBase644 == ""
                              ? Container()
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        setState(() {
                                          fotoHasilBase644 = "";
                                        });
                                      },
                                      child: Container(
                                        width: 150,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2)
                                            ]),
                                        child: Center(
                                          child: textDefault(
                                              "Hapus Foto",
                                              Colors.white,
                                              14,
                                              FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          Divider(
                            thickness: 1,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          bytes5.isEmpty
                              ? Container()
                              : Container(
                                  // width: MediaQuery.of(context).size.width,
                                  // height: 200,
                                  alignment: Alignment.center,
                                  child: ClipRRect(
                                      child: Image.memory(
                                    bytes5,
                                    fit: BoxFit.cover,
                                  )),
                                ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              if (kIsWeb) {
                                setState(() {
                                  _pickImage5();
                                });
                              } else {
                                setState(() {
                                  getfoto(ImageSource.gallery);
                                });
                              }
                            },
                            child: Container(
                              width: 150,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, blurRadius: 2)
                                  ]),
                              child: Center(
                                child: textDefault(
                                    fotoHasilBase645 != ""
                                        ? "Upload Foto"
                                        : "Ubah Foto",
                                    Colors.black,
                                    14,
                                    FontWeight.normal),
                              ),
                            ),
                          ),
                          fotoHasilBase645 == ""
                              ? Container()
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        setState(() {
                                          fotoHasilBase645 = "";
                                        });
                                      },
                                      child: Container(
                                        width: 150,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2)
                                            ]),
                                        child: Center(
                                          child: textDefault(
                                              "Hapus Foto",
                                              Colors.white,
                                              14,
                                              FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          Divider(
                            thickness: 1,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          bytes6.isEmpty
                              ? Container()
                              : Container(
                                  // width: MediaQuery.of(context).size.width,
                                  // height: 200,
                                  alignment: Alignment.center,
                                  child: ClipRRect(
                                      child: Image.memory(
                                    bytes6,
                                    fit: BoxFit.cover,
                                  )),
                                ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              if (kIsWeb) {
                                setState(() {
                                  _pickImage6();
                                });
                              } else {
                                setState(() {
                                  getfoto(ImageSource.gallery);
                                });
                              }
                            },
                            child: Container(
                              width: 150,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, blurRadius: 2)
                                  ]),
                              child: Center(
                                child: textDefault(
                                    fotoHasilBase646 != ""
                                        ? "Upload Foto"
                                        : "Ubah Foto",
                                    Colors.black,
                                    14,
                                    FontWeight.normal),
                              ),
                            ),
                          ),
                          fotoHasilBase646 == ""
                              ? Container()
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        setState(() {
                                          fotoHasilBase646 = "";
                                        });
                                      },
                                      child: Container(
                                        width: 150,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2)
                                            ]),
                                        child: Center(
                                          child: textDefault(
                                              "Hapus Foto",
                                              Colors.white,
                                              14,
                                              FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          Divider(
                            thickness: 1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextFormField(
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                                textAlign: TextAlign.center,
                                controller: dokterApa,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          textDefault(":", Colors.black, 14, FontWeight.normal),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextFormField(
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                                textAlign: TextAlign.center,
                                controller: namaDokter,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: TextFormField(
                          controller: keteranganConn,
                          style: TextStyle(fontFamily: 'poppins'),
                          maxLines: 10,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
                child: InkWell(
                  onTap: saveButton,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
    );
  }

  saveButton() async {
    PemeriksaanModel? _pemeriksaan;
    HasilPemeriksaanUSGModel data = HasilPemeriksaanUSGModel(
        judul: judulConn.text,
        keterangan: keteranganConn.text,
        image1: fotoHasilBase64,
        image2: fotoHasilBase642,
        image3: fotoHasilBase643,
        image4: fotoHasilBase644,
        image5: fotoHasilBase645,
        image6: fotoHasilBase646,
        dokterApa: dokterApa.text,
        namaDokter: namaDokter.text);
    firestore.setHasilPemeriksaanUsg(
        pemeriksaan: data, idPasien: widget.idPasien);
    _pemeriksaan = await firestore.getPemeriksaan(widget.idPasien);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('iconHasil') == null) {
      if (prefs.getString("detail1") == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return MenuForm(idPasien: widget.idPasien);
        }));
      } else {
        prefs.remove("detail1");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return PasienDetail(idPasien: widget.idPasien);
        }));
      }
    } else {
      prefs.remove("iconHasil");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Pemeriksaan5(idPasien: widget.idPasien);
      }));
    }
  }
}
