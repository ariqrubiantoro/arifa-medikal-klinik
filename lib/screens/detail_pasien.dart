// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class DetailPasien extends StatelessWidget {
  const DetailPasien({super.key, required this.pasienSnapshots});

  final DocumentSnapshot pasienSnapshots;
  @override
  Widget build(BuildContext context) {
    void getPDF() async {
      final pdf = pw.Document();
      final ByteData bytesImage1 =
          await rootBundle.load('assets/images/header.jpeg');
      final Uint8List headerImage = bytesImage1.buffer.asUint8List();

      final ByteData bytesImage2 =
          await rootBundle.load('assets/images/footer.jpeg');
      final Uint8List footerImage = bytesImage2.buffer.asUint8List();

      pdf.addPage(pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
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
                    pw.Row(children: [
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 120,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Text("Nama",
                              style: pw.TextStyle(fontSize: 16))),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 120,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child:
                              pw.Text("", style: pw.TextStyle(fontSize: 16))),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 160,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Text("Tgl. Pemeriksaan",
                              style: pw.TextStyle(fontSize: 16))),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 160,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child:
                              pw.Text("", style: pw.TextStyle(fontSize: 16))),
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
                              style: pw.TextStyle(fontSize: 16))),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 120,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child:
                              pw.Text("", style: pw.TextStyle(fontSize: 16))),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 160,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Text("TTL/Umur",
                              style: pw.TextStyle(fontSize: 16))),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 160,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child:
                              pw.Text("", style: pw.TextStyle(fontSize: 16))),
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
                              style: pw.TextStyle(fontSize: 16))),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 120,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child:
                              pw.Text("", style: pw.TextStyle(fontSize: 16))),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 160,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Text("Perusahaan",
                              style: pw.TextStyle(fontSize: 16))),
                      pw.Container(
                          padding:
                              pw.EdgeInsets.only(left: 5, top: 2, bottom: 2),
                          width: 160,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child:
                              pw.Text("", style: pw.TextStyle(fontSize: 16))),
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
                                  style: pw.TextStyle(fontSize: 16))),
                          pw.Container(
                              padding: pw.EdgeInsets.only(
                                  left: 5, top: 2, bottom: 2),
                              width: 120,
                              height: 60,
                              decoration: pw.BoxDecoration(
                                  border:
                                      pw.Border.all(color: PdfColors.black)),
                              child: pw.Text("",
                                  style: pw.TextStyle(fontSize: 16))),
                          pw.Column(children: [
                            pw.Row(children: [
                              pw.Container(
                                  padding: pw.EdgeInsets.only(
                                      left: 5, top: 2, bottom: 2),
                                  width: 160,
                                  height: 20,
                                  decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColors.black)),
                                  child: pw.Text("Bagian / Seksi",
                                      style: pw.TextStyle(fontSize: 16))),
                              pw.Container(
                                  padding: pw.EdgeInsets.only(
                                      left: 5, top: 2, bottom: 2),
                                  width: 160,
                                  height: 20,
                                  decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColors.black)),
                                  child: pw.Text("",
                                      style: pw.TextStyle(fontSize: 16))),
                            ]),
                            pw.Row(children: [
                              pw.Container(
                                  padding: pw.EdgeInsets.only(
                                      left: 5, top: 2, bottom: 2),
                                  width: 160,
                                  height: 20,
                                  decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColors.black)),
                                  child: pw.Text("No HP",
                                      style: pw.TextStyle(fontSize: 16))),
                              pw.Container(
                                  padding: pw.EdgeInsets.only(
                                      left: 5, top: 2, bottom: 2),
                                  width: 160,
                                  height: 20,
                                  decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColors.black)),
                                  child: pw.Text("",
                                      style: pw.TextStyle(fontSize: 16))),
                            ]),
                            pw.Row(children: [
                              pw.Container(
                                  padding: pw.EdgeInsets.only(
                                      left: 5, top: 2, bottom: 2),
                                  width: 160,
                                  height: 20,
                                  decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColors.black)),
                                  child: pw.Text("No MCU",
                                      style: pw.TextStyle(fontSize: 16))),
                              pw.Container(
                                  padding: pw.EdgeInsets.only(
                                      left: 5, top: 2, bottom: 2),
                                  width: 160,
                                  height: 20,
                                  decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColors.black)),
                                  child: pw.Text("",
                                      style: pw.TextStyle(fontSize: 16))),
                            ])
                          ])
                        ]),
                    pw.SizedBox(height: 20),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 10),
                          pw.Text("I.",
                              style: pw.TextStyle(
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 20),
                          pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Riwayat Penyakit Terdahulu",
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.SizedBox(height: 5),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("a. Darah tinggi",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ya/Tidak Ada",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text(
                                        "b. Penyakit paru (Asma, TBC dll)",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ya/Tidak Ada",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("c. Asam lambung",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ya/Tidak Ada",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("d. Alergi",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ya/Tidak Ada",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("e. Riwayat operasi",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ya/Tidak Ada",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("f. Riwayat kecelakaan",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ya/Tidak Ada",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("g. Riwayat rawat RS",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ya/Tidak Ada",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("h. Hepatitis",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ya/Tidak Ada",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("i. Kencing manis",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ya/Tidak Ada",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text(
                                        "j. Patah tulang (terpasang PEN)",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ya/Tidak Ada",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                              ])
                        ]),
                    pw.SizedBox(height: 20),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 5),
                          pw.Text("II.",
                              style: pw.TextStyle(
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 20),
                          pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Riwayat Penyakit Keluarga (Orang Tua)",
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.SizedBox(height: 5),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("a. Darah tinggi",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ayah ( )      Ibu ( )",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text(
                                        "b. Penyakit paru (Asma, TBC dll)",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ayah ( )      Ibu ( )",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("c. Asam lambung",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ayah ( )      Ibu ( )",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("d. Alergi",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ayah ( )      Ibu ( )",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("e. Riwayat operasi",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ayah ( )      Ibu ( )",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("f. Riwayat kecelakaan",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ayah ( )      Ibu ( )",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("g. Riwayat rawat RS",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ayah ( )      Ibu ( )",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("h. Hepatitis",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ayah ( )      Ibu ( )",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("i. Kencing manis",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ayah ( )      Ibu ( )",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text(
                                        "j. Patah tulang (terpasang PEN)",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ayah ( )      Ibu ( )",
                                      style: pw.TextStyle(
                                          fontSize: 12,
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
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 15),
                          pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Riwayat Kebiasaan",
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.SizedBox(height: 5),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("a. Merokok",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ya/Tidak Ada",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("   a). Lama",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ( ) Tahun",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("   b). Banyak",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ( ) Batang/hari",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ( ) Bungkus/hari",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("b. Minum Miras",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ya/Tidak Ada",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("   a). Lama",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ( ) Tahun",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("   b). Banyak",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ( ) Gelas/hari",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": ( ) Botol/hari",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                                pw.Row(children: [
                                  pw.Container(
                                    width: 250,
                                    child: pw.Text("c. Olahraga",
                                        style: pw.TextStyle(
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.normal)),
                                  ),
                                  pw.Text(": Ya/Tidak Ada",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                ]),
                              ])
                        ]),
                    pw.SizedBox(height: 10),
                    pw.Row(children: [
                      pw.SizedBox(width: 5),
                      pw.Text("IV.",
                          style: pw.TextStyle(
                              fontSize: 16, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(width: 15),
                      pw.Text("Keluhan Sekarang",
                          style: pw.TextStyle(
                              fontSize: 16, fontWeight: pw.FontWeight.bold)),
                    ]),
                    pw.SizedBox(height: 10),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 5),
                          pw.Text("A.",
                              style: pw.TextStyle(
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 15),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("KEADAAN UMUM",
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("1.",
                                          style: pw.TextStyle(
                                              fontSize: 16,
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
                                                    fontSize: 16,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(": ",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text("cm",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(": ",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text("kg",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(": ",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text("kg",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(": ",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(": ",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text("cm",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(": ",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text("mmHg",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(": ",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text("x/menit",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(": ",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text("x/menit",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text(": ",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 100,
                                                    child: pw.Text("°C",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                              fontSize: 16,
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
                                                    fontSize: 16,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": Ya/Tidak Ada",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    child: pw.Text(
                                                        "(Rabun dekat/jauh)",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(": ",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    child: pw.Text(
                                                        "(Tanpa lensa koreksi)",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(": ",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    child: pw.Text(
                                                        "(Tanpa lensa koreksi)",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": Ya/Tidak Ada",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": Ya/Tidak Ada",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": Normal/Tidak Normal",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": Normal/Tidak Normal",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(
                                    "Pemeriksaan Telinga, Hidung dan Tenggorokan",
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("a.",
                                          style: pw.TextStyle(
                                              fontSize: 12,
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
                                                    fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": Normal/Tidak Normal",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": Normal/Tidak Normal",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": Normal/Tidak Normal",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Text(
                                                      "Serumen : Ada/Tidak ada",
                                                      style: pw.TextStyle(
                                                          fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": Normal/Tidak Normal",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Text(
                                                      "Serumen : Ada/Tidak ada",
                                                      style: pw.TextStyle(
                                                          fontSize: 12,
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
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Hidung",
                                    style: pw.TextStyle(
                                        fontSize: 12,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text("(a) Pilek / tersumbat",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Ya/Tidak Ada  ",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Ya/Tidak Ada",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Kerongkongan",
                                    style: pw.TextStyle(
                                        fontSize: 12,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text("(a) Tonsil kanan",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Ya/Tidak ada",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Pemeriksaan Rongga Dada",
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("a.",
                                          style: pw.TextStyle(
                                              fontSize: 12,
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
                                                    fontSize: 12,
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
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": Normal/Tidak Normal",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Text(
                                                      "Iktus Kordis : Normal/Tidak Normal",
                                                      style: pw.TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: pw
                                                              .FontWeight
                                                              .normal)),
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        "(b) Auskultasi",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": Normal/Tidak Normal",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Text(
                                                      "Bunyi Jantung : Normal/Tidak Normal",
                                                      style: pw.TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: pw
                                                              .FontWeight
                                                              .normal)),
                                                ]),
                                            pw.Row(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                children: [
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        "(c) lain-lain",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Container(
                                                    width: 150,
                                                    child: pw.Text(
                                                        ": Ya/Tidak Ada",
                                                        style: pw.TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .normal)),
                                                  ),
                                                  pw.Text(
                                                      "Bunyi Nafas  : Ada/Tidak ada",
                                                      style: pw.TextStyle(
                                                          fontSize: 12,
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
                          pw.SizedBox(width: 59),
                          pw.Text("b.",
                              style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Paru",
                                    style: pw.TextStyle(
                                        fontSize: 12,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 120,
                                        child: pw.Text("(a) Inspeksi",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text("Kiri : Normal/Tidak Normal",
                                          style: pw.TextStyle(
                                              fontSize: 12,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 120,
                                        child: pw.Text("(b) Palpasi",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text("Kiri : Normal/Tidak Normal",
                                          style: pw.TextStyle(
                                              fontSize: 12,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 120,
                                        child: pw.Text("(c) Perkusi",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text("Kiri : Normal/Tidak Normal",
                                          style: pw.TextStyle(
                                              fontSize: 12,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 120,
                                        child: pw.Text("(d) Auskultasi",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text("Kiri : Normal/Tidak Normal",
                                          style: pw.TextStyle(
                                              fontSize: 12,
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
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Pemeriksaan Rongga Perut",
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("a. Inspeksi",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Timpani",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Teraba/Tidak teraba",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Ballotement : - Nyeri Ketok : Negatif",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Ballotement : - Nyeri Ketok : Negatif",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Normal/Tidak Normal ",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Pemeriksaan Gentalia dan Anorektal",
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("a. Hernia",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            ": Tidak dilakukan pemeriksaan",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            ": Tidak dilakukan pemeriksaan",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            ": Tidak dilakukan pemeriksaan",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            ": Tidak dilakukan pemeriksaan",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            ": Tidak dilakukan pemeriksaan",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            ": Tidak dilakukan pemeriksaan",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            ": Tidak dilakukan pemeriksaan",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Pemeriksaan Anggota Gerak",
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("a. Atas kiri / kanan",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text("Kiri : Normal/Tidak Normal",
                                          style: pw.TextStyle(
                                              fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text("Kiri : Normal/Tidak Normal",
                                          style: pw.TextStyle(
                                              fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text("Kiri : Normal/Tidak Normal",
                                          style: pw.TextStyle(
                                              fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text("Kiri : Normal/Tidak Normal",
                                          style: pw.TextStyle(
                                              fontSize: 12,
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
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Pemeriksaan Refleks",
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment: pw.MainAxisAlignment.end,
                                    children: [
                                      pw.SizedBox(width: 340),
                                      pw.Container(
                                        width: 60,
                                        child: pw.Text("Kanan",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 50,
                                        child: pw.Text("Kiri",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 80,
                                        child: pw.Text("Biceps",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 50,
                                        child: pw.Text(":",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 55,
                                        child: pw.Text("+",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                      ),
                                      pw.Container(
                                        width: 50,
                                        child: pw.Text("+",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 80,
                                        child: pw.Text("Biceps",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 50,
                                        child: pw.Text(":",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 55,
                                        child: pw.Text("+",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                      ),
                                      pw.Container(
                                        width: 50,
                                        child: pw.Text("+",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text(": Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 80,
                                        child: pw.Text("Biceps",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 50,
                                        child: pw.Text(":",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 55,
                                        child: pw.Text("-",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                      ),
                                      pw.Container(
                                        width: 50,
                                        child: pw.Text("-",
                                            style: pw.TextStyle(
                                                fontSize: 12,
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
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 10),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Pemeriksaan Kelenjar Getah Bening",
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                        width: 150,
                                        child: pw.Text("a. Cervical",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text("Kiri : Normal/Tidak Normal",
                                          style: pw.TextStyle(
                                              fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text("Kiri : Normal/Tidak Normal",
                                          style: pw.TextStyle(
                                              fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text("Kiri : Normal/Tidak Normal",
                                          style: pw.TextStyle(
                                              fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text("Kiri : Normal/Tidak Normal",
                                          style: pw.TextStyle(
                                              fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Container(
                                        width: 200,
                                        child: pw.Text(
                                            "Kanan : Normal/Tidak Normal",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.normal)),
                                      ),
                                      pw.Text("Kiri : Normal/Tidak Normal",
                                          style: pw.TextStyle(
                                              fontSize: 12,
                                              fontWeight:
                                                  pw.FontWeight.normal)),
                                    ]),
                              ])
                        ]),
                    pw.SizedBox(height: 20),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(width: 5),
                          pw.Text("A.",
                              style: pw.TextStyle(
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(width: 15),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Riwayat Pajanan Pada Pekerjaan",
                                    style: pw.TextStyle(
                                        fontSize: 16,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("1.",
                                          style: pw.TextStyle(
                                              fontSize: 16,
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
                                                    fontSize: 16,
                                                    fontWeight:
                                                        pw.FontWeight.bold)),
                                            pw.Row(children: [
                                              pw.SizedBox(width: 10),
                                              pw.Container(
                                                width: 200,
                                                child: pw.Text("a. Kebisingan",
                                                    style: pw.TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: pw
                                                            .FontWeight
                                                            .normal)),
                                              ),
                                            ])
                                          ])
                                    ])
                              ])
                        ])
                  ]))
            ]; // Center
          })); // Page

      Uint8List bytes = await pdf.save();
      final dir = await getApplicationDocumentsDirectory();
      // final file = File('${dir.path}/pasienMCU.pdf');

      final file =
          File('${dir.path}/Hasil MCU ${pasienSnapshots['namaPasien']}');
      // await OpenFilex.open(file.path);
      await OpenFile.open(file.path);
      await file.writeAsBytes(bytes);
    }

    return Scaffold(
      appBar: AppBar(title: Text('Review Hasil MCU')),
      body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(pasienSnapshots['namaPasien']),
              ElevatedButton(
                  child: Text('Download File'),
                  onPressed: () {
                    getPDF();
                  })
            ],
          )),
    );
  }
}
