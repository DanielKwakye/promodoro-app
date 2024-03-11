import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promodo/core/app.colors.dart';

/// UI overlay -> Configure app status bar and android navigation bar here
void setSystemUIOverlays(Brightness brightness) {
  final  systemOverlayStyle = brightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;
  SystemChrome.setSystemUIOverlayStyle(systemOverlayStyle.copyWith(
    statusBarColor: Colors.transparent, // android only
    // statusBarColor: brightness == Brightness.dark  ? kBlack : kWhite, // android only
    statusBarIconBrightness: brightness == Brightness.dark ? Brightness.light : Brightness.dark, // android only
    systemNavigationBarColor: brightness == Brightness.dark  ? AppColors.yankeesBlue : AppColors.whiteSmoke, // android only
    systemNavigationBarIconBrightness: brightness == Brightness.dark ? Brightness.light : Brightness.dark, // android only
    statusBarBrightness: brightness == Brightness.dark ? Brightness.dark : Brightness.light, // ios only
  ));

}

String formatSecondsToMinutes(int seconds) {
  int minutes = seconds ~/ 60;
  int remainingSeconds = seconds % 60;

  return "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
}
