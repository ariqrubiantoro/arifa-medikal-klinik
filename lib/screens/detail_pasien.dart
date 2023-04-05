import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

      pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Center(
                child: pw.Column(children: [
              pw.Text('Nama: ' + pasienSnapshots['namaPasien']),
              pw.Text('NIK: ' + pasienSnapshots['NIK']),
              pw.Text('Umur: ' + pasienSnapshots['umur'])
            ])); // Center
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
