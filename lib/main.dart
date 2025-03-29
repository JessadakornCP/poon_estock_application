import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'config/config.dart';
import 'core/app_lifecycle_tracker/app_lifecycle_tracker.dart';
import 'core/init/navigation/navigation.dart';
import 'core/provider/provider_list.dart';
import 'package:flutter_localization/flutter_localization.dart';

// dart run build_runner build --delete-conflicting-outputs

const String appVersion = '1.0.0';
const String versionBuild = '1';
const String packageName = 'com.ptn.estock.application';

void main() async {
  await _init();
  runApp(
    MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      // child: const MyApp(),
      child: const AppLifecycleTracker(child: MyApp()),
    ),
  );
}

final FlutterLocalization _localization = FlutterLocalization.instance;

mixin AppLocale {
  static const String title = 'title';

  static const Map<String, dynamic> th = {title: 'การแปลภาษา'};
  static const Map<String, dynamic> en = {title: 'Localization'};
}

List<MapLocale> _mapLocales = [
  const MapLocale('th', AppLocale.th, countryCode: 'TH'),
  const MapLocale('en', AppLocale.en, countryCode: 'US'),
];
GlobalKey<NavigatorState>? navigatorKey =
    AppRouteConfig.instance.router.routerDelegate.navigatorKey;
Future<void> _init() async {
  Intl.defaultLocale = 'th';
  WidgetsFlutterBinding.ensureInitialized();
  await _localization.ensureInitialized();
  _localization.init(mapLocales: _mapLocales, initLanguageCode: 'th');
  // await AppFirebase.ensureInitialized();
  // await AppLocalNotificationPlugin.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Return the app with GoRouter for navigation
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: _localization.localizationsDelegates,
      supportedLocales: _localization.supportedLocales,
      locale: _localization.currentLocale,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme(context),
      routerConfig: AppRouteConfig.instance.router,
    );
  }
}
