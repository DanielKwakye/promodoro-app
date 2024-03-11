

import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {

  final String text;
  final Function()? onPressed;
  final bool expand;
  final Widget? icon;
  final bool loading;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? outlineColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final bool disabled;
  final FontWeight? fontWeight;
  // final

  const CustomButtonWidget({
    required this.text,
    super.key, this.onPressed,
    this.expand = false,
    this.icon,
    this.loading = false,
    this.disabled = false,
    this.textColor,
    this.backgroundColor,
    this.outlineColor,
    this.borderRadius,
    this.padding,
    this.fontWeight
  });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: expand ? size.width : null,
        child: ElevatedButton.icon(
          icon: loading ? const SizedBox.shrink() : (icon ?? const SizedBox.shrink()),
          onPressed: loading ? null : (disabled ? null : (onPressed ?? (){})),
          label: Padding( padding: EdgeInsets.symmetric(horizontal: 0, vertical: expand ? 14 : 0),
          child: loading ?
              // Loading State
          // CupertinoActivityIndicator(color: appearance == Appearance.clean ? theme.colorScheme.onBackground : kAppWhite,)
           SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: theme.colorScheme.onPrimary, strokeWidth: 2,),)
              // Normal state
          : Text(text,
            textAlign: TextAlign.center,

            style: TextStyle(color: textColor ?? theme.colorScheme.onPrimary, fontWeight: fontWeight ?? FontWeight.w700),
          ),
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.resolveWith<double>((states) => 0),
          minimumSize:  MaterialStateProperty.resolveWith<Size?>((states) => padding != null ? Size.zero : null), // Set this
          padding: MaterialStateProperty.resolveWith<EdgeInsets?>((states) => padding), // and this
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular( borderRadius != null ? borderRadius! : expand? 30 : 30),
                  side: BorderSide(color: outlineColor ?? theme.colorScheme.primary)
              )
          ),
          backgroundColor: backgroundColor != null ?
              MaterialStateProperty.resolveWith<Color>((states) => backgroundColor!)
              : MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {


                if (states.contains(MaterialState.pressed)) {
                  // appearance when button is pressed
                    return theme.colorScheme.primary.withOpacity(0.5);
                }

              // background color

              if(onPressed == null || disabled){
                return theme.colorScheme.outline;
              }

              return theme.colorScheme.primary;

            },
            ),
          ),
        ),
      );
  }
}
