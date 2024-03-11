import 'package:flutter/material.dart';

class SettingsThemeItemWidget extends StatelessWidget {

  final bool active;
  final IconData icon;
  const SettingsThemeItemWidget({super.key, required this.active, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: active ? theme.colorScheme.surface : theme.colorScheme.onSurface
      ),
      child: Center(
        // child: Text("Aa", style: TextStyle(color: active ? Colors.white : theme.colorScheme.onTertiary),),
        child: Icon(icon, color: active ? Colors.white : theme.colorScheme.onTertiary, size: 18,),
      ),
    );
  }
}
