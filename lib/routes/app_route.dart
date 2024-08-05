import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cgi_task_v1/presentation/pages/add_task_page.dart';
import 'package:cgi_task_v1/presentation/pages/home_page.dart';
import 'package:cgi_task_v1/routes/app_routes_const.dart';
import 'package:cgi_task_v1/routes/screens/not_found_page.dart';
import 'package:cgi_task_v1/splash/splash.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
  GlobalKey<NavigatorState>();
  static const String _initialLocation = AppRoutes.splash;
  static final GoRouter _router = GoRouter(
    initialLocation: _initialLocation,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const Splash();
        },
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: AppRoutes.addTask,
            builder: (BuildContext context, GoRouterState state) {
              return AddTaskPage();
            },
          ),
        ],
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) =>
    const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}