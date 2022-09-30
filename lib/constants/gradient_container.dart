import 'package:flutter/material.dart';

class KGradientContainer {
  KGradientContainer._();

  static const kGradientButtonContainer = BoxDecoration(
    gradient: LinearGradient(colors: [
      Color(0xFFFF3A44),
      Color(0xFFFF8086),
    ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
  );
}
