import 'package:flutter/material.dart';

import '../../../../components/widget/text.dart';
import '../../../../model/pasien_model.dart';

class ListProfilePasien extends StatelessWidget {
  const ListProfilePasien({
    super.key,
    required PasienModel? pasien,
  }) : _pasien = pasien;

  final PasienModel? _pasien;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Nama Pasien", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_pasien!.nama}", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Jenis Kelamin", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_pasien!.jenisKelamin}", Colors.black, 12,
                    FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault("NIK", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_pasien!.nik}", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Alamat", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_pasien!.alamat}", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault("Tanggal\nPemeriksaan", Colors.black, 12,
                    FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_pasien!.tanggalPemeriksaan}",
                    Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "TTL/Umur", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_pasien!.umur}", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Perusahaan", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_pasien!.perusahaan}", Colors.black, 12,
                    FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Bagian/Seksi", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_pasien!.bagian}", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "No. Handphone", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_pasien!.noHp}", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("No MCU", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_pasien!.noMcu}", Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
