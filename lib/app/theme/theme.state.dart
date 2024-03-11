import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:promodo/core/app.fonts.dart';
import 'package:promodo/features/home/data/models/promodoro.session.model.dart';
import 'package:promodo/features/home/data/store/enums.dart';

part 'theme.state.g.dart';

@immutable
@CopyWith()
class ThemeState {
    final AppFont? appFont;
    final ThemeData? themeData;

    const ThemeState({
      this.appFont,
      this.themeData
    });
}