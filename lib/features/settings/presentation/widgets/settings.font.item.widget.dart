import 'package:flutter/material.dart';

class SettingsFontItemWidget extends StatelessWidget {

  final bool active;
  final TextStyle style;
  final Function()? onTap;
  const SettingsFontItemWidget({super.key, required this.active, required this.style, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: active ? theme.colorScheme.surface : theme.colorScheme.onSurface
        ),
        child: Center(
          child: Text("Aa", style: style.copyWith(color: active ? Colors.white : theme.colorScheme.onTertiary),),
        ),
      ),
    );
  }
}
