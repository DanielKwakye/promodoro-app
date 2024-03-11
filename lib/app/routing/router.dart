import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:promodo/app/routing/route.constants.dart';
import 'package:promodo/features/home/presentation/pages/home.page.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey<NavigatorState>(debugLabel: 'root');

/// Go router package handles the routing system
///
final router = GoRouter(

  debugLogDiagnostics: true,
  navigatorKey: _rootNavigator,
  initialLocation: homeRoute,
  routes: [

    GoRoute(
      path: homeRoute,
      parentNavigatorKey: _rootNavigator,
      pageBuilder: (context, state) {
        return  MaterialPage(name: state.path, arguments: state.extra,
            child: const HomePage()
        );
      },
    ),

  ],


);