import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promodo/core/app.fonts.dart';
import 'package:promodo/core/app.providers.dart';
import 'package:promodo/features/settings/presentation/widgets/settings.font.item.widget.dart';
import 'package:separated_row/separated_row.dart';

class SettingsFontSectionWidget extends ConsumerWidget {
  const SettingsFontSectionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appFont = ref.watch(themeProvider.select((value) => value.appFont));
    return SeparatedRow(
      mainAxisAlignment: MainAxisAlignment.center,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 10,);
      },
      children: [
        SettingsFontItemWidget(active: appFont == AppFont.kumbhSans, style: GoogleFonts.kumbhSans(),
          onTap: () {
            ref.read(themeProvider.notifier).setFontTextTheme(AppFont.kumbhSans);
          },
        ),
        SettingsFontItemWidget(active: appFont == AppFont.spaceMono, style: GoogleFonts.spaceMono(),
          onTap: () {
            ref.read(themeProvider.notifier).setFontTextTheme(AppFont.spaceMono);
          },
        ),
        SettingsFontItemWidget(active: appFont == AppFont.robotoSlab, style: GoogleFonts.robotoSlab(),
            onTap: () {
              ref.read(themeProvider.notifier).setFontTextTheme(AppFont.robotoSlab);
            }
        )
      ],
    );
  }
}
