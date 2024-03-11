import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promodo/app/theme/theme.notifier.dart';
import 'package:promodo/app/theme/theme.state.dart';
import 'package:promodo/features/home/data/store/enums.dart';
import 'package:promodo/features/home/data/store/timer.notifier.dart';
import 'package:promodo/features/home/data/store/timer.state.dart';


/// Creates a [ThemeNotifier] and initialise it with pre-defined values.
///
final themeProvider = NotifierProvider<ThemeNotifier, ThemeState>(ThemeNotifier.new);

/// Get the dark theme values
///
/// By using [Provider], this value is cached, making it performant.
/// the value will be computed only once (until the theme changes).



/// Creates a [TimerNotifier] and initialise it with pre-defined values.
///
final timerProvider = NotifierProvider<TimerNotifier, TimerState>(TimerNotifier.new);



