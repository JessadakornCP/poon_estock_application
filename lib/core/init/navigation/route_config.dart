import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/auth/login/view/login_screen.dart';
import '../../../app/dashboard/view/dashboard_screen.dart';
import '../../../app/splash/view/splash_screen.dart';
import '../../widget/not_found_navigation.dart';
import 'navigation_constants.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

class AppRouteConfig {
  AppRouteConfig._init();
  static final AppRouteConfig _instance = AppRouteConfig._init();
  static AppRouteConfig get instance => _instance;

  GoRouter get router => _router;

  // Add your redirect logic here
  String? _redirectLogic(BuildContext context, GoRouterState state) {
    // You can implement your auth check or other redirection logic here
    // For example, check if user is logged in and redirect accordingly
    // final bool isLoggedIn = YourAuthProvider.of(context).isLoggedIn;
    // final bool isGoingToLogin = state.matchedLocation == AppNavConstants.LOGIN;

    // if (!isLoggedIn && !isGoingToLogin) {
    //   return AppNavConstants.LOGIN;
    // }

    // No redirect needed
    return null;
  }

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppNavConstants.DEFALT,
    debugLogDiagnostics: true,
    // Uncomment when ready to implement redirect logic
    // redirect: _redirectLogic,
    errorBuilder: (context, state) => const NotFoundNavigationWidget(),
    routes: [
      GoRoute(
        path: AppNavConstants.DEFALT,
        name: AppNavConstants.DEFAULT_NAME,
        builder: (context, state) {
          // You can access route parameters here if needed
          final extra = state.extra;
          final bool popScreen = extra is bool ? extra : false;
          return SplashScreen(popScreen: popScreen);
        },
      ),
      GoRoute(
        path: AppNavConstants.LOGIN,
        name: AppNavConstants.LOGIN_NAME,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppNavConstants.DASHBOARD,
        name: AppNavConstants.DASHBOARD_NAME,
        builder: (context, state) => const DashboardScreen(),
      ),
      // Special route for arbitrary widgets
      GoRoute(
        path: '/widget-view',
        builder: (context, state) {
          // Extract the widget from the extra data
          final extra = state.extra as Map<String, dynamic>?;
          final widget = extra?['widget'] as Widget?;

          // If no widget provided, show not found
          if (widget == null) {
            return const NotFoundNavigationWidget();
          }

          return widget;
        },
      ),
    ],
  );
}
