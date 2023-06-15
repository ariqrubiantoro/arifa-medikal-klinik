import 'package:arifa_medikal_klink_3/components/widget/text.dart';
import 'package:arifa_medikal_klink_3/model/ajuran_model.dart';
import 'package:flutter/material.dart';

class ListAnjuran extends StatelessWidget {
  const ListAnjuran({
    super.key,
    required AjuranModel? ajuran,
  }) : _ajuran = ajuran;

  final AjuranModel? _ajuran;

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
                    "Konsumsi Air Mineral 2-3 Liter dalam Sehari",
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
                child: textDefault("${_ajuran!.konsumsiAir}", Colors.black, 12,
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
                    "Olahraga Teratur Minimal 30 Menit Setiap Harinya 3-4X Seminggus",
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
                child: textDefault("${_ajuran!.olahragaTeratur}", Colors.black,
                    12, FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        _ajuran!.anjuran3 == ""
            ? Container()
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        child: textDefault(
                            "", Colors.black, 12, FontWeight.normal),
                      ),
                    ),
                    Container(
                      child: textDefault(
                          ":  ", Colors.black, 12, FontWeight.normal),
                    ),
                    Expanded(
                      child: Container(
                        child: textDefault("${_ajuran!.anjuran3}", Colors.black,
                            12, FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ]),
        _ajuran!.anjuran4 == ""
            ? Container()
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        child: textDefault(
                            "", Colors.black, 12, FontWeight.normal),
                      ),
                    ),
                    Container(
                      child: textDefault(
                          ":  ", Colors.black, 12, FontWeight.normal),
                    ),
                    Expanded(
                      child: Container(
                        child: textDefault("${_ajuran!.anjuran4}", Colors.black,
                            12, FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ]),
        _ajuran!.anjuran5 == ""
            ? Container()
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        child: textDefault(
                            "", Colors.black, 12, FontWeight.normal),
                      ),
                    ),
                    Container(
                      child: textDefault(
                          ":  ", Colors.black, 12, FontWeight.normal),
                    ),
                    Expanded(
                      child: Container(
                        child: textDefault("${_ajuran!.anjuran5}", Colors.black,
                            12, FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ]),
        _ajuran!.anjuran6 == ""
            ? Container()
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        child: textDefault(
                            "", Colors.black, 12, FontWeight.normal),
                      ),
                    ),
                    Container(
                      child: textDefault(
                          ":  ", Colors.black, 12, FontWeight.normal),
                    ),
                    Expanded(
                      child: Container(
                        child: textDefault("${_ajuran!.anjuran6}", Colors.black,
                            12, FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ]),
        _ajuran!.anjuran7 == ""
            ? Container()
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        child: textDefault(
                            "", Colors.black, 12, FontWeight.normal),
                      ),
                    ),
                    Container(
                      child: textDefault(
                          ":  ", Colors.black, 12, FontWeight.normal),
                    ),
                    Expanded(
                      child: Container(
                        child: textDefault("${_ajuran!.anjuran7}", Colors.black,
                            12, FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ]),
        _ajuran!.anjuran8 == ""
            ? Container()
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        child: textDefault(
                            "", Colors.black, 12, FontWeight.normal),
                      ),
                    ),
                    Container(
                      child: textDefault(
                          ":  ", Colors.black, 12, FontWeight.normal),
                    ),
                    Expanded(
                      child: Container(
                        child: textDefault("${_ajuran!.anjuran8}", Colors.black,
                            12, FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ]),
        _ajuran!.anjuran9 == ""
            ? Container()
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        child: textDefault(
                            "", Colors.black, 12, FontWeight.normal),
                      ),
                    ),
                    Container(
                      child: textDefault(
                          ":  ", Colors.black, 12, FontWeight.normal),
                    ),
                    Expanded(
                      child: Container(
                        child: textDefault("${_ajuran!.anjuran9}", Colors.black,
                            12, FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ]),
      ],
    );
  }
}
