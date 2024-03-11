// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer.state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TimerStateCWProxy {
  TimerState activePromodoroSession(PromodoroSession activePromodoroSession);

  TimerState timerIsRunning(bool timerIsRunning);

  TimerState timeRemaining(int timeRemaining);

  TimerState timeInitial(int timeInitial);

  TimerState numberOfPromodoroRoundsCompleted(
      int numberOfPromodoroRoundsCompleted);

  TimerState promodoroSettings(PromodoroSessionModel promodoroSettings);

  TimerState longBreakSettings(PromodoroSessionModel longBreakSettings);

  TimerState shortBreakSettings(PromodoroSessionModel shortBreakSettings);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TimerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TimerState(...).copyWith(id: 12, name: "My name")
  /// ````
  TimerState call({
    PromodoroSession? activePromodoroSession,
    bool? timerIsRunning,
    int? timeRemaining,
    int? timeInitial,
    int? numberOfPromodoroRoundsCompleted,
    PromodoroSessionModel? promodoroSettings,
    PromodoroSessionModel? longBreakSettings,
    PromodoroSessionModel? shortBreakSettings,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTimerState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTimerState.copyWith.fieldName(...)`
class _$TimerStateCWProxyImpl implements _$TimerStateCWProxy {
  const _$TimerStateCWProxyImpl(this._value);

  final TimerState _value;

  @override
  TimerState activePromodoroSession(PromodoroSession activePromodoroSession) =>
      this(activePromodoroSession: activePromodoroSession);

  @override
  TimerState timerIsRunning(bool timerIsRunning) =>
      this(timerIsRunning: timerIsRunning);

  @override
  TimerState timeRemaining(int timeRemaining) =>
      this(timeRemaining: timeRemaining);

  @override
  TimerState timeInitial(int timeInitial) => this(timeInitial: timeInitial);

  @override
  TimerState numberOfPromodoroRoundsCompleted(
          int numberOfPromodoroRoundsCompleted) =>
      this(numberOfPromodoroRoundsCompleted: numberOfPromodoroRoundsCompleted);

  @override
  TimerState promodoroSettings(PromodoroSessionModel promodoroSettings) =>
      this(promodoroSettings: promodoroSettings);

  @override
  TimerState longBreakSettings(PromodoroSessionModel longBreakSettings) =>
      this(longBreakSettings: longBreakSettings);

  @override
  TimerState shortBreakSettings(PromodoroSessionModel shortBreakSettings) =>
      this(shortBreakSettings: shortBreakSettings);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TimerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TimerState(...).copyWith(id: 12, name: "My name")
  /// ````
  TimerState call({
    Object? activePromodoroSession = const $CopyWithPlaceholder(),
    Object? timerIsRunning = const $CopyWithPlaceholder(),
    Object? timeRemaining = const $CopyWithPlaceholder(),
    Object? timeInitial = const $CopyWithPlaceholder(),
    Object? numberOfPromodoroRoundsCompleted = const $CopyWithPlaceholder(),
    Object? promodoroSettings = const $CopyWithPlaceholder(),
    Object? longBreakSettings = const $CopyWithPlaceholder(),
    Object? shortBreakSettings = const $CopyWithPlaceholder(),
  }) {
    return TimerState(
      activePromodoroSession:
          activePromodoroSession == const $CopyWithPlaceholder() ||
                  activePromodoroSession == null
              ? _value.activePromodoroSession
              // ignore: cast_nullable_to_non_nullable
              : activePromodoroSession as PromodoroSession,
      timerIsRunning: timerIsRunning == const $CopyWithPlaceholder() ||
              timerIsRunning == null
          ? _value.timerIsRunning
          // ignore: cast_nullable_to_non_nullable
          : timerIsRunning as bool,
      timeRemaining:
          timeRemaining == const $CopyWithPlaceholder() || timeRemaining == null
              ? _value.timeRemaining
              // ignore: cast_nullable_to_non_nullable
              : timeRemaining as int,
      timeInitial:
          timeInitial == const $CopyWithPlaceholder() || timeInitial == null
              ? _value.timeInitial
              // ignore: cast_nullable_to_non_nullable
              : timeInitial as int,
      numberOfPromodoroRoundsCompleted:
          numberOfPromodoroRoundsCompleted == const $CopyWithPlaceholder() ||
                  numberOfPromodoroRoundsCompleted == null
              ? _value.numberOfPromodoroRoundsCompleted
              // ignore: cast_nullable_to_non_nullable
              : numberOfPromodoroRoundsCompleted as int,
      promodoroSettings: promodoroSettings == const $CopyWithPlaceholder() ||
              promodoroSettings == null
          ? _value.promodoroSettings
          // ignore: cast_nullable_to_non_nullable
          : promodoroSettings as PromodoroSessionModel,
      longBreakSettings: longBreakSettings == const $CopyWithPlaceholder() ||
              longBreakSettings == null
          ? _value.longBreakSettings
          // ignore: cast_nullable_to_non_nullable
          : longBreakSettings as PromodoroSessionModel,
      shortBreakSettings: shortBreakSettings == const $CopyWithPlaceholder() ||
              shortBreakSettings == null
          ? _value.shortBreakSettings
          // ignore: cast_nullable_to_non_nullable
          : shortBreakSettings as PromodoroSessionModel,
    );
  }
}

extension $TimerStateCopyWith on TimerState {
  /// Returns a callable class that can be used as follows: `instanceOfTimerState.copyWith(...)` or like so:`instanceOfTimerState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TimerStateCWProxy get copyWith => _$TimerStateCWProxyImpl(this);
}
