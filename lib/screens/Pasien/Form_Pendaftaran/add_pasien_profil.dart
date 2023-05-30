// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously

import 'package:age_calculator/age_calculator.dart';
import 'package:arifa_medikal_klink_3/components/alert/alert.dart';
import 'package:arifa_medikal_klink_3/components/colors/color.dart';
import 'package:arifa_medikal_klink_3/model/pasien_model.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/add_pasien_profil_success.dart';
import 'package:arifa_medikal_klink_3/screens/Pasien/Menu_Form/menu_form.dart';
import 'package:arifa_medikal_klink_3/screens/menu_utama.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/widget/text.dart';
import '../../../service/firebase_firestore_service.dart';
import '../pasien_detail.dart';

class AddPasienProfil extends StatefulWidget {
  AddPasienProfil({super.key, required this.idPasien});
  String idPasien;

  @override
  State<AddPasienProfil> createState() => _AddPasienProfilState();
}

class _AddPasienProfilState extends State<AddPasienProfil> {
  FirebaseFirestoreService firestore = FirebaseFirestoreService();
  DateTime birthday = DateTime.now();
  final namaC = TextEditingController();
  final nikC = TextEditingController();
  final alamatC = TextEditingController();
  final tglPemeriksaanC = TextEditingController();
  final tempatLahirC = TextEditingController();
  final tglLahirC = TextEditingController();
  final umurC = TextEditingController();
  final perusahaanC = TextEditingController();
  final bagianC = TextEditingController();
  final nohpC = TextEditingController();
  final nomcuC = TextEditingController();
  PasienModel? _pasien;
  int idJk = 0;
  bool cek = false;

