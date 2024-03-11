import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promodo/app/routing/router.dart';
import 'package:promodo/core/app.providers.dart';
import 'package:promodo/core/utils.dart';

class App extends ConsumerWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final theme = ref.watch(themeProvider.select((value) => value.themeData));
    return MaterialApp.router(
      title: "Promodoro",
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: router,
      builder: (ctx, widget) {
        setSystemUIOverlays(Brightness.dark);
        return  widget ?? const SizedBox.shrink();
      },
    );
  }
}

