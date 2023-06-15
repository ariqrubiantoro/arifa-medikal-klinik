import 'package:arifa_medikal_klink_3/components/widget/text.dart';
import 'package:arifa_medikal_klink_3/model/kesimpulan_derajat_kesehatan.dart';
import 'package:flutter/material.dart';

class ListKesimpulanDerajat extends StatelessWidget {
  const ListKesimpulanDerajat({
    super.key,
    required KesimpulanDerajatKesehatanModel? kesimpulanDerajatKesehatan,
  }) : _kesimpulanDerajatKesehatan = kesimpulanDerajatKesehatan;

  final KesimpulanDerajatKesehatanModel? _kesimpulanDerajatKesehatan;

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
                child: textDefault("Tidak Ditemukan Kelainan Medis",
                    Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_kesimpulanDerajatKesehatan!.ditemukanKelainanMedis}",
                    Colors.black,
                    12,
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
                child: textDefault("Ditemukan Kelainan Medis yang Tidak Serius",
                    Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_kesimpulanDerajatKesehatan!.ditemukanKelainanYangTidakSerius}",
                    Colors.black,
                    12,
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
                    "Ditemukan Kelainan Medis, Risiko Kesehatan Rendah",
                    Colors.black,
                    12,
                    FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_kesimpulanDerajatKesehatan!.ditemukanKelainanResikoKesehatanRendah}",
                    Colors.black,
                    12,
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
                    "Ditemukan Kelainan Medis Bermakna yang Dapat Menjadi Serius, Resiko Kesehatan Sedang",
                    Colors.black,
                    12,
                    FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_kesimpulanDerajatKesehatan!.ditemukanKelainanResikoKesehatanSedang}",
                    Colors.black,
                    12,
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
                    "Ditemukan Kelainan Medis yang Serius, Resiko Kesehatan Tinggi",
                    Colors.black,
                    12,
                    FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_kesimpulanDerajatKesehatan!.ditemukanKelainanResikoKesehatanTinggi}",
                    Colors.black,
                    12,
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
                    "Ditemukan Kelainan Medis yang Menyebabkan Keterbatasan Fisik Maupun Psikis untuk Melakukan Sesuai Jabatan/Posisinya",
                    Colors.black,
                    12,
                    FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    "${_kesimpulanDerajatKesehatan!.tidakDapatBekerja}",
                    Colors.black,
                    12,
                    FontWeight.normal),
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
 