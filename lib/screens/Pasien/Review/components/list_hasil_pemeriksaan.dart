import 'package:flutter/material.dart';

import '../../../../components/widget/text.dart';

class ListHasilPemeriksaan extends StatelessWidget {
  ListHasilPemeriksaan(
      {super.key,
      required this.judul,
      required this.dokterApa,
      required this.namaDokter,
      required this.foto,
      required this.keterangan});
  String judul;
  String dokterApa;
  String namaDokter;
  String foto;
  String keterangan;

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
                child:
                    textDefault("Judul", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    // _hasilFisik != null
                    //     ? boolHasilFisik
                    //         ? "${_hasilFisik!.judul}"
                    //         : ""
                    //     : _hasilMata != null
                    //         ? boolHasilMata
                    //             ? "${_hasilMata!.judul}"
                    //             : ""
                    //         : _hasilGigiMulut != null
                    //             ? boolHasilGigiMulut
                    //                 ? "${_hasilGigiMulut!.judul}"
                    //                 : ""
                    //             : _hasilAudiometri != null
                    //                 ? boolHasilAudiometri
                    //                     ? "${_hasilAudiometri!.judul}"
                    //                     : ""
                    //                 : _hasilSpirometri != null
                    //                     ? boolHasilSpirometri
                    //                         ? "${_hasilSpirometri!.judul}"
                    //                         : ""
                    //                     : _hasilTreadmill != null
                    //                         ? boolHasilTreadmill
                    //                             ? "${_hasilTreadmill!.judul}"
                    //                             : ""
                    //                         : _hasilLaboratorium != null
                    //                             ? boolHasilLaboratorium
                    //                                 ? "${_hasilLaboratorium!.judul}"
                    //                                 : ""
                    //                             : _hasilJantung != null
                    //                                 ? boolHasilJantung
                    //                                     ? "${_hasilJantung!.judul}"
                    //                                     : ""
                    //                                 : _hasilParu != null
                    //                                     ? boolHasilParu
                    //                                         ? "${_hasilParu!.judul}"
                    //                                         : ""
                    //                                     : "",
                    "$judul",
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
                    // _hasilFisik == null
                    //     ? ""
                    //     : boolHasilFisik
                    //         ? "${_hasilFisik!.dokterApa}"
                    //         : _hasilMata == null
                    //             ? ""
                    //             : boolHasilMata
                    //                 ? "${_hasilMata!.dokterApa}"
                    //                 : _hasilGigiMulut == null
                    //                     ? ""
                    //                     : boolHasilGigiMulut
                    //                         ? "${_hasilGigiMulut!.dokterApa}"
                    //                         : _hasilAudiometri == null
                    //                             ? ""
                    //                             : boolHasilAudiometri
                    //                                 ? "${_hasilAudiometri!.dokterApa}"
                    //                                 : _hasilSpirometri == null
                    //                                     ? ""
                    //                                     : boolHasilSpirometri
                    //                                         ? "${_hasilSpirometri!.dokterApa}"
                    //                                         : _hasilTreadmill ==
                    //                                                 null
                    //                                             ? ""
                    //                                             : _hasilLaboratorium ==
                    //                                                     null
                    //                                                 ? ""
                    //                                                 : boolHasilLaboratorium
                    //                                                     ? "${_hasilLaboratorium!.dokterApa}"
                    //                                                     : _hasilJantung ==
                    //                                                             null
                    //                                                         ? ""
                    //                                                         : _hasilJantung == null
                    //                                                             ? ""
                    //                                                             : boolHasilJantung
                    //                                                                 ? "${_hasilJantung!.dokterApa}"
                    //                                                                 : _hasilParu == null
                    //                                                                     ? ""
                    //                                                                     : boolHasilParu
                    //                                                                         ? "${_hasilParu!.dokterApa}"
                    //                                                                         : "",
                    "$dokterApa",
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
                    // _hasilFisik == null
                    //     ? ""
                    //     : boolHasilFisik
                    //         ? "${_hasilFisik!.namaDokter}"
                    //         : _hasilMata == null
                    //             ? ""
                    //             : boolHasilMata
                    //                 ? "${_hasilMata!.namaDokter}"
                    //                 : _hasilGigiMulut == null
                    //                     ? ""
                    //                     : boolHasilGigiMulut
                    //                         ? "${_hasilGigiMulut!.namaDokter}"
                    //                         : _hasilAudiometri == null
                    //                             ? ""
                    //                             : boolHasilAudiometri
                    //                                 ? "${_hasilAudiometri!.namaDokter}"
                    //                                 : _hasilSpirometri == null
                    //                                     ? ""
                    //                                     : boolHasilSpirometri
                    //                                         ? "${_hasilSpirometri!.namaDokter}"
                    //                                         : _hasilTreadmill ==
                    //                                                 null
                    //                                             ? ""
                    //                                             : _hasilLaboratorium ==
                    //                                                     null
                    //                                                 ? ""
                    //                                                 : boolHasilLaboratorium
                    //                                                     ? "${_hasilLaboratorium!.namaDokter}"
                    //                                                     : _hasilJantung ==
                    //                                                             null
                    //                                                         ? ""
                    //                                                         : _hasilJantung == null
                    //                                                             ? ""
                    //                                                             : boolHasilJantung
                    //                                                                 ? "${_hasilJantung!.namaDokter}"
                    //                                                                 : _hasilParu == null
                    //                                                                     ? ""
                    //                                                                     : boolHasilParu
                    //                                                                         ? "${_hasilParu!.namaDokter}"
                    //                                                                         : "",
                    "$namaDokter",
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
                child: textDefault("Foto", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    // _hasilFisik == null
                    //     ? ""
                    //     : boolHasilFisik
                    //         ? "[FOTO]"
                    //         : _hasilMata == null
                    //             ? ""
                    //             : boolHasilMata
                    //                 ? "[FOTO]"
                    //                 : _hasilGigiMulut == null
                    //                     ? ""
                    //                     : boolHasilGigiMulut
                    //                         ? "[FOTO]"
                    //                         : _hasilAudiometri == null
                    //                             ? ""
                    //                             : boolHasilAudiometri
                    //                                 ? "[FOTO]"
                    //                                 : _hasilSpirometri == null
                    //                                     ? ""
                    //                                     : boolHasilSpirometri
                    //                                         ? "[FOTO]"
                    //                                         : _hasilTreadmill ==
                    //                                                 null
                    //                                             ? ""
                    //                                             : _hasilLaboratorium ==
                    //                                                     null
                    //                                                 ? ""
                    //                                                 : boolHasilLaboratorium
                    //                                                     ? "[FOTO]"
                    //                                                     : _hasilJantung ==
                    //                                                             null
                    //                                                         ? ""
                    //                                                         : _hasilJantung == null
                    //                                                             ? ""
                    //                                                             : boolHasilJantung
                    //                                                                 ? "[FOTO]"
                    //                                                                 : _hasilParu == null
                    //                                                                     ? ""
                    //                                                                     : boolHasilParu
                    //                                                                         ? "[FOTO]"
                    //                                                                         : "",
                    "$foto",
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
                    "Keterangan", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault(
                    // _hasilFisik == null
                    //     ? ""
                    //     : boolHasilFisik
                    //         ? "${_hasilFisik!.keterangan}"
                    //         : _hasilMata == null
                    //             ? ""
                    //             : boolHasilMata
                    //                 ? "${_hasilMata!.keterangan}"
                    //                 : _hasilGigiMulut == null
                    //                     ? ""
                    //                     : boolHasilGigiMulut
                    //                         ? "${_hasilGigiMulut!.keterangan}"
                    //                         : _hasilAudiometri == null
                    //                             ? ""
                    //                             : boolHasilAudiometri
                    //                                 ? "${_hasilAudiometri!.keterangan}"
                    //                                 : _hasilSpirometri == null
                    //                                     ? ""
                    //                                     : boolHasilSpirometri
                    //                                         ? "${_hasilSpirometri!.keterangan}"
                    //                                         : _hasilTreadmill ==
                    //                                                 null
                    //                                             ? ""
                    //                                             : _hasilLaboratorium ==
                    //                                                     null
                    //                                                 ? ""
                    //                                                 : boolHasilLaboratorium
                    //                                                     ? "${_hasilLaboratorium!.keterangan}"
                    //                                                     : _hasilJantung ==
                    //                                                             null
                    //                                                         ? ""
                    //                                                         : _hasilJantung == null
                    //                                                             ? ""
                    //                                                             : boolHasilJantung
                    //                                                                 ? "${_hasilJantung!.keterangan}"
                    //                                                                 : _hasilParu == null
                    //                                                                     ? ""
                    //                                                                     : boolHasilParu
                    //                                                                         ? "${_hasilParu!.keterangan}"
                    //                                                                         : "",
                    "$keterangan",
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
