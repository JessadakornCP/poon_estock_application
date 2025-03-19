import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../app/splash/view/splash_screen.dart';
import '../../main.dart';
import '../init/navigation/navigation.dart';
import '../init/shared_preferences/shared_preferences.dart';
import '../provider/global_provider.dart';
import '../provider/user_profile_provider.dart';
import '../repo/global_repo.dart';
import '../utility/formatters.dart';
import 'enum/enum.dart';

class AppLifecycleTracker extends StatefulWidget {
  final Widget child;

  const AppLifecycleTracker({super.key, required this.child});

  @override
  State<AppLifecycleTracker> createState() => _AppLifecycleTrackerState();
}

class _AppLifecycleTrackerState extends State<AppLifecycleTracker>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    AppState status;
    switch (state) {
      case AppLifecycleState.resumed:
        status = AppState.resumed;
        break;
      case AppLifecycleState.inactive:
        status = AppState.inactive;
        break;
      case AppLifecycleState.paused:
        status = AppState.paused;
        break;
      case AppLifecycleState.detached:
        status = AppState.detached;
        break;
      case AppLifecycleState.hidden:
        status = AppState.hidden;
        break;
    }
    debugPrint('AppLifecycleState: $status');
    _callApi(status);
  }

  final _globalRepo = GlobalRepo();
  final _singleton = Singleton.shared;

  void _callApi(AppState state) async {
    switch (state) {
      case AppState.resumed:
        BuildContext? context = navigatorKey.currentState?.context;
        if (context != null) {
          final provider = context.read<GlobalProvider>();
          final userProfileProvider = context.read<UserProfileProvider>();
          final showSplashScreen = provider.showSplashScreen;
          if (!showSplashScreen) {
            bool pass = await userProfileProvider.checkValidateUserPass();
            if (pass) {
              if (context.mounted) {
                final expiresAt = await _singleton.getExpiresAt();
                final formattedDateTime = DateFormat(
                  'yyyy-MM-dd HH:mm:ss',
                ).format(DateTime.now());
                if (emptyToNull(expiresAt) != null) {
                  final kExpiresAt = DateTime.parse(expiresAt!);
                  final compare = kExpiresAt.isBefore(
                    DateTime.parse(formattedDateTime),
                  );
                  if (compare) {
                    if (context.mounted) {
                      await showDialog(
                        context: context,
                        builder: (context) => const SplashScreen(),
                      );
                    }
                  }
                } else {
                  await _globalRepo.setExpiresAt();
                }
              }
            } else {
              userProfileProvider.deleteUserProfile();
              if (context.mounted) {
                AppNav.toNameAndRemoveUntil(context, AppNavConstants.LOGIN);
              }
            }
          }
        }
        break;
      case AppState.detached:
        await _singleton.setExpiresAt('');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
