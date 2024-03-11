// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promodoro.session.model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PromodoroSessionModelCWProxy {
  PromodoroSessionModel session(PromodoroSession session);

  PromodoroSessionModel timeInSeconds(int timeInSeconds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PromodoroSessionModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PromodoroSessionModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PromodoroSessionModel call({
    PromodoroSession? session,
    int? timeInSeconds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPromodoroSessionModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPromodoroSessionModel.copyWith.fieldName(...)`
class _$PromodoroSessionModelCWProxyImpl
    implements _$PromodoroSessionModelCWProxy {
  const _$PromodoroSessionModelCWProxyImpl(this._value);

  final PromodoroSessionModel _value;

  @override
  PromodoroSessionModel session(PromodoroSession session) =>
      this(session: session);

  @override
  PromodoroSessionModel timeInSeconds(int timeInSeconds) =>
      this(timeInSeconds: timeInSeconds);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PromodoroSessionModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PromodoroSessionModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PromodoroSessionModel call({
    Object? session = const $CopyWithPlaceholder(),
    Object? timeInSeconds = const $CopyWithPlaceholder(),
  }) {
    return PromodoroSessionModel(
      session: session == const $CopyWithPlaceholder() || session == null
          ? _value.session
          // ignore: cast_nullable_to_non_nullable
          : session as PromodoroSession,
      timeInSeconds:
          timeInSeconds == const $CopyWithPlaceholder() || timeInSeconds == null
              ? _value.timeInSeconds
              // ignore: cast_nullable_to_non_nullable
              : timeInSeconds as int,
    );
  }
}

extension $PromodoroSessionModelCopyWith on PromodoroSessionModel {
  /// Returns a callable class that can be used as follows: `instanceOfPromodoroSessionModel.copyWith(...)` or like so:`instanceOfPromodoroSessionModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PromodoroSessionModelCWProxy get copyWith =>
      _$PromodoroSessionModelCWProxyImpl(this);
}
