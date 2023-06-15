import 'package:arifa_medikal_klink_3/components/widget/text.dart';
import 'package:arifa_medikal_klink_3/model/pemeriksaan_tht_model.dart';
import 'package:flutter/material.dart';

class ListHidung extends StatelessWidget {
  const ListHidung({
    super.key,
    required PemeriksaanTHTModel? pemeriksaanTHT,
  }) : _pemeriksaanTHT = pemeriksaanTHT;

  final PemeriksaanTHTModel? _pemeriksaanTHT;

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
                    "Pilek/Tersumbat", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_pemeriksaanTHT!.hidung!.pilekTersumbat}",
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
                child:
                    textDefault("Lidah", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_pemeriksaanTHT!.hidung!.lidah}",
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
                    "Lain-Lain", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_pemeriksaanTHT!.hidung!.lainLain}",
                    Colors.black, 12, FontWeight.normal),
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
