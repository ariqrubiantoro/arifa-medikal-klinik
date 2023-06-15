import 'package:arifa_medikal_klink_3/components/widget/text.dart';
import 'package:arifa_medikal_klink_3/model/riwayat_kebiasaan_model.dart';
import 'package:flutter/material.dart';

class ListRiwayatKebiasaan extends StatelessWidget {
  const ListRiwayatKebiasaan({
    super.key,
    required RiwayatKebiasaanModel? riwayatKebiasaan,
    required this.merokokLama,
    required this.merokokBungkus,
    required this.mirasLama,
    required this.mirasBotol,
  }) : _riwayatKebiasaan = riwayatKebiasaan;

  final RiwayatKebiasaanModel? _riwayatKebiasaan;
  final String merokokLama;
  final String merokokBungkus;
  final String mirasLama;
  final String mirasBotol;

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
                    textDefault("Merokok", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_riwayatKebiasaan!.strMerokok}",
                    Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: textDefault(
                        "a) Lama", Colors.black, 12, FontWeight.normal),
                  ),
                ),
                Container(
                  child: textDefault("", Colors.black, 12, FontWeight.normal),
                ),
                Expanded(
                  child: Container(
                    child: textDefault(
                        merokokLama, Colors.black, 12, FontWeight.normal),
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
                        "b) Banyak", Colors.black, 12, FontWeight.normal),
                  ),
                ),
                Container(
                  child: textDefault("", Colors.black, 12, FontWeight.normal),
                ),
                Expanded(
                  child: Container(
                    child: textDefault(
                        merokokBungkus, Colors.black, 12, FontWeight.normal),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child:
                    textDefault("Miras", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault("", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_riwayatKebiasaan!.strMiras}",
                    Colors.black, 12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: textDefault(
                        "a) Lama", Colors.black, 12, FontWeight.normal),
                  ),
                ),
                Container(
                  child: textDefault("", Colors.black, 12, FontWeight.normal),
                ),
                Expanded(
                  child: Container(
                    child: textDefault(
                        mirasLama, Colors.black, 12, FontWeight.normal),
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
                        "b) Banyak", Colors.black, 12, FontWeight.normal),
                  ),
                ),
                Container(
                  child: textDefault("", Colors.black, 12, FontWeight.normal),
                ),
                Expanded(
                  child: Container(
                    child: textDefault(
                        mirasBotol, Colors.black, 12, FontWeight.normal),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: textDefault(
                    "Olahraga", Colors.black, 12, FontWeight.normal),
              ),
            ),
            Container(
              child: textDefault(":  ", Colors.black, 12, FontWeight.normal),
            ),
            Expanded(
              child: Container(
                child: textDefault("${_riwayatKebiasaan!.olahraga}",
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
