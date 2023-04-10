import 'package:flutter/material.dart';

import '../../../components/colors/color.dart';
import '../../../components/widget/text.dart';

class RiwwayatKebiasaan3 extends StatefulWidget {
  const RiwwayatKebiasaan3({super.key});

  @override
  State<RiwwayatKebiasaan3> createState() => _RiwwayatKebiasaan3State();
}

class _RiwwayatKebiasaan3State extends State<RiwwayatKebiasaan3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueDefault,
        automaticallyImplyLeading: false,
        title: Row(children: [
          Icon(Icons.arrow_back),
          SizedBox(
            width: 20,
          ),
          textDefault("Riwayat Kebiasaan", Colors.white, 18, FontWeight.bold)
        ]),
      ),
    );
  }
}
