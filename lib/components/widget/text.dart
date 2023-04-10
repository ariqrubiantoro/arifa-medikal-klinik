import 'package:flutter/material.dart';

textDefault(String message, Color color, double size, FontWeight fw) {
  return Text(
    message,
    style: TextStyle(color: color, fontSize: size, fontWeight: fw),
  );
}
