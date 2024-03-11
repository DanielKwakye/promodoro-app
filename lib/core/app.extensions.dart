import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:promodo/core/app.colors.dart';

extension ContextExtension on BuildContext {
  /// shows a [SnackBar]
  void showSnackBar(String message, {Color? background, Color? foreground, Appearance? appearance, BuildContext? context, Function()? onTap}) {
    Future.delayed(const Duration(milliseconds: 0), () async {
      try{

        final theme = Theme.of(this);
        Color backgColor = theme.colorScheme.primary.withOpacity(0.9);
        Color msgColor = theme.colorScheme.onPrimary;
        if(appearance == Appearance.error) {
          backgColor = const Color(0xfff7c5c1);
          msgColor = Colors.redAccent;
        }else if (appearance == Appearance.dark ) {
          backgColor = Colors.black;
        }
        else if (appearance == Appearance.info ) {
          backgColor = Colors.blue;
        }

        await Flushbar(
          titleColor: msgColor,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          message: message,
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.decelerate,
          // forwardAnimationCurve: Curves.elasticOut,
          borderRadius: BorderRadius.circular(8),
          backgroundColor: background ?? backgColor,
          messageColor: msgColor,
          isDismissible: true,
          onTap: (flashBar) {
            onTap?.call();
          },
          borderColor: null,
          duration: const Duration(seconds: 4),
          icon: Icon(
            Icons.info_outline,
            color: msgColor,
          ),
        ).show(context ?? this);

      }catch(e){
        debugPrint("snackBar error: $e");
      }
    });
  }

  bool isTablet () {
    // The equivalent of the "smallestWidth" qualifier on Android.
    var shortestSide = MediaQuery.of(this).size.shortestSide;
// Determine if we should use mobile layout or not, 600 here is
// a common breakpoint for a typical 7-inch tablet.
    return shortestSide >= 600;

  }

}


