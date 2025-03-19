import 'package:flutter/cupertino.dart';
import '../../../app/auth/login/view/login_screen.dart';
import '../../../app/dashboard/view/dashboard_screen.dart';
import '../../../app/splash/view/splash_screen.dart';
import '../../widget/widgets.dart';
import 'navigation_constants.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic>? generateRoute(RouteSettings settings) {
    if (settings.name == null) return null;
    final uri = Uri.parse(settings.name!);
    switch (uri.path) {
      case AppNavConstants.DEFALT:
        return normalNavigate(
          const SplashScreen(),
          AppNavConstants.DEFALT,
          settings.arguments,
        );
      case AppNavConstants.LOGIN:
        return normalNavigate(
          const LoginScreen(),
          AppNavConstants.LOGIN,
          settings.arguments,
        );
      case AppNavConstants.DASHBOARD:
        return normalNavigate(
          const DashboardScreen(),
          AppNavConstants.DASHBOARD,
          settings.arguments,
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  CupertinoPageRoute normalNavigate(
    Widget widget,
    String pageName,
    Object? arguments,
  ) {
    return CupertinoPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName, arguments: arguments),
    );
  }
}
