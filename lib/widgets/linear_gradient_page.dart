import 'package:flutter/material.dart';

class LinearGradientWidget extends StatelessWidget {
  const LinearGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // tileMode: TileMode.clamp,
            colors: <Color>[
              Color(0xff626262).withOpacity(0.35),
              Color(0xff000000),
            ], // Gradient from ht
          ),
        ),
      ),
    );
  }
}
