import 'package:flutter/material.dart';

abstract final class AppColors {

  static const Color begonia = Color(0xFFF87070);
  static const Color heliotrope = Color(0xFFD881F8);
  static const Color electricBlue = Color(0xFF70F3F8);
  static const Color darkGunMetal = Color(0xFF161932);
  // static const Color yankeesBlue = Color(0xFF1E213F);
  static const Color whiteSmoke = Color(0xFFF5F5F5);
  static const Color azureishWhite = Color(0xFFD7E0FF);
  static const Color oldSilver = Color(0xFF828282);
  static const Color raisinBlack = Color(0xFF202021);


  static const MaterialColor yankeesBlue = MaterialColor(
    yankeesBlueColor,
    <int, Color>{
      400: Color(0xFF2E335A),
      500: Color(yankeesBlueColor),
      600: darkGunMetal,
      700: Color(0xFF0E112A),
    },
  );
  static const int yankeesBlueColor = 0xFF1E213F;


}

enum Appearance {
  dark,info, error
}

