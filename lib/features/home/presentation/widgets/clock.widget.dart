import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:promodo/core/app.colors.dart';
import 'package:promodo/core/app.extensions.dart';
import 'package:promodo/core/app.providers.dart';
import 'package:promodo/core/utils.dart';

//! UI to display the clock
class ClockWidget extends ConsumerWidget {
  const ClockWidget({super.key});


  void onClockTapped(WidgetRef ref) {
    final timerProv = ref.read(timerProvider.notifier);
    timerProv.toggleTimer();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final isTablet = context.isTablet();
    final length = isTablet ? 400.0 : mediaQuery.size.width * 0.8;

    
    return GestureDetector(
      key: const ValueKey("clockTappableContainer"),
      onTap: () => onClockTapped(ref),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: isTablet ? 80 : 50),
        child: SizedBox(
          width: length,
          height: length,
          child: Stack(
            children: [
              Transform.rotate(
                angle: -45,
                // angle: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(length),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.yankeesBlue.shade400,
                        // color: Colors.redAccent,
                        blurRadius: 70,
                        spreadRadius: 0,
                        offset: const Offset(0, -30), // Shadow position
                      ),
                      BoxShadow(
                        // color: Colors.yellow,
                        color: AppColors.yankeesBlue.shade600,
                        blurRadius: 30,
                        spreadRadius: 0,
                        offset: const Offset(0, 30), // Shadow position
                      ),
                    ],
                    gradient: LinearGradient(
                        colors: [
                          AppColors.yankeesBlue.shade600,
                          AppColors.yankeesBlue.shade500,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(length),
                ),
                child: Center(
                  child: Consumer(builder: (_,ref, ___) {
                    final timerState = ref.watch(timerProvider);
                    return CircularPercentIndicator(
                      radius: length / 2 - 20 - 10,
                      lineWidth: 8.0,
                      animation: true,
                      animateFromLastPercent: true,
                      percent: ((timerState.timeInitial - timerState.timeRemaining) / timerState.timeInitial),
                      // percent: timerState.timeRemaining.toDouble(),
                      center: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            key: const ValueKey("clockDisplayKey"),
                            formatSecondsToMinutes(timerState.timeRemaining),
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 65.0, color: theme.colorScheme.onSurface),

                          ),
                          Text(timerState.timerIsRunning ? "Pause" : (timerState.timeRemaining < timerState.timeInitial ? "Resume" : "Start"), style: theme.textTheme.bodyMedium?.copyWith(fontSize: 22, color: theme.colorScheme.onSurface),)
                        ],
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: theme.colorScheme.primary,
                      backgroundColor: theme.colorScheme.surface,
                    );
                  },),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}
