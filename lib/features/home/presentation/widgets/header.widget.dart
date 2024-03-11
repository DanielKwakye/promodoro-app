import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promodo/core/app.providers.dart';
import 'package:promodo/features/home/data/store/enums.dart';
import 'package:promodo/features/home/presentation/widgets/header.item.widget.dart';
import 'package:separated_row/separated_row.dart';

//! Widget displays the 3 promodo states (Promodo, Short break, Long break)
class HeaderWidget extends ConsumerWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final theme = Theme.of(context);
    final session = ref.watch(timerProvider.select((value) => value.activePromodoroSession));

    return Container(
        decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(40)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        constraints: const BoxConstraints(
          maxWidth: 400
        ),
        child: SeparatedRow(
           separatorBuilder: (BuildContext context, int index) {
             return const SizedBox(width: 10,);
           },
           children:  [
             Expanded(child: HeaderItemWidget(active: session == PromodoroSession.promodoro, title: "Promodoro",)),
             Expanded(child: HeaderItemWidget(active: session == PromodoroSession.shortBreak, title: "Short break",)),
             Expanded(child: HeaderItemWidget(active: session == PromodoroSession.longBreak, title: "Long break",)),
           ],
        ),

    );
  }
}
