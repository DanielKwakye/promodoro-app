import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:promodo/core/app.colors.dart';
import 'package:promodo/core/app.extensions.dart';
import 'package:promodo/core/app.images.dart';
import 'package:promodo/core/app.providers.dart';
import 'package:promodo/features/home/data/store/enums.dart';
import 'package:promodo/features/settings/presentation/widgets/settings.color.section.widget.dart';
import 'package:promodo/features/settings/presentation/widgets/settings.font.section.widget.dart';
import 'package:promodo/features/shared/presentation/widgets/custom.border.widget.dart';
import 'package:promodo/features/shared/presentation/widgets/custom.button.widget.dart';
import 'package:promodo/features/shared/presentation/widgets/custom.textfield.widget.dart';
import 'package:separated_column/separated_column.dart';
import 'package:separated_row/separated_row.dart';

class SettingsPage extends HookConsumerWidget {

  const SettingsPage({super.key});


  String? validateTextField(String? value) {

    // check if field is not empty
    if((value??"").isEmpty) {
      return "required";
    }
    //! check if field is an integer
    if(int.tryParse(value ?? "") == null) {
      return "Value must be an integer";
    }

    if(int.parse(value ?? "") < 1) {
      return "Invalid field";
    }

    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final theme = Theme.of(context);
    final timerNotifier = ref.watch(timerProvider.notifier); // This does NOT result in rebuild
    final Map<PromodoroSession, int> settings = timerNotifier.getSettings();
    final pomodoroSettingsController = useTextEditingController(text: "${(settings[PromodoroSession.promodoro] ?? 0) ~/ 60}");
    final shortBreakSettingsController = useTextEditingController(text: "${(settings[PromodoroSession.shortBreak] ?? 0) ~/ 60}");
    final longBreakSettingsController = useTextEditingController(text:"${(settings[PromodoroSession.longBreak] ?? 0) ~/ 60}");
    final isTablet = context.isTablet();


    ///! Method called when Apply button is tapped
    void onApplyHandler(BuildContext ctx) {

        // Check for validations
        if(!Form.of(ctx).validate()){
          return;
        }

        timerNotifier.updateSettings(
          pomodoroTimeInSeconds: int.parse(pomodoroSettingsController.text) * 60,
          shortBreakTimeInSeconds: int.parse(shortBreakSettingsController.text) * 60,
          longBreakTimeInSeconds: int.parse(longBreakSettingsController.text) * 60
        );

        ctx.showSnackBar("Settings updated");
        Navigator.of(ctx).pop();

    }

    //! Just displays the color title
    const colorTitleWidget = Text("COLOR", style: TextStyle(fontWeight: FontWeight.bold),);

    //! Just displays the font title
    const fontTitleWidget = Text("FONT", style: TextStyle(fontWeight: FontWeight.bold),);

    // pomodoro settings components
    const promodoroTitle = Text("Pomodro");
    final promodoTextFieldWidget = CustomTextFieldWidget(
      suffix:  UnconstrainedBox(child: SvgPicture.asset(AppImages.numberIndicator)),
      controller: pomodoroSettingsController,
      validator: (value) => validateTextField(value),
      inputType: TextInputType.number,
    );

    // short break settings components
    const shortBreakTitle = Text("Short break");
    final shortBreakTextFieldWidget = CustomTextFieldWidget(
        controller: shortBreakSettingsController,
        validator: (value) => validateTextField(value),
        inputType: TextInputType.number,
        suffix:  UnconstrainedBox(child: SvgPicture.asset(AppImages.numberIndicator)));

    // long break settings components
    const longBreakTitle = Text("Long break");
    final longBreakTextFieldWidget = CustomTextFieldWidget(
        controller: longBreakSettingsController,
        validator: (value) => validateTextField(value),
        inputType: TextInputType.number,
        suffix:  UnconstrainedBox(child: SvgPicture.asset(AppImages.numberIndicator)));


    /// MAin UI layout here
    return GestureDetector(
      onTap: () {
        // dismiss any opened keyboard when any part outside the keyboard is touched
        FocusScope.of(context).unfocus();
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Form(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Material(
                  color: theme.colorScheme.tertiary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(child: Text("Settings", style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.onBackground),)),
                              const Icon(Icons.close),
                            ],
                          ),
                        ),
                      ),
                      const CustomBorderWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: SeparatedColumn(separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 20,);
                          },
                            children: [
                              const Text("TIME (MINUTES)"),

                              //! Set fields
                              if(isTablet) ... {
                                // tablet layout
                                SeparatedRow(
                                  separatorBuilder: (BuildContext context, int index) {
                                    return const SizedBox(width: 15,);
                                  },
                                  children: [
                                    Expanded(child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        promodoroTitle,
                                        const SizedBox(height: 5,),
                                        promodoTextFieldWidget
                                      ],
                                    )),
                                    Expanded(child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        shortBreakTitle,
                                        const SizedBox(height: 5,),
                                        shortBreakTextFieldWidget
                                      ],
                                    )),
                                    Expanded(child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        longBreakTitle,
                                        const SizedBox(height: 5,),
                                        longBreakTextFieldWidget
                                      ],
                                    )),
                                  ],
                                )
                              }else ... {
                                // mobile layout
                                SeparatedColumn(
                                  mainAxisSize: MainAxisSize.min,
                                  separatorBuilder: (BuildContext context, int index) {
                                    return const SizedBox(height: 5,);
                                  },
                                  children:  [
                                    Row(
                                      children: [
                                        const Expanded(child: promodoroTitle),
                                        Expanded(child: promodoTextFieldWidget,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Expanded(child: shortBreakTitle),
                                        Expanded(child: shortBreakTextFieldWidget)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Expanded(child: longBreakTitle),
                                        Expanded(child: longBreakTextFieldWidget)
                                      ],
                                    ),
                                  ],

                                ),
                              },


                              const CustomBorderWidget(),

                              if(isTablet) ... {
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                      fontTitleWidget,
                                      SettingsFontSectionWidget()
                                   ],
                                )
                              }else ... {
                                fontTitleWidget,
                                const SettingsFontSectionWidget()
                              },

                              //!
                              const CustomBorderWidget(),


                              if(isTablet) ... {
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                      colorTitleWidget,
                                      SettingsColorSectionWidget()
                                   ],
                                )
                              }else ... {
                                colorTitleWidget,
                                const SettingsColorSectionWidget()
                              }

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(bottom: -20,
                  left: 0,
                  right: 0,child: UnconstrainedBox(
                    child: Consumer(
                        builder: (ctx, ref, __) {
                          ref.watch(themeProvider.select((value) => value.themeData));
                          return CustomButtonWidget(
                            text: 'Apply',
                            onPressed: () {
                              onApplyHandler(ctx);
                            },
                          );
                        }
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );


  }
}
