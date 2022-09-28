import 'package:flutter/material.dart';

class KGradientColor {
  KGradientColor._();

  static const kGradientButtonColor = BoxDecoration(
    gradient: LinearGradient(colors: [
      Color(0xFFFF3A44),
      Color(0xFFFF8086),
    ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
  );
}
