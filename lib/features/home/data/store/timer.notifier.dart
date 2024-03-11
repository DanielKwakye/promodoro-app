import 'dart:async';
import 'package:alarm/alarm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promodo/core/app.constants.dart';
import 'package:promodo/features/home/data/models/promodoro.session.model.dart';
import 'package:promodo/features/home/data/store/enums.dart';
import 'package:promodo/features/home/data/store/timer.state.dart';

class TimerNotifier extends Notifier<TimerState> {

  late Timer _timer;

  @override
  TimerState build() {
    return const TimerState();
  }

  //! This method gets the existing settings
  Map<PromodoroSession, int> getSettings() {
    return {
      state.promodoroSettings.session: state.promodoroSettings.timeInSeconds,
      state.shortBreakSettings.session: state.shortBreakSettings.timeInSeconds,
      state.longBreakSettings.session: state.longBreakSettings.timeInSeconds,
    };
  }

  //! This method updates the settings
  void updateSettings({int? pomodoroTimeInSeconds, int? shortBreakTimeInSeconds, int? longBreakTimeInSeconds}) {
    state = state.copyWith(
        promodoroSettings: pomodoroTimeInSeconds != null ? state.promodoroSettings.copyWith(timeInSeconds: pomodoroTimeInSeconds) : state.promodoroSettings,
        shortBreakSettings: shortBreakTimeInSeconds != null ? state.shortBreakSettings.copyWith(timeInSeconds: shortBreakTimeInSeconds) : state.shortBreakSettings,
        longBreakSettings: longBreakTimeInSeconds != null ? state.longBreakSettings.copyWith(timeInSeconds: longBreakTimeInSeconds) : state.longBreakSettings
    );


  }

  void toggleTimer() {
    if(!state.timerIsRunning) {
      resumeTimer();
      startTimer();
    }else {
      pauseTimer();
    }
  }

  // executed anytime a pomodoro session is completed
  void _evaluatePomodoroSession() {

    debugPrint("numberOfPromodoroRoundsCompleted => ${state.numberOfPromodoroRoundsCompleted}");
    if(state.activePromodoroSession == PromodoroSession.promodoro){
      ///! Long break after every 4 completed rounds
      if(state.numberOfPromodoroRoundsCompleted == 4){
        state = state.copyWith(
          activePromodoroSession: state.longBreakSettings.session,
          timeInitial: state.longBreakSettings.timeInSeconds,
          timeRemaining: state.longBreakSettings.timeInSeconds,
          numberOfPromodoroRoundsCompleted: 0
        );
        _notifyUser(title: "Long break 👏", body: "You did great. Promodoro session is over. It's time for a long break");
      }else {
        /// 1 short break after each session
        state = state.copyWith(
            activePromodoroSession: state.shortBreakSettings.session,
            timeInitial: state.shortBreakSettings.timeInSeconds,
            timeRemaining: state.shortBreakSettings.timeInSeconds
        );
        _notifyUser(title: "Short break 👏", body: "Good Job!. Promodoro session is over. It's time for a short break");
      }
    }else {

      /// after every break, there is a pomodoro session
      state = state.copyWith(
          activePromodoroSession: state.promodoroSettings.session,
          timeInitial: state.promodoroSettings.timeInSeconds,
          timeRemaining: state.promodoroSettings.timeInSeconds
      );

      _notifyUser(title: "Pomodoro time 👏", body: "Let's focus now!. Break is over");

    }
  }

  // starts the timer
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {

      if(!state.timerIsRunning) {
        return;
      }

      if (state.timeRemaining > 0) {
        state = state.copyWith(
          timeRemaining: state.timeRemaining - 1
        );
      } else {
        // Countdown is complete, you can perform any action here
        pauseTimer();
        if(state.activePromodoroSession == PromodoroSession.promodoro) {
          state = state.copyWith( numberOfPromodoroRoundsCompleted: state.numberOfPromodoroRoundsCompleted + 1,);
        }
        _evaluatePomodoroSession();
      }
    });
  }

  void pauseTimer() {
    state = state.copyWith(
      timerIsRunning: false
    );
    _timer.cancel();
  }

  void resumeTimer() {
    state = state.copyWith(
      timerIsRunning: true
    );
  }


  /// Once a session is completed, the user is notified
  void _notifyUser({required String title, required String body}) async {
    final alarmSettings = AlarmSettings(
      id: AppConstants.alarmId,
      dateTime: DateTime.now(),
      assetAudioPath: 'assets/mp3/alarm.mp3',
      loopAudio: false,
      vibrate: true,
      volume: 0.8,
      fadeDuration: 3.0,
      notificationTitle: title,
      notificationBody: body,
      enableNotificationOnKill: true,
    );

    await Alarm.set(alarmSettings: alarmSettings);
  }

}