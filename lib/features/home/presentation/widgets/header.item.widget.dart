import 'package:flutter/material.dart';
import 'package:promodo/core/app.extensions.dart';

//! Individual pill item on the header, either promodo, short break, long break
class HeaderItemWidget extends StatelessWidget {

  final bool active;
  final String title;
  const HeaderItemWidget({super.key, this.active = false, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme  = Theme.of(context);
    final isTablet = context.isTablet();

    return Container(
      decoration: BoxDecoration(
        color: active ? theme.colorScheme.primary : null,
        borderRadius: BorderRadius.circular(40)
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: isTablet ? 15 : 10),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(title, style: theme.textTheme.bodyMedium?.copyWith(color: active ? theme.colorScheme.surface : theme.colorScheme.onSurface),),
        ),
      )
    );
  }
}
