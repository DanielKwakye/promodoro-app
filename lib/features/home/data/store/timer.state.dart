import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:promodo/features/home/data/models/promodoro.session.model.dart';
import 'package:promodo/features/home/data/store/enums.dart';

part 'timer.state.g.dart';

@immutable
@CopyWith()
class TimerState {

  final PromodoroSessionModel promodoroSettings;
  final PromodoroSessionModel longBreakSettings;
  final PromodoroSessionModel shortBreakSettings;
  final PromodoroSession activePromodoroSession;
  final bool timerIsRunning;
  final int timeInitial;
  final int timeRemaining;
  final int numberOfPromodoroRoundsCompleted;

  const TimerState({
    this.activePromodoroSession = PromodoroSession.promodoro,
    this.timerIsRunning = false,
    this.timeRemaining = 10 * 60,
    this.timeInitial = 10 * 60,
    this.numberOfPromodoroRoundsCompleted = 0,
    this.promodoroSettings = const PromodoroSessionModel(session: PromodoroSession.promodoro, timeInSeconds: 10 * 60),
    this.longBreakSettings = const PromodoroSessionModel(session: PromodoroSession.longBreak, timeInSeconds: 5 * 60),
    this.shortBreakSettings = const PromodoroSessionModel(session: PromodoroSession.shortBreak, timeInSeconds: 2 * 60),
  });

}