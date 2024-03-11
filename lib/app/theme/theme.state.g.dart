// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ThemeStateCWProxy {
  ThemeState appFont(AppFont? appFont);

  ThemeState themeData(ThemeData? themeData);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ThemeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ThemeState(...).copyWith(id: 12, name: "My name")
  /// ````
  ThemeState call({
    AppFont? appFont,
    ThemeData? themeData,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfThemeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfThemeState.copyWith.fieldName(...)`
class _$ThemeStateCWProxyImpl implements _$ThemeStateCWProxy {
  const _$ThemeStateCWProxyImpl(this._value);

  final ThemeState _value;

  @override
  ThemeState appFont(AppFont? appFont) => this(appFont: appFont);

  @override
  ThemeState themeData(ThemeData? themeData) => this(themeData: themeData);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ThemeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ThemeState(...).copyWith(id: 12, name: "My name")
  /// ````
  ThemeState call({
    Object? appFont = const $CopyWithPlaceholder(),
    Object? themeData = const $CopyWithPlaceholder(),
  }) {
    return ThemeState(
      appFont: appFont == const $CopyWithPlaceholder()
          ? _value.appFont
          // ignore: cast_nullable_to_non_nullable
          : appFont as AppFont?,
      themeData: themeData == const $CopyWithPlaceholder()
          ? _value.themeData
          // ignore: cast_nullable_to_non_nullable
          : themeData as ThemeData?,
    );
  }
}

extension $ThemeStateCopyWith on ThemeState {
  /// Returns a callable class that can be used as follows: `instanceOfThemeState.copyWith(...)` or like so:`instanceOfThemeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ThemeStateCWProxy get copyWith => _$ThemeStateCWProxyImpl(this);
}
