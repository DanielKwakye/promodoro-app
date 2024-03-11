import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promodo/core/app.colors.dart';
import 'package:promodo/core/app.providers.dart';
import 'package:promodo/features/settings/presentation/widgets/settings.color.item.widget.dart';
import 'package:separated_row/separated_row.dart';


class SettingsColorSectionWidget extends ConsumerWidget {
  const SettingsColorSectionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider.select((value) => value.themeData));
    return SeparatedRow(
      mainAxisAlignment: MainAxisAlignment.center,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 10,);
      },
      children: [
        SettingsColorItemWidget(
          active: themeData?.colorScheme.primary == AppColors.begonia, color: AppColors.begonia,
          onTap: () {
            ref.read(themeProvider.notifier).setThemePrimaryColor(AppColors.begonia);
          },
        ),
        SettingsColorItemWidget(active: themeData?.colorScheme.primary == AppColors.electricBlue, color: AppColors.electricBlue,
          onTap: () {
            ref.read(themeProvider.notifier).setThemePrimaryColor(AppColors.electricBlue);
          },
        ),
        SettingsColorItemWidget(active: themeData?.colorScheme.primary == AppColors.heliotrope, color: AppColors.heliotrope,
          onTap: () {
            ref.read(themeProvider.notifier).setThemePrimaryColor(AppColors.heliotrope);
          },
        )
      ],
    );
  }
}
