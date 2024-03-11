import 'package:flutter/material.dart';

class SettingsColorItemWidget extends StatelessWidget {

  final bool active;
  final Color color;
  final Function()? onTap;
  const SettingsColorItemWidget({super.key, required this.active, required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: color
        ),
        child: Center(
          child: active ? const Icon(Icons.check, color: Colors.white,) : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
