import 'package:flutter/material.dart';

class ConstColor {
  static const customBackgroundColor = Color(0xff0F0B21);
  static const customCardColor = Color(0xff221C44);
  static const customFlatButtonColor = Color(0xff6C63FF);
}

class CustomLinearGradient {
  static const customLinearGradient = LinearGradient(
    tileMode: TileMode.clamp,
    stops: [0.5, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff322C54),
      Color(0xff231D49),
    ],
  );

  static const customPhotoCardLinearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.white,
      Colors.black,
    ],
  );
}
