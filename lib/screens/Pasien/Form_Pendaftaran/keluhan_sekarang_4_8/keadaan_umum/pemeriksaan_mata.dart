import 'package:flutter/material.dart';

import '../../../../../components/colors/color.dart';
import '../../../../../components/widget/text.dart';

class PemeriksaanMata extends StatefulWidget {
  const PemeriksaanMata({super.key});

  @override
  State<PemeriksaanMata> createState() => _PemeriksaanMataState();
}

class _PemeriksaanMataState extends State<PemeriksaanMata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueDefault,
        title: Row(
          children: [
            textDefault("Keadaan Umum - Pemeriksaan Mata", Colors.white, 18,
                FontWeight.bold)
          ],
        ),
      ),
    );
  }
}
