import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promodo/app/theme/theme.state.dart';
import 'package:promodo/core/app.colors.dart';
import 'package:promodo/core/app.fonts.dart';

//! Custom notifier for interacting with the Theme
class ThemeNotifier extends Notifier<ThemeState> {

  @override
  ThemeState build() {
    return  ThemeState(
      appFont: AppFont.kumbhSans,
      themeData: ThemeData(
          brightness: Brightness.light,
          colorScheme: _lightColorScheme.copyWith(
            primary: AppColors.begonia,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: _lightColorScheme.background,
          ),
          textTheme: _kumbhSans(Brightness.light)
      )
    );
  }

  //! Set the theme brightness to dark / light

  void setDarkMode() {
    state = state.copyWith(
      themeData: state.themeData?.copyWith(
          colorScheme: _darkColorScheme,
          appBarTheme: state.themeData?.appBarTheme.copyWith(
            backgroundColor: _darkColorScheme.background,
          )
      )
    );
  }

  void setLightMode() {
    state = state.copyWith(
      themeData: state.themeData?.copyWith(
          colorScheme: _lightColorScheme,
          appBarTheme: state.themeData?.appBarTheme.copyWith(
            backgroundColor: _lightColorScheme.background,
          )
      )
    );
  }

  //! Set the theme primary color to begonia, heliotrope, electricBlue
  void setThemePrimaryColor(Color color) {
    state = state.copyWith(
      themeData: state.themeData?.copyWith(colorScheme: state.themeData?.colorScheme.copyWith(primary: color))
    );
  }

  //! Set the theme primary color to kumbh sans, Roboto Slab, Space Mono
  void setFontTextTheme(AppFont appFont) {
    switch(appFont) {
      case AppFont.robotoSlab:
        state = state.copyWith(
          appFont: appFont,
          themeData: state.themeData?.copyWith(
              textTheme: _robotoSlab(state.themeData?.brightness ?? Brightness.light)
          )
        );
        break;

      case AppFont.spaceMono:
        state = state.copyWith(
            appFont: appFont,
            themeData: state.themeData?.copyWith(
                textTheme: _spaceMono(state.themeData?.brightness ?? Brightness.light)
            )
        );
        break;
      default:
        state = state.copyWith(
            appFont: appFont,
            themeData: state.themeData?.copyWith(
                textTheme: _kumbhSans(state.themeData?.brightness ?? Brightness.light)
            )
        );
    }

  }


  //! Color Scheme for Dark Mode
  ColorScheme get _darkColorScheme {
    return const ColorScheme.dark(
        background: AppColors.yankeesBlue,
        onBackground: Colors.white,
        surface: AppColors.darkGunMetal,
        onSurface: AppColors.azureishWhite,
        onPrimary: Colors.white,
        tertiary: AppColors.raisinBlack,
        onTertiary: Colors.white,
    );
  }


  //! Color Scheme for Light Mode
  ColorScheme get _lightColorScheme{
    return const ColorScheme.light(
        background: AppColors.yankeesBlue,
        onBackground: Colors.black,
        surface: AppColors.darkGunMetal,
        onSurface: AppColors.azureishWhite,
        onPrimary: Colors.white,
        tertiary: Colors.white,
        onTertiary: AppColors.oldSilver
    );
  }

  //! Kumbh Sans Font
  TextTheme _kumbhSans (Brightness themeMode) {
    bool darkMode = themeMode == Brightness.dark;
    //kumbhSansTextTheme
    return GoogleFonts.kumbhSansTextTheme().copyWith(
      displayLarge: GoogleFonts.kumbhSans(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      displayMedium: GoogleFonts.kumbhSans(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      displaySmall: GoogleFonts.kumbhSans(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      headlineMedium: GoogleFonts.kumbhSans(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      headlineSmall: GoogleFonts.kumbhSans(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      titleLarge: GoogleFonts.kumbhSans(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),

      bodyMedium: GoogleFonts.kumbhSans(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      bodySmall: GoogleFonts.kumbhSans(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      bodyLarge: GoogleFonts.kumbhSans(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      titleMedium: GoogleFonts.kumbhSans(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      titleSmall: GoogleFonts.kumbhSans(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
    );
  }

  //! Roboto Slab Font
  TextTheme _robotoSlab (Brightness themeMode) {
    bool darkMode = themeMode == Brightness.dark;
    //kumbhSansTextTheme
    return GoogleFonts.robotoSlabTextTheme().copyWith(
      displayLarge: GoogleFonts.robotoSlab(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      displayMedium: GoogleFonts.robotoSlab(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      displaySmall: GoogleFonts.robotoSlab(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      headlineMedium: GoogleFonts.robotoSlab(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      headlineSmall: GoogleFonts.robotoSlab(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      titleLarge: GoogleFonts.robotoSlab(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),

      bodyMedium: GoogleFonts.robotoSlab(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      bodySmall: GoogleFonts.robotoSlab(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      bodyLarge: GoogleFonts.robotoSlab(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      titleMedium: GoogleFonts.robotoSlab(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      titleSmall: GoogleFonts.robotoSlab(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
    );
  }

  //! Space Mono Font
  TextTheme _spaceMono (Brightness themeMode) {
    bool darkMode = themeMode == Brightness.dark;
    //kumbhSansTextTheme
    return GoogleFonts.spaceMonoTextTheme().copyWith(
      displayLarge: GoogleFonts.spaceMono(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      displayMedium: GoogleFonts.spaceMono(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      displaySmall: GoogleFonts.spaceMono(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      headlineMedium: GoogleFonts.spaceMono(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      headlineSmall: GoogleFonts.spaceMono(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      titleLarge: GoogleFonts.spaceMono(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),

      bodyMedium: GoogleFonts.spaceMono(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      bodySmall: GoogleFonts.spaceMono(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      bodyLarge: GoogleFonts.spaceMono(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      titleMedium: GoogleFonts.spaceMono(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
      titleSmall: GoogleFonts.spaceMono(color: darkMode ? _darkColorScheme.onBackground : _lightColorScheme.onBackground),
    );
  }




}