  var jkStr = "";

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    if (widget.idPasien != "") {
      _pasien = await firestore.getPasien(widget.idPasien);
      setState(() {
        namaC.text = _pasien!.nama!;
        nikC.text = _pasien!.nik!;
        alamatC.text = _pasien!.alamat!;
        tglPemeriksaanC.text = _pasien!.tanggalPemeriksaan!;
        tempatLahirC.text = _pasien!.tempatLahir!;
        tglLahirC.text = _pasien!.tanggalLahir!;
        umurC.text = _pasien!.umur!;
        perusahaanC.text = _pasien!.perusahaan!;
        bagianC.text = _pasien!.bagian!;
        nohpC.text = _pasien!.noHp!;
        nomcuC.text = _pasien!.noMcu!;
      });
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('detail1') != null) {
      setState(() {
        cek = true;
      });
    }
    if (prefs.getString('namaUser') != null) {
      setState(() {
        namaC.text = prefs.getString('namaUser')!;
        nikC.text = prefs.getString('nikUser')!;
      });
    }
  }

  Future<void> selectTanggalPemeriksaan(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        tglPemeriksaanC.text =
            DateFormat("dd-MM-yyyy").format(picked).toString();
      });
    }
  }

  Future<void> selectTanggalLahir(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        birthday = picked;
        calAge(birthday);
        tglLahirC.text = DateFormat("dd-MM-yyyy").format(picked).toString();
      });
    }
  }

  DateDuration calAge(DateTime birthDate) {
    DateTime cekAge = birthday; //DateTime(1997, 3, 5);

    DateDuration duration;

    // Find out your age as of today's date 2021-03-08
    duration = AgeCalculator.age(birthday);
    umurC.text =
        "${duration.years} Tahun ${duration.months} Bulan ${duration.days} Hari";
    return duration;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        if (prefs.getString("detail1") == null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return MenuUtama();
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
          title: Row(
            children: [
              widget.idPasien != ""
                  ? InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return PasienDetail(idPasien: widget.idPasien);
                        }));
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    )
                  : Container(),
              SizedBox(
                width: 10,
              ),
              textDefault("Tambah Pasien", Colors.white, 16, FontWeight.bold)
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textDefault("Nama", Colors.black, 14, FontWeight.normal),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: namaC,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      textDefault(
                          "Jenis Kelamin", Colors.black, 14, FontWeight.normal),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                    value: 1,
                                    groupValue: idJk,
                                    onChanged: (index) {
                                      setState(() {
                                        jkStr = "Pria";
                                        idJk = 1;
                                      });
                                    }),
                                Expanded(
                                  child: textDefault("Pria", Colors.black, 14,
                                      FontWeight.normal),
                                )
                              ],
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                    value: 2,
                                    groupValue: idJk,
                                    onChanged: (index) {
                                      setState(() {
                                        jkStr = "Wanita";
                                        idJk = 2;
                                      });
                                    }),
                                Expanded(
                                  child: textDefault("Wanita", Colors.black, 14,
                                      FontWeight.normal),
                                )
                              ],
                            ),
                            flex: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textDefault("NIK", Colors.black, 14, FontWeight.normal),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: nikC,
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      textDefault(
                          "Alamat", Colors.black, 14, FontWeight.normal),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: alamatC,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      textDefault("Tanggal Pemeriksaan", Colors.black, 14,
                          FontWeight.normal),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () => selectTanggalPemeriksaan(context),
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              enabled: false,
                              controller: tglPemeriksaanC,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textDefault(
                          "Tempat Lahir", Colors.black, 14, FontWeight.normal),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: tempatLahirC,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      textDefault(
                          "Tanggal Lahir", Colors.black, 14, FontWeight.normal),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () => selectTanggalLahir(context),
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              controller: tglLahirC,
                              enabled: false,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textDefault("Umur", Colors.black, 14, FontWeight.normal),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            readOnly: true,
                            controller: umurC,
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      textDefault(
                          "Perusahaan", Colors.black, 14, FontWeight.normal),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: perusahaanC,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      textDefault(
                          "Bagian/Seksi", Colors.black, 14, FontWeight.normal),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: bagianC,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      textDefault(
                          "No. Handphone", Colors.black, 14, FontWeight.normal),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: nohpC,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      textDefault(
                          "No. MCU", Colors.black, 14, FontWeight.normal),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: nomcuC,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => showDialogProfil(),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.only(top: 10),
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
              )
            ],
          ),
        ),
      ),
    );
  }

  validasi() {
    if (namaC.text == "") {
      alertError(context, "Nama Harus Diisi !");
    } else if (jkStr == "") {
      alertError(context, "Jenis Kelamin Harus Di Pilih !");
    } else if (nikC.text == "") {
      alertError(context, "NIK Harus Diisi !");
    } else if (nikC.text.length < 15) {
      alertError(context, "NIK Tidak Valid !");
    } else if (alamatC.text == "") {
      alertError(context, "Alamat Harus Diisi !");
    } else if (tempatLahirC.text == "") {
      alertError(context, "Tempat Lahir Harus Diisi !");
    } else if (tglLahirC.text == "") {
      alertError(context, "Tanggal Lahir Harus Diisi !");
    } else if (umurC.text == "") {
      alertError(context, "Umur Harus Diisi !");
    } else if (perusahaanC.text == "") {
      alertError(context, "Perusahaan Harus Diisi !");
    } else if (bagianC.text == "") {
      alertError(context, "Bagian/seksi Harus Diisi !");
    } else if (nohpC.text == "") {
      alertError(context, "No.Handphone Harus Diisi !");
    } else {
      showDialogProfil();
    }
  }

  void showDialogProfil() {
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
            "Apakah Anda yakin ingin\nmenyimpan?",
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
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) {
                  //     return AddPasienProfilSucces(
                  //       idPasien: "",
                  //     );
                  //   }),
                  // ),
                  onTap: saveButton,
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: textDefault(
                            "Ya, Simpan", Colors.white, 14, FontWeight.bold),
                      )),
                )),
              ],
            )
          ],
        );
      },
    );
  }

  void saveButton() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    PasienModel pasien = PasienModel(
      nama: namaC.text,
      jenisKelamin: jkStr,
      nik: nikC.text,
      alamat: alamatC.text,
      tanggalPemeriksaan: tglPemeriksaanC.text,
      tempatLahir: tempatLahirC.text,
      tanggalLahir: tglLahirC.text,
      umur: umurC.text,
      perusahaan: perusahaanC.text,
      bagian: bagianC.text,
      noHp: nohpC.text,
      noMcu: nomcuC.text,
      waktu: DateTime.now().toString(),
    );

    firestore.setPasien(pasien);
    prefs.setString('jenisKelamin', jkStr);

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) {
    //     return AddPasienProfilSucces(
    //       idPasien: pasien.id,
    //     );
    //   }),
    // );

    if (prefs.getString("detail1") == null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MenuForm(
          idPasien: pasien.id!,
        );
      }));
    } else {
      prefs.remove("detail1");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return PasienDetail(idPasien: widget.idPasien);
      }));
    }
  }
}
