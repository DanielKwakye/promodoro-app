import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:promodo/core/app.extensions.dart';
import 'package:promodo/features/home/presentation/widgets/clock.widget.dart';
import 'package:promodo/features/home/presentation/widgets/header.widget.dart';
import 'package:promodo/features/settings/presentation/pages/settings.page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  //! Shows the settings page
  void _openSettingsModal(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding:  EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
          child: const AnimationConfiguration.synchronized(
            child: SlideAnimation(
              duration: Duration(milliseconds: 375),
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: SettingsPage(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Promodoro", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        elevation: 0,
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: AnimationConfiguration.synchronized(
          child: SlideAnimation(
            duration: const Duration(milliseconds: 800),
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: context.isTablet() ? 50 : 30),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       const HeaderWidget(),
                       const ClockWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: IconButton(onPressed: () {
                          _openSettingsModal(context);
                        }, icon: Icon(Icons.settings, color: theme.colorScheme.onSurface, size: 30,)),
                      ),
                     ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
