// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:arifa_medikal_klink_3/model/foto_lain_lain_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/pemeriksaan_5_8.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/pasien_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/colors/color.dart';
import '../../../components/widget/text.dart';
import '../../../service/firebase_firestore_service.dart';

class FotoLainLainView extends StatefulWidget {
  FotoLainLainView({super.key, required this.idPasien});
  String idPasien;
  @override
  State<FotoLainLainView> createState() => _FotoLainLainViewState();
}

class _FotoLainLainViewState extends State<FotoLainLainView> {
  String foto1 = "";
  String foto2 = "";
  String foto3 = "";
  String foto4 = "";
  String foto5 = "";
  String foto6 = "";
  String foto7 = "";
  String foto8 = "";
  String foto9 = "";
  FotoLainLain? data;
  FirebaseFirestoreService firestore = FirebaseFirestoreService();

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    data = await firestore.getFotoLainLain(widget.idPasien);
    if (data != null) {
      setState(() {
        foto1 = data!.foto1!;
        foto2 = data!.foto2!;
        foto3 = data!.foto3!;
        foto4 = data!.foto4!;
        foto5 = data!.foto5!;
        foto6 = data!.foto6!;
        foto7 = data!.foto7!;
        foto8 = data!.foto8!;
        foto9 = data!.foto9!;
      });
    }
  }

  File? _image;
  dynamic bytes;

  Future getfoto(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: source, imageQuality: 40);
    _image = File(imagePicked!.path);
    // print(imagePicked.path);
    // bytes = File(imagePicked.path).readAsBytesSync();
    // setState(() {
    //   fotoHasilBase64 = base64Encode(File(imagePicked.path).readAsBytesSync());
    //   print(fotoHasilBase64);
    // });
  }

  Future<void> _pickImage(String tipe) async {
    Uint8List? fromPicker = await ImagePickerWeb.getImageAsBytes();
    if (fromPicker != null) {
      if (tipe == 'foto1') {
        setState(() {
          foto1 = base64Encode(fromPicker);
        });
      } else if (tipe == 'foto2') {
        setState(() {
          foto2 = base64Encode(fromPicker);
        });
      } else if (tipe == 'foto3') {
        setState(() {
          foto3 = base64Encode(fromPicker);
        });
      } else if (tipe == 'foto4') {
        setState(() {
          foto4 = base64Encode(fromPicker);
        });
      } else if (tipe == 'foto5') {
        setState(() {
          foto5 = base64Encode(fromPicker);
        });
      } else if (tipe == 'foto6') {
        setState(() {
          foto6 = base64Encode(fromPicker);
        });
      } else if (tipe == 'foto7') {
        setState(() {
          foto7 = base64Encode(fromPicker);
        });
      } else if (tipe == 'foto8') {
        setState(() {
          foto8 = base64Encode(fromPicker);
        });
      } else if (tipe == 'foto9') {
        setState(() {
          foto9 = base64Encode(fromPicker);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Uint8List bytes1 = base64.decode(foto1);
    Uint8List bytes2 = base64.decode(foto2);
    Uint8List bytes3 = base64.decode(foto3);
    Uint8List bytes4 = base64.decode(foto4);
    Uint8List bytes5 = base64.decode(foto5);
    Uint8List bytes6 = base64.decode(foto6);
    Uint8List bytes7 = base64.decode(foto7);
    Uint8List bytes8 = base64.decode(foto8);
    Uint8List bytes9 = base64.decode(foto9);

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
        backgroundColor: Colors.white,
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
            textDefault("Foto Lain Lain", Colors.white, 16, FontWeight.bold),
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
                      bytes1.isEmpty
                          ? Container()
                          : Container(
                              height: 300,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                  child: Image.memory(
                                bytes1,
                                fit: BoxFit.cover,
                              )),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (kIsWeb) {
                            setState(() {
                              _pickImage('foto1');
                            });
                          } else {
                            setState(() {
                              getfoto(ImageSource.gallery);
                            });
                          }
                        },
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ]),
                          child: Center(
                            child: textDefault("Upload Foto", Colors.black, 14,
                                FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      bytes2.isEmpty
                          ? Container()
                          : Container(
                              height: 300,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                  child: Image.memory(
                                bytes2,
                                fit: BoxFit.cover,
                              )),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (kIsWeb) {
                            setState(() {
                              _pickImage('foto2');
                            });
                          } else {
                            setState(() {
                              getfoto(ImageSource.gallery);
                            });
                          }
                        },
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ]),
                          child: Center(
                            child: textDefault("Upload Foto", Colors.black, 14,
                                FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      bytes3.isEmpty
                          ? Container()
                          : Container(
                              height: 300,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                  child: Image.memory(
                                bytes3,
                                fit: BoxFit.cover,
                              )),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (kIsWeb) {
                            setState(() {
                              _pickImage('foto3');
                            });
                          } else {
                            setState(() {
                              getfoto(ImageSource.gallery);
                            });
                          }
                        },
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ]),
                          child: Center(
                            child: textDefault("Upload Foto", Colors.black, 14,
                                FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      bytes4.isEmpty
                          ? Container()
                          : Container(
                              height: 300,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                  child: Image.memory(
                                bytes4,
                                fit: BoxFit.cover,
                              )),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (kIsWeb) {
                            setState(() {
                              _pickImage('foto4');
                            });
                          } else {
                            setState(() {
                              getfoto(ImageSource.gallery);
                            });
                          }
                        },
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ]),
                          child: Center(
                            child: textDefault("Upload Foto", Colors.black, 14,
                                FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      bytes5.isEmpty
                          ? Container()
                          : Container(
                              height: 300,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                  child: Image.memory(
                                bytes5,
                                fit: BoxFit.cover,
                              )),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (kIsWeb) {
                            setState(() {
                              _pickImage('foto5');
                            });
                          } else {
                            setState(() {
                              getfoto(ImageSource.gallery);
                            });
                          }
                        },
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ]),
                          child: Center(
                            child: textDefault("Upload Foto", Colors.black, 14,
                                FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      bytes6.isEmpty
                          ? Container()
                          : Container(
                              height: 300,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                  child: Image.memory(
                                bytes6,
                                fit: BoxFit.cover,
                              )),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (kIsWeb) {
                            setState(() {
                              _pickImage('foto6');
                            });
                          } else {
                            setState(() {
                              getfoto(ImageSource.gallery);
                            });
                          }
                        },
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ]),
                          child: Center(
                            child: textDefault("Upload Foto", Colors.black, 14,
                                FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      bytes7.isEmpty
                          ? Container()
                          : Container(
                              height: 300,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                  child: Image.memory(
                                bytes7,
                                fit: BoxFit.cover,
                              )),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (kIsWeb) {
                            setState(() {
                              _pickImage('foto7');
                            });
                          } else {
                            setState(() {
                              getfoto(ImageSource.gallery);
                            });
                          }
                        },
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ]),
                          child: Center(
                            child: textDefault("Upload Foto", Colors.black, 14,
                                FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      bytes8.isEmpty
                          ? Container()
                          : Container(
                              height: 300,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                  child: Image.memory(
                                bytes8,
                                fit: BoxFit.cover,
                              )),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (kIsWeb) {
                            setState(() {
                              _pickImage('foto8');
                            });
                          } else {
                            setState(() {
                              getfoto(ImageSource.gallery);
                            });
                          }
                        },
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ]),
                          child: Center(
                            child: textDefault("Upload Foto", Colors.black, 14,
                                FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      bytes9.isEmpty
                          ? Container()
                          : Container(
                              height: 300,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                  child: Image.memory(
                                bytes9,
                                fit: BoxFit.cover,
                              )),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (kIsWeb) {
                            setState(() {
                              _pickImage('foto9');
                            });
                          } else {
                            setState(() {
                              getfoto(ImageSource.gallery);
                            });
                          }
                        },
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2)
                              ]),
                          child: Center(
                            child: textDefault("Upload Foto", Colors.black, 14,
                                FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                // onTap: () => Navigator.push(context,
                //     MaterialPageRoute(builder: (context) {
                //   return KesimpulanDerajat8();
                // })),
                onTap: saveButton,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  margin: EdgeInsets.only(top: 0, bottom: 10),
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
              ),
            )
          ],
        ),
      ),
    );
  }

  saveButton() async {
    FotoLainLain data = FotoLainLain(
      foto1: foto1,
      foto2: foto2,
      foto3: foto3,
      foto4: foto4,
      foto5: foto5,
      foto6: foto6,
      foto7: foto7,
      foto8: foto8,
      foto9: foto9,
    );

    FirebaseFirestoreService firestore = FirebaseFirestoreService();

    firestore.setFotoLainLain(fotoLain: data, idPasien: widget.idPasien);
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
